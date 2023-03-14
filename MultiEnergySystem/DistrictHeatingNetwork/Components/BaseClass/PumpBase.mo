within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;

partial model PumpBase "Base model to develop water pump models"
  extends DistrictHeatingNetwork.Icons.Water.WaterPump;
  replaceable package Medium = MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(
     choicesAllMatching = true);
  Medium.ThermodynamicState fluidIn;
  Medium.ThermodynamicState fluidOut;
  //Constants
  parameter Real a[2] = {115, 45000} "value of coefficients for Linear Power Characteristic of pump model";
  parameter Real b[3] = {7.38557689, 617.03274734, -545218.57934041} "value of quadratic polynomial coefficients for head calculation";
  constant Modelica.Units.SI.Power W_eps = 1e-8 "Small coefficient to avoid numerical singularities";
  constant Modelica.Units.SI.AngularVelocity omega_eps = 1e-6 "Small coefficient to avoid numerical singularities";
  constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "constant gravity";
  //Parameters
  parameter Boolean use_in_omega = false "Use connector input for the rotational speed" annotation(
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Modelica.Units.SI.Temperature Tin_start "Start value of the inlet temperature" annotation(
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tout_start "Start value of the outlet temperature" annotation(
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start "Start value of the inlet pressure" annotation(
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start "Start value of the outlet pressure" annotation(
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.SpecificEnthalpy hin_start = 1e5 "Specific Enthalpy Start Value" annotation(
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_start = m_flow_nom "Mass Flow Rate Start Value" annotation(
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_nom "nomimal outlet massflowrate" annotation(
    Dialog(group = "Pump Characteristics"));
  final parameter Modelica.Units.SI.VolumeFlowRate qnom = m_flow_nom/rhonom "nominal compressor volume flowrate" annotation(
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Density rhonom "Nominal Liquid Density" annotation(
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Volume V = 0 "Pump Internal Volume" annotation(
    Evaluate = true);
  parameter Modelica.Units.SI.Pressure dpnom "Nominal pressure increase" annotation(
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Efficiency etamech = 0.98 "mechanical efficiency" annotation(
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Efficiency etaelec = 1 "electrical efficiency" annotation(
    Dialog(group = "Pump Characteristics"));
  final parameter Modelica.Units.SI.Efficiency etanom = 0.61524695 "Nominal efficiency" annotation(
    Dialog(group = "Characteristics"));
  parameter Modelica.Units.SI.AngularVelocity omeganom = 2*3.14159*1450/60;
  //Variables
  Modelica.Units.SI.MassFlowRate m_flow "Mass flow rate";
  Modelica.Units.SI.VolumeFlowRate q(start = qnom) "Volume flow rate";
  Modelica.Units.SI.Pressure dp "Outlet pressure minus inlet pressure";
  Modelica.Units.SI.Length head "Pump head";
  Modelica.Units.SI.Pressure pin "Pressure of entering fluid";
  Modelica.Units.SI.Pressure pout "Pressure of outgoing fluid";
  Modelica.Units.SI.SpecificEnthalpy hin(start = hin_start) "Enthalpy of entering fluid";
  Modelica.Units.SI.SpecificEnthalpy hout "Enthalpy of outgoing fluid";
  //Types.SpecificEnthalpy hiso;
  Modelica.Units.SI.Density rhoin "Density of entering fluid";
  Modelica.Units.SI.Density rhoout "Density of outgoing fluid";
  Modelica.Units.SI.Temperature Tin "Liquid inlet temperature";
  Modelica.Units.SI.Temperature Tout "Liquid outlet temperature";
  Modelica.Units.SI.AngularVelocity omega(min = 0, nominal = 100) "Shaft rad/s.";
  Modelica.Units.SI.Power W "Power Consumption";
  Modelica.Units.SI.Power Qloss = 0 "Heat loss (single pump)";
  Modelica.Units.SI.Efficiency eta "Pump efficiency";
  Modelica.Units.SI.Power Pm "mechanical power";
  Modelica.Units.SI.Power Pe "electrical power";
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, 0}, {-60, 40}}, rotation = 0), iconTransformation(origin = {0, -20}, extent = {{-100, 0}, {-60, 40}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{36, 58}, {76, 98}}, rotation = 0), iconTransformation(origin = {0, -20}, extent = {{36, 58}, {76, 98}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_omega if use_in_omega "rad" annotation(
    Placement(visible = true, transformation(origin = {-26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
protected
  Modelica.Blocks.Interfaces.RealInput in_omega_int "Internal connector for rotational speed";
equation
  assert(eta > 0, "Efficiency becomes negative", AssertionLevel.error);
  assert(dp > 0, "Flow is in the opposite direction", AssertionLevel.error);
  connect(in_omega, in_omega_int);
  if not use_in_omega then
    in_omega_int = omeganom "Rotational speed provided by parameter";
  end if;
  omega = in_omega_int "Rotational speed";
  pin = inlet.p;
  hin = inStream(inlet.h_out);
  m_flow = inlet.m_flow;
  pout = outlet.p;
  hout = outlet.h_out;
// Fluid properties
  fluidIn = Medium.setState_phX(pin, hin);
  rhoin = Medium.density(fluidIn);
  Tin = Medium.temperature(fluidIn);
  fluidOut = Medium.setState_phX(pout, hout);
  rhoout = Medium.density(fluidOut);
  Tout = Medium.temperature(fluidOut);
  dp = pout - pin;
  q = m_flow/rhoin;
  W = (omega/omeganom)^3*Utilities.PowerCharacteristicLinear(a[2]*omeganom/omega, a[1], q) "Power Characteristic equation";
  head = b[1]*(omega/omeganom)^2 + q*(b[2]*(omega/omeganom) + b[3]*q) "Head Characteristic equation";
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
  inlet.h_out = inStream(outlet.h_out) "Dummy equation for flow reversal";
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Polygon(fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{-40, -24}, {-60, -60}, {60, -60}, {40, -24}, {-40, -24}}, lineColor = {0, 0, 0}), Ellipse(fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-60, 80}, {60, -40}}, lineColor = {0, 0, 0}), Polygon(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, points = {{-30, 52}, {-30, -8}, {48, 20}, {-30, 52}}), Text(origin = {0, 39}, extent = {{-100, -99}, {100, -139}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)));
end PumpBase;
