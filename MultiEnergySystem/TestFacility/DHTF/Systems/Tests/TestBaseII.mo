within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseII
  extends TestBaseI(
    redeclare HeatGeneration.CentralizedThreeGenGBEBCHPTES heatGen(
    S200(
        nTank=5,
        pin_start_pump=200000,
        Tin_start=338.15,
        Tout_start=338.15,
        FCV201(q_m3h_start=0.1),
        FV202(q_m3h_start=0.1))),
    redeclare Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHPTES actuator(
      domegaP401(table=[0,2*pi*40; 1e3,2*pi*40]),
      dthetaFCV201_var(y=0.2), S200status(y=2),
      domegaP201_var(y=2*pi*30)),
    ramp(offset=1.5E5),
    sinkMassFlow(m_flow0=4));
end TestBaseII;
