within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpP901
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set(height=7, offset=2),
    sourceP(
      p0 = Pump.P901.pin_start,
      T0 = Pump.P901.Tin_start,
      h0 = Pump.P901.hin_start),
    cvalve(
      Kv = 72.29759327),
    omega(
      offset = Pump.P901.omeganom),
    sink(
      T0 = Pump.P901.Tout_start,
      p0 = Pump.P901.pout_start,
      m_flow0 = Pump.P901.m_flow_nom,
      pin_start = Pump.P901.pout_start),
    pump(
      Tin_start = Pump.P901.Tin_start,
      Tout_start = Pump.P901.Tout_start,
      hin_start = Pump.P901.hin_start,
      pin_start = Pump.P901.pin_start,
      pout_start = Pump.P901.pout_start,
      a = Pump.P901.a,
      b = Pump.P901.b,
      dpnom = Pump.P901.dpnom,
      etaelec = Pump.P901.etaelec,
      etamech = Pump.P901.etamech,
      etanom = Pump.P901.etanom,
      headmax=Pump.P901.headnommax,
      headmin=Pump.P901.headnommin,
      m_flow_nom = Pump.P901.m_flow_nom,
      omeganom = Pump.P901.omeganom,
      qnom_inm3h=Pump.P901.qnom_inm3h,
      qnom_inm3h_min=Pump.P901.qnommin_inm3h,
      rhonom = Pump.P901.rhonom));
equation

annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpP901;
