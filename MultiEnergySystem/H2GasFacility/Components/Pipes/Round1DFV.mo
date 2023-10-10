within MultiEnergySystem.H2GasFacility.Components.Pipes;
model Round1DFV "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube(
    inlet(nXi = nXi, m_flow(start = m_flow_start, min = if allowFlowReversal then -Modelica.Constants.inf else 0), Xi(start = X_start[1:fluid[1].nXi])),
    outlet(nXi = nXi, m_flow(start = -m_flow_start, max = if allowFlowReversal then +Modelica.Constants.inf else 0)),hin_start = fluid[1].h_id_start,
    T_ext = system.T_amb);
  import Modelica.Fluid.Utilities.regSquare;
  import MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes;
  import MultiEnergySystem.DistrictHeatingNetwork.Utilities.sqrtReg;
  import MultiEnergySystem.DistrictHeatingNetwork.Utilities.squareReg;
  import Modelica.Fluid.Utilities.regStep;
  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2
      constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation (
     choicesAllMatching = true);
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer "Heat transfer model for " annotation (
     choicesAllMatching = true);

  constant Types.Acceleration g_n = Modelica.Constants.g_n "Gravity";
  outer System system;
  // Main Parameters
  parameter Boolean computeTransport = false "Used to decide if it is necessary to calculate the transport properties" annotation (
    Dialog(group = "Choices"));
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate specific entropy" annotation (
    Dialog(group = "Choices"));
  parameter Boolean noInitialPressure = false "Used to remove initial equation for pressure, to be used in case of solver failure" annotation (
    Dialog(group = "Choices"));
  parameter Boolean quasiStatic = false "Used to remove energy and composition dynamic equations" annotation (
    Dialog(group = "Choices"));
  parameter Boolean constantFrictionFactor = false "Used to set a constant value for the friction factor" annotation (
    Dialog(group = "Choices"));
  parameter Boolean computeInertialTerm = false "Used to decide if the inertial term is considered in the momentum balance" annotation (
    Dialog(group = "Choices"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state (hydraulic capacitance)" annotation (
    Dialog(group = "Choices"));
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure "Momentum equation according to the operating pressure" annotation (
    Dialog(group = "Choices"));
  parameter Types.Pressure pin_nom = pin_start "Nominal pressure of the pipeline system" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.Density rho_nom = 0.68 "Nominal density of the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.PerUnit ff_nom = 0.025 "Nominal friction factor" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nX = fluid[1].nX "Number of components in the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nXi = fluid[1].nXi "Number of independent components in the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer n = 3 "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Integer nPipes = 1 "Number of parallel pipes" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length kappa = 0.01e-3 "Roughness of the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Real k = 500 "Coefficient for the calculation of the pressure loss" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Real k_linear(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the linear pressure loss across the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));

  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter Types.PerUnit kc = 1 "Corrective factor for heat tranfer" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter Types.MassFraction X_start[nX] "Start value for the mass fraction" annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(group = "Initialisation"));

  // Final parameters
  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1) "Temperature start value of the fluid";
  final parameter Types.Pressure dp_nom = pin_start - pout_start "Nominal pressure drop";
  final parameter Types.Velocity u_nom = m_flow_start / (rho_nom * A) "Nominal mass flow rate";
  final parameter Types.Area S = L*omega "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n "Surface of the wall of each finite volume (for one pipe)";
  final parameter Types.Area Stot = S * nPipes "Total surface of the wall";
  final parameter Types.Area Atot = A * nPipes "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n "Volume of one finite element";
  final parameter Types.PerUnit Re_start = Di * m_flow_start / (A * fluid[1].mu_start) "Start value for Reynolds number";

  // State Variables
  Types.MassFraction Xitilde[n, nXi](each stateSelect = if not quasiStatic then StateSelect.prefer else StateSelect.default, start = fill(X_start[1:nXi], n), nominal = fill(1e-2*ones(nXi),n)) "Mass Composition state";
  //Types.Pressure ptilde(stateSelect = StateSelect.prefer, start = pout_start, nominal = 1e4) "Pressure state the pipe";
  Types.Pressure ptilde[n](each stateSelect = StateSelect.prefer, start = linspace(pin_start, pout_start, n), each nominal = pin_nom) "Press. state";
  Types.Temperature Ttilde[n](each stateSelect = if not quasiStatic then StateSelect.prefer else StateSelect.default, start = T_start[2:n+1]) "State variable temperatures";

  // Inlet/Outlet Variables
  Types.Temperature Tin(start = Tin_start) "Inlet temperature";
  Types.Temperature Tout(start = Tout_start) "Outlet temperature";
  Types.SpecificEnthalpy hin(start = hin_start) "Inlet Specific enthalpy";
  Types.SpecificEnthalpy hout "Outlet Specific enthalpy";
  Types.Pressure pin(start = pin_start) "Inlet pressure";
  Types.Pressure pout(start = pout_start) "Outlet pressure";

  // Vector Variables
  Types.Mass M[n] "Mass of fluid in each finite volume";
  Types.Mass Mt "Total mass in the full volume";
  Types.Density rho[n + 1](each start = rho_nom) "Density at each volume boundary";
  Types.MassFlowRate m_flow[n + 1](each min = if allowFlowReversal then -Modelica.Constants.inf else 0, each start = m_flow_start, each nominal = 1e-4) "Mass flow at each volume boundary";
  Types.VolumeFlowRate q[n + 1] "Mass flow rate in each volume across the pipe";
  Types.Temperature T[n + 1] "Volume boundary temperatures";
  Types.SpecificEnthalpy h[n + 1](each nominal = 1e6) "Specific enthalpy at each fluid";
  Types.MassFraction Xi[n + 1, nXi](nominal = fill(1e-2*ones(nXi),n+1)) "Mass fractions at each volume boundary";
  Types.Velocity u[n + 1](each start = u_nom, each nominal = 1) "Velocity at each volume boundary";
  Types.Pressure p[n + 1](each nominal = pin_nom) "Pressure at each fluid";

  // Complementary variables
  Types.Time taur "Residence time";
  Types.PerUnit Re[n + 1](each nominal = 1e5, each start = Re_start) "Reynolds";
  Types.PerUnit ff[n + 1](each nominal = ff_nom, each min = 0, each start = ff_nom) "Friction factor";
  Real kf(unit = "1/m4");

  // Fluids
  Medium fluid[n + 1](each p(nominal = pin_nom),
    T_start = T_start,
    p_start = linspace(pin_start, pout_start, n+1),
    each X_start = X_start,
    each computeTransport = computeTransport,
    each computeEntropy = computeEntropy);

equation
// Equations to set the fluid properties
  for i in 1:n + 1 loop
    fluid[i].T = T[i] "Temperature at each volume boundary is equal to its equivalent value in the vector variable T";
    fluid[i].Xi = Xi[i, :] "Mass fraction at each volume boundary is equal to its equivalent value in the vector variable Xi";
    fluid[i].p = p[i] "Pressure at each volume boundary is equal to ptilde";
    //fluid[i].p = ptilde "Pressure at each volume boundary is equal to ptilde";
  end for;
// Equations to assign values from fluids properties
  for i in 1:n + 1 loop
    h[i] = fluid[i].h "Specific enthalpy at each volume boundary";
    rho[i] = fluid[i].rho "Density at each volume boundary";
    q[i] = m_flow[i]/rho[i] "Volumetric flowrate at each volume boundary";
    m_flow[i] = A*u[i]*rho[i] "Velocity - mass flowrate relationship";
    Re[i] = min(homotopy(Di*abs(m_flow[i])/(A*fluid[i].mu_start), Di*m_flow_start/(A*fluid[i].mu_start)), 4000) "Reynold's number";
    if not constantFrictionFactor then
      sqrtReg(ff[i]) = min(1/(-1.8*log10((6.9/Re[i]) + (kappa/(3.71*Di))^1.11)), 1/(-1.8*log10((6.9/4000) + (kappa/(3.71*Di))^1.11)));
    else
      ff[i]=0.02;
    end if;
  end for;
// Relationships for state variables
  Ttilde = T[2:n + 1];
  Xitilde = Xi[2:n + 1, :];
  ptilde = if hctype == DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream then p[2:n+1] else p[1:n];

// Inlet/Outlet variables
  Tin = fluid[1].T "Inlet temperature equals to temperature of first fluid";
  Tout = fluid[n+1].T "Outlet temperature equals to temperature of last fluid";
  hin = fluid[1].h "Inlet specific enthalpy equals to specific enthalpy of first fluid";
  hout = fluid[n+1].h "Outlet specific enthalpy equals to specific enthalpy of last fluid";
  pin = fluid[1].p "Inlet pressure equals to pressure of the inlet connector";
  pout = fluid[n+1].p "Outlet pressure equals to pressure of the outlet connector";

// Boundary variables
  inlet.p = p[1];
  outlet.p = p[n+1];
  inlet.m_flow = m_flow[1];
  outlet.m_flow = -m_flow[n+1];

// Balances
  for i in 1:n loop
    M[i] = Vi*rho[i+1];
    if quasiStatic then
      m_flow[i] - m_flow[i + 1] = -Vi*rho[i + 1]^2*(fluid[i + 1].dv_dp*der(fluid[i + 1].p));
      zeros(nXi) = Xi[i,:] - Xi[i+1,:];
      0 = T[i] - T[i + 1];
    else
      m_flow[i] - m_flow[i + 1] = -Vi*rho[i + 1]^2*(fluid[i + 1].dv_dT*der(fluid[i + 1].T) + fluid[i + 1].dv_dp*der(fluid[i + 1].p) + fluid[i + 1].dv_dX*der(fluid[i + 1].X));
      m_flow[i]*fluid[i].h - m_flow[i + 1]*fluid[i + 1].h = M[i]*(fluid[i + 1].du_dT*der(fluid[i + 1].T) + fluid[i + 1].du_dp*der(fluid[i + 1].p) + fluid[i + 1].du_dX*der(fluid[i + 1].X)) + (m_flow[i] - m_flow[i + 1])*fluid[i + 1].u "Energy Balance";
      M[i]*der(fluid[i+1].Xi) = m_flow[i]*(Xi[i, :] - Xi[i+1, :]);
    end if;
    // Momentum Balance
    if not computeInertialTerm then
    //-L/(A*n)*der(m_flow[i+1]) + p[i] - p[i+1] = ff[i+1]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))*fluid[i+1].rho*A^2*squareReg(u[i]);
      p[i] - p[i+1] = ff[i+1]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/fluid[i+1].rho*squareReg(m_flow[i]);
    else
      -L/(A*n)*der(m_flow[i+1]) + p[i] - p[i+1] = ff[i+1]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/fluid[i+1].rho*squareReg(m_flow[i+1]);
    end if;
  end for;


  if not allowFlowReversal then
    inlet.h_out = fluid[1].h;
    inlet.Xi = fluid[1].Xi;
    outlet.h_out = fluid[n+1].h;
    outlet.Xi = fluid[n+1].Xi;
    fluid[1].h = inStream(inlet.h_out);
    fluid[1].Xi = inStream(inlet.Xi);
  else
    inlet.h_out = regStep(pin-pout, -4.52e6, fluid[1].h,1e2);
    inlet.Xi = regStep(pin-pout, X_start[1:nXi], fluid[1].Xi);
    outlet.h_out = regStep(pin-pout, fluid[n+1].h, -4.52e6,1e2);
    outlet.Xi = regStep(pin-pout, fluid[n+1].Xi, X_start[1:nXi]);
    if pin-pout>=0 then
      fluid[1].h = inStream(inlet.h_out);
      fluid[1].Xi = inStream(inlet.Xi);
    else
      fluid[n+1].h = inStream(outlet.h_out);
      fluid[n+1].Xi = inStream(outlet.Xi);
    end if;
  end if;

  //fluid[1].h = homotopy(noEvent(if not allowFlowReversal then inStream(inlet.h_out) elseif m_flow[1] >= 0 then inStream(inlet.h_out) else actualStream(inlet.h_out)), inStream(inlet.h_out));
  //fluid[1].Xi = homotopy(noEvent(if not allowFlowReversal then inStream(inlet.Xi) elseif m_flow[1]>= 0 then inStream(inlet.Xi) else actualStream(inlet.Xi)), inStream(inlet.Xi));
  //fluid[n+1].h = homotopy(noEvent(if not allowFlowReversal then actualStream(outlet.h_out) elseif m_flow[n+1]< 0 then actualStream(outlet.h_out) else inStream(outlet.h_out)), actualStream(outlet.h_out));
  //fluid[n+1].Xi = homotopy(noEvent(if not allowFlowReversal then actualStream(outlet.Xi) elseif m_flow[n+1]< 0 then actualStream(outlet.Xi) else inStream(outlet.Xi)), actualStream(outlet.Xi));

  kf = cf*omega*L/(2*A^3);

// Complementary variables
  Mt = sum(M);
  taur = sum(M)/max(abs(inlet.m_flow), 0.0000001);

initial equation
  if initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    for i in 1:n loop
      if quasiStatic then
      // nothing
      else
        der(Xitilde[i,:]) = zeros(nXi);
        der(Ttilde[i]) = 0;
      end if;
    end for;
    if not noInitialPressure then
      //der(ptilde) = 0;
      der(ptilde) = zeros(n);
    else
      //  No initial pressure
    end if;

  elseif initOpt == DistrictHeatingNetwork.Choices.Init.Options.fixedState then
    for i in 1:n loop
      fluid[i+1].X = X_start;
    end for;
    if not noInitialPressure then
      ptilde = linspace(pin_start, pout_start, n);
    else
//  No initial pressure
    end if;
  else
// No initial equations
  end if;



end Round1DFV;
