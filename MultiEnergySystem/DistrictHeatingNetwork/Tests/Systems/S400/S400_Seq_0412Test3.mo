within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Seq_0412Test3
  extends S400_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
  annotation (experiment(
      StopTime=7200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Seq_0412Test3;
