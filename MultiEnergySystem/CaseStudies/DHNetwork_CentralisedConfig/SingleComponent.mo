within MultiEnergySystem.CaseStudies.DHNetwork_CentralisedConfig;
model SingleComponent "Validation test for heat exchanger EX701"
  extends TestFacility.DHTF.Subsystems.Validation.S700.E700Test(
    E7X1(alpha_hot=0.67402256, alpha_cold=0.67402256),
    CorrectFactorHot=1,
    CorrectFactorCold=1,
    deltaThotmax=26,
    deltaTcoldmax=22.5);
//         coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
  annotation (experiment(
      StopTime=7200,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end SingleComponent;
