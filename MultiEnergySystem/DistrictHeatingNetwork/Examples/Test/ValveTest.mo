within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model ValveTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation (
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation (
      Placement(visible=true, transformation(
        origin={-68,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant massflow(k = 5) annotation (
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank(p = 499999.9999999999)  annotation (
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank HP(p = 499999.9999999999)  annotation (
    Placement(visible = true, transformation(origin = {96, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant halfopen(k = 0.5) annotation (
    Placement(visible = true, transformation(origin = {-28, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant minimumOpen(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Valves.FlowCoefficientVale halfOpenValve(Kv=12,
      openingChar=DHN4Control.Components.Types.valveOpeningChar.Linear)
    annotation (Placement(visible=true, transformation(
        origin={6,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Components.Valves.FlowCoefficientVale closedValve(Kv = 12)  annotation (
    Placement(visible = true, transformation(origin = {6, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.m_flow)
    annotation (Line(points={{-90,18},{-78,18}}, color={0,0,127}));
  connect(temperature.y, idealMassFlowSource.T) annotation (
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, closedValve.inlet) annotation (
    Line(points = {{-68, 0}, {-70, 0}, {-70, -40}, {-4, -40}}, color = {168, 168, 168}));
  connect(closedValve.outlet, HP.inlet) annotation (
    Line(points = {{16, -40}, {96, -40}}, color = {168, 168, 168}));
  connect(minimumOpen.y, closedValve.opening) annotation (
    Line(points = {{-13, -20}, {5, -20}, {5, -32}}, color = {0, 0, 127}));
  connect(halfopen.y, halfOpenValve.opening) annotation (
    Line(points = {{-16, 28}, {6, 28}, {6, 8}}, color = {0, 0, 127}));
  connect(halfOpenValve.outlet, expansionTank.inlet) annotation (
    Line(points = {{16, 0}, {92, 0}}, color = {168, 168, 168}));
  connect(idealMassFlowSource.inlet, halfOpenValve.inlet) annotation (
    Line(points = {{-68, 0}, {-4, 0}}, color = {168, 168, 168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 40}, {120, -60}})));
end ValveTest;
