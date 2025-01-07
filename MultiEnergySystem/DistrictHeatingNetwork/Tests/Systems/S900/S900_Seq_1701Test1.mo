within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_1701Test1
  extends S900_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=2700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_1701Test1;
