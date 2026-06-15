within MultiEnergySystem.ElectricNetwork.Tests;
model Test_ResistiveLine "Test on a resistive line (accounting voltage drop along the line)"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-92, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealUser idealUser annotation(
    Placement(transformation(origin = {72, 3.55271e-15}, extent = {{16, -16}, {-16, 16}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 100, duration = 200, offset = 300, startTime = 300)  annotation(
    Placement(transformation(origin = {80, 38}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine(L = 10, A = 0.001, rho = 1.68e-8, useThermalPort = false)  annotation(
    Placement(transformation(origin = {-4, 0}, extent = {{-16, -16}, {16, 16}})));
equation
  connect(ramp.y, idealUser.P_in) annotation(
    Line(points = {{92, 38}, {110, 38}, {110, 0}, {85, 0}}, color = {0, 0, 127}));
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation(
    Line(points = {{-82, 0}, {-20, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, idealUser.inlet) annotation(
    Line(points = {{12, 0}, {58, 0}}, color = {56, 93, 138}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, 60}, {120, -20}})));
end Test_ResistiveLine;
