within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PlugFlowCoreTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(Tnom(displayUnit = "K") = 353.15, allowFlowReversal = true, mflownom = 5, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
    Placement(visible = true, transformation(origin = {40, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore(Di = 0.0508, L = 50, T_start(displayUnit = "degC") = 338.15, Tin_start = 25 + 273.15, Tout_start = 25 + 273.15, hin_start = 10000, m_flow_start = 5, pin_start = 200000, pout_start = 150000) annotation (
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(Tnom(displayUnit = "K") = 353.15, mflownom = 5, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySecNoTI(Di = 0.0508, L = 50, N = 50, T_ext(displayUnit = "K"), T_start(displayUnit = "degC") = 338.15, Tin_start = 80 + 273.15, Tout_start = 80 + 273.15, allowFlowReversal = true, hin_start = 10000, lambdaIns = 0.04, m_flow_start = 5, pin_start = 200000, pout_start = 150000, t = 0.003, tIns = 0.1, thermalInertia = false) annotation (
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_1(duration = 50, height = -15, offset = 5, startTime = 50) annotation (
    Placement(visible = true, transformation(origin = {-64, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_2(duration = 50, height = -15, offset = 5, startTime = 50) annotation (
    Placement(visible = true, transformation(origin = {-64, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(plugFlowCore.outlet, expansionTank.inlet) annotation (
    Line(points = {{10, 60}, {40, 60}, {40, 74}}, color = {168, 168, 168}));
  connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (
    Line(points = {{10, 20}, {40, 20}, {40, 30}}));
  connect(idealMassFlowSource.outlet, plugFlowCore.inlet) annotation (
    Line(points = {{-29.8, 60}, {-10, 60}}, color = {168, 168, 168}));
  connect(idealMassFlowSource2.outlet, fiftySecNoTI.inlet) annotation (
    Line(points = {{-29.8, 20}, {-10, 20}}, color = {168, 168, 168}));
  connect(m_flow_1.y, idealMassFlowSource.in_m_flow) annotation (
    Line(points = {{-52, 82}, {-44, 82}, {-44, 66}}, color = {0, 0, 127}));
  connect(m_flow_2.y, idealMassFlowSource2.in_m_flow) annotation (
    Line(points = {{-52, 40}, {-44, 40}, {-44, 26}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, 0}, {100, 100}})));
end PlugFlowCoreTest;
