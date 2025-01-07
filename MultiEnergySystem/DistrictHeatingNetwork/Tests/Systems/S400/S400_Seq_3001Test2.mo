within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Seq_3001Test2
  extends S400_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
  annotation (experiment(
      StopTime=3500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Seq_3001Test2;
