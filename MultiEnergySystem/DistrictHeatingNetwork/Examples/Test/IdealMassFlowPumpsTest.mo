within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model IdealMassFlowPumpsTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=5, Tnom=
        353.15)                                               annotation (
    Placement(visible = true, transformation(origin={-102,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
    Placement(visible = true, transformation(origin={80,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation (
    Placement(visible = true, transformation(origin={80,14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.FixedMassFlowPump fixedMassFlowPump annotation (
    Placement(visible = true, transformation(                    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
    Placement(visible = true, transformation(origin={80,-16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.VariableMassFlowPump variableMassFlowPump annotation (
    Placement(visible = true, transformation(origin={0,-30},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant variableMassRef(k = 2) annotation (
    Placement(visible = true, transformation(origin={-38,-18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedMassFlowPump.outlet, expansionTank1.inlet) annotation (
    Line(points={{10,0},{80,0},{80,4}},             color = {168, 168, 168}));
  connect(variableMassRef.y, variableMassFlowPump.m_flow) annotation (Line(
        points={{-27,-18},{-7.8,-18},{-7.8,-24}},   color={0,0,127}));

  connect(variableMassFlowPump.outlet, expansionTank2.inlet) annotation (Line(
        points={{10,-30},{80,-30},{80,-26}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, fixedMassFlowPump.inlet)
    annotation (Line(points={{-91.8,0},{-10,0}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, expansionTank.inlet) annotation (Line(
        points={{-91.8,0},{-80,0},{-80,26},{80,26},{80,30}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, variableMassFlowPump.inlet) annotation (
      Line(points={{-91.8,0},{-80,0},{-80,-30},{-10,-30}}, color={168,168,168}));
annotation (
    Diagram(coordinateSystem(extent={{-140,-60},{140,60}})), Icon(
        coordinateSystem(preserveAspectRatio=false)));
end IdealMassFlowPumpsTest;
