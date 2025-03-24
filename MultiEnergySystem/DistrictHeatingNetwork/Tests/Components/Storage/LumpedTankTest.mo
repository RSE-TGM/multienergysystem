within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Storage;
model LumpedTankTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage tank(D = 1.7, T_start( displayUnit = "K")= 338.15, allowFlowReversal = false, H = 4, pin_start = 250000)  annotation (
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -14}, {10, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0=338.15,                      use_in_p0 = false)  annotation (
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceW(T0 = 338.15,m_flow0 = 5, p0( displayUnit = "Pa")= 1.1, use_in_m_flow = true)  annotation (
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression m_flow(y = if time < 10 then 2 else 5)  annotation (
    Placement(visible = true, transformation(origin = {-82, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System system annotation (
    Placement(visible = true, transformation(origin = {88, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage tank2(D = 1.7, T_start(displayUnit = "K") = 338.15, allowFlowReversal = false, H = 4,
    pin_start=100000,
    n=4)                                                                                                                                                                                             annotation (
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -14}, {10, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink_mflow(T0 = 68 + 273.15, p0 = 99999.99999999999, pin_start = 99999.99999999999, m_flow0 = 0.5)  annotation (
    Placement(visible = true, transformation(origin = {20, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0=338.15)                       annotation (
    Placement(visible = true, transformation(origin = {20, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(sinkP.inlet, tank.outlet) annotation (
    Line(points={{-50,40},{-60,40},{-60,7},{-50,7}},          color = {168, 168, 168}));
  connect(sourceW.outlet, tank.inlet) annotation (
    Line(points={{-60,-30},{-60,-7},{-50,-7}},        color = {168, 168, 168}));
  connect(m_flow.y, sourceW.in_m_flow) annotation (
    Line(points = {{-71, -46}, {-65, -46}}, color = {0, 0, 127}));
  connect(sink_mflow.inlet, tank2.outlet) annotation (
    Line(points={{20,32},{20,8.75},{30,8.75}},  color = {168, 168, 168}));
  connect(sourceP.outlet, tank2.inlet) annotation (
    Line(points={{20,-34},{20,-8.75},{30,-8.75}},  color = {168, 168, 168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -80}, {100, 80}})), experiment(
        StopTime=100, __Dymola_Algorithm="Dassl"));
end LumpedTankTest;
