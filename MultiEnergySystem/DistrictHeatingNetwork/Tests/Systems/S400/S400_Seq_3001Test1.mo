within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Seq_3001Test1
  extends S400_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test1/Temperatures.mat"));
  annotation (experiment(
      StopTime=1500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Seq_3001Test1;
