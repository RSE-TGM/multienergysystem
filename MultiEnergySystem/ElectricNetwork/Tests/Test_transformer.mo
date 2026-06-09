within MultiEnergySystem.ElectricNetwork.Tests;
model Test_transformer
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage(v0 = 1000)  annotation(
    Placement(transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.Transformer transformer(useThermalPort = false, N1 = 1000, N2 = 385)  annotation(
    Placement(transformation(extent = {{-14, -14}, {14, 14}})));
  Components.Battery battery(E_nom = 1e7, SOC0 = 0.2)  annotation(
    Placement(transformation(origin = {88, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(sourceVoltage.outlet, transformer.electricPortInlet) annotation(
    Line(points = {{-88, 0}, {-14, 0}}, color = {56, 93, 138}));
  connect(transformer.electricPortOutlet, battery.inlet) annotation(
    Line(points = {{14, 0}, {78, 0}}, color = {56, 93, 138}));
end Test_transformer;
