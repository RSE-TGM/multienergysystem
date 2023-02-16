within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model LumpedTESTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
        1, Tnom=348.15)                                                                    annotation (
    Placement(visible = true, transformation(origin={-66,-24},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(T = 353.15)  annotation (
    Placement(visible = true, transformation(origin={-38,40},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage tes(
    D=1.7,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        origin={60,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource1(mflownom=
        10, Tnom=338.15)                                                                    annotation (
    Placement(visible = true, transformation(origin={40,-28},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation (
    Placement(visible = true, transformation(origin={60,44},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage lumpedStorage(
    D=1.7,
    T_ext=298.15,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        origin={-40,-2},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(lumpedStorage.outlet, expansionTank.inlet) annotation (
    Line(points={{-40,8},{-38,8},{-38,30}},
                                       color = {168, 168, 168}));
  connect(tes.outlet, expansionTank1.inlet) annotation (Line(points={{60,10},{
          60,34}},                                        color={168,168,168}));
  connect(idealMassFlowSource.outlet, lumpedStorage.inlet) annotation (Line(
        points={{-55.8,-24},{-40,-24},{-40,-12}}, color={168,168,168}));
  connect(idealMassFlowSource1.outlet, tes.inlet) annotation (Line(points={{
          50.2,-28},{60,-28},{60,-10}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-80},{100,80}})));
end LumpedTESTest;
