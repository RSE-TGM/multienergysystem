within MultiEnergySystem.TestFacility.FMUExport;
package OffSetBlocks
  extends Modelica.Icons.Package;

  model InputOffset
    parameter Boolean fixInput = true "= true enforces the physical input to be u_start";
    parameter Boolean fixOffset = false "= true fixes the offset value to u_start, otherwise automatically adapted to initial DeltaUNorm";
    parameter Real u_norm "Normalization value for u";
    parameter Real u_start "Start value for u";
    parameter Real u_Offset_fixed = u_start "Value of u_Offset if fixedOffset == true" annotation (
      Dialog(enable = fixedOffset));
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
      Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 85}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -100}, {100, -140}}, lineColor = {0, 0, 0}, textString = "IN OFFSET")}),
      Documentation(info = "<html>
This block provides initialization conditions, normalizations and offsets for a plant model initialized in steady state. 
It is meant to be used in conjuction to a corresponding <a href=\"modelica://MultiEnergySystem.TestFacility.FMUExport.OffSetBlocks.OutputOffset\">OutputOffset</a> model. 
It can be used in several ways.</p>
<h4>Forward initialization with given physical input value <code>u</code></h4>
<p>Set <code>fixedInput = true</code>, <code>fixedOffset = false</code>, and <code>fixedOutput = false</code> on the corresponding 
<code>OutputOffset</code> block.</p>
<p>In this case, the initial physical value of the input <code>u</code> is set to <code>u_start</code>,
and the corresponding value of the plant output will be determined by the steady-state plant behaviour.</p>
<p>The offset value <code>u_offset</code> will be determined automatically based on the initial value of the input connector <code>deltaUnorm</code>.
Note that in case this input is connected to a top-level connector that is left unconnected, this would correspond to setting <code>deltaUnorm = 0</code>.</p>

<h4>Forward initialization with given offset value <code>u</code></h4>
<p>Set <code>fixedInput = false</code>, <code>fixedOffset = true</code>, and <code>fixedOutput = false</code> on the corresponding 
<code>OutputOffset</code> block.</p>
<p>In this case, the offset value <code>u_offset</code> is directly set to <code>u_Offset_fixed</code>, and the initial value
of the physical plant input <code>u</code> is given by the sum of the fixed offset and of the value of the input connector <code>deltaUnorm</code>.
The corresponding value of the plant output will be determined by the steady-state plant behaviour.</p>

<h4>Backward initialization with given physical output value <code>y</code></h4>
<p>Set <code>fixedInput = false</code>, <code>fixedOffset = false</code>, and <code>fixedOutput = true</code> on the corresponding 
<code>OutputOffset</code> block.</p>
<p>In this case, the initial physical value of the output <code>y</code> of the plant is set by the corresponding <code>OutputOffset</code> block, 
and the corresponding value of the plant input <code>u</code> will be determined by the steady-state plant behaviour, which is solved backwards from output to input.</p>

<p>In all cases, a start value <code>u_start</code> must be provided, which is either used directly or as an initial guess for the plant physical input <code>u</code>, depending on 
the chosen initialization mode.
</html>"));
  end InputOffset;

  model InputOffsetSplitRange
    parameter Boolean fixInput = true "= true enforces the physical input to be u_start";
    parameter Boolean fixOffset = false "= true fixes the offset values to u1_start, u2_start";
    parameter Real s_start "Start value of virtual manipulated variable s";
    parameter Real u1_norm "Normalization value for u1";
    parameter Real u2_norm = u1_norm "Normalization value for u2";
    parameter Real u1_start "Start value for u1, only useful if not fixInput" annotation (
      Dialog(enable = not fixInput));
    parameter Real u2_start "Start value for u2, only useful if not fixInput" annotation (
      Dialog(enable = not fixInput));
    parameter Real u1_Offset(start = u1_start, fixed = fixOffset) "Offset for u1" annotation (
      Dialog(enable = fixOffset));
    parameter Real u2_Offset(start = u2_start, fixed = fixOffset) "Offset for u2" annotation (
      Dialog(enable = fixOffset));
    parameter Real u1_u_zero "Value of u1 when s = 0";
    parameter Real u1_u_one "Value of u1 when s = 1";
    parameter Real u2_u_zero "Value of u2 when s = 0";
    parameter Real u2_u_minusone "Value of u2 when s = -1";
    final parameter Real s_Initial(start = s_start, fixed = false) "Initial value of virtual manipulated variable s";
    final parameter Real u1_norm_Offset(start = u1_start/u1_norm, fixed = false) "Normalized offset for u1";
    final parameter Real u2_norm_Offset(start = u2_start/u2_norm, fixed = false) "Normalized offset for u2";
    final parameter Real u1_norm_Initial(start = u1_start/u1_norm, fixed = false) "Normalized initial value of u1";
    final parameter Real u2_norm_Initial(start = u2_start/u2_norm, fixed = false) "Normalized initial value of u2";
    final parameter Real u1_Initial(fixed = false) "Initial value of u1";
    final parameter Real u2_Initial(fixed = false) "Initial value of u1";
    final parameter Real Deltau1_norm_Initial(fixed = false) "Normalized inizial value of delta_u1";
    final parameter Real Deltau2_norm_Initial(fixed = false) "Normalized inizial value of delta_u2";
    Modelica.Blocks.Interfaces.RealInput DeltaU1norm "Physical variabile minus its bias value and divided by normalization factor" annotation (
      Placement(transformation(extent = {{-120, 0}, {-80, 40}}), iconTransformation(extent = {{-100, 20}, {-60, 60}})));
    Modelica.Blocks.Interfaces.RealOutput u1 "First physical manipulated variable" annotation (
      Placement(transformation(extent = {{90, 10}, {110, 30}}), iconTransformation(extent = {{62, 22}, {100, 60}})));
    Modelica.Blocks.Interfaces.RealInput DeltaU2norm "Physical variabile minus its bias value and divided by normalization factor" annotation (
      Placement(transformation(extent = {{-120, -40}, {-80, 0}}), iconTransformation(extent = {{-100, -60}, {-60, -20}})));
    Modelica.Blocks.Interfaces.RealOutput u2 "Second physical manipulated variable" annotation (
      Placement(transformation(extent = {{90, -30}, {110, -10}}), iconTransformation(extent = {{60, -60}, {100, -20}})));
  equation
    u1 = DeltaU1norm*u1_norm + u1_Offset;
    u2 = DeltaU2norm*u2_norm + u2_Offset;
  initial equation
    u1 = piecewiseLinear2(s_Initial, -1, 0, 1, u1_u_zero, u1_u_zero, u1_u_one);
    u2 = piecewiseLinear2(s_Initial, -1, 0, 1, u2_u_minusone, u2_u_zero, u2_u_zero);
    if fixInput then
      s_Initial = s_start;
    end if;
    // Auxiliary computed parameters, may be useful for debugging
    Deltau1_norm_Initial = DeltaU1norm "Snapshot of initial value";
    Deltau2_norm_Initial = DeltaU2norm "Snapshot of initial value";
    u1_norm_Initial = u1_Initial/u1_norm;
    u2_norm_Initial = u2_Initial/u2_norm;
    u1_norm_Offset = u1_Offset/u1_norm;
    u2_norm_Offset = u2_Offset/u2_norm;
    assert(not (fixOffset and fixInput), "You can't set fixOffset and fixInput both to true");
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 85}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -100}, {100, -140}}, lineColor = {0, 0, 0}, textString = "IN OFFSET")}),
      Diagram(coordinateSystem(preserveAspectRatio = false)));
  end InputOffsetSplitRange;

  model OutputOffset
    parameter Boolean fixOutput = false "= true enforces the physical output to be y_fixed";
    parameter Boolean fixOffset = false "= true fixes the offset to y_Offset_fixed, otherwise initial deltaYnorm = 0";
    parameter Real y_fixed = 0 "Fixed value for the physical output" annotation (
      Dialog(enable = fixOutput));
    parameter Real y_Offset_fixed = y_fixed "Value of y_Offset if fixedOffset == true" annotation (
      Dialog(enable = fixedOffset));
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
      Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 85}, fillPattern = FillPattern.Solid), Text(extent = {{-100, -100}, {100, -140}}, lineColor = {0, 0, 0}, textString = "OUT OFFSET")}),
      Documentation(info = "<html>
This block provides initialization conditions, normalizations and offsets for a plant model initialized in steady state. 
It is meant to be used in conjuction to a corresponding <a href=\"modelica://MultiEnergySystem.TestFacility.FMUExport.OffSetBlocks.InputOffset\">InputOffset</a> model. 
It can be used in several ways.</p>
<h4>Forward initialization</h4>
<p>Set <code>fixedOutput = false</code> and make sure that either <code>fixedInput</code> or <code>fixedOffset</code> are set to <code>true</code> in the corresponding 
<code>InputOffset</code> block.</p>
<p>In this case, the initial value of the physical plant output <code>y</code> will be determined by the steady-state plant behaviour and by the conditions
set at the input side.</p>

<h4>Backward initialization</h4>
<p>Set <code>fixedOutput = true</code> and make sure both <code>fixedInput = false</code> and <code>fixedOffset = false</code> in the corresponding 
<code>InputOffset</code> block.</p>
<p>In this case, the initial physical value of the output <code>y</code> is set to <code>y_fixed</code>,
and the corresponding value of the physical plant input will be determined by the steady-state plant behaviour.</p>

<p>The offset value <code>y_offset</code> will be determined based on the value of <code>fixedOffset</code>. If <code>fixedOffset = false</code>, then
the offset is set to the initial value of the physical output, so that the initial value of <code>deltaYnorm</code> is zero. Otherwise, if
<code>fixedOffset = true</code>, then the offset is set to <code>y_Offset_fixed</code>.</p>
</html>"));
  end OutputOffset;

  function piecewiseLinear2 "Given three points this function return a piecewise linear function connecting them"
    input Real x;
    input Real x1;
    input Real x2;
    input Real x3;
    input Real y1;
    input Real y2;
    input Real y3;
    output Real y;
  algorithm
    y := if x < x2 then (y1*(x - x2) - y2*(x - x1))/(x1 - x2) else (y2*(x - x3) - y3*(x - x2))/(x2 - x3);
    annotation (
      Evaluate = true,
      Documentation(info = "<html>
<p>This function, given three points (xi,yi), generates a piecewise linear function that connects them:</p>
<p>y = piecewiseLinear(x,x1,x2,x3,y1,y2,y3);</p>
<p><img src=\"modelica://FlexiCaL/Images/Immagini_piecewiseLinear_2.png\"/></p>
</html>"));
  end piecewiseLinear2;

  model TestPiecewiseLinear2 "Simple test of the function piecewiseLinear2"
    Real x[20];
    parameter Real x_start = -1;
    parameter Real x1 = -1;
    parameter Real x2 = 0.1;
    parameter Real x3 = 1;
    parameter Real y1 = 30;
    parameter Real y2 = 0;
    parameter Real y3 = 0;
    Real y[20];
  equation
    for i in 1:20 loop
      if i == 1 then
        x[i] = x_start;
      else
        x[i] = x[i - 1] + 0.1;
      end if;
      y[i] = piecewiseLinear2(x[i], x1, x2, x3, y1, y2, y3);
    end for;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false)),
      Diagram(coordinateSystem(preserveAspectRatio = false)));
  end TestPiecewiseLinear2;
  annotation ();
end OffSetBlocks;
