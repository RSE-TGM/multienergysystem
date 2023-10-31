within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpP101
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set(height=5, offset=1),
    sourceP(
      p0 = Pump.P101.pin_start,
      T0 = Pump.P101.Tin_start,
      h0 = Pump.P101.hin_start),
    cvalve(
      Kv = 72.29759327),
    omega(
      offset = Pump.P101.omeganom),
    sink(
      T0 = Pump.P101.Tout_start,
      p0 = Pump.P101.pout_start,
      m_flow0 = Pump.P101.m_flow_nom,
      pin_start = Pump.P101.pout_start),
    pump(
      Tin_start = Pump.P101.Tin_start,
      Tout_start = Pump.P101.Tout_start,
      hin_start = Pump.P101.hin_start,
      pin_start = Pump.P101.pin_start,
      pout_start = Pump.P101.pout_start,
      a = Pump.P101.a,
      b = Pump.P101.b,
      dpnom = Pump.P101.dpnom,
      etaelec = Pump.P101.etaelec,
      etamech = Pump.P101.etamech,
      etanom = Pump.P101.etanom,
      headmax=Pump.P101.headnommax,
      headmin=Pump.P101.headnommin,
      m_flow_nom = Pump.P101.m_flow_nom,
      omeganom = Pump.P101.omeganom,
      qnom_inm3h=Pump.P101.qnom_inm3h,
      qnom_inm3h_min=Pump.P101.qnommin_inm3h,
      rhonom = Pump.P101.rhonom));
equation

annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpP101;
