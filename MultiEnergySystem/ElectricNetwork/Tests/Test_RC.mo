within MultiEnergySystem.ElectricNetwork.Tests;
model Test_RC
"An RC circuit test model that connects a voltage source, resistor, and capacitor to analyze transient electrical behavior"
 extends Modelica.Icons.Example;
  Sources.SourceVoltage_i sourceVoltage_i annotation (
    Placement(transformation(origin = {-68, 32}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Components.Lines.Resistor resistor(R = 10)  annotation (
    Placement(transformation(origin = {12, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
  Components.Capacitance capacitance(C = 5)  annotation (
    Placement(transformation(origin = {68, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
  Components.Ground ground annotation (
    Placement(transformation(origin = {-26, 66}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceVoltage_i.p, resistor.p) annotation (
    Line(points = {{-58, 32}, {2, 32}}, color = {56, 93, 138}));
  connect(resistor.n, capacitance.p) annotation (
    Line(points = {{22, 32}, {58, 32}}, color = {56, 93, 138}));
  connect(capacitance.n, sourceVoltage_i.n) annotation (
    Line(points = {{78, 32}, {88, 32}, {88, -18}, {-98, -18}, {-98, 32}, {-78, 32}}, color = {56, 93, 138}));
  connect(ground.electricPortInlet_i, sourceVoltage_i.n) annotation (
    Line(points = {{-26, 76}, {-88, 76}, {-88, 32}, {-78, 32}}, color = {56, 93, 138}));
end Test_RC;
