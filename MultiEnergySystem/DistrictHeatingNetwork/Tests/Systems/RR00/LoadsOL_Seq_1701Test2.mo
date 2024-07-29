within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model LoadsOL_Seq_1701Test2
  extends LoadColdSideOpenLoop(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test2.mat"));
  annotation (experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end LoadsOL_Seq_1701Test2;
