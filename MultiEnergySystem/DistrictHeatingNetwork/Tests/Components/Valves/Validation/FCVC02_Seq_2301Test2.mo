within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCVC02_Seq_2301Test2
  extends FCVC02_Seq_0412Test3(
  MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Temperatures.mat"));
equation

annotation (
    experiment(
      StopTime=9200,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCVC02_Seq_2301Test2;
