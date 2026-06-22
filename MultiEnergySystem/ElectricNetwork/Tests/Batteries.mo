within MultiEnergySystem.ElectricNetwork.Tests;
package Batteries
  extends Modelica.Icons.ExamplesPackage;
  model Test_Battery "Source voltage charging the battery"
    extends Modelica.Icons.Example;
    Sources.SourceVoltage sourceVoltage
      annotation (Placement(transformation(extent={{-68,-8},{-48,12}})));
    Components.Batteries.Battery battery(E_nom=1e7) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={30,2})));
  equation
    connect(sourceVoltage.outlet, battery.inlet) annotation (Line(
        points={{-48,2},{20.8,2}},
        color={56,93,138},
        thickness=1));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test_Battery;

  model Test_Battery_powerdriven "Test on a battery  in charging/discharging"
    extends Modelica.Icons.Example;
    Sources.SourceVoltage sourceVoltage annotation (
      Placement(transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
    Components.Lines.ResistiveLine resistiveLine(
      useThermalPort=false,
      L=10,
      A=0.0001,
      rho=1.68e-8) annotation (Placement(transformation(origin={-12,0}, extent={{
              -14,-14},{14,14}})));
    Components.Batteries.Battery_powerdriven battery_powerdriven(E_nom=1e7,
        P_request=-4e3) annotation (Placement(transformation(
          origin = {66, 0},
          extent={{10,-10},{-10,10}})));
  equation
    connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation (
      Line(points = {{-88, 0}, {-26, 0}}, color = {56, 93, 138}));
    connect(resistiveLine.electricPortOutlet, battery_powerdriven.inlet) annotation (
      Line(points = {{2, 0}, {56, 0}}, color = {56, 93, 138}));

  annotation (
      Diagram(coordinateSystem(extent = {{-120, 20}, {80, -20}})));
  end Test_Battery_powerdriven;

  model Test_Battery_user
    "Test of a simple battery (sink battery) and a user with prescribed electric absorption"
    extends Modelica.Icons.Example;
    Sources.SourceVoltage sourceVoltage annotation (
      Placement(transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}})));
    Components.Batteries.Battery_powerdriven battery_powerdriven(P_request=500)
      annotation (Placement(transformation(
          origin={20,48},
          extent={{-10,-10},{10,10}},
          rotation=-90)));
    Components.Lines.ResistiveLine resistiveLine(
      L=10,
      A=0.001,
      rho=1.68e-5,
      useThermalPort=false) annotation (Placement(transformation(origin={-42,0},
            extent={{-10,-10},{10,10}})));
    Components.IdealUser idealUser annotation (
      Placement(transformation(origin = {88, -6}, extent = {{10, -10}, {-10, 10}})));
    Modelica.Blocks.Sources.Ramp ramp(duration = 200, height = 100, offset = 300, startTime = 300) annotation (
      Placement(transformation(origin = {130, -6}, extent = {{10, -10}, {-10, 10}})));
    Components.Lines.ResistiveLine resistiveLine2(
      useThermalPort=false,
      L=1,
      A=0.001,
      rho=1.68e-5) annotation (Placement(transformation(
          origin={20,18},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Components.Lines.ResistiveLine resistiveLine1(
      L=1,
      A=0.001,
      rho=1.68e-5,
      useThermalPort=false) annotation (Placement(transformation(origin={48,-6},
            extent={{-10,-10},{10,10}})));
    Components.ElectricBus2 electricBus2 annotation (
      Placement(transformation(origin = {-12, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  equation
    connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation (
      Line(points = {{-78, 0}, {-52, 0}}, color = {56, 93, 138}));
    connect(idealUser.P_in, ramp.y) annotation (
      Line(points = {{96, -6}, {120, -6}}, color = {0, 0, 127}));
    connect(resistiveLine2.electricPortOutlet, battery_powerdriven.inlet) annotation (
      Line(points = {{20, 28}, {20, 38}}, color = {56, 93, 138}));
    connect(resistiveLine1.electricPortOutlet, idealUser.inlet) annotation (
      Line(points = {{58, -6.2}, {80, -6.2}}, color = {56, 93, 138}));
    connect(electricBus2.electricPortInlet, resistiveLine2.electricPortInlet) annotation (
      Line(points = {{-2, 6}, {20, 6}, {20, 8}}, color = {56, 93, 138}));
    connect(electricBus2.electricPortInlet1, resistiveLine1.electricPortInlet) annotation (
      Line(points = {{-2, -6}, {38, -6}}, color = {56, 93, 138}));
    connect(resistiveLine.electricPortOutlet, electricBus2.electricPortOutlet) annotation (
      Line(points = {{-32, 0}, {-22, 0}}, color = {56, 93, 138}));
    annotation (
      Diagram(coordinateSystem(extent = {{-100, 60}, {140, -20}})));
  end Test_Battery_user;

  model Test_Battery_powerdriven_user
    "Test of a battery (charge/discharge) with imposed power and a user with prescribed electric absortion"
    extends Modelica.Icons.Example;
    Sources.SourceVoltage sourceVoltage annotation (
      Placement(transformation(origin = {-96, 22}, extent = {{-10, -10}, {10, 10}})));
    Components.Lines.ResistiveLine resistiveLine(
      L=10,
      A=0.001,
      rho=1.68e-5) annotation (Placement(transformation(origin={-52,22}, extent={
              {-10,-10},{10,10}})));
    Components.Lines.ResistiveLine resistiveLine1(
      L=1,
      A=0.001,
      rho=1.68e-5) annotation (Placement(transformation(origin={30,36}, extent={{
              -10,-10},{10,10}})));
    Components.Lines.ResistiveLine resistiveLine2(
      L=1,
      A=0.001,
      rho=1.68e-5) annotation (Placement(transformation(origin={28,4}, extent={{-10,
              -10},{10,10}})));
    Components.Batteries.Battery_powerdriven battery_powerdriven(P_request=-500,
        E_nom=1e6) annotation (Placement(transformation(
          origin={84,36},
          extent={{10,-10},{-10,10}},
          rotation=-0)));
    Components.IdealUser idealUser annotation (
      Placement(transformation(origin = {86, 4}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
    Modelica.Blocks.Sources.Ramp ramp(duration = 200, height = 100, offset = 300, startTime = 300) annotation (
      Placement(transformation(origin = {122, 4}, extent = {{10, -10}, {-10, 10}})));
  equation
    connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation (
      Line(points = {{-86, 22}, {-62, 22}}, color = {56, 93, 138}));
    connect(resistiveLine1.electricPortOutlet, battery_powerdriven.inlet) annotation (
      Line(points = {{40, 36}, {74, 36}}, color = {56, 93, 138}));
    connect(resistiveLine2.electricPortOutlet, idealUser.inlet) annotation (
      Line(points = {{38, 4}, {78, 4}}, color = {56, 93, 138}));
    connect(idealUser.P_in, ramp.y) annotation (
      Line(points = {{94, 4}, {112, 4}}, color = {0, 0, 127}));
    connect(resistiveLine1.electricPortInlet, resistiveLine.electricPortOutlet) annotation (
      Line(points = {{20, 36}, {-14, 36}, {-14, 22}, {-42, 22}}, color = {56, 93, 138}));
    connect(resistiveLine2.electricPortInlet, resistiveLine.electricPortOutlet) annotation (
      Line(points = {{18, 4}, {-14, 4}, {-14, 22}, {-42, 22}}, color = {56, 93, 138}));
    annotation (
      Diagram(coordinateSystem(extent = {{-120, 60}, {140, -20}})));
  end Test_Battery_powerdriven_user;

  model Test_Battery_powerinput_user
    "Test with battery (charge/discharge)and a user both with prescribed power absoprtion"
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

  model Test_Battery_powerinput
    "Test with battery (charge/discharge) with prescribed power exchange with network"
   extends Modelica.Icons.Example;
    Components.Batteries.Battery_powerinput battery_powerinput(E_nom=1e6, SOC0=
          0.2) annotation (Placement(transformation(
          origin={56,0},
          extent={{12,-12},{-12,12}},
          rotation=-0)));
    Sources.SourceVoltage sourceVoltage annotation (
      Placement(transformation(origin = {-96, 0}, extent = {{-10, -10}, {10, 10}})));
    Components.Lines.ResistiveLine resistiveLine(
      L=10,
      A=0.001,
      rho=1.68e-8) annotation (Placement(transformation(origin={-28,0}, extent={{
              -16,-16},{16,16}})));
    Modelica.Blocks.Sources.Ramp ramp(height = 300, duration = 500, offset = 500, startTime = 200)  annotation (
      Placement(transformation(origin = {112, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  equation
    connect(sourceVoltage.outlet, resistiveLine.electricPortInlet) annotation (
      Line(points = {{-86, 0}, {-44, 0}}, color = {56, 93, 138}));
    connect(resistiveLine.electricPortOutlet, battery_powerinput.inlet) annotation (
      Line(points = {{-12, 0}, {45, 0}}, color = {56, 93, 138}));
    connect(ramp.y, battery_powerinput.P_request) annotation (
      Line(points = {{102, 0}, {68, 0}}, color = {0, 0, 127}));

  annotation (
      Diagram(coordinateSystem(extent = {{-120, 20}, {140, -20}})));
  end Test_Battery_powerinput;
end Batteries;
