within MultiEnergySystem.H2GasFacility.Components.Pipes;
model Round1DFV "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube(
    inlet(                                                          nXi =       nXi,                   m_flow(      start = m_flow_start, min = if allowFlowReversal then -Modelica.Constants.inf else 0),                                                                                                                                        Xi(      start = X_start[1:fluid[1].nXi])),
    outlet(                                                                          nXi =        nXi,                                                                                                     m_flow(       start = -m_flow_start, max = if allowFlowReversal then +Modelica.Constants.inf else 0)),hin_start = fluid[1].h_id_start);
  import Modelica.Fluid.Utilities.regSquare;
  import           MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes;
  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2                        constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation (
     choicesAllMatching = true);
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
                                                                                                                               constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer "Heat transfer model for " annotation (
     choicesAllMatching = true);

  constant Types.Acceleration g_n = Modelica.Constants.g_n "Gravity";

  // Main Parameters
  parameter Boolean computeTransport = false "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate specific entropy";
  parameter Boolean noInitialPressure = false "Remove initial equation for pressure, to be used in case of solver failure";
  parameter Boolean quasistaticEnergyBalance = false "If true, then T[i+1] = T[i]";
  parameter Integer n = 3 "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nPipes = 1 "Number of parallel pipes" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Pressure pin_nom = 7500 "Nominal pressure of the pipeline system";
  parameter Types.Density rho_nom = 0.68 "Nominal density of the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter Types.PerUnit kc = 1 "Corrective factor for heat tranfer" annotation (
    Dialog(group = "Heat Transfer Model"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.LowPressure "Momentum equation";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(group = "Initialisation"));
  parameter Real k = 500 "Coefficient for the calculation of the pressure loss" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Real k_linear(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the linear pressure loss across the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Integer nX = fluid[1].nX "Number of components in the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nXi = fluid[1].nXi "Number of independent components in the fluid" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.MassFraction X_start[nX] "Start value for the mass fraction" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Length kappa = 0.01e-3 "Roughness of the pipe" annotation (
    Dialog(tab = "Data", group = "Pipe"));

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
  final parameter Types.PerUnit Re_start = Di * m_flow_start / (A * fluid[1].mu_const) "Start value for Reynolds number";

  outer System system "system object for global defaults";

  // State Variables
  Types.MassFraction Xitilde[n, nXi](each stateSelect = StateSelect.prefer, start = fill(X_start[1:nXi], n)) "Mass Composition state";
  //Types.Pressure ptilde(stateSelect = StateSelect.prefer, start = pout_start, nominal = 1e4) "Pressure state the pipe";
  Types.Pressure ptilde[n](each stateSelect = StateSelect.prefer, start = linspace(pin_start, pout_start, n), each nominal = pin_nom) "Press. state";
  Types.Temperature Ttilde[n](each stateSelect = StateSelect.prefer, start = T_start[2:n+1]) "State variable temperatures";

  // Inlet/Outlet Variables
  Types.Temperature Tin "Inlet temperature";
  Types.Temperature Tout "Outlet temperature";
  Types.SpecificEnthalpy hin(start = hin_start) "Inlet Specific enthalpy";
  Types.SpecificEnthalpy hout
                             "Outlet Specific enthalpy";
  Types.Pressure pin "Inlet pressure";
  Types.Pressure pout "Outlet pressure";

  // Vector Variables
  Types.Mass M[n] "Mass of fluid in each finite volume";
  Types.Density rho[n + 1](each start = rho_nom) "Density at each volume boundary";
  Types.MassFlowRate m_flow[n + 1](each min = 0, each start = m_flow_start, each nominal = 0.3) "Mass flow at each volume boundary";
  Types.VolumeFlowRate q[n + 1] "Mass flow rate in each volume across the pipe";
  Types.Temperature T[n + 1] "Volume boundary temperatures";
  Types.SpecificEnthalpy h[n + 1](each nominal = 1e6) "Specific enthalpy at each fluid";
  Types.MassFraction Xi[n + 1, nXi] "Mass fractions at each volume boundary";
  Types.Velocity u[n + 1] "Velocity at each volume boundary";
  Types.Pressure p[n + 1](each nominal = pin_nom) "Pressure at each fluid";

  // Complementary variables
  Types.Time taur "Residence time";
  Types.PerUnit Re[n + 1](each nominal = 1e5, each start = Re_start) "Reynolds";
  Types.PerUnit ff[n + 1](each nominal = 0.001, each min = 0, each start = 0.001) "Friction factor";
  Real kf(unit = "1/m4");

  // Fluids
  Medium fluid[n + 1](each p(nominal = pin_nom), each v(nominal = 50),
    T_start = T_start,
    each X_start = X_start,
    p_start = linspace(pin_start, pout_start, n+1),
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
    Re[i] = homotopy(Di*m_flow[i]/(A*fluid[i].mu_const), Di*m_flow_start/(A*fluid[i].mu_const)) "Reynold's number";
    //ff[i] = -2*log((2.51/(Re[i]*sqrt(ff[i])) + kappa/(3.715*Di)));
    //1 = (-3.6*log10((6.9/Re[i]) + (kappa/(3.71*Di))^(1.11)))*sqrt(ff[i]);
    //ff[i] = 0.00475;
    //ff[i] = 1/(-3.6*log10((6.9/Re[i]) + (kappa/(3.71*Di))^(1.11)))^2;
    ff[i] = 64/(Re[i]+1) + 1/(-2*log(kappa/(3.71*Di)))^2 "Nikuradse, friction factor";
    //ff[i] = -3.6*log10((6.9/Re[i]) + (kappa/(3.71*Di))^(1.11));
  end for;
// Relationships for state variables
  Ttilde = T[2:n + 1];
  Xitilde = Xi[2:n + 1, :];
//ptilde = p[2:n+1];
//ptilde = pout;
// Boundary variables
  m_flow[1] = inlet.m_flow;
  m_flow[n + 1] = -outlet.m_flow;
  h[1] = inStream(inlet.h_out);
//h[n+1] = outlet.h_out;
  outlet.h_out = h[n + 1];
  Xi[1, :] = inStream(inlet.Xi);
  outlet.Xi = Xi[n + 1, :];
  Tin = fluid[1].T "Inlet temperature equals to temperature of first fluid";
  Tout = fluid[n + 1].T "Outlet temperature equals to temperature of last fluid";
  hin = fluid[1].h "Inlet specific enthalpy equals to specific enthalpy of first fluid";
  hout = fluid[n + 1].h "Outlet specific enthalpy equals to specific enthalpy of last fluid";
  pin = inlet.p "Inlet pressure equals to pressure of the inlet connector";
  pout = outlet.p "Outlet pressure equals to pressure of the outlet connector";
  inlet.Xi = X_start[1:nXi] "Dummy equation (not flow reversal)";
  //inlet.h_out = hin_start "Dummy equation (not flow reversal)";
  //inlet.Xi = inStream(outlet.Xi) "Dummy equation (not flow reversal)";
  inlet.h_out = inStream(outlet.h_out) "Dummy equation (not flow reversal)";

// Balances
  for i in 1:n loop
    M[i] = Vi*rho[i + 1];

    // Mass fraction Balance
    M[i]*der(fluid[i + 1].Xi) = m_flow[i]*(Xi[i, :] - Xi[i + 1, :]);

    // Mass & Energy Balance
    if quasistaticEnergyBalance then
      m_flow[i] - m_flow[i + 1] = -Vi*rho[i + 1]^2*(fluid[i + 1].dv_dp*der(fluid[i + 1].p) + fluid[i + 1].dv_dX*der(fluid[i + 1].X));
      0 = T[i] - T[i + 1];
    else
      m_flow[i] - m_flow[i + 1] = -Vi*rho[i + 1]^2*(fluid[i + 1].dv_dT*der(fluid[i + 1].T) + fluid[i + 1].dv_dp*der(fluid[i + 1].p) + fluid[i + 1].dv_dX*der(fluid[i + 1].X));
      m_flow[i]*fluid[i].h - m_flow[i + 1]*fluid[i + 1].h = M[i]*(fluid[i + 1].du_dT*der(fluid[i + 1].T) + fluid[i + 1].du_dp*der(fluid[i + 1].p) + fluid[i + 1].du_dX*der(fluid[i + 1].X)) + (m_flow[i] - m_flow[i + 1])*fluid[i + 1].u "Energy Balance";
    end if;

    // Momentum Balance
    if momentum == DistrictHeatingNetwork.Choices.Pipe.Momentum.LowPressure then
      p[i] - p[i + 1] = k*m_flow[i]*m_flow[i]*(L/n)/((rho[1])*Di^5);
      ptilde[i] = p[i+1];
    elseif momentum == DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure then
      p[i]*p[i] = p[i+1]*p[i+1] + (8*(L/n)*L*ff[i]*T[i]*(fluid[i].R/fluid[i].MM_mix)*m_flow[i]*m_flow[i]/(Modelica.Constants.pi^2*Di^5))/1e3;
      ptilde[i] = p[i+1];
    elseif momentum == DistrictHeatingNetwork.Choices.Pipe.Momentum.HighPressure then
      p[i] - ptilde[i] = k_linear/2*m_flow[i]/n;
      ptilde[i] - p[i+1] = k_linear/2*m_flow[i]/n;
    end if;
  end for;

  //pin - ptilde = k/2*inlet.m_flow;
  //ptilde - pout = -k/2*outlet.m_flow;

  //pin*pin = pout*pout + (8*L*L*ff[n+1]*T_start[n+1]*(fluid[n+1].R/fluid[1].MM_mix)*m_flow[n + 1]*m_flow[n + 1]/(Modelica.Constants.pi^2*Di^5))/1e6 ;
  //pin*pin = pout*pout + (8*L*L*ff[n+1]*(pout/rho[n+1])*m_flow[n + 1]*m_flow[n + 1]/(Modelica.Constants.pi^2*Di^5))/1e6 ;

  //pin*pin = homotopy(pout*pout + (8*L*L*ff[n+1]*(pin/rho[1])*m_flow[n + 1]*m_flow[n + 1]/(Modelica.Constants.pi^2*Di^5))/1e6,pout_start*pout_start + (8*L*L*ff[n+1]*(pin/rho_nom)*m_flow_start*m_flow_start/(Modelica.Constants.pi^2*Di^5))/1e6 ) ;
  //ptilde = pout;


//pin - pout = homotopy(kf * inlet.m_flow^2/ rho_nom, dp_nom * inlet.m_flow/m_flow_start);
  kf = cf*omega*L/(2*A^3);
  p[1] = inlet.p;
  p[n + 1] = outlet.p;

// Complementary variables
  taur = sum(M)/inlet.m_flow;

initial equation
  if initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    for i in 1:n loop
      if quasistaticEnergyBalance then
      // nothing
      else
        der(Ttilde[i]) = 0;
      end if;
      der(Xitilde[i,:]) = zeros(nXi);
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
