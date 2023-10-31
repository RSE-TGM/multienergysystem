within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model ValveTestBase "Base test model for valves' tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0=Valve.TCV701.Tin_start,
      p0=Valve.TCV701.pin_start)                                                                                              annotation (
    Placement(visible = true, transformation(origin={-42,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20, height = 0, offset = 1, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={-20,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale cvalve(
    Kv=Valve.TCV701.Kv,
    dp_nom=Valve.TCV701.dp_nom,
    rho_nom=Valve.TCV701.rho_nom,
    Tin_start=Valve.TCV701.Tin_start,
    pin_start=Valve.TCV701.pin_start)                                                                                     annotation (
    Placement(visible = true, transformation(                   extent={{-8,-8},
            {8,8}},                                                                          rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink(
    T0=Valve.TCV701.Tin_start,
    m_flow0=Valve.TCV701.m_flow_nom,
    p0(displayUnit="Pa") = Valve.TCV701.pin_start - Valve.TCV701.dp_nom,
    pin_start(displayUnit="Pa") = Valve.TCV701.pin_start - Valve.TCV701.dp_nom,                                                                                        use_in_m_flow = true)  annotation (
    Placement(visible = true, transformation(origin={46,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 20,
    height=1*Valve.TCV701.m_flow_nom,
    offset=0.5*Valve.TCV701.m_flow_nom,                                              startTime = 30) annotation (
    Placement(visible = true, transformation(origin={20,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(m_flow_set.y, sink.in_m_flow) annotation (
    Line(points={{31,50},{40,50},{40,5}},                   color = {0, 0, 127}));
  connect(theta.y, cvalve.opening) annotation (
    Line(points={{-9,50},{0,50},{0,6.4}},         color = {0, 0, 127}));
  connect(sourceP.outlet, cvalve.inlet) annotation (Line(
      points={{-32,0},{-8,0}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve.outlet, sink.inlet) annotation (Line(
      points={{8,0},{36,0}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end ValveTestBase;
