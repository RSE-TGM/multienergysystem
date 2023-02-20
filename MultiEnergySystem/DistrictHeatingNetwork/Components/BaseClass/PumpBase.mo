within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;
partial model PumpBase "Base model to develop water pump models"

  replaceable package Medium =
      MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model"
    annotation(choicesAllMatching = true);
  Medium.ThermodynamicState fluidIn;
  Medium.ThermodynamicState fluidOut;

  //Constants
  constant Real a[2] = {45000, 115}
   "value of coefficients for Linear Power Characteristic of pump model";
  constant Real b[4] = {0.7053, 1.325, -0.5132, -401.26}
   "value of coefficient in pump work efficiency calculation polynomial";
  constant Real b1[3] = {0.7063, 1.699, -29.88};
  constant Real b2[3] = {0.477, 10.158, -106.6};
  constant Modelica.Units.SI.Power W_eps = 1e-8
   "Small coefficient to avoid numerical singularities";
  constant Modelica.Units.SI.AngularVelocity omega_eps = 1e-6
   "Small coefficient to avoid numerical singularities";
  constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n
   "constant gravity";

  //Parameters
  parameter Boolean computeEnthalpyCondensation = false
    "Used to decide if it is necessary to calculate enthalpy condensation";
  parameter Boolean computeTransport = false
    "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = true
    "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Boolean compressibilityEffect = false
    "Used to enable compressibility effects";
  parameter Boolean use_in_omega = false
    "Use connector input for the rotational speed" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Modelica.Units.SI.Temperature Tin_start
    "Start value of the inlet temperature" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tout_start
    "Start value of the outlet temperature" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start
   "Start value of the inlet pressure" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start
   "Start value of the outlet pressure" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.SpecificEnthalpy h_start = 1e5
   "Specific Enthalpy Start Value" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.MassFlowRate w_start = wnom
   "Mass Flow Rate Start Value" annotation (
    Dialog(tab = "Initialisation"));
  parameter Modelica.Units.SI.MassFlowRate wnom
   "nomimal outlet massflowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  final parameter Modelica.Units.SI.VolumeFlowRate qnom = wnom / rhonom
   "nominal compressor volume flowrate" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.PerUnit phicnom
   "flow coefficient nominal" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Density rhonom
   "Nominal Liquid Density" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Volume V = 0
   "Pump Internal Volume" annotation (
    Evaluate = true);
  parameter Modelica.Units.SI.Pressure dpnom
   "Nominal pressure increase" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Efficiency etamech = 0.98
   "mechanical efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.Efficiency etaelec = 1
   "electrical efficiency" annotation (
    Dialog(group = "Pump Characteristics"));
  parameter Modelica.Units.SI.PerUnit etareg = 1
   "correction factor of nominal efficiency";
  final parameter Modelica.Units.SI.PerUnit psinom =  1
   "Nominal work coefficient" annotation (
    Dialog(group = "Characteristics"));
  final parameter Modelica.Units.SI.Efficiency etanom = 0.61524695
   "Nominal efficiency" annotation (
    Dialog(group = "Characteristics"));
  final parameter Modelica.Units.SI.Length D = sqrt(sqrt(qnom^2*psinom*rhonom/(phicnom^2*dpnom)))
   "Nominal diameter";
  parameter Modelica.Units.SI.AngularVelocity omeganom = 2*3.14159*1450/60;


  //Variables
  Modelica.Units.SI.MassFlowRate m_flow(start = w_start)
   "Mass flow rate";
  Modelica.Units.SI.VolumeFlowRate q(start = w_start / rhonom)
   "Volume flow rate";
  Modelica.Units.SI.Pressure dp(start = dpnom)
   "Outlet pressure minus inlet pressure";
  Modelica.Units.SI.Length head
   "Pump head";
  Modelica.Units.SI.Pressure pin(start = pin_start)
   "Pressure of entering fluid";
  Modelica.Units.SI.Pressure pout
   "Pressure of outgoing fluid";
  Modelica.Units.SI.SpecificEnthalpy hin(start = h_start)
   "Enthalpy of entering fluid";
  Modelica.Units.SI.SpecificEnthalpy hout
   "Enthalpy of outgoing fluid";
  //Types.SpecificEnthalpy hiso;
  Modelica.Units.SI.Density rhoin
   "Density of entering fluid";
  Modelica.Units.SI.Density rhoout
   "Density of outgoing fluid";
  Modelica.Units.SI.Temperature Tin
   "Liquid inlet temperature";
  Modelica.Units.SI.Temperature Tout
   "Liquid outlet temperature";
  Modelica.Units.SI.AngularVelocity omega(min=0, nominal = 100)
   "Shaft rad/s.";
  Modelica.Units.SI.Power W
    "Power Consumption";
  Modelica.Units.SI.Power Qloss = 0
   "Heat loss (single pump)";
  Modelica.Units.SI.Efficiency eta
   "Pump efficiency";
  Modelica.Units.SI.Power Pm
   "mechanical power";
  Modelica.Units.SI.Power Pe
   "electrical power";

  Interfaces.FluidPortInlet inlet annotation (Placement(transformation(extent={{
            -100,0},{-60,40}}), iconTransformation(extent={{-100,0},{-60,40}})));
  Interfaces.FluidPortOutlet outlet annotation (Placement(transformation(extent=
           {{36,58},{76,98}}), iconTransformation(extent={{36,58},{76,98}})));

  Modelica.Blocks.Interfaces.RealInput in_omega if use_in_omega "rad" annotation (
    Placement(transformation(origin = {-26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 270),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,70})));

protected
  Modelica.Blocks.Interfaces.RealInput in_omega_int "Internal connector for rotational speed";

equation
  assert(eta>0, "Efficiency becomes negative", AssertionLevel.error);
  assert(dp>0, "Flow is in the opposite direction", AssertionLevel.error);

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

  dp = homotopy(pout-pin, dpnom);
  q = homotopy(m_flow/rhoin, qnom);

  W = (omega/omeganom)^3*Utilities.PowerCharacteristicLinear(a[1]*omeganom/omega,a[2],q) "Power Characteristic equation";
  head = 7.38557689*(omega/omeganom)^2 + q*(617.03274734*(omega/omeganom) -545218.57934041*q) "Head Characteristic equation";
  head = dp / (rhoin * g);
  W = dp*q/eta;

  // Mass Balance
  inlet.m_flow + outlet.m_flow = 0;
  // Energy Balance
  0 = outlet.m_flow * hout + inlet.m_flow * hin + W - Qloss "Energy balance";

  Pm = W/etamech;
  Pe = Pm/etaelec;

  inlet.h_out = inStream(outlet.h_out) "Dummy equation for flow reversal";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Polygon(fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            lineThickness=1,                                                                                  points={{-40,-24},
              {-60,-60},{60,-60},{40,-24},{-40,-24}},
          lineColor={0,0,0}),                                                                                                                                                       Ellipse(fillColor={0,0,255},         fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        lineThickness=1,      extent={{-60,80},
              {60,-40}},
          lineColor={0,0,0}),                                                                                                                                                                                                        Polygon(fillColor = {255, 255, 255}, pattern = LinePattern.None,
            fillPattern =                                                                                                                                                                                                        FillPattern.HorizontalCylinder, points={{-30,52},
              {-30,-8},{48,20},{-30,52}}),                                                                                                                                                                                                        Text(origin={0,39},    extent = {{-100, -99}, {100, -139}}, textString = "%name")}),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
              Icon(graphics={
        Polygon(
          points={{-40,-24},{-60,-60},{60,-60},{40,-24},{-40,-24}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,191},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-60,80},{60,-40}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Polygon(
          points={{-30,52},{-30,-8},{48,20},{-30,52}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Text(extent={{-100,-62},{100,-100}},textString="%name")}));
end PumpBase;
