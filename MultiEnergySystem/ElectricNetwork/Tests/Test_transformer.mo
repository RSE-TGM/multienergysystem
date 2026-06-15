within MultiEnergySystem.ElectricNetwork.Tests;
model Test_transformer "Test with a transformer that powers an ideal electrical load"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage(v0 = 1000)  annotation(
    Placement(transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.Transformer transformer(useThermalPort = false, N1 = 1000, N2 = 385)  annotation(
    Placement(transformation(extent = {{-14, -14}, {14, 14}})));
  Components.IdealUser idealUser annotation(
    Placement(transformation(origin = {88, 0}, extent = {{14, -14}, {-14, 14}}, rotation = -0)));
  Modelica.Blocks.Sources.Ramp ramp(height = 0, duration = 0, offset = 100)  annotation(
    Placement(transformation(origin = {88, 56}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceVoltage.outlet, transformer.electricPortInlet) annotation(
    Line(points = {{-88, 0}, {-14, 0}}, color = {56, 93, 138}));
  connect(transformer.electricPortOutlet, idealUser.inlet) annotation(
    Line(points = {{14, 0}, {77, 0}}, color = {56, 93, 138}));
  connect(ramp.y, idealUser.P_in) annotation(
    Line(points = {{100, 56}, {120, 56}, {120, 0}, {100, 0}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-120, 80}, {120, -20}})));
end Test_transformer;
