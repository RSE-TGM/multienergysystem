within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseIII_MFC
  extends TestBaseI(
  redeclare HeatGeneration.CentralizedThreeGenGBEBCHPTES_FC heatGen(
    S200(
        Tin_start=65 + 273.15,
        Tout_start=65 + 273.15,
        FCV201(dp_nom=0.5e5)),
      pout_start_S100=220000,
      pout_start_S400=220000,
      PL_S200_rCD_cold(set_m_flow_start=true, m_flow_start=2,
        pin_start=2e5,
        q_m3h_start=7),
      PL_S200_rCD_hot(set_m_flow_start=true, m_flow_start=2,
        pin_start=2.1e5,
        q_m3h_start=7)),
    ramp(height=0, offset=2.2e5),
    redeclare Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHPTES actuator(
      domegaP201_var(y=2),
      dthetaFCV201_var(y=1),
      omegaP101(table=[0,1.4; 1e3,1.4]),
      domegaP401(table=[0,1; 1e3,1]),
      domegaP501_var(y=1.0),
      S200status(y=if time < 1e3 then 2 else 1)));
  annotation (experiment(
      StopTime=20000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestBaseIII_MFC;
