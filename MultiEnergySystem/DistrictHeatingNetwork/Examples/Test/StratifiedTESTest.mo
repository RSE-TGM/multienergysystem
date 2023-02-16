within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model StratifiedTESTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant massflow(k = 10) annotation (
    Placement(visible = true, transformation(origin = {-102, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation (
    Placement(visible = true, transformation(origin = {-130, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation (
    Placement(visible = true, transformation(origin = {-68, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank(T = 353.15) annotation (
    Placement(visible = true, transformation(origin = {92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Storage.Stratified1DStorage stratified1DStorage(
    D=1.7,
    N=5,
    T_ext=298.15,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        origin={-8,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  SimpleDistricHeating.Components.STES stes(D = 1.7, T_amb = 298.15, T_start = 338.15, h = 5)  annotation (
    Placement(visible = true, transformation(origin = {-10, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 80) annotation (
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 10) annotation (
    Placement(visible = true, transformation(origin = {-102, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation (
    Placement(visible = true, transformation(origin = {-68, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1(T = 353.15) annotation (
    Placement(visible = true, transformation(origin = {92, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.m_flow)
    annotation (Line(points={{-91,58},{-78,58}}, color={0,0,127}));
  connect(temperature.y, idealMassFlowSource.T) annotation (
    Line(points = {{-119, 42}, {-78, 42}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, stratified1DStorage.inlet) annotation (
    Line(points = {{-68, 40}, {-18, 40}}, color = {168, 168, 168}));
  connect(stratified1DStorage.outlet, expansionTank.inlet) annotation (
    Line(points = {{2, 40}, {92, 40}}, color = {168, 168, 168}));
  connect(constant1.y, idealMassFlowSource1.T) annotation (
    Line(points = {{-119, 10}, {-78, 10}}, color = {0, 0, 127}));
  connect(constant2.y, idealMassFlowSource1.m_flow)
    annotation (Line(points={{-91,26},{-78,26}}, color={0,0,127}));
  connect(idealMassFlowSource1.inlet, stes.inlet) annotation (
    Line(points = {{-68, 8}, {-10, 8}}, color = {168, 168, 168}));
  connect(stes.outlet, expansionTank1.inlet) annotation (
    Line(points = {{-10, -12}, {92, -12}}, color = {168, 168, 168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 80}, {100, -20}})));
end StratifiedTESTest;
