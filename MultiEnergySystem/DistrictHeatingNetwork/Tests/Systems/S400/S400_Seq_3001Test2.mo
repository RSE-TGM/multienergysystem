within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Seq_3001Test2
  extends S400_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Temperatures.mat"));
  annotation (experiment(
      StopTime=3500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Seq_3001Test2;
