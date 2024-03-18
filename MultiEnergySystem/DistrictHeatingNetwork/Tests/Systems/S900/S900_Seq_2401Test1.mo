within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_2401Test1
  extends S900_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test1/Temperatures.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=10000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_2401Test1;
