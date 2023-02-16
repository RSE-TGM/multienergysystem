within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model StratifiedTESTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
        10, Tnom=353.15)                                                                   annotation (
    Placement(visible = true, transformation(origin={-40,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(T = 353.15) annotation (
    Placement(visible = true, transformation(origin={40,22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.Stratified1DStorage stratified1DStorage(
    D=1.7,
    N=5,
    T_ext=298.15,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(stratified1DStorage.outlet, expansionTank.inlet) annotation (
    Line(points={{10,0},{40,0},{40,12}},
                                       color = {168, 168, 168}));
  connect(idealMassFlowSource.outlet, stratified1DStorage.inlet)
    annotation (Line(points={{-29.8,0},{-10,0}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})));
end StratifiedTESTest;
