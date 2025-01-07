within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_3101Test1
  extends S900_Test(
    T_sampling = 2,
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3101_Test1.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=750,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_3101Test1;
