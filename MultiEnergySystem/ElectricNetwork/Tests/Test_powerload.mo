within MultiEnergySystem.ElectricNetwork.Tests;
model Test_powerload
"Test on a simple circuit with a power load"
 extends Modelica.Icons.Example;
  Sources.SourceVoltage_i sourceVoltage_i annotation (
    Placement(transformation(origin = {-64, 38}, extent = {{-10, -10}, {10, 10}})));
  Components.PowerLoad powerLoad(P_nominal = 100)  annotation (
    Placement(transformation(origin = {42, 38}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Components.Ground ground annotation (
    Placement(transformation(origin = {-86, 68}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceVoltage_i.n, powerLoad.n) annotation (
    Line(points = {{-54, 38}, {32, 38}}, color = {56, 93, 138}));
  connect(powerLoad.p, sourceVoltage_i.p) annotation (
    Line(points = {{52, 38}, {62, 38}, {62, 0}, {-82, 0}, {-82, 38}, {-74, 38}}, color = {56, 93, 138}));
 connect(ground.electricPortInlet_i, sourceVoltage_i.n) annotation (
    Line(points = {{-86, 78}, {-20, 78}, {-20, 38}, {-54, 38}}, color = {56, 93, 138}));
end Test_powerload;
