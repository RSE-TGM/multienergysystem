within MultiEnergySystem.H2GasFacility.Sensors;
model IdealMassFlowSensor
  "Ideal Mass Flow Sensor"
  extends
    MultiEnergySystem.H2GasFacility.Sensors.BaseClass.PartialIdealFlowSensor;

  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
     choicesAllMatching = true);


  parameter Types.Temperature T_start = 60 + 273.15;
  parameter Types.Pressure p_start = 2.5e5;
  Medium fluid(Tin_start = T_start, pin_start = p_start);
  Modelica.Blocks.Interfaces.RealOutput m_flow "Mass flowrate in kg/s" annotation (Placement(
      visible=true,
      transformation(
        origin={0,72},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={70,60},
        extent={{-10,-10},{10,10}},
        rotation= 0)));
  Modelica.Blocks.Interfaces.RealOutput q_m3hr "Volumetric flowrate in m3/hr" annotation (Placement(
      visible=true,
      transformation(
        origin={0,56},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,130},
        extent={{-10,-10},{10,10}},
        rotation=90)));

  // Medium
  Medium fluidIn(
    T_start = Tin_start,
    p_start = pin_start,
    X_start = X_start,
    computeTransport = false,
    computeEntropy = false);
  Medium fluidOut(
    T_start = Tout_start,
    p_start = pout_start,
    X_start = X_start,
    computeTransport = false,
    computeEntropy = false);


equation

  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = inStream(inlet.Xi);

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = outlet.Xi;

  // Fluid definition
  fluid.h = inStream(inlet.h_out);
  fluid.p = inlet.p;

  m_flow = inlet.m_flow;
  q_m3hr = (m_flow/fluid.rho)*3600;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Rectangle(lineColor = {140, 56, 54}, fillColor={244,125,35},    fillPattern=
              FillPattern.Solid,                                                                                      extent={{-40,-20},
              {40,-60}}),                                                                                                                                                                                                        Text(origin={0,68},     textColor={244,125,
              35},                                                                                                                                                                                                        extent={{-100,
              -126},{100,-166}},
          textString="%name"),
                     Text(origin={0,60},    textColor={244,125,35},    extent = {{-20, 24}, {20, -24}}, textString = "F"),                                                                                           Ellipse(lineColor={244,125,
              35},                                                                                                                                                                                                        extent={{-40,100},
              {40,20}}),                                                                                                                                 Line(points={{40,60},
              {60,60}},                                                                                                                                                                      color={244,125,
              35}),                                                                                                                                                                                                        Line(points={{0,20},{
              0,-20}},                                                                                                                                                                                                        color={244,125,
              35}),                                                                                                                                      Line(points={{-10,0},
              {10,0}},                                                                                                                                                                       color={244,125,
              35},
          origin={0,110},
          rotation=90)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealMassFlowSensor;
