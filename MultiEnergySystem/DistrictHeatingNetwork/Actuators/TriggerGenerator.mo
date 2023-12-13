within MultiEnergySystem.DistrictHeatingNetwork.Actuators;
block TriggerGenerator "Triggered generator"
  extends Modelica.Blocks.Icons.PartialBooleanBlock;
  parameter Real offset = 0 "Offset of output signal";
  Modelica.Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal" annotation (
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Interfaces.RealInput amplitude annotation (
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-140, -20}, {-100, 20}}, rotation = 0), iconTransformation(origin = {0, -60}, extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
protected
  Real endValue "Value of y at time of recent edge";
equation
  y = endValue;
  endValue = if u then amplitude + offset else offset;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(origin = {0, 2.84746},points = {{-60, -70}, {-60, -70}, {-60, 40}, {8, 40}, {8, -72}, {8, -72}}, color = {0, 0, 127}), Line(points = {{-90, -70}, {82, -70}}, color = {192, 192, 192}), Line(points = {{-80, 68}, {-80, -80}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(points = {{-80, -70}, {-60, -70}, {-60, 24}, {8, 24}, {8, -70}, {60, -70}}, color = {255, 0, 255})}),
    Documentation(info = "<html>
<p>The block TriggeredTrapezoid has a Boolean input and a real
output signal and requires the parameters <em>amplitude</em>,
<em>rising</em>, <em>falling</em> and <em>offset</em>. The
output signal <strong>y</strong> represents a trapezoidal signal dependent on the
input signal <strong>u</strong>.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Logical/TriggeredTrapezoid.png\"
   alt=\"TriggeredTrapezoid.png\">
</p>

<p>The behaviour is as follows: Assume the initial input to be false. In this
case, the output will be <em>offset</em>. After a rising edge (i.e., the input
changes from false to true), the output is rising during <em>rising</em> to the
sum of <em>offset</em> and <em>amplitude</em>. In contrast, after a falling
edge (i.e., the input changes from true to false), the output is falling
during <em>falling</em> to a value of <em>offset</em>.
</p>
<p>Note, that the case of edges before expiration of rising or falling is
handled properly.</p>
</html>"));
end TriggerGenerator;
