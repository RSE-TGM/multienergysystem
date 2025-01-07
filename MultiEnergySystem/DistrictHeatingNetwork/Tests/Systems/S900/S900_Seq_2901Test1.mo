within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_2901Test1
  extends S900_Test(
    T_sampling = 2,
    MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2901_Test1.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=6800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_2901Test1;
