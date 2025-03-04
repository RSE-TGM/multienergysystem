within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Seq_2601Test1
  extends S400_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"));
  annotation (experiment(
      StopTime=1940,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Seq_2601Test1;
