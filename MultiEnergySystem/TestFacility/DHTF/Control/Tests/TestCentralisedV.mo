within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedV
  extends TestCentralisedIV(plant(
    heatGeneration(redeclare model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidIdeal),
    distribution(redeclare model MediumCP = DistrictHeatingNetwork.Media.WaterLiquidIdeal),
    load(redeclare model MediumHot = DistrictHeatingNetwork.Media.WaterLiquidIdeal,
        redeclare model MediumCold = DistrictHeatingNetwork.Media.WaterLiquidIdeal)));
  annotation (experiment(
      StopTime=86400,
      Interval=17.28,
      __Dymola_Algorithm="Dassl"));
end TestCentralisedV;
