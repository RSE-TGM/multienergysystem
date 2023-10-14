within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model PumpTestBase "Base test model for pumps' tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P101(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P101.a, b = Pump.P101.b, dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom) annotation(
    Placement(visible = true, transformation(origin = {2, 64}, extent = {{-18, -20}, {16, 14}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression theta(y = if time < 10 then 1 else 0.5) annotation(
    Placement(visible = true, transformation(origin = {-26, 46}, extent = {{-62, 24}, {-42, 44}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0 = 81 + 273.15, p0 = Pump.P101.pout_start, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {54, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(T0 = Pump.P7.Tout_start, p0 = Pump.P7.pout_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {52, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourcePressure(T0 = Pump.P7.Tin_start, p0 = Pump.P7.pin_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-46, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P7(Tin_start = Pump.P7.Tin_start, Tout_start = Pump.P7.Tout_start, a = Pump.P7.a, b = Pump.P7.b, dpnom = Pump.P7.dpnom, etaelec = Pump.P7.etaelec, etamech = Pump.P7.etamech, hin_start = Pump.P7.hin_start, m_flow_nom = Pump.P7.m_flow_nom, omeganom = Pump.P7.omeganom, pin_start = Pump.P7.pin_start, pout_start = Pump.P7.pout_start, rhonom(displayUnit = "kg/m3") = Pump.P7.rhonom) annotation(
    Placement(visible = true, transformation(origin = {0, -58}, extent = {{-18, -20}, {16, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P601(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P601.a, b = Pump.P601.b, dpnom = Pump.P601.dpnom, etaelec = Pump.P601.etaelec, etamech = Pump.P601.etamech, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P601.m_flow_nom, omeganom = Pump.P601.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, rhonom(displayUnit = "kg/m3") = Pump.P601.rhonom) annotation(
    Placement(visible = true, transformation(origin = {2, 2}, extent = {{-18, -20}, {16, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP601(T0 = Pump.P601.Tin_start, p0 = Pump.P601.pin_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP601(T0 = Pump.P601.Tout_start, p0 = Pump.P601.pout_start, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {54, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P101.outlet, sinkP.inlet) annotation(
    Line(points = {{10.52, 70.86}, {44.52, 70.86}}));
  connect(sourceP.outlet, P101.inlet) annotation(
    Line(points = {{-34, 62}, {-12, 62}, {-12, 64}}, color = {136, 136, 136}));
  connect(sourcePressure.outlet, P7.inlet) annotation(
    Line(points = {{-36, -60}, {-26, -60}, {-26, -58}, {-14, -58}}, color = {136, 136, 136}));
  connect(P7.outlet, sinkPressure.inlet) annotation(
    Line(points = {{8.52, -51.14}, {42.52, -51.14}}, color = {136, 136, 136}));
  connect(sourceP601.outlet, P601.inlet) annotation(
    Line(points = {{-34, 0}, {-24, 0}, {-24, 2}, {-12, 2}}, color = {136, 136, 136}));
  connect(P601.outlet, sinkP601.inlet) annotation(
    Line(points = {{10.52, 8.86}, {44.52, 8.86}}, color = {136, 136, 136}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 50, __Dymola_Algorithm = "Dassl"));
end PumpTestBase;
