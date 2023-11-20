within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model StratifiedTESTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
    use_in_m_flow=true,
    use_in_T=true,
    mflownom=5,
    Tnom=353.15)                                                                           annotation (
    Placement(visible = true, transformation(origin={-40,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(p=300000,
      T=353.15)                                                                               annotation (
    Placement(visible = true, transformation(origin={40,22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.Stratified1DStorage stratified1DStorage(
    D=1.7,
    N=8,
    T_ext=298.15,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp ramp(
    height=3,
    duration=100,
    offset=3,
    startTime=1000)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=30,
    duration=100,
    offset=30 + 273.15,
    startTime=2000)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
equation
  connect(stratified1DStorage.outlet, expansionTank.inlet) annotation (
    Line(points={{10,0},{40,0},{40,12}},
                                       color = {168, 168, 168}));
  connect(idealMassFlowSource.outlet, stratified1DStorage.inlet)
    annotation (Line(points={{-29.8,0},{-10,0}}, color={168,168,168}));
  connect(ramp.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{-59,
          10},{-44,10},{-44,6.2},{-45,6.2}}, color={0,0,127}));
  connect(ramp1.y, idealMassFlowSource.in_T)
    annotation (Line(points={{-59,50},{-35,50},{-35,6.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 6000, Tolerance = 1e-6, Interval = 12));
end StratifiedTESTest;
