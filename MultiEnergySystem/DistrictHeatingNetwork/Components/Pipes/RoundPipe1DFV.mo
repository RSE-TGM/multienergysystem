within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model RoundPipe1DFV
  "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialRoundTube;
  import Modelica.Fluid.Utilities.regSquare;
  import Modelica.Fluid.Utilities.regStep;
  //import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
//  replaceable package Medium = Water constrainedby
//    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation (
//     choicesAllMatching = true);
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby
    DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer
      "Heat transfer model for " annotation (
     choicesAllMatching = true);
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;

  constant Types.Acceleration g = Modelica.Constants.g_n;
  parameter Boolean computePressureDifference = true;
// Flow parameter
  parameter Boolean noInitialPressure = false "Remove initial equation for pressure, to be used in case of solver failure";
  parameter Boolean computeLinearPressureDrop = true "If true, then the pressure drop is linear, else the pressure drop is non-linear computed as a function of cp and u";
  parameter Integer n = 3 "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nPipes = 1 "Number of parallel pipes" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.PerUnit cf = 0.004 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Velocity u_nom = 1 "Nominal fluid velocity" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.PerUnit kc=1 "Corrective factor for heat tranfer" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(group = "Initialisation"));
  parameter Real k(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Density rho_nom = 997 "Nominal density of the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter Types.Area Stot = S * nPipes "Total surface of the wall" annotation (
    Dialog(tab = "Data", group = "Pipe"));

  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1) "Temperature start value of the fluid" annotation (
    Dialog(group = "Initialisation"));
  final parameter Types.Pressure dp_nom = cf / 2 * rho_nom * omega * L / A * u_nom ^ 2 "Nominal pressure drop";
  final parameter Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom "Nominal mass flow rate";
  final parameter Types.Area S = L * omega "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n "Surface of the wall of each finite volume (for one pipe)";
  final parameter Types.Area Atot = A * nPipes "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n "Volume of one finite element";

  outer System system "system object for global defaults";

  // Variables
  Types.MassFlowRate m_flow[n + 1](each start = m_flow_start) "Mass flow rate in each section across the pipe";
  Types.VolumeFlowRate q[n + 1] "Volumetric flowrate in each section across the pipe";
  Real q_m3h[n + 1](each unit = "m3/h") "Volumetric flowrate in each section in m3/h";
  Types.Velocity u[n + 1](each start = u_nom, each nominal = 1) "Velocity in each volume across the pipe";
  Types.Temperature Ttilde[n](start = T_start[2:n+1], each stateSelect = StateSelect.prefer) "State variable temperatures";
  Types.Temperature Twall[n] "Pipe wall temperature";
  Types.Power Qtot "Total heat";
  Types.Temperature T[n + 1](start = T_start) "Volume boundary temperatures";
  Types.Pressure pin "Inlet pressure";
  Types.Pressure pout "Outlet pressure";
  Types.Pressure ptilde "Pressure state the pipe";
  Types.Pressure dp(start = dp_nom) "Delta pressure";
  Types.Mass M[n] "Mass of fluid in each finite volume";
  Types.Mass Mtot "Total Mass in the pipe";
  Types.SpecificHeatCapacity cp[n+1] "Specific heat capacity at each fluid";
  Types.Density rho[n+1] "Density at each fluid";
  Types.Density rhotilde[n](each start = rho_nom);

  //   Types.Power Q_int[n] "Heat dissipation out of each volume into the wall";
  //   Types.Power Q_ext[n] "Heat dissipation out of each wall cell to the ambient";

  Medium fluid[n+1](T_start = T_start, p_start = linspace(pin_start, pout_start, n + 1));
  Medium fluid_temp(T_start = Tin_start, p_start = pin_start);

  HeatTransferModel heatTransfer(
    gamma_nom = gamma_nom,
    n = n,
    nPipes = nPipes,
    Lc = Di,
    S = Stot,
    A = Atot,
    Twall = Twall,
    Tmean = regStep(dp, fluid[2:end].T, fluid[1:end-1].T),
    m_flow = regStep(dp, m_flow[2:end], m_flow[1:end-1]),
    p = pout,
    cp = fluid[2:end].cp,
    mu = fluid[2:end].mu,
    k = fluid[2:end].kappa,
    each m_flow_nom = m_flow_start,
    p_nom = pout_start,
    kc = kc);
    //cp = 0.5*(fluid[1:end-1].cp + fluid[2:end].cp),

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.MultiHeatPort wall(n=n)   annotation (
    Placement(visible = true, transformation(origin = {-1.77636e-15, 50.5}, extent = {{-42, -10.5}, {42, 10.5}}, rotation = 0), iconTransformation(origin={0,51},               extent = {{-44, -11}, {44, 11}}, rotation = 0)));
equation

// Assertations
  assert(n > 1, "The number of volumes must be at least 2");
  //assert(pin < pmax, "The pressure in the pipe is higher than the maximum designed pressure");
  //assert(pout < pmax, "The pressure in the pipe is higher than the maximum designed pressure");


// Mass & Energy Balance
  for i in 1:n loop
    m_flow[i]- m_flow[i+1] = Vi*(regStep(dp,fluid[i+1].drho_dT, fluid[i].drho_dT)*der(Ttilde[i]) +  1e-5*der(ptilde));
    //rhotilde[i]*Vi*cp[i+1]*der(Ttilde[i]) = cp[i]*m_flow[i]*(T[i] - T[i+1]) + wall.Q_flow[i] "Energy balance";
    //(Vi*regStep(dp,fluid[i+1].h,fluid[i].h)*rhotilde[i] + M[i]*regStep(dp,fluid[i+1].cp,fluid[i].cp))*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h + wall.Q_flow[i] "Energy Balance";

    (Vi*regStep(dp,fluid[i+1].drho_dT, fluid[i].drho_dT)*regStep(dp,fluid[i+1].h,fluid[i].h) + M[i]*regStep(dp,fluid[i+1].cp,fluid[i].cp))*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h + wall.Q_flow[i] "Energy Balance";
  end for;

  rhotilde = regStep(dp, rho[2:n+1], rho[1:n], rho_nom*1e-5);
  M = Vi*rhotilde;
  Ttilde = regStep(dp, T[2:n+1], T[1:n], Tin_start*1e-5);
  ptilde = pout;

  // Momentum Balance
  //pin - pout = rho[end]*g*h + homotopy((cf/2)*rho[end]*omega*L/A*regSquare(u[end],u_nom*0.05), dp_nom/m_flow_nom*m_flow[end]);
  pin - pout = rho[1]*g*h + homotopy((cf/2)*rho[1]*omega*L/A*regSquare(u[1],u_nom*0.05), dp_nom/m_flow_nom*m_flow[1]);

  // Equations to set the fluid properties
  fluid.T = T;
  fluid.p = ones(n+1)*ptilde;
  rho = fluid[1:end].rho;
  cp = fluid[1:end].cp;
  m_flow = rho.*u*A;
  q = m_flow./rho;
  q_m3h = q*3600;


  Mtot = sum(M) "Total mass";
  Qtot = sum(wall.Q_flow) "Total heat";

  dp = pin-pout;

  if noEvent(dp > 0) then
    T[1] = fluid_temp.T;
  else
    T[end] = fluid_temp.T;
  end if;

  fluid_temp.p = ptilde;
  fluid_temp.h = homotopy(regStep(dp, inStream(inlet.h_out), inStream(outlet.h_out), hin_start*1e-5), hin_start);

  // Boundary conditions
  inlet.m_flow = m_flow[1];
  outlet.m_flow = -m_flow[n + 1];
  inlet.p = pin;
  outlet.p = pout;
  inlet.h_out = fluid[1].h;
  outlet.h_out = fluid[n+1].h;
  wall.Q_flow = heatTransfer.Q_flow;
  wall.T = Twall;

initial equation
  if initOpt == Choices.Init.Options.steadyState then
    der(Ttilde) = zeros(n);
    der(ptilde) = 0;
    if not noInitialPressure then
      //der(ptilde) = 0;
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


end RoundPipe1DFV;
