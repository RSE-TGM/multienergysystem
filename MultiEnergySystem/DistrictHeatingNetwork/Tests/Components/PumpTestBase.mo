within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components;

model PumpTestBase "Base test model for pumps' tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump pump(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P101.a, b = Pump.P101.b, dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, etanom = Pump.P101.etanom, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, qnom_inm3h = 15.60340167, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom, use_in_omega = true) annotation(
    Placement(visible = true, transformation(origin = {-4, 20}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp omega(duration = 10, height = 0, offset = Pump.P101.omeganom, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale cvalve(Kv = 33.25192916, dp_nom = 20000) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink(T0 = 85 + 273.15, m_flow0 = 4, p0(displayUnit = "Pa") = 4e5, pin_start(displayUnit = "Pa") = 4e5, use_in_m_flow = true)  annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 20, height = 5.5, offset = 0.5, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pump.inlet, sourceP.outlet) annotation(
    Line(points = {{-18, 20}, {-40, 20}}, color = {140, 56, 54}));
  connect(omega.y, pump.in_omega) annotation(
    Line(points = {{-39, 70}, {-11, 70}, {-11, 29}}, color = {0, 0, 127}));
  connect(theta.y, cvalve.opening) annotation(
    Line(points = {{22, 70}, {30, 70}, {30, 36}}, color = {0, 0, 127}));
  connect(pump.outlet, cvalve.inlet) annotation(
    Line(points = {{6, 30}, {22, 30}}, color = {140, 56, 54}));
  connect(cvalve.outlet, sink.inlet) annotation(
    Line(points = {{38, 30}, {70, 30}}, color = {140, 56, 54}));
  connect(m_flow_set.y, sink.in_m_flow) annotation(
    Line(points = {{62, 70}, {74, 70}, {74, 36}}, color = {0, 0, 127}));
protected
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end PumpTestBase;
