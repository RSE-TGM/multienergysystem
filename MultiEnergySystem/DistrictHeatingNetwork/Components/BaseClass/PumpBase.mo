within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;
partial model PumpBase "Base model to develop water pump models"
  extends DistrictHeatingNetwork.Icons.Water.WaterPump;
  //replaceable package Medium = Water constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(
  //   choicesAllMatching = true);
  //Medium.ThermodynamicState fluidIn;
  //Medium.ThermodynamicState fluidOut;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid annotation (
     choicesAllMatching = true);
  //Constants
  parameter Real a[3] = {338.084416, 130887.059346, -8074937.668508} "value of coefficients for Linear Power Characteristic of pump model";
  parameter Real b[3] = {7.38557689, 617.03274734, -545218.57934041} "value of quadratic polynomial coefficients for head calculation";
  constant Modelica.Units.SI.Power W_eps = 1e-8 "Small coefficient to avoid numerical singularities";
  constant Modelica.Units.SI.AngularVelocity omega_eps = 1e-6 "Small coefficient to avoid numerical singularities";
  constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "constant gravity";

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
  parameter Types.MassFlowRate m_flow_nom "nomimal outlet mass flowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Real qnom_inm3h(unit = "m3/h") "nominal volumetric flowrate in m3/h " annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Density rhonom "Nominal Liquid Density" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Volume V = 0 "Pump Internal Volume" annotation (
    Evaluate = true);
  parameter Types.Pressure dpnom "Nominal pressure increase" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.AngularVelocity omeganom = 2*3.14159*1450/60 "Nominal angular velocity in rad/s" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Efficiency etanom = 0.61524695 "Nominal efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Efficiency etamech = 0.98 "mechanical efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Efficiency etaelec = 1 "electrical efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Length headmax = 13.5 "maximum head" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Types.Length headmin = 2.5 "minimum head" annotation (
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
  final parameter Types.VolumeFlowRate qnommin = qnom_inm3h_min/3600 "nominal compressor volume flowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  //Variables
  Modelica.Units.SI.MassFlowRate m_flow "Mass flow rate";
  Modelica.Units.SI.VolumeFlowRate q(start = qnom) "Volume flow rate";
  Real q_m3hr(unit = "m3/h") "Volumetric flow rate in m3/hr";
  Modelica.Units.SI.Pressure dp "Outlet pressure minus inlet pressure";
  Modelica.Units.SI.Length head "Pump head";
  Modelica.Units.SI.Pressure pin "Pressure of entering fluid";
  Modelica.Units.SI.Pressure pout "Pressure of outgoing fluid";
  Modelica.Units.SI.SpecificEnthalpy hin(start = hin_start) "Enthalpy of entering fluid";
  Modelica.Units.SI.SpecificEnthalpy hout(start = hin_start, nominal = 1e5) "Enthalpy of outgoing fluid";
  //Types.SpecificEnthalpy hiso;
  Modelica.Units.SI.Density rhoin "Density of entering fluid";
  Modelica.Units.SI.Density rhoout "Density of outgoing fluid";
  Modelica.Units.SI.Temperature Tin "Liquid inlet temperature";
  Modelica.Units.SI.Temperature Tout "Liquid outlet temperature";
  Modelica.Units.SI.AngularVelocity omega(min = 0, nominal = 100, start = omeganom) "Shaft rad/s.";
  Modelica.Units.SI.Power W "Power Consumption";
  Modelica.Units.SI.Power Qloss = 0 "Heat loss (single pump)";
  Modelica.Units.SI.Efficiency eta "Pump efficiency";
  Modelica.Units.SI.Power Pm "mechanical power";
  Modelica.Units.SI.Power Pe "electrical power";
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, 0}, {-60, 40}}, rotation = 0), iconTransformation(origin = {0, -20}, extent = {{-100, 0}, {-60, 40}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{36, 58}, {76, 98}}, rotation = 0), iconTransformation(origin={24,-78},   extent = {{36, 58}, {76, 98}}, rotation = 0)));

equation
  assert(eta > 0, "Efficiency becomes negative", AssertionLevel.error);
  assert(dp > 0, "Flow is in the opposite direction", AssertionLevel.error);
  assert(headmax > head and headmin < head, "Head is outside the operating range", AssertionLevel.error);
  assert(qnom_inm3h_max > q_m3hr and qnom_inm3h_min < q_m3hr, "Volumetric flowrate is outside the operating range", AssertionLevel.error);

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
  q_m3hr = q*3600;
  W = homotopy((omega/omeganom)^3*(a[1] + q_m3hr*(omeganom/omega)*(a[2] + a[3]*q_m3hr*(omeganom/omega))),
               ((a[1] + q_m3hr*(omeganom/omega)*(a[2] + a[3]*q_m3hr*(omeganom/omega)))))  "Power Characteristic equation";
  head = if q_m3hr >= qnom_inm3h_min then homotopy((omega/omeganom)^2*(b[1]+ q_m3hr*(omeganom/omega)*(b[2] + b[3]*q_m3hr*(omeganom/omega))),
                  ((b[1]+ q_m3hr*(omeganom/omega)*(b[2] + b[3]*q_m3hr*(omeganom/omega))))) else (omega/omeganom)^2*(b[1]+ (qnom_inm3h_min)*(omeganom/omega)*(b[2] + b[3]*(qnom_inm3h_min)*(omeganom/omega))) "Head Characteristic equation";
  head = dp/(rhoin*g);
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
