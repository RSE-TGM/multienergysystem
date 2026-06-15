within MultiEnergySystem.ElectricNetwork.Tests;
model Test_Battery_user "Test of a simple battery (sink battery) and a user with prescribed electric absorption"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.Battery_powerdriven battery_powerdriven(P_request = 500)  annotation(
    Placement(transformation(origin = {20, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.ResistiveLine resistiveLine(L = 10, A = 0.001, rho = 1.68e-5, useThermalPort = false)  annotation(
    Placement(transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.IdealUser idealUser annotation(
    Placement(transformation(origin = {88, -6}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 200, height = 100, offset = 300, startTime = 300) annotation(
    Placement(transformation(origin = {130, -6}, extent = {{10, -10}, {-10, 10}})));
  Components.ResistiveLine resistiveLine2(useThermalPort = false, L = 1, A = 0.001, rho = 1.68e-5)  annotation(
    Placement(transformation(origin = {20, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Components.ResistiveLine resistiveLine1(L = 1, A = 0.001, rho = 1.68e-5, useThermalPort = false)  annotation(
    Placement(transformation(origin = {48, -6}, extent = {{-10, -10}, {10, 10}})));
  Components.ElectricBus2 electricBus2 annotation(
    Placement(transformation(origin = {-12, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation(
    Line(points = {{-78, 0}, {-52, 0}}, color = {56, 93, 138}));
  connect(idealUser.P_in, ramp.y) annotation(
    Line(points = {{96, -6}, {120, -6}}, color = {0, 0, 127}));
  connect(resistiveLine2.electricPortOutlet, battery_powerdriven.inlet) annotation(
    Line(points = {{20, 28}, {20, 38}}, color = {56, 93, 138}));
  connect(resistiveLine1.electricPortOutlet, idealUser.inlet) annotation(
    Line(points = {{58, -6.2}, {80, -6.2}}, color = {56, 93, 138}));
  connect(electricBus2.electricPortInlet, resistiveLine2.electricPortInlet) annotation(
    Line(points = {{-2, 6}, {20, 6}, {20, 8}}, color = {56, 93, 138}));
  connect(electricBus2.electricPortInlet1, resistiveLine1.electricPortInlet) annotation(
    Line(points = {{-2, -6}, {38, -6}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, electricBus2.electricPortOutlet) annotation(
    Line(points = {{-32, 0}, {-22, 0}}, color = {56, 93, 138}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, 60}, {140, -20}})));
end Test_Battery_user;
