within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model ValveTestBase "Base test model for valves' tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start) annotation (
    Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp omega(duration = 10, height = 0, offset = Pump.P101.omeganom, startTime = 10) annotation (
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20, height = 0, offset = 1, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={-20,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale cvalve(Kv = 33.25192916, dp_nom = 20000) annotation (
    Placement(visible = true, transformation(                   extent={{-8,-8},
            {8,8}},                                                                          rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink(T0 = 85 + 273.15, m_flow0 = 4, p0(displayUnit = "Pa") = 4e5, pin_start(displayUnit = "Pa") = 4e5, use_in_m_flow = true)  annotation (
    Placement(visible = true, transformation(origin={50,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 20, height = 5.5, offset = 0.5, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={20,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cvalve.outlet, sink.inlet) annotation (
    Line(points={{8,0},{40,0}},         color = {140, 56, 54}));
  connect(m_flow_set.y, sink.in_m_flow) annotation (
    Line(points={{31,50},{44,50},{44,5}},                   color = {0, 0, 127}));
  connect(theta.y, cvalve.opening) annotation (
    Line(points={{-9,50},{0,50},{0,6.4}},         color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end ValveTestBase;
