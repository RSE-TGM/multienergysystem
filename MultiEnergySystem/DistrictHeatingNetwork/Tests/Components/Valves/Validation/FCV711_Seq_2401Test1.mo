within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV711_Seq_2401Test1
  extends Valves.Validation.FCV711_Seq_0412Test3(
  MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test1/Temperatures.mat"));
equation

annotation (
    experiment(
      StopTime=10000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV711_Seq_2401Test1;