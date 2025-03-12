within MultiEnergySystem.H2GasFacility.Sensors;
model IdealPressureSensor "Ideal pressure sensor"
  extends MultiEnergySystem.H2GasFacility.Sensors.BaseClass.PartialIdealFlowSensor;

  parameter Types.Temperature T_start = 15 + 273.15;
  parameter Types.Pressure p_start = 4.93e5;

  parameter Types.MassFlowRate m_flow_start "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));

  Modelica.Blocks.Interfaces.RealOutput p_meas "Measured pressure"
    annotation (Placement(transformation(extent={{28,64},{48,84}}), iconTransformation(extent={{28,64},{48,84}})));
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
  // Momentum balance (no pressure losses)
  0 = inlet.p - outlet.p;
  // Mass flow balance
  0 = inlet.m_flow + outlet.m_flow;
  // Enthalpy balance
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;

  //
  p_meas = inlet.p;
                    annotation (Line(points={{38,74},{38,74}},
                                                         color={0,0,127}),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,18},{80,-16}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-28,100},{28,46}},
          lineColor={0,0,0},
          lineThickness=1),
        Text(
          extent={{-18,94},{22,50}},
          textColor={0,0,0},
          textString="P"),
        Line(
          points={{0,46},{0,18}},
          color={0,0,0},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">IdealPressureSensor</span> is an idealized sensor model designed to measure the pressure of gas in a system. It extends from <span style=\"font-family: Courier New;\">PartialIdealFlowSensor</span> and assumes no pressure losses across the sensor.</p>
<h4>Outputs:</h4>
<ul>
<li><span style=\"font-family: Courier New;\">p_meas</span> (Pa): Measured pressure at the sensor inlet.</li>
</ul>
<h4>Equations and Assumptions:</h4>
<ul>
<li>The model assumes an ideal pressure sensor with no pressure losses (<span style=\"font-family: Courier New;\">0 = inlet.p - outlet.p</span>).</li>
<li>The composition of the fluid remains unchanged (<span style=\"font-family: Courier New;\">inStream(inlet.Xi) = outlet.Xi</span>).</li>
<li>The mass flow balance ensures that the sum of inlet and outlet mass flows is zero.</li>
<li>The enthalpy at the inlet and outlet remains equal.</li>
<li>The measured pressure is directly taken from the inlet pressure (<span style=\"font-family: Courier New;\">p_meas = inlet.p</span>).</li>
</ul>
<h4>Usage:</h4>
<p>This sensor can be used in hydrogen gas flow measurement applications within the <span style=\"font-family: Courier New;\">MultiEnergySystem.H2GasFacility</span> framework. It is suitable for simulations where ideal pressure measurement is assumed.</p>
</html>"));
end IdealPressureSensor;
