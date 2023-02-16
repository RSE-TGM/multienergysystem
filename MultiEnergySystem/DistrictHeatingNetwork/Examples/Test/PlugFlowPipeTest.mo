within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PlugFlowPipeTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
        5, Tnom=353.15)                                                                    annotation (
      Placement(visible=true, transformation(
        origin={-70,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (Placement(
        visible=true, transformation(
        origin={92,80},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(mflownom=
        5, Tnom=353.15)                                                                     annotation (
    Placement(visible = true, transformation(origin={-68,24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySecNoTI(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, thermalInertia = true) annotation (
    Placement(visible = true, transformation(origin={-12,24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
    Placement(visible = true, transformation(origin={92,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipePF pipePF(
    D=0.0508,
    L=50,
    T_start(displayUnit="degC") = 338.15,
    T_start_m(displayUnit="degC") = 338.15) annotation (Placement(visible=true,
        transformation(
        origin={0,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor pfOut annotation (Placement(
        visible=true, transformation(
        origin={46,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (
    Line(points={{-2,24},{92,24}}));
  connect(pipePF.outlet, pfOut.inlet) annotation (
    Line(points={{10,70},{36,70}},      color = {168, 168, 168}));
  connect(pfOut.outlet, expansionTank.inlet) annotation (
    Line(points={{56,70},{92,70}},      color = {168, 168, 168}));
  connect(idealMassFlowSource.outlet, pipePF.inlet)
    annotation (Line(points={{-59.8,70},{-10,70}}, color={168,168,168}));
  connect(idealMassFlowSource2.outlet, fiftySecNoTI.inlet)
    annotation (Line(points={{-57.8,24},{-22,24}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,0},{100,100}})));
end PlugFlowPipeTest;
