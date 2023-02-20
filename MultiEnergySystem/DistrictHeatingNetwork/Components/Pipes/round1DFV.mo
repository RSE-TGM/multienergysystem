within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model round1DFV
  "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialRoundTube;
  import Modelica.Fluid.Utilities.regSquare;
  //import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  replaceable package Medium =
      DistrictHeatingNetwork.Media.StandarWater constrainedby
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
  parameter Integer n = 2
    "Number of finite volumes in each pipe";
  parameter Integer nPipes = 2
    "Number of parallel pipes";
  parameter Modelica.Units.SI.PerUnit cf = 0.004
    "Constant Fanning friction coefficient";
  parameter Modelica.Units.SI.Velocity u_nom = 1
    "Nominal fluid velocity";
  parameter Modelica.Units.SI.PerUnit kc
    "Corrective factor for heat tranfer";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle
    "Location of pressure state";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt
    "Initialisation option" annotation (
    Dialog(tab = "Initialisation"));
  parameter Real k(unit = "Pa/(kg/s)") = 500
    "Coefficient for the calculation of the pressure loss across the pipe";
  parameter Modelica.Units.SI.Density rho_nom = 997
    "Nominal density of the fluid";
  parameter Modelica.Units.SI.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1)
    "Temperature start value of the fluid" annotation (
    Dialog(group = "Initialisation"));

  final parameter Modelica.Units.SI.PressureDifference dp_nom = cf / 2 * rho_nom * omega * L / A * u_nom ^ 2
    "Nominal pressure drop";
  final parameter Modelica.Units.SI.MassFlowRate m_flow_nom = rho_nom * A * u_nom
    "Nominal mass flow rate";
  final parameter Modelica.Units.SI.Area S = L * omega
    "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Modelica.Units.SI.Area Si = S / n
    "Surface of the wall of each finite volume (for one pipe)";
  final parameter Modelica.Units.SI.Area Stot = S * nPipes
    "Total surface of the wall";
  final parameter Modelica.Units.SI.Area Atot = A * nPipes
    "Total internal area of all tubes";
  final parameter Modelica.Units.SI.Volume V = A * L * nPipes
    "Total volume of the fluid in the pipe";
  final parameter Modelica.Units.SI.Volume Vi = V / n
    "Volume of one finite element";

  outer System system "system object for global defaults";

  // Variables
  Modelica.Units.SI.MassFlowRate m_flow[n + 1]
    "Mass flow rate in each volume across the pipe";
  Modelica.Units.SI.Velocity u[n + 1]
    "Velocity in each volume across the pipe";
  Modelica.Units.SI.Temperature Ttilde[n](start = T_start[2:n+1], each stateSelect = StateSelect.prefer)
    "State variable temperatures";
  Modelica.Units.SI.Temperature Twall[n]
    "Pipe wall temperature";
//   Modelica.Units.SI.Power Q_int[n]
//     "Heat dissipation out of each volume into the wall";
  Modelica.Units.SI.Temperature T[n + 1]
    "Volume boundary temperatures";
//   Modelica.Units.SI.Power Q_ext[n]
//     "Heat dissipation out of each wall cell to the ambient";
  Modelica.Units.SI.Pressure pin
    "Inlet pressure";
  Modelica.Units.SI.Pressure pout
    "Outlet pressure";
  Modelica.Units.SI.Pressure ptilde(stateSelect = StateSelect.prefer)
    "Pressure state the pipe";
  Modelica.Units.SI.Mass M[n]
    "Mass of fluid in each finite volume";
  Modelica.Units.SI.Mass Mtot
    "Total Mass in the pipe";
  Modelica.Units.SI.SpecificHeatCapacity cp[n+1]
    "Specific heat capacity at each fluid";
  Modelica.Units.SI.SpecificHeatCapacity rho[n+1]
    "Density at each fluid";

  Medium.ThermodynamicState fluid[n + 1];

  HeatTransferModel heatTransfer(
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
    //each cp = Medium.specificHeatCapacityCp(fluid[1].state),

  DistrictHeatingNetwork.Interfaces.MultiHeatPort wall(n=n)   annotation (
    Placement(visible = true, transformation(origin = {-1.77636e-15, 50.5}, extent = {{-42, -10.5}, {42, 10.5}}, rotation = 0), iconTransformation(origin={0,51},               extent = {{-44, -11}, {44, 11}}, rotation = 0)));
equation
// Equations to set the fluid properties
  for i in 1:n + 1 loop
    fluid[i] = Medium.setState_pTX(ptilde, T[i]);
    rho[i] = Medium.density(fluid[i]);
    cp[i] = Medium.specificHeatCapacityCp(fluid[i]);
    m_flow[i] = A * u[i]* rho[i];
  end for;

  fluid[1].h = inStream(inlet.h_out);

// Relationships for state variables
  Ttilde = T[2:n + 1];
  if hctype == Choices.Pipe.HCtypes.Downstream then
    ptilde = pout;
    pin - pout = k*inlet.m_flow "Momentum Balance (linear friction)";
  elseif hctype == Choices.Pipe.HCtypes.Middle then
    pin - ptilde = k/2*inlet.m_flow;
    ptilde - pout = -k/2*outlet.m_flow;
  end if;

  for i in 1:n loop
     M[i] = Vi * fluid[i + 1].d;
     //w[i] - w[i + 1] = -Vi * fluid[i + 1].rho ^ 2 * (fluid[i + 1].dv_dT * der(fluid[i + 1].T) + fluid[i + 1].dv_dp * der(fluid[i + 1].p) + fluid[i + 1].dv_dX * der(fluid[i + 1].X)) "Total Mass Balance";
     m_flow[i] - m_flow[i + 1] = der(M[i]);
     rho[i] * Vi * cp[i] * der(Ttilde[i]) = Ttilde[i] * m_flow[i]*(cp[i] - cp[i+1]) + wall.Q_flow[i] "Energy balance";
  end for;

  Mtot = sum(M) "Total mass";

  // Momentum balance

  //inlet.p - outlet.p = rho0 * Modelica.Constants.g_n * h + homotopy(cf / 2 * rho0 * omega * L / A * regSquare(u[1], u_nom * 0.05), dp_nom / m_flow_nom * m_flow[1]);



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
  if initOpt == Choices.Init.Options.steadyState then
    der(Ttilde) = zeros(n);
    if not noInitialPressure then
      der(ptilde) = 0;
    else
 //No initial pressure
    end if;
  elseif initOpt == Choices.Init.Options.fixedState then
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
