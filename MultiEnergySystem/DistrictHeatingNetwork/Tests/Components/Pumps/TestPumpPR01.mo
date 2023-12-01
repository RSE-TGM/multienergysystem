within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpPR01
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set(height=8, offset=4.18),
    sourceP(
      p0 = Pump.PR01.pin_start,
      T0 = Pump.PR01.Tin_start,
      h0 = Pump.PR01.hin_start),
    cvalve(
      Kv = 72.29759327),
    omega(
      offset = Pump.PR01.omeganom),
    sink(
      T0 = Pump.PR01.Tout_start,
      p0 = Pump.PR01.pout_start,
      m_flow0 = Pump.PR01.m_flow_nom,
      pin_start = Pump.PR01.pout_start),
    pump(
      Tin_start = Pump.PR01.Tin_start,
      Tout_start = Pump.PR01.Tout_start,
      hin_start = Pump.PR01.hin_start,
      pin_start = Pump.PR01.pin_start,
      pout_start = Pump.PR01.pout_start,
      a = Pump.PR01.a,
      b = Pump.PR01.b,
      dpnom = Pump.PR01.dpnom,
      etaelec = Pump.PR01.etaelec,
      etamech = Pump.PR01.etamech,
      etanom = Pump.PR01.etanom,
      headmax=Pump.PR01.headnommax,
      headmin=Pump.PR01.headnommin,
      m_flow_nom = Pump.PR01.m_flow_nom,
      omeganom = Pump.PR01.omeganom,
      qnom_inm3h=Pump.PR01.qnom_inm3h,
      qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
      rhonom = Pump.PR01.rhonom,
      qnom_inm3h_max=Pump.PR01.qnommax_inm3h),
    pump_40Hz(
      Tin_start = Pump.PR01.Tin_start,
      Tout_start = Pump.PR01.Tout_start,
      hin_start = Pump.PR01.hin_start,
      pin_start = Pump.PR01.pin_start,
      pout_start = Pump.PR01.pout_start,
      a = Pump.PR01.a,
      b = Pump.PR01.b,
      dpnom = Pump.PR01.dpnom,
      etaelec = Pump.PR01.etaelec,
      etamech = Pump.PR01.etamech,
      etanom = Pump.PR01.etanom,
      headmax=Pump.PR01.headnommax,
      headmin=Pump.PR01.headnommin,
      m_flow_nom = Pump.PR01.m_flow_nom,
      omeganom = Pump.PR01.omeganom,
      qnom_inm3h=Pump.PR01.qnom_inm3h,
      qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
      rhonom = Pump.PR01.rhonom,
      qnom_inm3h_max=Pump.PR01.qnommax_inm3h),
     pump_30Hz(
      Tin_start = Pump.PR01.Tin_start,
      Tout_start = Pump.PR01.Tout_start,
      hin_start = Pump.PR01.hin_start,
      pin_start = Pump.PR01.pin_start,
      pout_start = Pump.PR01.pout_start,
      a = Pump.PR01.a,
      b = Pump.PR01.b,
      dpnom = Pump.PR01.dpnom,
      etaelec = Pump.PR01.etaelec,
      etamech = Pump.PR01.etamech,
      etanom = Pump.PR01.etanom,
      headmax=Pump.PR01.headnommax,
      headmin=Pump.PR01.headnommin,
      m_flow_nom = Pump.PR01.m_flow_nom,
      omeganom = Pump.PR01.omeganom,
      qnom_inm3h=Pump.PR01.qnom_inm3h,
      qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
      rhonom = Pump.PR01.rhonom,
      qnom_inm3h_max=Pump.PR01.qnommax_inm3h),
    omega_40Hz(offset=Pump.PR01.omeganom*4/5),
    m_flow_set_40Hz(height=9, offset=2),
    m_flow_set_30Hz(height=5, offset=2),
    omega_30Hz(offset=Pump.PR01.omeganom*3/5));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump pump1(
    Tin_start=Pump.PR01.Tin_start,
    Tout_start=Pump.PR01.Tout_start,
    hin_start=Pump.PR01.hin_start,
    pin_start=Pump.PR01.pin_start,
    pout_start=Pump.PR01.pout_start,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    dpnom=Pump.PR01.dpnom,
    etaelec=Pump.PR01.etaelec,
    etamech=Pump.PR01.etamech,
    etanom=Pump.PR01.etanom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    m_flow_nom=Pump.PR01.m_flow_nom,
    omeganom=Pump.PR01.omeganom,
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    use_in_omega=true)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={0,-132}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Sources.SinkPressure sinkPressure(p0=360000, T0=288.15)
    annotation (Placement(transformation(extent={{52,-142},{72,-122}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=120000,
    T0=288.15,
    m_flow0=8.88)
    annotation (Placement(transformation(extent={{-80,-142},{-60,-122}})));
  Modelica.Blocks.Sources.Ramp omega1(
    offset=Pump.PR01.omeganom,
    duration=10,
    height=0,
    startTime=10)                                                                                            annotation (
    Placement(visible = true, transformation(origin={-30,-110},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  connect(sourceMassFlow.outlet, pump1.inlet) annotation (Line(
      points={{-60,-132},{-14.4,-132}},
      color={140,56,54},
      thickness=0.5));
  connect(pump1.outlet, sinkPressure.inlet) annotation (Line(
      points={{14.4,-132},{52,-132}},
      color={140,56,54},
      thickness=0.5));
  connect(omega1.y, pump1.in_omega) annotation (Line(points={{-19,-110},{-7.2,
          -110},{-7.2,-123}}, color={0,0,127}));
annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16), Diagram(
        coordinateSystem(extent={{-100,-160},{100,160}})));
end TestPumpPR01;
