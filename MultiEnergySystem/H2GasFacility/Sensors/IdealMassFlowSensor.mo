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
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">IdealMassFlowSensor</span> is an idealized sensor model used to measure the mass flow rate and volumetric flow rate of hydrogen gas in a system. It extends from <span style=\"font-family: Courier New;\">PartialIdealFlowSensor</span> and assumes no pressure losses across the sensor.</p>
<h4>Outputs:</h4>
<ul>
<li><span style=\"font-family: Courier New;\">m_flow</span> (kg/s): Measured mass flow rate of hydrogen gas.</li>
<li><span style=\"font-family: Courier New;\">q_m3hr</span> (m&sup3;/h): Computed volumetric flow rate based on the density of the gas.</li>
</ul>
<h4>Equations and Assumptions:</h4>
<ul>
<li>The model assumes an ideal flow sensor with no pressure losses (<span style=\"font-family: Courier New;\">0 = inlet.p - outlet.p</span>).</li>
<li>The composition of the fluid remains unchanged (<span style=\"font-family: Courier New;\">inStream(inlet.Xi) = outlet.Xi</span>).</li>
<li>The mass flow balance ensures that the sum of inlet and outlet mass flows is zero.</li>
<li>The enthalpy at the inlet and outlet remains equal.</li>
<li>The volumetric flow rate is calculated as <span style=\"font-family: Courier New;\">q_m3hr = (m_flow / fluidIn.rho) * 3600</span>.</li>
</ul>
<h4>Usage:</h4>
<p>This sensor can be used in gas flow measurement applications within the <span style=\"font-family: Courier New;\">MultiEnergySystem.H2GasFacility</span> framework. It is suitable for simulations where ideal sensor behavior is assumed.</p>
</html>"));
end IdealMassFlowSensor;
