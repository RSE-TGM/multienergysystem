within MultiEnergySystem.ElectricNetwork.Tests;
model Test_Battery_powerdriven_user "Test of a battery (charge/discharge) with imposed power and a user with prescribed electric absortion"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-96, 22}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine(L = 10, A = 0.001, rho = 1.68e-5)  annotation(
    Placement(transformation(origin = {-52, 22}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine1(L = 1, A = 0.001, rho = 1.68e-5)  annotation(
    Placement(transformation(origin = {30, 36}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine2(L = 1, A = 0.001, rho = 1.68e-5)  annotation(
    Placement(transformation(origin = {28, 4}, extent = {{-10, -10}, {10, 10}})));
  Components.Battery_powerdriven battery_powerdriven(P_request = -500, E_nom = 1e6)  annotation(
    Placement(transformation(origin = {84, 36}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Components.IdealUser idealUser annotation(
    Placement(transformation(origin = {86, 4}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 200, height = 100, offset = 300, startTime = 300) annotation(
    Placement(transformation(origin = {122, 4}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation(
    Line(points = {{-86, 22}, {-62, 22}}, color = {56, 93, 138}));
  connect(resistiveLine1.electricPortOutlet, battery_powerdriven.inlet) annotation(
    Line(points = {{40, 36}, {74, 36}}, color = {56, 93, 138}));
  connect(resistiveLine2.electricPortOutlet, idealUser.inlet) annotation(
    Line(points = {{38, 4}, {78, 4}}, color = {56, 93, 138}));
  connect(idealUser.P_in, ramp.y) annotation(
    Line(points = {{94, 4}, {112, 4}}, color = {0, 0, 127}));
  connect(resistiveLine1.electricPortInlet, resistiveLine.electricPortOutlet) annotation(
    Line(points = {{20, 36}, {-14, 36}, {-14, 22}, {-42, 22}}, color = {56, 93, 138}));
  connect(resistiveLine2.electricPortInlet, resistiveLine.electricPortOutlet) annotation(
    Line(points = {{18, 4}, {-14, 4}, {-14, 22}, {-42, 22}}, color = {56, 93, 138}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, 60}, {140, -20}})));
end Test_Battery_powerdriven_user;
