within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model IdealDPPump
  extends Modelica.Icons.Example;
  DHN4Control.Components.ExpansionTank sinkLP(p = 399999.9999999999)  annotation (
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.FixedDifferentialPressurePump fixedDifferentialPressurePump(Dp=
        99999.99999999999) annotation (Placement(visible=true, transformation(
        origin={-24,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=5, Tnom=
        353.15) annotation (Placement(visible=true, transformation(
        origin={-82,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.VariableDifferentialPressurePump variableDifferentialPressurePump annotation (
    Placement(visible = true, transformation(origin = {-22, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank sinkHP(p = 999999.9999999999) annotation (
    Placement(visible = true, transformation(origin = {90, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1(mflownom=5, Tnom=
       353.15)                                                 annotation (
    Placement(visible = true, transformation(origin={-80,-52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 8, height = 8e5, offset = 1e5, startTime = 1)  annotation (
    Placement(visible = true, transformation(origin = {-48, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedDifferentialPressurePump.outlet, sinkLP.inlet) annotation (
    Line(points = {{-14, 0}, {90, 0}}, color = {168, 168, 168}));
  connect(sinkHP.inlet, variableDifferentialPressurePump.outlet) annotation (
    Line(points = {{90, -52}, {-12, -52}}, color = {168, 168, 168}));
  connect(ramp.y, variableDifferentialPressurePump.Dp) annotation (
    Line(points={{-37,-30},{-29.8,-30},{-29.8,-46}},    color = {0, 0, 127}));
  connect(idealMassFlowSource.outlet, fixedDifferentialPressurePump.inlet)
    annotation (Line(points={{-71.8,0},{-34,0}}, color={168,168,168}));
  connect(idealMassFlowSource1.outlet, variableDifferentialPressurePump.inlet)
    annotation (Line(points={{-69.8,-52},{-32,-52}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -60}})));
end IdealDPPump;
