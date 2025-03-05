within MultiEnergySystem.H2GasFacility.Sensors;
model IdealMassFlowSensor
  "Ideal Mass Flow Sensor"
  extends MultiEnergySystem.H2GasFacility.Sensors.BaseClass.PartialIdealFlowSensor;

  parameter Types.Temperature T_start = 60 + 273.15;
  parameter Types.Pressure p_start = 2.5e5;

  parameter Types.MassFlowRate m_flow_start "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));

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

equation

  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = inStream(inlet.Xi);

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = outlet.Xi;

  // Mass composition balance
  inStream(inlet.Xi) = outlet.Xi;
  inStream(outlet.Xi) = inlet.Xi;
  // momentum balance (no pressure losses)
  0 = inlet.p - outlet.p;
  // mass flow balance
  0 = inlet.m_flow + outlet.m_flow;
  // Enthalpy balance
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;

  //
  m_flow = inlet.m_flow;
  q_m3hr = (m_flow/fluidIn.rho)*3600;


  annotation (Icon(                                             graphics={                                                                                                                                                       Text(origin={0,100},    textColor={244,125,
              35},                                                                                                                                                                                                        extent={{-100,
              -126},{100,-166}},
          textString="%name"),
                     Text(origin={0,60},    textColor={244,125,35},    extent = {{-20, 24}, {20, -24}}, textString = "F"),                                                                                           Ellipse(lineColor={244,125,
              35},                                                                                                                                                                                                        extent={{-40,100},
              {40,20}}),                                                                                                                                 Line(points={{40,60},
              {60,60}},                                                                                                                                                                      color={244,125,
              35}),                                                                                                                                                                                                        Line(points={{0,20},{0,-16}},
                                                                                                                                                                                                        color={244,125,
              35}),                                                                                                                                      Line(points={{-10,0},
              {10,0}},                                                                                                                                                                       color={244,125,
              35},
          origin={0,110},
          rotation=90),
        Rectangle(
          extent={{-80,18},{80,-16}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid)}));
end IdealMassFlowSensor;
