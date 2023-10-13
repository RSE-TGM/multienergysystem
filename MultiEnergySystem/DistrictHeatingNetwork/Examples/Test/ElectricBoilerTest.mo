within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model ElectricBoilerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {58, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource sourceHot(Tnom(displayUnit = "K") = 352.15, mflownom = 1) annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor mflowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor mflowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-30, -18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {58, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource sourceCold(Tnom(displayUnit = "K") = 338.15, mflownom = 1) annotation(
    Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor TSensorCold annotation(
    Placement(visible = true, transformation(origin = {36, -18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor TSensorWarm annotation(
    Placement(visible = true, transformation(origin = {36, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.ElectricBoiler eBoilerHot(onOffController(pre_y_start = true)) annotation(
    Placement(transformation(extent = {{-6, 10}, {14, 30}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.ElectricBoiler eBoilerCold annotation(
    Placement(transformation(extent = {{-6, -30}, {14, -10}})));
  Modelica.Blocks.Sources.RealExpression TrefBoiler2(y = 80) annotation(
    Placement(transformation(extent = {{-28, -12}, {-12, 4}})));
  Modelica.Blocks.Sources.RealExpression TrefBoiler1(y = 80) annotation(
    Placement(transformation(extent = {{-28, 28}, {-12, 44}})));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(TSensorCold.outlet, expansionTank1.inlet) annotation(
    Line(points = {{40, -20}, {58, -20}, {58, -14}}, color = {168, 168, 168}));
  connect(TSensorWarm.outlet, expansionTank.inlet) annotation(
    Line(points = {{40, 20}, {58, 20}, {58, 26}}, color = {168, 168, 168}));
  connect(mflowSensor1.outlet, eBoilerHot.inlet) annotation(
    Line(points = {{-26, 20}, {-6, 20}}, color = {168, 168, 168}));
  connect(eBoilerHot.outlet, TSensorWarm.inlet) annotation(
    Line(points = {{14, 20}, {32, 20}}, color = {168, 168, 168}));
  connect(mflowSensor2.outlet, eBoilerCold.inlet) annotation(
    Line(points = {{-26, -20}, {-6, -20}}, color = {168, 168, 168}));
  connect(eBoilerCold.outlet, TSensorCold.inlet) annotation(
    Line(points = {{14, -20}, {32, -20}}, color = {168, 168, 168}));
  connect(TrefBoiler2.y, eBoilerCold.referenceT) annotation(
    Line(points = {{-11.2, -4}, {0.6, -4}, {0.6, -10}}, color = {0, 0, 127}));
  connect(TrefBoiler1.y, eBoilerHot.referenceT) annotation(
    Line(points = {{-11.2, 36}, {0.6, 36}, {0.6, 30}}, color = {0, 0, 127}));
  connect(sourceCold.outlet, mflowSensor2.inlet) annotation(
    Line(points = {{-49.8, -20}, {-34, -20}}, color = {168, 168, 168}));
  connect(sourceHot.outlet, mflowSensor1.inlet) annotation(
    Line(points = {{-49.8, 20}, {-34, 20}}, color = {168, 168, 168}));
  annotation(
    Diagram(coordinateSystem(extent = {{-80, -80}, {80, 80}})));
end ElectricBoilerTest;
