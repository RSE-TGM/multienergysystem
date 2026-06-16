within MultiEnergySystem.ElectricNetwork.Tests;
model Test_Battery_powerinput_user "Test with battery (charge/discharge) and a user both with prescribed power absoprtion"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(origin = {-86, 0}, extent = {{-10, -10}, {10, 10}})));
  Components.Lines.ResistiveLine resistiveLine(
    L=10,
    A=0.001,
    rho=1.68e-5,
    useThermalPort=false) annotation (Placement(transformation(origin={-40,0},
          extent={{-10,-10},{10,10}})));
  Components.Lines.ResistiveLine resistiveLine1(
    L=1,
    A=0.001,
    rho=1.68e-5,
    useThermalPort=false) annotation (Placement(transformation(origin={42,18},
          extent={{-10,-10},{10,10}})));
  Components.Lines.ResistiveLine resistiveLine2(
    L=1,
    A=0.001,
    rho=1.68e-5,
    useThermalPort=false) annotation (Placement(transformation(origin={44,-24},
          extent={{-10,-10},{10,10}})));
  Components.IdealUser idealUser annotation (
    Placement(transformation(origin = {84, -24}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 200, height = 100, offset = 300, startTime = 300) annotation (
    Placement(transformation(origin = {126, -24}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 200, height = -100, offset = -300, startTime = 300) annotation (
    Placement(transformation(origin = {120, 18}, extent = {{10, -10}, {-10, 10}})));
  Components.Batteries.Battery_powerinput battery_powerinput(E_nom=1e6)
    annotation (Placement(transformation(
        origin={78,18},
        extent={{10,-10},{-10,10}},
        rotation=-0)));
equation
  connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation (
    Line(points = {{-76, 0}, {-50, 0}}, color = {56, 93, 138}));
  connect(resistiveLine2.electricPortOutlet, idealUser.inlet) annotation (
    Line(points = {{54, -24}, {76, -24}}, color = {56, 93, 138}));
  connect(ramp.y, idealUser.P_in) annotation (
    Line(points = {{116, -24}, {92, -24}}, color = {0, 0, 127}));
  connect(resistiveLine1.electricPortOutlet, battery_powerinput.inlet) annotation (
    Line(points = {{52, 18}, {68, 18}}, color = {56, 93, 138}));
  connect(battery_powerinput.P_request, ramp1.y) annotation (
    Line(points = {{88, 18}, {110, 18}}, color = {0, 0, 127}));
  connect(resistiveLine1.electricPortInlet, resistiveLine.electricPortOutlet) annotation (
    Line(points = {{32, 18}, {12, 18}, {12, 0}, {-30, 0}}, color = {56, 93, 138}));
  connect(resistiveLine2.electricPortInlet, resistiveLine.electricPortOutlet) annotation (
    Line(points = {{34, -24}, {12, -24}, {12, 0}, {-30, 0}}, color = {56, 93, 138}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, 40}, {140, -40}})));
end Test_Battery_powerinput_user;
