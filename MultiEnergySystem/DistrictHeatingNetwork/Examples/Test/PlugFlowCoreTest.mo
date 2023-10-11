within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PlugFlowCoreTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
        5, Tnom=353.15)                                                                    annotation (
      Placement(visible=true, transformation(
        origin={-40,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (Placement(
        visible=true, transformation(
        origin={40,84},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore(
    Di=0.0508,
    L=50,
    T_start(displayUnit="degC") = 338.15) annotation (Placement(visible=true,
        transformation(
        origin={0,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(mflownom=
        5, Tnom=353.15)                                                                     annotation (
    Placement(visible = true, transformation(origin={-40,20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySecNoTI(Di = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, tIns = 0.1, t = 0.003, lambdaIns = 0.04, thermalInertia = false) annotation (
    Placement(visible = true, transformation(origin={0,20},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
    Placement(visible = true, transformation(origin={40,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(plugFlowCore.outlet, expansionTank.inlet) annotation (
    Line(points={{10,60},{40,60},{40,74}},
                                        color = {168, 168, 168}));
  connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (
    Line(points={{10,20},{40,20},{40,30}}));
  connect(idealMassFlowSource.outlet, plugFlowCore.inlet)
    annotation (Line(points={{-29.8,60},{-10,60}}, color={168,168,168}));
  connect(idealMassFlowSource2.outlet, fiftySecNoTI.inlet)
    annotation (Line(points={{-29.8,20},{-10,20}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,0},{100,100}})));
end PlugFlowCoreTest;
