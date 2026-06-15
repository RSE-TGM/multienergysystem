within MultiEnergySystem.ElectricNetwork.Tests;
model Test_SimpleLine "Test on a simple electric line (not accounting voltage drop along the line)"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-92, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.SimpleLine simpleLine(useThermalPort = false)  annotation(
    Placement(transformation(origin = {-2, -1.77636e-15}, extent = {{-16, -16}, {16, 16}})));
  Components.IdealUser idealUser annotation(
    Placement(transformation(origin = {80, 0}, extent = {{14, -14}, {-14, 14}}, rotation = -0)));
  Modelica.Blocks.Sources.Ramp ramp(height = 10, duration = 100, offset = 10, startTime = 10)  annotation(
    Placement(transformation(origin = {80, 38}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceVoltage.outlet, simpleLine.electricPortInlet) annotation(
    Line(points = {{-82, 0}, {-18, 0}}, color = {56, 93, 138}));
  connect(simpleLine.electricPortOutlet, idealUser.inlet) annotation(
    Line(points = {{14, 0}, {68, 0}}, color = {56, 93, 138}));
  connect(ramp.y, idealUser.P_in) annotation(
    Line(points = {{92, 38}, {110, 38}, {110, 0}, {92, 0}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-100, 60}, {120, -20}})));
end Test_SimpleLine;
