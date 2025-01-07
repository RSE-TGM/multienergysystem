within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_0412Test2
  extends S900_Test(
    T_sampling = 1,
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=2650,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_0412Test2;
