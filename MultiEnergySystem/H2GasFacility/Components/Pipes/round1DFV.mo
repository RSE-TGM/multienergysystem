within MultiEnergySystem.H2GasFacility.Components.Pipes;
model Round1DFV
  "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube;
  import Modelica.Fluid.Utilities.regSquare;
  import HCtypes = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes;
  
  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.CH4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture 
    "Medium model" annotation (
     choicesAllMatching = true);
  replaceable model HeatTransferModel = ConstantHTC constrainedby BaseConvectiveHT
    "Heat transfer model" annotation (
     choicesAllMatching = true);

  // Main Parameters
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
  parameter Types.Density rho_nom = 0.68
    "Nominal density of the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nX = fluid[1].nX 
    "Number of components in the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nXi = fluid[1].nXi 
    "Number of independent components in the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.Area Stot = S * nPipes
    "Total surface of the wall" annotation (
    Dialog(tab = "Data", group = "Pipe"));  
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500
    "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model")); 
  parameter Types.Temperature X_start[fluid[1].nX] = fluid[1].X_start
    "Start value for the mass fraction" annotation (
    Dialog(group = "Initialisation"));

  
  // Final parameters 
  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1)
    "Temperature start value of the fluid";
  final parameter Types.Pressure dp_nom = cf / 2 * rho_nom * omega * L / A * u_nom ^ 2
    "Nominal pressure drop";
  final parameter Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom
    "Nominal mass flow rate";
  final parameter Types.Area S = L * omega
    "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n
    "Surface of the wall of each finite volume (for one pipe)";
  final parameter Types.Area Atot = A * nPipes
    "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes
    "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n
    "Volume of one finite element";

  outer System system "system object for global defaults";

// Variables
  Types.MassFlowRate m_flow[n + 1](each min = 0, each start = m_flow_start) 
    "Mass flow at each volume boundary";
//  Types.VolumeFlowRate q[n + 1]
//    "Mass flow rate in each volume across the pipe";
//  Types.Velocity u[n + 1](each start = u_nom)
//    "Velocity in each volume across the pipe";
  Types.Temperature Ttilde[n](start = T_start[2:n+1], each stateSelect = StateSelect.prefer)
    "State variable temperatures";
//  Types.Temperature Twall[n]
//    "Pipe wall temperature";
//  Types.Power Qtot
//    "Total heat";
  Types.Temperature T[n + 1]
    "Volume boundary temperatures";
  Types.Temperature Tin
    "Inlet temperature";
  Types.Temperature Tout
    "Outlet temperature";
  Types.SpecificEnthalpy hin
    "Inlet Specific enthalpy";
  Types.SpecificEnthalpy hout
    "Outlet Specific enthalpy";   
  Types.SpecificEnthalpy h[n + 1]
    "Specific enthalpy at each fluid";
  Types.SpecificEnthalpy u[n + 1]
    "Specific energy at each fluid";
  Types.MassFraction Xi[n + 1, nXi] 
    "Mass fractions at each volume boundary";
  Types.MassFraction Xtilde[n, nXi](each stateSelect = StateSelect.prefer, start = fill(X_start[1:nXi], n)) 
    "Composition state for each volume";  
  Types.Pressure pin
    "Inlet pressure";
  Types.Pressure pout
    "Outlet pressure";
  Types.Pressure ptilde(stateSelect = StateSelect.prefer)
    "Pressure state the pipe";
//  Types.Pressure dp(start = dp_nom)
//    "Delta pressure";
  Types.Mass M[n]
    "Mass of fluid in each finite volume";
//  Types.Mass Mtot
//    "Total Mass in the pipe";
//  Types.SpecificHeatCapacity cp[n + 1]
//    "Specific heat capacity at each fluid";
  Types.Density rho[n + 1]
    "Density at each fluid";
  Real dv_dt[n + 1](each unit = "m3/(kg.s)")
    "Derivative of specific volume w.r.t. time";
  Real du_dt[n + 1](each unit = "J/(kg.s)")
    "Derivative of specific energy w.r.t time";

  Medium fluid[n + 1](
    T_start = T_start,
    each X_start = X_start,
    each p_start = pout_start);



  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.MultiHeatPort wall(n=n)   annotation (
    Placement(visible = true, transformation(origin = {-1.77636e-15, 50.5}, extent = {{-42, -10.5}, {42, 10.5}}, rotation = 0), iconTransformation(origin={0,51},               extent = {{-44, -11}, {44, 11}}, rotation = 0)));
equation

// Assertations
  assert(n > 1, "The number of volumes must be at least 2");

// Equations to set the fluid properties
  for i in 1:n + 1 loop
    fluid[i].T = T[i];
    fluid[i].Xi = Xi[i, :];
    fluid[i].p = ptilde;
  end for;
  
// Equations to assign values from fluids properties
  for i in 1:n + 1 loop
    h[i] = fluid[i].h;
    rho[i] = fluid[i].rho;
    u[i] = fluid[i].u;
    dv_dt[i] = fluid[i].dv_dT * der(fluid[i].T) + fluid[i].dv_dp * der(fluid[i].p) + fluid[i].dv_dX * der(fluid[i].X);
    du_dt[i] = fluid[i].du_dT * der(fluid[i].T) + fluid[i].du_dp * der(fluid[i].p) + fluid[i].du_dX * der(fluid[i].X);
  end for;

// Relationships for state variables
  Ttilde = T[2:n + 1];
  Xtilde = Xi[2:n+1,:];
  if hctype == HCtypes.Downstream then
    ptilde = pout;
    pin - pout = k*inlet.m_flow;
  elseif hctype == HCtypes.Middle then
    pin - ptilde = k/2*inlet.m_flow;
    ptilde - pout = -k/2*outlet.m_flow;
  end if;

// Balances
  for i in 1:n loop
     M[i] = Vi * rho[i + 1];
     m_flow[i] - m_flow[i + 1] = -Vi * rho[i + 1] ^ 2 * dv_dt[i + 1] "Total Mass Balance";
     m_flow[i] * h[i] - m_flow[i + 1] * h[i + 1] + wall.Q_flow[i] = M[i] * du_dt[i + 1] + (m_flow[i] - m_flow[i + 1]) * u[i + 1] "Energy Balance";
     if nX == 1 then
      0 = (Xi[i, :] - Xi[i + 1, :]);
     else
      M[i]*der(fluid[i+1].Xi) = w[i]* (Xi[i, :] - Xi[i + 1, :]);
     end if;
  end for;

// Boundary variables
  m_flow[1] = inlet.m_flow;
  m_flow[n + 1] = -outlet.m_flow;
  pin = inlet.p;
  pout = outlet.p;
  h[1] = inStream(inlet.h_out);
  h[n+1] = outlet.h_out;
  Xi[1,:] = fluid[1].Xi;
  Tin = fluid[1].T;
  Tout = fluid[n+1].T;
  hin = fluid[1].h;
  hout = fluid[n+1].h;
  inlet.h_out = hin_start "Dummy equation (not flow reversal)" ;
//  wall.Q_flow = heatTransfer.Q_flow;
//  wall.T = Tw;


initial equation



end Round1DFV;
