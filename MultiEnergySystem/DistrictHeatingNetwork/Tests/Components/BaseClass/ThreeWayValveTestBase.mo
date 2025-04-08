within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model ThreeWayValveTestBase "Base test model for three-way valve tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0=Valve.TCV701.Tin_start,
      p0=Valve.TCV701.pin_start)                                                                                              annotation (
    Placement(visible = true, transformation(origin={-42,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20,
    height=-0.9,                                                offset = 1, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={-20,50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink(
    T0=Valve.TCV701.Tin_start,
    m_flow0=Valve.TCV701.m_flow_nom,
    p0(displayUnit="Pa") = Valve.TCV701.pin_start - Valve.TCV701.dp_nom,
    pin_start(displayUnit="Pa") = Valve.TCV701.pin_start - Valve.TCV701.dp_nom,                                                                                        use_in_m_flow = true)  annotation (
    Placement(visible = true, transformation(origin={46,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 20,
    height=1*Valve.TCV701.m_flow_nom,
    offset=0.5*Valve.TCV701.m_flow_nom, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={20,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ThreeWayValve threeWayValve(Kv=Valve.TCV701.Kv) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Sources.SourcePressure                                          sourceP1(
    use_in_p0=true,
    T0=Valve.TCV701.Tin_start,
    p0=Valve.TCV701.pin_start,
    R=0)                                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-14,-60},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkMassFlow                                          sink1(
    T0=Valve.TCV701.Tin_start,
    m_flow0=Valve.TCV701.m_flow_nom,
    p0(displayUnit="Pa") = Valve.TCV701.pin_start - Valve.TCV701.dp_nom,
    pin_start(displayUnit="Pa") = Valve.TCV701.pin_start - Valve.TCV701.dp_nom,
    use_in_m_flow=true,
    G=1e-8)                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={24,-40},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set1(
    duration=20,
    height=-1*Valve.TCV701.m_flow_nom,
    offset=0.2*Valve.TCV701.m_flow_nom,
    startTime=30)                                       annotation (
    Placement(visible = true, transformation(origin={58,-24},   extent={{10,-10},{-10,10}},      rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set2(
    duration=20,
    height=Valve.TCV701.pin_start*0.25,
    offset=Valve.TCV701.pin_start,
    startTime=30)                                       annotation (
    Placement(visible = true, transformation(origin={-40,-40},  extent={{-10,-10},{10,10}},      rotation = 0)));
equation
  connect(m_flow_set.y, sink.in_m_flow) annotation (
    Line(points={{31,50},{40,50},{40,5}},                   color = {0, 0, 127}));
  connect(sourceP.outlet, threeWayValve.inlet) annotation (Line(
      points={{-32,0},{-10,0}},
      color={140,56,54},
      thickness=0.5));
  connect(threeWayValve.outlet, sink.inlet) annotation (Line(
      points={{10,0},{36,0}},
      color={140,56,54},
      thickness=0.5));
  connect(theta.y, threeWayValve.opening) annotation (Line(points={{-9,50},{0,50},{0,8}}, color={0,0,127}));
  connect(m_flow_set1.y, sink1.in_m_flow) annotation (Line(points={{47,-24},{18,-24},{18,-35}}, color={0,0,127}));
  connect(sourceP1.outlet, threeWayValve.outlet2) annotation (Line(
      points={{-4,-60},{-2,-60},{-2,-58},{0,-58},{0,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_set2.y, sourceP1.in_p0) annotation (Line(points={{-29,-40},{-18,-40},{-18,-51.6}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end ThreeWayValveTestBase;
