within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.BaseClass;
partial model PumpBase "Base model to develop water pump models"
  extends DistrictHeatingNetwork.Icons.Water.WaterPump;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid annotation (
     choicesAllMatching = true);

  //Constants
  parameter Real a[3] = {338.084416, 130887.059346, -8074937.668508} "value of coefficients for Linear Power Characteristic of pump model";
  parameter Real b[3] = {7.38557689, 617.03274734, -545218.57934041} "value of quadratic polynomial coefficients for head calculation";
  constant Types.Power W_eps = 1e-8 "Small coefficient to avoid numerical singularities";
  constant Types.AngularVelocity omega_eps = 1e-6 "Small coefficient to avoid numerical singularities";
  constant Types.Acceleration g = Modelica.Constants.g_n "constant gravity";
  constant Real pi = Modelica.Constants.pi "pi";

  //Start Parameters
  parameter Modelica.Units.SI.Temperature Tin_start "Start value of the inlet temperature" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tout_start "Start value of the outlet temperature" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start "Start value of the inlet pressure" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start "Start value of the outlet pressure" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.SpecificEnthalpy hin_start = 1e5 "Specific Enthalpy Start Value" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_start = m_flow_nom "Mass Flow Rate Start Value" annotation (
    Dialog(tab = "Initialisation"));

  //Nominal parameters
  parameter Types.MassFlowRate m_flow_nom = qnom_inm3h_max*985/3600 "nomimal outlet mass flowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Density rhonom = 1000 "Nominal Liquid Density" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Volume V = 0 "Pump Internal Volume" annotation (
    Evaluate = true);
  parameter Types.Pressure dpnom = headmax*rhonom*g "Nominal pressure increase" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.AngularVelocity omeganom = 2*pi*50 "Nominal angular velocity in rad/s" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Efficiency etanom = 0.61524695 "Nominal efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Efficiency etamech = 0.98 "mechanical efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Efficiency etaelec = 1 "electrical efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Length headnom = 7 "nominal head" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Length headmin = 2.5 "minimum head" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Length headmax = 13.5 "maximum head" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Real qnom_inm3h(unit = "m3/h") = 13 "nominal volumetric flowrate in m3/h " annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Real qnom_inm3h_min(unit = "m3/h") = 5.5 "minimum volumetric flowrate in m3/h" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Real qnom_inm3h_max(unit = "m3/h") = 20 "minimum volumetric flowrate in m3/h" annotation (
    Dialog(group = "Pump Characteristics"));

  Medium fluidIn(T_start = Tin_start, p_start = pin_start);
  Medium fluidOut(T_start = Tout_start, p_start = pout_start);

  //Final parameters
  final parameter Types.VolumeFlowRate qnom = qnom_inm3h/3600 "nominal compressor volume flowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  final parameter Types.VolumeFlowRate qnommin = qnom_inm3h_min/3600 "nominal minimun compressor volume flowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  //Variables
  Types.MassFlowRate m_flow "Mass flow rate";
  Types.VolumeFlowRate q(start = qnom) "Volume flow rate";
  Real q_m3h(unit = "m3/h") "Volumetric flow rate in m3/hr";
  Types.Pressure dp(nominal = dpnom) "Outlet pressure minus inlet pressure";
  Types.Length head(nominal = headmax) "Pump head";
  Types.Pressure pin(start = pin_start) "Pressure of entering fluid";
  Modelica.Units.SI.Pressure pout "Pressure of outgoing fluid";
  Modelica.Units.SI.SpecificEnthalpy hin(start = hin_start) "Enthalpy of entering fluid";
  Modelica.Units.SI.SpecificEnthalpy hout(start = hin_start, nominal = 1e5) "Enthalpy of outgoing fluid";
  //Types.SpecificEnthalpy hiso;
  Types.Density rhoin(nominal = 1e3) "Density of entering fluid";
  Types.Density rhoout(nominal = 1e3) "Density of outgoing fluid";
  Types.Temperature Tin(start = Tin_start) "Liquid inlet temperature";
  Types.Temperature Tout "Liquid outlet temperature";
  Modelica.Units.SI.AngularVelocity omega(min = 2*pi*30, nominal = 2*pi*50, start = omeganom) "Shaft rad/s.";
  Modelica.Units.SI.Power W "Power Consumption";
  Modelica.Units.SI.Power Qloss = 0 "Heat loss (single pump)";
  Modelica.Units.SI.Efficiency eta "Pump efficiency";
  Modelica.Units.SI.Power Pm "mechanical power";
  Modelica.Units.SI.Power Pe "electrical power";
  Modelica.Units.SI.Frequency f "frequency";
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, 0}, {-60, 40}}, rotation = 0), iconTransformation(origin = {0, -20}, extent = {{-100, 0}, {-60, 40}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{36, 58}, {76, 98}}, rotation = 0), iconTransformation(origin={24,-78},   extent = {{36, 58}, {76, 98}}, rotation = 0)));

equation
  assert(eta > 0, "Efficiency becomes negative", AssertionLevel.error);
  assert(dp > 0, "Flow is in the opposite direction", AssertionLevel.error);
//   assert(headmax > head, "Head is higher than its maximum value", AssertionLevel.error);
//   assert(headmin < head, "Head is lower than its minimum value", AssertionLevel.error);
//   assert(qnom_inm3h_max > q_m3h, "Volumetric flowrate is higher than its maximum operating value", AssertionLevel.error);
//   assert(qnom_inm3h_min < q_m3h, "Volumetric flowrate is lower than its minimum operating value", AssertionLevel.error);
   assert(2*pi*50 >= omega, "Frequency is higher than its maximum operating value", AssertionLevel.error);
   assert(2*pi*30 <= omega, "Frequency is lower than its minimum operating value", AssertionLevel.error);

  hin = inStream(inlet.h_out);
  m_flow = inlet.m_flow;

  // Boundary conditions
  inlet.p = pin;
  inlet.h_out = hin;
  outlet.p = pout;
  outlet.h_out = hout;

  // Equations to set fluid properties
  {fluidIn.p, fluidIn.h} = {pin, hin};
  {fluidOut.p, fluidOut.h} = {pout, hout};

  // Inlet/outlet variables from fluids
  Tin = fluidIn.T;
  rhoin = fluidIn.rho;
  Tout = fluidOut.T;
  rhoout = fluidOut.rho;

  // Additional variables
  dp = pout - pin;
  q = m_flow/rhoin;
  q_m3h = q*3600;
  f = omega/(2*pi);

  head = dp/(rhoin*g);
  //dp = head*rhoin*g;
  W = dp*q/eta;
//eta = 0.6;
//eta = dp*q/W;
//dp = W*eta/q;
  // Mass Balance
  inlet.m_flow + outlet.m_flow = 0;

  // Energy Balance
  0 = outlet.m_flow*hout + inlet.m_flow*hin + W - Qloss "Energy balance";
  Pm = W/etamech;
  Pe = Pm/etaelec;
  //inlet.h_out = inStream(outlet.h_out) "Equation for flow reversal, not used in this model";
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end PumpBase;