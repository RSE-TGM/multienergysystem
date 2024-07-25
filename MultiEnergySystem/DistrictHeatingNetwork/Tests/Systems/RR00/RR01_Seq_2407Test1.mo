within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Seq_2407Test1
  extends RR01_Test(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2407_Test1.mat"));
  annotation (experiment(
      StopTime=6800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RR01_Seq_2407Test1;
