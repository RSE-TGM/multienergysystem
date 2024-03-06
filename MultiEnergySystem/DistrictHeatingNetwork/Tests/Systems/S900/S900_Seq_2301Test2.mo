within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_2301Test2
  extends S900_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Temperatures.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=7800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_2301Test2;
