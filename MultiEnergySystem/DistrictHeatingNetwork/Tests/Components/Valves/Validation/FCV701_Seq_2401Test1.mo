within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;

model FCV701_Seq_2401Test1
  extends Valves.Validation.TestBase(
  MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test1/Temperatures.mat"), cvalve(openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear));
equation

annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 20));
end FCV701_Seq_2401Test1;
