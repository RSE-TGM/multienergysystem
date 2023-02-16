within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model ValveTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
        5, Tnom=353.15)                                                                    annotation (
      Placement(visible=true, transformation(
        origin={-70,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(p = 499999.9999999999)  annotation (
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank HP(p = 499999.9999999999)  annotation (
    Placement(visible = true, transformation(origin = {96, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant halfopen(k = 0.5) annotation (
    Placement(visible = true, transformation(origin = {-28, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant minimumOpen(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale halfOpenValve(Kv=12,
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear)
    annotation (Placement(visible=true, transformation(
        origin={6,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale closedValve(Kv = 12)  annotation (
    Placement(visible = true, transformation(origin = {6, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(closedValve.outlet, HP.inlet) annotation (
    Line(points = {{16, -40}, {96, -40}}, color = {168, 168, 168}));
  connect(minimumOpen.y, closedValve.opening) annotation (
    Line(points={{-13,-20},{6,-20},{6,-32}},        color = {0, 0, 127}));
  connect(halfopen.y, halfOpenValve.opening) annotation (
    Line(points={{-17,28},{6,28},{6,8}},        color = {0, 0, 127}));
  connect(halfOpenValve.outlet, expansionTank.inlet) annotation (
    Line(points = {{16, 0}, {92, 0}}, color = {168, 168, 168}));
  connect(idealMassFlowSource.outlet, halfOpenValve.inlet)
    annotation (Line(points={{-59.8,0},{-4,0}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, closedValve.inlet) annotation (Line(
        points={{-59.8,0},{-50,0},{-50,-40},{-4,-40}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 40}, {120, -60}})));
end ValveTest;
