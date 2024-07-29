within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model LoadsOL_Seq_1701Test1
  extends LoadColdSideOpenLoop;
  annotation (experiment(
      StopTime=2700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end LoadsOL_Seq_1701Test1;
