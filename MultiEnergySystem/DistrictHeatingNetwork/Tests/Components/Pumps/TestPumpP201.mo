within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpP201
  "Testing PumpP201 of test facility using nominal information"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set(height=8, offset=1),
    sourceP(
      p0 = Pump.P201.pin_start,
      T0 = Pump.P201.Tin_start,
      h0 = Pump.P201.hin_start),
    cvalve(
    Kv =        72.29759327),
    omega(
    offset =       Pump.P201.omeganom),
    sink(
    T0 =      Pump.P201.Tout_start,
    p0 =      Pump.P201.pout_start,
    m_flow0 =      Pump.P201.m_flow_nom,
    pin_start =      Pump.P201.pout_start),
    pump(
    Tin_start =      Pump.P201.Tin_start,
    Tout_start =      Pump.P201.Tout_start,
    hin_start =      Pump.P201.hin_start,
    pin_start =      Pump.P201.pin_start,
    pout_start =      Pump.P201.pout_start,
    a =      Pump.P201.a, b =      Pump.P201.b,
    dpnom =      Pump.P201.dpnom,
    etaelec =      Pump.P201.etaelec,
    etamech =      Pump.P201.etamech,
    etanom =      Pump.P201.etanom,
      headmax=Pump.P201.headnommax,
      headmin=Pump.P201.headnommin,
    m_flow_nom =      Pump.P201.m_flow_nom,
    omeganom =      Pump.P201.omeganom,
      qnom_inm3h=Pump.P201.qnom_inm3h,
      qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    rhonom =      Pump.P201.rhonom,
      qnom_inm3h_max=Pump.P201.qnommax_inm3h));
equation

annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpP201;