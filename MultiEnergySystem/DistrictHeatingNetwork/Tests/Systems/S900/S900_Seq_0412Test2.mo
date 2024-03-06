within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_0412Test2
  extends S900_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat"));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=2650,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_0412Test2;
