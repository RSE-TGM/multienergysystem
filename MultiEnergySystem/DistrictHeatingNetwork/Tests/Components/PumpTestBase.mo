within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components;

model PumpTestBase "Base test model for pumps' tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P101(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P101.a, b = Pump.P101.b, dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, rhonom(displayUnit = "kg/m3") = 972, use_in_omega = true) annotation(
    Placement(visible = true, transformation(origin = {2, 60}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0 = 81 + 273.15, p0 (displayUnit = "Pa")= 3.85e5, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {62, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {-44, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(T0 = Pump.P7.Tout_start, p0 = Pump.P7.pout_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {54, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourcePressure(T0 = Pump.P7.Tin_start, p0 = Pump.P7.pin_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-46, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P7(Tin_start = Pump.P7.Tin_start, Tout_start = Pump.P7.Tout_start, a = Pump.P7.a, b = Pump.P7.b, dpnom = Pump.P7.dpnom, etaelec = Pump.P7.etaelec, etamech = Pump.P7.etamech, hin_start = Pump.P7.hin_start, m_flow_nom = Pump.P7.m_flow_nom, omeganom = Pump.P7.omeganom, pin_start = Pump.P7.pin_start, pout_start = Pump.P7.pout_start, rhonom(displayUnit = "kg/m3") = Pump.P7.rhonom) annotation(
    Placement(visible = true, transformation(origin = {0, -58}, extent = {{-18, -20}, {16, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P601(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P601.a, b = Pump.P601.b, dpnom = Pump.P601.dpnom, etaelec = Pump.P601.etaelec, etamech = Pump.P601.etamech, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P601.m_flow_nom, omeganom = Pump.P601.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, rhonom(displayUnit = "kg/m3") = Pump.P601.rhonom) annotation(
    Placement(visible = true, transformation(origin = {2, -2.22045e-16}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP601(T0 = Pump.P601.Tin_start, p0 = Pump.P601.pin_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP601(T0 = Pump.P601.Tout_start, p0 = Pump.P601.pout_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {52, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp omega(duration = 10, height = -Pump.P101.omeganom*0.2, offset = Pump.P101.omeganom*1.1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale FCV101(Kv = 33.25192916, dp_nom = 20000)  annotation(
    Placement(visible = true, transformation(origin = {32, 70}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta_FCV101(duration = 20, height = -0.5, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourcePressure.outlet, P7.inlet) annotation(
    Line(points = {{-36, -60}, {-26, -60}, {-26, -58}, {-14, -58}}, color = {136, 136, 136}));
  connect(P7.outlet, sinkPressure.inlet) annotation(
    Line(points = {{8.52, -51.14}, {25.52, -51.14}, {25.52, -50}, {44, -50}}, color = {136, 136, 136}));
  connect(sourceP601.outlet, P601.inlet) annotation(
    Line(points = {{-34, 0}, {-12, 0}}, color = {136, 136, 136}));
  connect(P601.outlet, sinkP601.inlet) annotation(
    Line(points = {{12, 10}, {42, 10}}, color = {136, 136, 136}));
  connect(omega.y, P101.in_omega) annotation(
    Line(points = {{-58, 90}, {-5, 90}, {-5, 69}}, color = {0, 0, 127}));
  connect(P101.inlet, sourceP.outlet) annotation(
    Line(points = {{-12, 60}, {-34, 60}}, color = {140, 56, 54}));
  connect(P101.outlet, FCV101.inlet) annotation(
    Line(points = {{12, 70}, {24, 70}}, color = {140, 56, 54}));
  connect(FCV101.outlet, sinkP.inlet) annotation(
    Line(points = {{40, 70}, {52, 70}}, color = {140, 56, 54}));
  connect(theta_FCV101.y, FCV101.opening) annotation(
    Line(points = {{22, 100}, {32, 100}, {32, 76}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 50, __Dymola_Algorithm = "Dassl"));
end PumpTestBase;
