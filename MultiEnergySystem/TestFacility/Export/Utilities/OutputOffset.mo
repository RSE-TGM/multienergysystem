within MultiEnergySystem.TestFacility.Export.Utilities;
model OutputOffset
  parameter Boolean fixOutput = false "= true enforces the physical output to be y_fixed";
  parameter Boolean fixOffset = false "= true fixes the offset to y_Offset_fixed, otherwise initial deltaYnorm = 0";
  parameter Real y_fixed = 0 "Fixed value for the physical output" annotation (
    Dialog(enable = fixOutput));
  parameter Real y_Offset_fixed = y_fixed "Value of y_Offset if fixOffset == true" annotation (
    Dialog(enable = fixOffset));
  parameter Real y_norm "Normalization value for u";
  final parameter Real y_Offset(fixed = false) "Offset value for y";
  final parameter Real y_Initial(fixed = false) "Initial value of y";
  final parameter Real y_norm_Offset(fixed = false) "Normalized value of offset";
  final parameter Real y_norm_Initial(fixed = false) "Normalized initial value of y";
  final parameter Real delta_y_norm_Initial(fixed = false) "Initial value of normalized delta-y";
  Modelica.Blocks.Interfaces.RealInput y "physical variable" annotation (
    Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealOutput deltaYnorm "Physical variabile minus its bias value and divided by normalization factor" annotation (
    Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{80, -10}, {100, 10}})));
equation
  deltaYnorm = (y - y_Offset)/y_norm;
initial equation
  if fixOutput then
    y = y_fixed;
  end if;
  if fixOffset then
    y_Offset = y_Offset_fixed;
  else
    deltaYnorm = 0;
  end if;
  // Auxiliary computed parameters, may be useful for debugging
  y_Initial = y;
  delta_y_norm_Initial = deltaYnorm;
  y_norm_Initial = y_Initial/y_norm;
  y_norm_Offset = y_Offset/y_norm;
  assert(not (fixOffset and fixOutput), "You can't set fixOffset and fixOutput both to true");
  annotation (
    Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 85}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -100}, {100, -140}}, lineColor = {0, 0, 0}, textString = "OUT OFFSET")}),
    Documentation(info="<html>
This block provides initialization conditions, normalizations and offsets for a plant model initialized in steady state. 
It is meant to be used in conjuction to a corresponding <a href=\"modelica://MultiEnergySystem.TestFacility.Export.Utilities.InputOffset\">InputOffset</a> model. 
It can be used in several ways.</p>
<h4>Forward initialization</h4>
<p>Set <code>fixedOutput = false</code> and make sure that either <code>fixedInput</code> or <code>fixOffset</code> are set to <code>true</code> in the corresponding 
<code>InputOffset</code> block.</p>
<p>In this case, the initial value of the physical plant output <code>y</code> will be determined by the steady-state plant behaviour and by the conditions
set at the input side.</p>

<h4>Backward initialization</h4>
<p>Set <code>fixedOutput = true</code> and make sure both <code>fixedInput = false</code> and <code>fixOffset = false</code> in the corresponding 
<code>InputOffset</code> block.</p>
<p>In this case, the initial physical value of the output <code>y</code> is set to <code>y_fixed</code>,
and the corresponding value of the physical plant input will be determined by the steady-state plant behaviour.</p>

<p>The offset value <code>y_offset</code> will be determined based on the value of <code>fixOffset</code>. If <code>fixOffset = false</code>, then
the offset is set to the initial value of the physical output, so that the initial value of <code>deltaYnorm</code> is zero. Otherwise, if
<code>fixOffset = true</code>, then the offset is set to <code>y_Offset_fixed</code>.</p>
</html>"));
end OutputOffset;
