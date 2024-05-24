within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model RoundPipeFV
  "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialRoundTube(T_ext = system.T_amb, allowFlowReversal = system.allowFlowReversal, hin_start = fluid[1].h_start, m_flow_start = q_start*rho_start, pout_start = pin_start - dp_start);
  import Modelica.Fluid.Utilities.regSquare;
  import Modelica.Fluid.Utilities.regStep;

  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby
    DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer
      "Heat transfer model for " annotation (
     choicesAllMatching = true);
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;

  constant Types.Acceleration g = Modelica.Constants.g_n;

// Flow parameter
  parameter Types.Density rho_start = 985 "Density start/reference value" annotation (
    Dialog(group = "Initialisation"));
  parameter Real q_m3h_start(unit = "m3/h") = 8 "volumetric flowrate start/Reference value" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Velocity u_start = m_flow_start / (rho_start * A) "Velocity start value" annotation (
    Dialog(group = "Initialisation"));
  parameter Boolean noInitialPressure = false "Remove initial equation for pressure, to be used in case of solver failure" annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(group = "Initialisation"));

  parameter Integer n = 3 "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.Density rho_nom = 1e3 "Nominal density of the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.Velocity u_nom = 10 "Nominal fluid velocity" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Downstream "Location of pressure state" annotation (
    Dialog(tab = "Data", group = "Fluid"));

  parameter Integer nPipes = 1 "Number of parallel pipes" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.PerUnit cf = 0.004 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Area Stot = S * nPipes "Total surface of the wall" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Real k(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));

  parameter Types.PerUnit kc=1 "Corrective factor for heat tranfer" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 5 "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model"));

  parameter Real cons = 1e-4;

  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1) "Temperature start value of the fluid" annotation (
    Dialog(group = "Initialisation"));
  final parameter Types.Pressure dp_start = rho_start * g * h + cf/2 * rho_start * omega * L / A * u_nom ^ 2 "Nominal pressure drop";
  final parameter Types.Pressure dp_nom = 2e5 "Nominal pressure drop";
  final parameter Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom "Nominal mass flow rate";
  final parameter Types.VolumeFlowRate q_start = q_m3h_start/3600 "Volumetric flowrate start value";
  final parameter Types.Area S = L * omega "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n "Surface of the wall of each finite volume (for one pipe)";
  final parameter Types.Area Atot = A * nPipes "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n "Volume of one finite element";

  outer System system "system object for global defaults";

  // Variables
  Types.MassFlowRate m_flow[n + 1](each start = m_flow_start, each nominal = m_flow_nom) "Mass flow rate in each section across the pipe";
  Types.VolumeFlowRate q[n + 1] "Volumetric flowrate in each section across the pipe";
  Real q_m3h[n + 1](each unit = "m3/h") "Volumetric flowrate in each section in m3/h";
  Types.Velocity u[n + 1](each start = u_start, each nominal = u_nom) "Velocity in each volume across the pipe";
  Types.Temperature Ttilde[n](start = T_start[2:n+1], each stateSelect = StateSelect.prefer) "State variable temperatures";
  Types.Temperature Twall[n](start = T_start[2:n+1], each stateSelect = StateSelect.prefer) "Pipe wall temperature";
  Types.Temperature T[n + 1](start = T_start) "Volume boundary temperatures";
  Types.Pressure pin "Inlet pressure";
  Types.Pressure pout "Outlet pressure";
  Types.Pressure ptilde "Pressure state the pipe";
  Types.Pressure dp(start = dp_start) "Delta pressure";
  Types.Mass M[n] "Mass of fluid in each finite volume";
  Types.Mass Mtot "Total Mass in the pipe";
  Types.Mass Mwall = rhom*L*Am "Mass of the wall";
  Types.SpecificHeatCapacity cp[n + 1] "Specific heat capacity at each fluid";
  Types.Density rho[n + 1](each start = rho_start, each nominal = rho_nom) "Density at each fluid";
  Types.Density rhotilde[n](each start = rho_start, each nominal = rho_nom) "Density at each state fluid";
  Types.Power Q_int[n] "Heat dissipation out of each volume into the wall";
  Types.Power Q_ext[n] "Heat dissipation out of each wall cell to the ambient";
  Types.Power Qtot = sum(Q_int) "Total heat";

  Medium fluid[n+1](T_start = T_start, p_start = linspace(pin_start, pout_start, n + 1));
  Medium fluid_temp(T_start = Tin_start, p_start = pin_start);

protected
  function h_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnthalpy h;
  algorithm
    h := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
  annotation(Inline = true);
  end h_T;

equation

// Assertations
  assert(n > 1, "The number of volumes must be at least 2");

// Mass & Energy Balance
  for i in 1:n loop
    //0 = m_flow[i]- m_flow[i+1];
   // m_flow[i]- m_flow[i+1] = Vi*(regStep(inlet.m_flow, fluid[i+1].drho_dT, fluid[i].drho_dT, m_flow_nom*cons)*der(Ttilde[i]));
    m_flow[i] - m_flow[i+1] = 0;
    //(Vi*regStep(inlet.m_flow,fluid[i+1].drho_dT, fluid[i].drho_dT, m_flow_nom*cons)*regStep(inlet.m_flow,fluid[i+1].u,fluid[i].u, m_flow_nom*cons) + M[i]*regStep(inlet.m_flow,fluid[i+1].cp,fluid[i].cp))*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h + wall.Q_flow[i] "Energy Balance";
  end for;
  //(M[i]*regStep(inlet.m_flow, fluid[i+1].cp, fluid[i].cp))*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h + wall.Q_flow[i] "Energy Balance";
  if thermalInertia then
    for i in 1:n loop
      (M[i]*regStep(inlet.m_flow, fluid[i+1].cp, fluid[i].cp))*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h - Q_int[i];
      //M[i]*cp[i+1]*der(Ttilde[i]) = m_flow[i + 1]*cp[i + 1]*(T[i] - T[i + 1]) - Q_int[i] "Energy balance water volume";
      Cm/n*der(Twall[i]) = Q_int[i] + Q_ext[i] "Energy balance wall";
      // Heat conduction through the internal half-thickness water to wall
      Q_int[i] = U_wm*L/n*(Ttilde[i] - Twall[i]);
      // Heat conduction through the external half-thickness wall to ambient
      Q_ext[i] = U_me*L/n*(T_ext - Twall[i]);
    end for;
  else
    for i in 1:n loop
      M[i]*cp[i+1]*der(Ttilde[i]) = m_flow[i + 1]*cp[i + 1]*(T[i] - T[i + 1]) - Q_ext[i] "Energy balance water";
      Q_int[i] = 0;
      der(Twall[i]) = 0;
      // Heat exchange outwards
      Q_ext[i] = U_me*L/n*(T_ext - Ttilde[i]);
    end for;
  end if;

  rhotilde = regStep(inlet.m_flow, rho[2:n+1], rho[1:n], m_flow_nom*cons);
  M = Vi*rhotilde;
  Ttilde = regStep(inlet.m_flow, T[2:n+1], T[1:n], m_flow_nom*cons);

  // Momentum Balance
  if hctype == Choices.Pipe.HCtypes.Middle then
    pin - ptilde = (rho[1]*g*h + homotopy((cf/2)*rho[1]*omega*L/A*regSquare(u[1],u_nom*0.05), dp_nom/m_flow_nom*m_flow[1]))/2;
    ptilde - pout = (rho[end]*g*h + homotopy((cf/2)*rho[end]*omega*L/A*regSquare(u[end],u_nom*0.05), dp_nom/m_flow_nom*m_flow[end]))/2;
 else
    pin - pout = rho[1]*g*h + homotopy((cf/2)*rho[1]*omega*L/A*regSquare(u[1],u_nom*0.05), dp_nom/m_flow_nom*m_flow[1]);
    ptilde = pout;
  end if;

  // Equations to set the fluid properties
  fluid.T = T;
  fluid.p = ones(n+1)*ptilde;
  rho = fluid[1:end].rho;
  cp = fluid[1:end].cp;
  m_flow = rho.*u*A;
  q = m_flow./rho;
  q_m3h = q*3600;

  Mtot = sum(M) "Total mass";
  //Qtot = sum(wall.Q_flow) "Total heat";

  dp = pin-pout;

  if noEvent(inlet.m_flow > 0) or not allowFlowReversal then
    T[1] = fluid_temp.T;
  else
    T[end] = fluid_temp.T;
  end if;

  fluid_temp.p = ptilde;
  fluid_temp.h = homotopy(regStep(inlet.m_flow, inStream(inlet.h_out), inStream(outlet.h_out), m_flow_nom*cons), hin_start);

  // Boundary conditions
  inlet.m_flow = m_flow[1];
  outlet.m_flow = -m_flow[n + 1];
  inlet.p = pin;
  outlet.p = pout;
  inlet.h_out = fluid[1].h;
  outlet.h_out = fluid[n+1].h;

initial equation
  if initOpt == Choices.Init.Options.steadyState then
    der(Ttilde) = zeros(n);
    //der(ptilde) = 0;
    if not noInitialPressure then
      //der(ptilde) = 0;
    else
//No initial pressure
    end if;
    if thermalInertia then
      der(Twall) = zeros(n);
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

end RoundPipeFV;
