within MultiEnergySystem.ElectricNetwork.Tests;
model Resistive_circuit
"Test on a simple circuit with a resistor"
 extends Modelica.Icons.Example;
  Sources.SourceVoltage_i sourceVoltage_i annotation (
    Placement(transformation(origin = {-54, 38}, extent = {{-10, -10}, {10, 10}})));
  Components.Lines.Resistor resistor(R = 10)  annotation (
    Placement(transformation(origin = {38, 38}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Components.Ground ground annotation (
    Placement(transformation(origin = {0, 64}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ground.electricPortInlet_i, sourceVoltage_i.n) annotation (
    Line(points = {{0, 74}, {-22, 74}, {-22, 38}, {-44, 38}}, color = {56, 93, 138}));
  connect(sourceVoltage_i.n, resistor.n) annotation (
    Line(points = {{-44, 38}, {28, 38}}, color = {56, 93, 138}));
  connect(resistor.p, sourceVoltage_i.p) annotation (
    Line(points = {{48, 38}, {64, 38}, {64, -6}, {-76, -6}, {-76, 38}, {-64, 38}}, color = {56, 93, 138}));
end Resistive_circuit;
