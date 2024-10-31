within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpP101
  extends MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set_50Hz(height=14.9*1000/3600, offset=5.5*1000/3600),
    sink_50Hz(
      T0=Pump.P101.Tout_start,
      p0=Pump.P101.pout_start,
      m_flow0=Pump.P101.m_flow_nom,
      pin_start=Pump.P101.pout_start),
    pump_50Hz(
      Tin_start=Pump.P101.Tin_start,
      Tout_start=Pump.P101.Tout_start,
      hin_start=Pump.P101.hin_start,
      pin_start=Pump.P101.pin_start,
      pout_start=Pump.P101.pout_start,
      a=Pump.P101.a,
      b=Pump.P101.b,
      dpnom=Pump.P101.dpnom,
      etaelec=Pump.P101.etaelec,
      etamech=Pump.P101.etamech,
      etanom=Pump.P101.etanom,
      headnom=Pump.P101.headnom,
      headmax=Pump.P101.headnommax,
      headmin=Pump.P101.headnommin,
      m_flow_nom=Pump.P101.m_flow_nom,
      omeganom=Pump.P101.omeganom,
      qnom_inm3h=Pump.P101.qnom_inm3h,
      qnom_inm3h_min=Pump.P101.qnommin_inm3h,
      rhonom=Pump.P101.rhonom,
      qnom_inm3h_max=Pump.P101.qnommax_inm3h),
    sourceP(
      p0=Pump.P101.pin_start,
      T0=Pump.P101.Tin_start,
      h0=Pump.P101.hin_start),
    cvalve(Kv=72.29759327),
    omega(offset=Pump.P101.omeganom),
    pump_40Hz(
      Tin_start=Pump.P101.Tin_start,
      Tout_start=Pump.P101.Tout_start,
      hin_start=Pump.P101.hin_start,
      pin_start=Pump.P101.pin_start,
      pout_start=Pump.P101.pout_start,
      a=Pump.P101.a,
      b=Pump.P101.b,
      dpnom=Pump.P101.dpnom,
      etaelec=Pump.P101.etaelec,
      etamech=Pump.P101.etamech,
      etanom=Pump.P101.etanom,
      headnom=Pump.P101.headnom,
      headmax=Pump.P101.headnommax,
      headmin=Pump.P101.headnommin,
      m_flow_nom=Pump.P101.m_flow_nom,
      omeganom=Pump.P101.omeganom,
      qnom_inm3h=Pump.P101.qnom_inm3h,
      qnom_inm3h_min=Pump.P101.qnommin_inm3h,
      rhonom=Pump.P101.rhonom,
      qnom_inm3h_max=Pump.P101.qnommax_inm3h),
    pump_30Hz(
      Tin_start=Pump.P101.Tin_start,
      Tout_start=Pump.P101.Tout_start,
      hin_start=Pump.P101.hin_start,
      pin_start=Pump.P101.pin_start,
      pout_start=Pump.P101.pout_start,
      a=Pump.P101.a,
      b=Pump.P101.b,
      dpnom=Pump.P101.dpnom,
      etaelec=Pump.P101.etaelec,
      etamech=Pump.P101.etamech,
      etanom=Pump.P101.etanom,
      headnom=Pump.P101.headnom,
      headmax=Pump.P101.headnommax,
      headmin=Pump.P101.headnommin,
      m_flow_nom=Pump.P101.m_flow_nom,
      omeganom=Pump.P101.omeganom,
      qnom_inm3h=Pump.P101.qnom_inm3h,
      qnom_inm3h_min=Pump.P101.qnommin_inm3h,
      rhonom=Pump.P101.rhonom,
      qnom_inm3h_max=Pump.P101.qnommax_inm3h),
    m_flow_set_40Hz(height=12.2*1000/3600, offset=4.5*1000/3600),
    m_flow_set_30Hz(height=9.3*1000/3600, offset=3.2*1000/3600),
    omega_30Hz(offset=Pump.P101.omeganom*3/5),
    omega_40Hz(offset=Pump.P101.omeganom*4/5));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
equation

  connect(sourceVoltage.outlet, pump_50Hz.inletPower) annotation (Line(
      points={{-70,80},{-22,80},{-22,62.6}},
      color={56,93,138},
      thickness=1));
  connect(pump_40Hz.inletPower, sourceVoltage.outlet) annotation (Line(
      points={{-22,2.6},{-22,30},{-70,30},{-70,80}},
      color={56,93,138},
      thickness=1));
  connect(pump_30Hz.inletPower, sourceVoltage.outlet) annotation (Line(
      points={{-22,-57.4},{-22,-34},{-70,-34},{-70,80}},
      color={56,93,138},
      thickness=1));
annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpP101;
