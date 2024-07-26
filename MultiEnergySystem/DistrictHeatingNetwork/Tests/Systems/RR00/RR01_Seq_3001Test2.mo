within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Seq_3001Test2
  extends RR01_Test(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
  annotation (experiment(
      StopTime=4200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RR01_Seq_3001Test2;
