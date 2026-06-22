within MultiEnergySystem.ElectricNetwork.Tests;
model Test_RL
"An RL circuit test model that connects a voltage source, resistor, and inductance to analyze transient electrical behavior"
 extends Modelica.Icons.Example;
  Sources.SourceVoltage_i sourceVoltage_i annotation (
    Placement(transformation(origin = {-18, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Components.Lines.Resistor resistor(R = 10)  annotation (
    Placement(transformation(origin = {60, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.Inductance inductance(L = 5)  annotation (
    Placement(transformation(origin = {-10, -40}, extent = {{14, -14}, {-14, 14}}, rotation = -0)));
  Components.Ground ground annotation (
    Placement(transformation(origin = {-36, 66}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceVoltage_i.p, resistor.p) annotation (
    Line(points = {{-8, 26}, {60, 26}, {60, 14}}, color = {56, 93, 138}));
  connect(resistor.n, inductance.p) annotation (
    Line(points = {{60, -6}, {60, -40}, {4, -40}}, color = {56, 93, 138}));
  connect(inductance.n, sourceVoltage_i.n) annotation (
    Line(points = {{-24, -40}, {-70, -40}, {-70, 26}, {-28, 26}}, color = {56, 93, 138}));
  connect(sourceVoltage_i.n, ground.electricPortInlet_i) annotation (
    Line(points = {{-28, 26}, {-54, 26}, {-54, 84}, {-36, 84}, {-36, 76}}, color = {56, 93, 138}));
end Test_RL;
