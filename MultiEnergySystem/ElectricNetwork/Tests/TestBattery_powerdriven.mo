within MultiEnergySystem.ElectricNetwork.Tests;
model TestBattery_powerdriven
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine(useThermalPort = true, L = 100, A = 0.0001, rho = 1.68e-8)  annotation(
    Placement(transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.Battery_powerdriven battery_powerdriven(E_nom = 1e7, P_request = -4e3)  annotation(
    Placement(transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15)  annotation(
    Placement(transformation(origin = {-64, 70}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation(
    Line(points = {{-88, 0}, {-26, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, battery_powerdriven.inlet) annotation(
    Line(points = {{-6, 0}, {58, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, battery_powerdriven.inlet) annotation(
    Line(points = {{-16, 0}, {60, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.thermalPort, fixedTemperature.port) annotation(
    Line(points = {{-16, 2}, {-16, 70}, {-54, 70}}, color = {191, 0, 0}));
end TestBattery_powerdriven;
