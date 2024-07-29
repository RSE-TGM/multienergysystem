within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model LoadsOL_Seq_2301Test2
  extends LoadColdSideOpenLoop(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2301_Test2.mat"));
  annotation (experiment(
      StopTime=7000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end LoadsOL_Seq_2301Test2;
