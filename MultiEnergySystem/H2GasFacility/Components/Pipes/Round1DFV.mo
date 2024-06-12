within MultiEnergySystem.H2GasFacility.Components.Pipes;
model Round1DFV "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube(
    redeclare model Medium = Gas,
    fluidIn(computeTransport = computeTransport, computeEntropy = computeEntropy, computeEnergyVariables = computeEnergyVariables),
    fluidOut(computeTransport = computeTransport, computeEntropy = computeEntropy, computeEnergyVariables = computeEnergyVariables),
    inlet(nXi = nXi, m_flow(start = m_flow_start, min = if allowFlowReversal then -Modelica.Constants.inf else 0), Xi(start = X_start[1:fluid[1].nXi])),
    outlet(nXi = nXi, m_flow(start = -m_flow_start, max = if allowFlowReversal then +Modelica.Constants.inf else 0)), hin_start = fluid[1].h_id_start,
    T_ext = system.T_amb, allowFlowReversal = system.allowFlowReversal);
  import Modelica.Fluid.Utilities.regSquare;
  import MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes;
  import MultiEnergySystem.DistrictHeatingNetwork.Utilities.sqrtReg;
  import MultiEnergySystem.DistrictHeatingNetwork.Utilities.squareReg;
  import Modelica.Fluid.Utilities.regStep;
  // Medium & Heat Transfer Model for the pipe
  replaceable model Gas = H2GasFacility.Media.RealGases.NG6_H2_Papay
      constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation (
     choicesAllMatching = true);
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby
    DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer                 "Heat transfer model for " annotation (
     choicesAllMatching = true);

  constant Types.Acceleration g_n = Modelica.Constants.g_n "Gravity";
  outer System system;
  // Main Parameters
  parameter Boolean computeTransport = false "Used to calculate the transport properties" annotation (
    Dialog(group = "Choices"));
  parameter Boolean computeEntropy = false "Used to calculate specific entropy" annotation (
    Dialog(group = "Choices"));
  parameter Boolean noInitialPressure = false "Used to remove initial equation for pressure, to be used in case of solver failure" annotation (
    Dialog(group = "Choices"));
  parameter Boolean quasiStatic = false "Used to remove composition dynamic equation" annotation (
    Dialog(group = "Choices"));
  parameter Boolean constantFrictionFactor = false "Used to set a constant value for the friction factor" annotation (
    Dialog(group = "Choices"));
  parameter Boolean computeInertialTerm = false "Used to decide if the inertial term is considered in the momentum balance" annotation (
    Dialog(group = "Choices"));
  parameter Boolean computeEnergyVariables = false "Used to calculate HHV,SG & WI at each fluid volume";
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
  parameter Real dp_small = 1e-5;

  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter Types.PerUnit kc = 1 "Corrective factor for heat tranfer" annotation (
    Dialog(group = "Heat Transfer Model"));
//   parameter Types.MassFraction X_start[nX] "Start value for the mass fraction"
//     annotation (Dialog(group="Initialisation"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(group = "Initialisation"));

  // Final parameters
  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1) "Temperature start value of the fluid";
  final parameter Types.Pressure p_start[n+1] = linspace(pin_start, pout_start, n+1)
                                                                                    "Pressure start value of fluids";
  final parameter Types.Pressure dp_nom = pin_start - pout_start "Nominal pressure drop";
  final parameter Types.Velocity vel_nom = m_flow_start / (rho_nom * A) "Nominal mass flow rate";
  final parameter Types.Area S = L*omega "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n "Surface of the wall of each finite volume (for one pipe)";
  final parameter Types.Area Stot = S * nPipes "Total surface of the wall";
  final parameter Types.Area Atot = A * nPipes "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n "Volume of one finite element";
  final parameter Types.PerUnit Re_start = Di * m_flow_start / (A * fluid[1].mu_start) "Start value for Reynolds number";

  // State Variables
  Types.MassFraction Xitilde[n, nXi](each stateSelect = if not quasiStatic then StateSelect.prefer else StateSelect.default, start = fill(X_start[1:nXi], n), nominal = 0.1*fill(ones(nXi),n)) "Mass Composition state";
  //Types.Pressure ptilde(stateSelect = StateSelect.prefer, start = pout_start, nominal = 1e4) "Pressure state the pipe";
  Types.Pressure ptilde[n](each stateSelect = StateSelect.prefer, start = p_start[2:end], each nominal = pin_nom) "Press. state";
  Types.Temperature Ttilde[n](each stateSelect = StateSelect.prefer, start = T_start[2:end]) "State variable temperatures";
  Types.Density rhotilde[n](each start = rho_nom);
  Types.SpecificEnergy utilde[n];
  Types.MassFlowRate m_flowtilde[n](each stateSelect = StateSelect.prefer, each start = m_flow_start);
  //Types.MassFlowRate m_flowtilde[n](each start = m_flow_start);


  // Inlet/Outlet Variables
  Types.Temperature Tin "Inlet temperature";
  Types.Temperature Tout "Outlet temperature";
  Types.SpecificEnthalpy hin(start = hin_start) "Inlet Specific enthalpy";
  Types.SpecificEnthalpy hout "Outlet Specific enthalpy";
  Types.Pressure pin "Inlet pressure";
  Types.Pressure pout "Outlet pressure";

  // Vector Variables
  Types.Mass M[n] "Mass of fluid in each finite volume";
  Types.Mass Mt "Total mass in the full volume";
  Types.Density rho[n + 1] "Density at each volume boundary";
  Types.MassFlowRate m_flow[n + 1](each min = if allowFlowReversal then -Modelica.Constants.inf else 0, each start = m_flow_start, each nominal = m_flow_start) "Mass flow at each volume boundary";
  Types.VolumeFlowRate q[n + 1] "Volumetric flow rate in each volume across the pipe";
  Types.Temperature T[n + 1] "Volume boundary temperatures";
  Types.SpecificEnthalpy h[n + 1] "Specific enthalpy at each fluid";
  //Types.MassFraction Xi[n + 1, nXi](nominal = fill(ones(nXi),n+1)) "Mass fractions at each volume boundary";
  Types.MassFraction Xi[n + 1, nXi](nominal = fill(ones(nXi),n+1)) "Mass fractions at each volume boundary";
  Types.Velocity vel[n + 1](each start = vel_nom, each nominal = 1) "Velocity at each volume boundary";
  Types.Pressure p[n + 1](each nominal = pin_nom) "Pressure at each fluid";
  Real dvdttilde[n](each start = 0);
  Real dudttilde[n](each start = 0);
  Types.SpecificVolume dv_dXi[n,nXi];
  Types.SpecificEnergy du_dXi[n,nXi];
  Types.SpecificEnthalpy inh;
  Types.SpecificEnthalpy outh;
  Types.MassFraction inXi[nXi];
  Types.MassFraction outXi[nXi];
  Types.DerSpecificVolumeByPressure dv_dp[n];
  Types.DerSpecificVolumeByTemperature dv_dT[n];
  Types.DerSpecEnergyByPressure du_dp[n];
  Types.DerSpecEnergyByTemperature du_dT[n];

  // Complementary variables
  Types.Time taur "Residence time";
  Types.PerUnit Re[n + 1](each nominal = 1e5) "Reynolds number";
  Types.PerUnit ff[n + 1](each nominal = 5e-2, each min = 0, each start = ff_nom) "Friction factor";
  Real kf(unit = "1/m4");
  Types.Pressure dp(start = dp_nom, nominal = 1e4) "Delta pressure";

  //** Energy Variables
  Real HHV_mix_in(unit = "J/kg"), HHV_mix_out(unit = "J/kg") "Higher Heating Value of the fluid in mass units";
  Real LHV_mix_in(unit = "J/kg"), LHV_mix_out(unit = "J/kg") "Lower Heating Value of the fluid in mass units";
  Real HHV_SCM_mix_in(unit = "J/m3"), HHV_SCM_mix_out(unit = "J/m3") "Higher Heating Value of the fluid mixture in Standard conditions";
  Real LHV_SCM_mix_in(unit = "J/m3"), LHV_SCM_mix_out(unit = "J/m3") "Lower Heating Value of the fluid mixture in Standard conditions";
  Types.PerUnit SG_in, SG_out "Specific gravity of the fluid mixture";
  Real WI_in(unit = "J/m3"), WI_out(unit = "J/m3") "Wobbex Index of the fluid mixture at inlet & outlet";

  // Fluids
  Medium fluid[n + 1](each p(nominal = pin_nom),
    T_start = T_start,
    p_start = linspace(pin_start, pout_start, n+1),
    each X_start = X_start,
    each computeTransport = computeTransport,
    each computeEntropy = computeEntropy,
    each computeEnergyVariables = computeEnergyVariables);

  Medium fluid_temp(
    T_start = Tin_start,
    p_start = pin_start,
    X_start = X_start,
    computeTransport = computeTransport,
    computeEntropy = computeEntropy,
    computeEnergyVariables = computeEnergyVariables);

equation
// Equations to set the fluid properties
  fluid.T = T;
  fluid.Xi = Xi;
  fluid.p = p;

  {fluidIn.p, fluidIn.h} = {fluid[1].p, fluid[1].h};
  fluidIn.Xi = fluid[1].Xi;
  {fluidOut.p, fluidOut.h} = {fluid[n+1].p, fluid[n+1].h};
  fluidOut.Xi = fluid[n+1].Xi;

// Equations to assign values from fluids properties
  for i in 1:n + 1 loop
    if not constantFrictionFactor then
      Re[i] = max((Di/A)*homotopy(abs(m_flow[i])/fluid[i].mu_start+1e-3, m_flow_start/fluid[i].mu_start),4000) "Reynold's number";
      sqrtReg(ff[i]) = min(1/(-1.8*log10((6.9/Re[i]) + (kappa/(3.71*Di))^1.11)), 1/(-1.8*log10((6.9/4000) + (kappa/(3.71*Di))^1.11)));
    else
      Re[i]=0;
      ff[i]=ff_nom;
    end if;
  end for;

  h = fluid.h;
  rho = fluid.rho;
  q = m_flow./rho;
  m_flow = A*vel.*rho;

// Relationships for state variables
  if allowFlowReversal then
    Ttilde = regStep(inlet.m_flow, T[2:end], T[1:end-1],m_flow_start*dp_small);
    //Ttilde = (T[2:end] + T[1:end-1])/2;
    Xitilde = regStep(inlet.m_flow, Xi[2:end,:], Xi[1:end-1,:], m_flow_start*dp_small);
    //Xitilde = (Xi[2:end,:] + Xi[1:end-1,:])/2;
    rhotilde = regStep(inlet.m_flow, rho[2:n+1], rho[1:n], m_flow_start*dp_small);
    //rhotilde = (rho[2:end] + rho[1:end-1])/2;
    utilde = regStep(inlet.m_flow, fluid[2:end].u, fluid[1:end-1].u, m_flow_start*dp_small);

    dv_dT = regStep(inlet.m_flow, fluid[2:end].dv_dT, fluid[1:end-1].dv_dT, m_flow_start*dp_small);
    dv_dp = regStep(inlet.m_flow, fluid[2:end].dv_dp, fluid[1:end-1].dv_dp, m_flow_start*dp_small);
    dv_dXi = regStep(inlet.m_flow, fluid[2:end].dv_dX[1:nXi], fluid[1:end-1].dv_dX[1:nXi], m_flow_start*dp_small);
    du_dT = regStep(inlet.m_flow, fluid[2:end].du_dT, fluid[1:end-1].du_dT, m_flow_start*dp_small);
    du_dp = regStep(inlet.m_flow, fluid[2:end].du_dp, fluid[1:end-1].du_dp, m_flow_start*dp_small);
    du_dXi = regStep(inlet.m_flow, fluid[2:end].du_dX[1:nXi], fluid[1:end-1].du_dX[1:nXi], m_flow_start*dp_small);
  else
    Ttilde = T[2:end];
    Xitilde = Xi[2:end,:];
    rhotilde = rho[2:end];
    utilde = fluid[2:end].u;

    dv_dT = fluid[2:end].dv_dT;
    dv_dp = fluid[2:end].dv_dp;
    dv_dXi = fluid[2:end].dv_dX[1:nXi];
    du_dT = fluid[2:end].du_dT;
    du_dp = fluid[2:end].du_dp;
    du_dXi = fluid[2:end].du_dX[1:nXi];
  end if;
  //ptilde = p[2:end];
  //m_flowtilde = regStep(inlet.m_flow, m_flow[2:end], m_flow[1:end-1], dp_nom*dp_small);
  m_flowtilde =  m_flow[1:end-1];
  //m_flowtilde = (m_flow[2:end] + m_flow[1:end-1])/2;

  M = Vi*rhotilde;

  dvdttilde = if quasiStatic then
                dv_dp.*der(ptilde)+
                dv_dT.*der(Ttilde)
              else
                dv_dp.*der(ptilde)+
                dv_dT.*der(Ttilde)+
                {dv_dXi[i,:]*der(Xitilde[i,:]) for i in 1:n};
  dudttilde = if quasiStatic then
                du_dp.*der(ptilde)+
                du_dT.*der(Ttilde)
              else
                du_dp.*der(ptilde)+
                du_dT.*der(Ttilde)+
                {du_dXi[i,:]*der(Xitilde[i,:]) for i in 1:n};

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
  inlet.h_out = fluid[1].h;
  outlet.h_out = fluid[end].h;
  inlet.Xi= fluid[1].Xi;
  outlet.Xi = fluid[end].Xi;

// Balances
  m_flow[1:n]-m_flow[2:n+1] = -Vi*rhotilde.^2 .*dvdttilde;
  m_flow[1:n].*fluid[1:n].h - m_flow[2:n+1].*fluid[2:n+1].h = M.*dudttilde + (m_flow[1:n]-m_flow[2:n+1]).*utilde;
  for i in 1:n loop
    // Composition mass balance
    if quasiStatic then
      zeros(nXi) = Xi[i,:] - Xi[i+1,:];
    else
      //M[i]*der(Xitilde[i,:]) = m_flow[i]*(Xi[i,:] - Xi[i+1,:]);
      M[i]*der(Xitilde[i,:]) + Xitilde[i,:]*(m_flow[i]-m_flow[i+1]) = m_flow[i]*Xi[i,:] - m_flow[i+1]*Xi[i+1,:];
    end if;

    // Momentum Balance - Hydraulic Capacitance Position
//     if hctype == DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle then
//       -L/(A*n)*der(m_flowtilde[i])/2 + p[i] - ptilde[i] = rho[i]*g_n*H/2 + homotopy(ff[i]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/rho[i]*regSquare(m_flow[i], m_flow_start*0.05), (dp_nom/m_flow_start)*m_flow[i])/2;
//       -L/(A*n)*der(m_flowtilde[i])/2 + ptilde[i] - p[i+1] = rho[i+1]*g_n*H/2 + homotopy(ff[i+1]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/rho[i+1]*regSquare(m_flow[i+1], m_flow_start*0.05), dp_nom/m_flow_start*m_flow[i+1])/2;
//     else
//       -L/(A*n)*der(m_flowtilde[i]) + p[i] - p[i+1] = rho[i+1]*g_n*H + homotopy(ff[i+1]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/rho[i+1]*regSquare(m_flow[i], m_flow_start*0.05), (dp_nom/m_flow_start)*m_flow[i]);
//       ptilde[i] = p[i+1];
//     end if;

    // Momentum Balance - Hydraulic Capacitance Position
    if hctype == DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle then
      p[i] - ptilde[i] = rho[i]*g_n*H/2 + homotopy(ff[i]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/rho[i]*regSquare(m_flow[i], m_flow_start*0.05), (dp_nom/m_flow_start)*m_flow[i])/2;
      ptilde[i] - p[i+1] = rho[i+1]*g_n*H/2 + homotopy(ff[i+1]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/rho[i+1]*regSquare(m_flow[i+1], m_flow_start*0.05), dp_nom/m_flow_start*m_flow[i+1])/2;
    else
      -L/(A*n)*der(m_flowtilde[i]) + p[i] - p[i+1] = rho[i]*g_n*H + homotopy(ff[i]*(8*(L/n)/(Modelica.Constants.pi^2*Di^5))/rho[i]*regSquare(m_flow[i], m_flow_start*0.05), (dp_nom/m_flow_start)*m_flow[i]);
      ptilde[i] = p[i+1];
    end if;
  end for;

  inh = inStream(inlet.h_out);
  outh = inStream(outlet.h_out);
  inXi = inStream(inlet.Xi);
  outXi = inStream(outlet.Xi);


  if allowFlowReversal then
    fluid_temp.p = regStep(inlet.m_flow,inlet.p,outlet.p,m_flow_start*dp_small);
    fluid_temp.h = regStep(inlet.m_flow,inh,outh,m_flow_start*dp_small);
    fluid_temp.Xi = regStep(inlet.m_flow,inXi,outXi,m_flow_start*dp_small);
  else
    fluid_temp.p = inlet.p;
    fluid_temp.h = inStream(inlet.h_out);
    fluid_temp.Xi = homotopy(inStream(inlet.Xi), X_start[1:nXi]);
  end if;

  if noEvent(inlet.m_flow > 0) then
    T[1] = homotopy(fluid_temp.T, Tin_start);
    Xi[1,:] = homotopy(fluid_temp.Xi, X_start[1:nXi]);
  else
    T[end] = fluid_temp.T;
    Xi[end,:] = fluid_temp.Xi;
  end if;

  kf = cf*omega*L/(2*A^3);
  dp = pin-pout;

  // Complementary variables
  Mt = sum(M);
  taur = sum(M)/max(abs(inlet.m_flow), 0.000001);


  // Energy Variables
  {HHV_mix_in, HHV_mix_out} = {fluid[1].HHV*fluid[1].X, fluid[n+1].HHV*fluid[n+1].X};
  {LHV_mix_in, LHV_mix_out} = {fluid[1].LHV*fluid[1].X, fluid[n+1].LHV*fluid[n+1].X};
  {HHV_SCM_mix_in, HHV_SCM_mix_out} = {fluid[1].HHV_SCM*fluid[1].Y, fluid[n+1].HHV_SCM*fluid[n+1].Y};
  {LHV_SCM_mix_in, LHV_SCM_mix_out} = {fluid[1].LHV_SCM*fluid[1].Y, fluid[n+1].LHV_SCM*fluid[n+1].Y};
  {SG_in, SG_out} = {fluid[1].rho0/fluid[1].rhoair, fluid[n+1].rho0/fluid[n+1].rhoair};
  {WI_in, WI_out} = {HHV_SCM_mix_in/sqrt(SG_in), HHV_SCM_mix_out/sqrt(SG_out)};

initial equation
  if initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    for i in 1:n loop
      der(m_flowtilde[i]) = 0;
      if quasiStatic then
      // nothing
        der(Ttilde[i]) = 0;
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

  annotation (Documentation(info="<html>
<p><span style=\"font-size: 12pt;\">** Friction factor equation -&gt; Add bibliography</span></p>
</html>"), experiment(
      StopTime=500,
      Interval=0.0167,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Round1DFV;
