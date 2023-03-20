within MultiEnergySystem.DistrictHeatingNetwork.Tests.Media;

model ModelicaVSPartialSubstance
  extends Modelica.Icons.Example;
  extends H2GasFacility.Tests.Media.IdealVSReal(
    redeclare package MediumIdeal = DistrictHeatingNetwork.Media.StandardWater,
    redeclare model MediumReal = DistrictHeatingNetwork.Media.WaterLiquid,
    T_min = 10 + 273.15,
    T_max = 90 + 273.15
  );annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
  
end ModelicaVSPartialSubstance;
