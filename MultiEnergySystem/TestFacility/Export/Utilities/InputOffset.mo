within MultiEnergySystem.TestFacility.Export.Utilities;
model InputOffset
  parameter Boolean fixInput = true "= true enforces the physical input to be u_start";
  parameter Boolean fixOffset = false "= true fixes the offset value to u_start, otherwise automatically adapted to initial DeltaUNorm";
  parameter Real u_norm "Normalization value for u";
  parameter Real u_start "Start value for u";
  parameter Real u_Offset_fixed = u_start "Value of u_Offset if fixOffset == true" annotation (
    Dialog(enable = fixOffset));
  final parameter Real u_Offset(start = u_start, fixed = false) "Offset value for u";
  final parameter Real u_Initial(start = u_start, fixed = false) "Actual initial value of u";
  final parameter Real u_norm_Offset(start = u_start/u_norm, fixed = false) "Normalized offset of u";
  final parameter Real u_norm_Initial(start = u_start/u_norm, fixed = false) "Initial value of normalized u";
  final parameter Real deltau_norm_Initial(fixed = false) "Initial value of normalized delta-u";
  Modelica.Blocks.Interfaces.RealInput deltaUnorm "Physical variabile minus its offset value and divided by normalization factor" annotation (
    Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealOutput u(start = u_start) "physical variable" annotation (
    Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{80, -10}, {100, 10}})));
equation
  u = deltaUnorm*u_norm + u_Offset;
initial equation
  if fixOffset then
    u_Offset = u_Offset_fixed;
  end if;
  if fixInput then
    u = u_start;
  end if;
  // Auxiliary computed parameters, may be useful for debugging
  u_Initial = u;
  u_norm_Initial = u_Initial/u_norm;
  deltau_norm_Initial = deltaUnorm;
  u_norm_Offset = u_Offset/u_norm;
  assert(not (fixOffset and fixInput), "You can't set fixOffset and fixInput both to true");
  annotation (
    Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 85}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -100}, {100, -140}}, lineColor = {0, 0, 0}, textString = "IN OFFSET")}),
    Documentation(info="<html>
This block provides initialization conditions, normalizations and offsets for a plant model initialized in steady state. 
It is meant to be used in conjuction to a corresponding <a href=\"modelica://MultiEnergySystem.TestFacility.Export.Utilities.OutputOffset\">OutputOffset</a> model. 
It can be used in several ways.</p>
<h4>Forward initialization with given physical input value <code>u</code></h4>
<p>Set <code>fixedInput = true</code>, <code>fixOffset = false</code>, and <code>fixedOutput = false</code> on the corresponding 
<code>OutputOffset</code> block.</p>
<p>In this case, the initial physical value of the input <code>u</code> is set to <code>u_start</code>,
and the corresponding value of the plant output will be determined by the steady-state plant behaviour.</p>
<p>The offset value <code>u_offset</code> will be determined automatically based on the initial value of the input connector <code>deltaUnorm</code>.
Note that in case this input is connected to a top-level connector that is left unconnected, this would correspond to setting <code>deltaUnorm = 0</code>.</p>

<h4>Forward initialization with given offset value <code>u</code></h4>
<p>Set <code>fixedInput = false</code>, <code>fixOffset = true</code>, and <code>fixedOutput = false</code> on the corresponding 
<code>OutputOffset</code> block.</p>
<p>In this case, the offset value <code>u_offset</code> is directly set to <code>u_Offset_fixed</code>, and the initial value
of the physical plant input <code>u</code> is given by the sum of the fixed offset and of the value of the input connector <code>deltaUnorm</code>.
The corresponding value of the plant output will be determined by the steady-state plant behaviour.</p>

<h4>Backward initialization with given physical output value <code>y</code></h4>
<p>Set <code>fixedInput = false</code>, <code>fixOffset = false</code>, and <code>fixedOutput = true</code> on the corresponding 
<code>OutputOffset</code> block.</p>
<p>In this case, the initial physical value of the output <code>y</code> of the plant is set by the corresponding <code>OutputOffset</code> block, 
and the corresponding value of the plant input <code>u</code> will be determined by the steady-state plant behaviour, which is solved backwards from output to input.</p>

<p>In all cases, a start value <code>u_start</code> must be provided, which is either used directly or as an initial guess for the plant physical input <code>u</code>, depending on 
the chosen initialization mode.
</html>"));
end InputOffset;
