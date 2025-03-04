within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_0412Test3
  extends S900_Test(
    T_sampling=1000,
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
  annotation (experiment(
      StopTime=7200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_0412Test3;
