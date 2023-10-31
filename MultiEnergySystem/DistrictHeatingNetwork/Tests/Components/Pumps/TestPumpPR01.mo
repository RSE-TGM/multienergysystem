within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpPR01
  extends MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set(
      height = 12,
      offset = 2),
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
      rhonom = Pump.PR01.rhonom));
equation

annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpPR01;
