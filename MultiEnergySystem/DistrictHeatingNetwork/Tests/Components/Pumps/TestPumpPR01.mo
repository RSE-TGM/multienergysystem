within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;

model TestPumpPR01
  extends MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.PumpTestBase(m_flow_set.height = 12, m_flow_set.offset = 2, sourceP.p0 = Pump.PR01.pin_start, sourceP.T0 = Pump.PR01.Tin_start, sourceP.h0 = Pump.PR01.hin_start, cvalve.Kv = 72.29759327, omega.offset = Pump.PR01.omeganom, sink.T0 = Pump.PR01.Tout_start, sink.p0 = Pump.PR01.pout_start, sink.m_flow0 = Pump.PR01.m_flow_nom, sink.pin_start = Pump.PR01.pout_start, pump.Tin_start = Pump.PR01.Tin_start, pump.Tout_start = Pump.PR01.Tout_start, pump.hin_start = Pump.PR01.hin_start, pump.pin_start = Pump.PR01.pin_start, pump.pout_start = Pump.PR01.pout_start, pump.a = Pump.PR01.a, pump.b = Pump.PR01.b, pump.dpnom = Pump.PR01.dpnom, pump.etaelec = Pump.PR01.etaelec, pump.etamech = Pump.PR01.etamech, pump.etanom = Pump.PR01.etanom, pump.headmax = 35, pump.headmin = 15, pump.m_flow_nom = Pump.PR01.m_flow_nom, pump.omeganom = Pump.PR01.omeganom, pump.qnom_inm3h = 32.34652403, pump.qnom_inm3h_min = 15, pump.rhonom = Pump.PR01.rhonom);
equation

annotation(
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpPR01;
