within MultiEnergySystem.ElectricNetwork.Tests;
model Test_Battery_powerdriven "Test on a battery  in charging/discharging"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine(useThermalPort = false, L = 10, A = 0.0001, rho = 1.68e-8)  annotation(
    Placement(transformation(origin = {-12, 0}, extent = {{-14, -14}, {14, 14}})));
  Components.Battery_powerdriven battery_powerdriven(E_nom = 1e7, P_request = -4e3)  annotation(
    Placement(transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation(
    Line(points = {{-88, 0}, {-26, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, battery_powerdriven.inlet) annotation(
    Line(points = {{2, 0}, {58, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, battery_powerdriven.inlet) annotation(
    Line(points = {{-16, 0}, {60, 0}}, color = {56, 93, 138}));
annotation(
    Diagram(coordinateSystem(extent = {{-120, 20}, {80, -20}})));
end Test_Battery_powerdriven;
