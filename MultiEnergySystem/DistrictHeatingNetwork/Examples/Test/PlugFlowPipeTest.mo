within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PlugFlowPipeTest
  extends Modelica.Icons.Example;
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation (
      Placement(visible=true, transformation(
        origin={-68,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation (
    Placement(visible = true, transformation(origin = {-130, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 5) annotation (
    Placement(visible = true, transformation(origin = {-102, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank annotation (Placement(
        visible=true, transformation(
        origin={92,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource2 annotation (
    Placement(visible = true, transformation(origin = {-68, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Pipes.pipeFV fiftySecNoTI(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, thermalInertia = true) annotation (
    Placement(visible = true, transformation(origin = {-12, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank2 annotation (
    Placement(visible = true, transformation(origin = {92, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 80) annotation (
    Placement(visible = true, transformation(origin = {-130, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant4(k = 5) annotation (
    Placement(visible = true, transformation(origin = {-102, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Pipes.pipePF pipePF(
    D=0.0508,
    L=50,
    T_start(displayUnit="degC") = 338.15,
    T_start_m(displayUnit="degC") = 338.15) annotation (Placement(visible=true,
        transformation(
        origin={0,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor pfOut annotation (Placement(
        visible=true, transformation(
        origin={46,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(massflow.y, idealMassFlowSource.m_flow)
    annotation (Line(points={{-91,78},{-79,78}}, color={0,0,127}));
  connect(temperature.y, idealMassFlowSource.T) annotation (
    Line(points = {{-119, 62}, {-79, 62}}, color = {0, 0, 127}));
  connect(constant3.y, idealMassFlowSource2.T) annotation (
    Line(points = {{-119, 16}, {-79, 16}}, color = {0, 0, 127}));
  connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (
    Line(points = {{-2, 14}, {92, 14}}));
  connect(constant4.y, idealMassFlowSource2.m_flow)
    annotation (Line(points={{-91,32},{-79,32}}, color={0,0,127}));
  connect(idealMassFlowSource2.inlet, fiftySecNoTI.inlet) annotation (
    Line(points = {{-68, 14}, {-22, 14}}));
  connect(idealMassFlowSource.inlet, pipePF.inlet) annotation (
    Line(points = {{-68, 60}, {-10, 60}}, color = {168, 168, 168}));
  connect(pipePF.outlet, pfOut.inlet) annotation (
    Line(points = {{10, 60}, {36, 60}}, color = {168, 168, 168}));
  connect(pfOut.outlet, expansionTank.inlet) annotation (
    Line(points = {{56, 60}, {92, 60}}, color = {168, 168, 168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 100}, {100, 0}})));
end PlugFlowPipeTest;
