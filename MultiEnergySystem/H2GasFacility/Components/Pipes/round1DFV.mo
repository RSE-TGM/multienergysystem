within MultiEnergySystem.H2GasFacility.Components.Pipes;
model round1DFV
  "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube;
  import Modelica.Fluid.Utilities.regSquare;
  replaceable package Medium =
      DistrictHeatingNetwork.Media.StandardWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation (
     choicesAllMatching = true);
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
                                                                                                                                                                                        constrainedby
    DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer
      "Heat transfer model for " annotation (
     choicesAllMatching = true);

// Flow parameter
  parameter Boolean noInitialPressure = false
    "Remove initial equation for pressure, to be used in case of solver failure";
  parameter Boolean computeLinearPressureDrop = true
    "If true, then the pressure drop is linear, else the pressure drop is non-linear computed as a function of cp and u";
  parameter Integer n = 2
    "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nPipes = 1
    "Number of parallel pipes" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.PerUnit cf = 0.004
    "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Velocity u_nom = 1
    "Nominal fluid velocity" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.PerUnit kc
    "Corrective factor for heat tranfer" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle
    "Location of pressure state";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt
    "Initialisation option" annotation (
    Dialog(group = "Initialisation"));
  parameter Real k(unit = "Pa/(kg/s)") = 500
    "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Density rho_nom = 997
    "Nominal density of the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1)
    "Temperature start value of the fluid" annotation (
    Dialog(group = "Initialisation"));

  final parameter Types.Pressure dp_nom = cf / 2 * rho_nom * omega * L / A * u_nom ^ 2
    "Nominal pressure drop";
  final parameter Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom
    "Nominal mass flow rate";
  final parameter Types.Area S = L * omega
    "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n
    "Surface of the wall of each finite volume (for one pipe)";
  parameter Types.Area Stot = S * nPipes
    "Total surface of the wall" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  final parameter Types.Area Atot = A * nPipes
    "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes
    "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n
    "Volume of one finite element";
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500
    "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model"));

  outer System system "system object for global defaults";

// Variables
  Types.MassFlowRate m_flow[n + 1]
    "Mass flow rate in each volume across the pipe";
  Types.VolumeFlowRate q[n + 1]
    "Mass flow rate in each volume across the pipe";
  Types.Velocity u[n + 1](each start = u_nom)
    "Velocity in each volume across the pipe";
  Types.Temperature Ttilde[n](start = T_start[2:n+1], each stateSelect = StateSelect.prefer)
    "State variable temperatures";
  Types.Temperature Twall[n]
    "Pipe wall temperature";
  Types.Power Qtot
    "Total heat";
  Types.Temperature T[n + 1](start = T_start)
    "Volume boundary temperatures";
  Types.Pressure pin
    "Inlet pressure";
  Types.Pressure pout
    "Outlet pressure";
  Types.Pressure ptilde(stateSelect = StateSelect.prefer)
    "Pressure state the pipe";
  Types.Pressure dp(start = dp_nom)
    "Delta pressure";
  Types.Mass M[n]
    "Mass of fluid in each finite volume";
  Types.Mass Mtot
    "Total Mass in the pipe";
  Types.SpecificHeatCapacity cp[n+1]
    "Specific heat capacity at each fluid";
  Types.Density rho[n+1]
    "Density at each fluid";

  Medium.ThermodynamicState fluid[n + 1];

  HeatTransferModel heatTransfer(
    gamma_nom = gamma_nom,
    n = n,
    nPipes = nPipes,
    Lc = Di,
    S = Stot,
    A = Atot,
    Twall = Twall,
    Tmean = 0.5*(fluid[1:end-1].T + fluid[2:end].T),
    m_flow = m_flow[2:end],
    p = pout,
    cp = Medium.specificHeatCapacityCp(fluid[2:end]),
    mu = Medium.dynamicViscosity(fluid[2:end]),
    k = Medium.thermalConductivity(fluid[2:end]),
    each m_flow_nom = m_flow_start,
    p_nom = pout_start,
    kc = kc);

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.MultiHeatPort wall(n=n)   annotation (
    Placement(visible = true, transformation(origin = {-1.77636e-15, 50.5}, extent = {{-42, -10.5}, {42, 10.5}}, rotation = 0), iconTransformation(origin={0,51},               extent = {{-44, -11}, {44, 11}}, rotation = 0)));
equation

// Assertations
  assert(n > 1, "The number of volumes must be at least 2");
  assert(pin < pmax, "The pressure in the pipe is higher than the maximum designed pressure");
  assert(pout < pmax, "The pressure in the pipe is higher than the maximum designed pressure");

// Equations to set the fluid properties
  for i in 1:n + 1 loop
    fluid[i] = Medium.setState_pTX(ptilde, T[i]);
    rho[i] = Medium.density(fluid[i]);
    cp[i] = Medium.specificHeatCapacityCp(fluid[i]);
    m_flow[i] = A * u[i]* rho[i];
    q[i] = m_flow[i]/rho[i];
  end for;

  fluid[1].h = inStream(inlet.h_out);

// Relationships for state variables
  Ttilde = T[2:n + 1];

  for i in 1:n loop
     M[i] = Vi * fluid[i + 1].d;
     m_flow[i] - m_flow[i + 1] = 0 "Mass balance";
     rho[i] * Vi * cp[i] * der(Ttilde[i]) = cp[i] * m_flow[i]*(T[i] - T[i+1]) + wall.Q_flow[i] "Energy balance";
  end for;

  Mtot = sum(M) "Total mass";
  Qtot = sum(wall.Q_flow) "Total heat";

// Momentum balance
  if computeLinearPressureDrop then
    if hctype == DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream then
      ptilde = pout;
      pin - pout = k*inlet.m_flow "Momentum Balance (linear friction)";
    elseif hctype == DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle then
      pin - ptilde = k/2*inlet.m_flow;
      ptilde - pout = -k/2*outlet.m_flow;
    end if;
  else
    inlet.p - outlet.p = (rho[1]+rho[n+1])/2 * Modelica.Constants.g_n * h + homotopy(cf / 2 * (rho[1]+rho[n+1])/2 * omega * L / A * regSquare(u[1], u_nom * 0.05), dp_nom / m_flow_nom * m_flow[1]);
    ptilde = pout;
  end if;

  dp = pin-pout;

// Boundary conditions
  inlet.m_flow = m_flow[1];
  outlet.m_flow = -m_flow[n + 1];
  inlet.p = pin;
  outlet.p = pout;
  inlet.h_out = 1e5;
  outlet.h_out = fluid[n+1].h;
  wall.Q_flow = heatTransfer.Q_flow;
  wall.T = Twall;

initial equation
  if initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    der(Ttilde) = zeros(n);
    if not noInitialPressure then
      der(ptilde) = 0;
    else
//No initial pressure
    end if;
  elseif initOpt == DistrictHeatingNetwork.Choices.Init.Options.fixedState then
    for i in 1:n loop
      fluid[i+1].T = T_start[i+1];
    end for;
    if not noInitialPressure then
      ptilde = pout_start;
    else
//No initial pressure
    end if;
  else
//No initial equations
  end if;
  annotation ();
end round1DFV;
