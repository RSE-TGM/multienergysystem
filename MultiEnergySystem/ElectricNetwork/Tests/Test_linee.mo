within MultiEnergySystem.ElectricNetwork.Tests;

model Test_linee
  Sources.SourceVoltage sourceVoltage annotation(
    Placement(transformation(origin = {-92, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.ResistiveLine resistiveLine(L = 100, A = 0.0001, rho = 1.68e-8, useThermalPort = false)  annotation(
    Placement(transformation(extent = {{-14, -14}, {14, 14}})));
  Components.Battery battery(E_nom = 1e7, SOC0 = 0.2)  annotation(
    Placement(transformation(origin = {92, 0}, extent = {{12, -12}, {-12, 12}}, rotation = -0)));
equation
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation(
    Line(points = {{-82, 0}, {-14, 0}}, color = {56, 93, 138}));
  connect(resistiveLine.electricPortOutlet, battery.inlet) annotation(
    Line(points = {{14, 0}, {80, 0}}, color = {56, 93, 138}));
end Test_linee;
