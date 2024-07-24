within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Seq_1701Test1
  extends RR01_Test(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"));
  annotation (experiment(
      StopTime=2700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RR01_Seq_1701Test1;
