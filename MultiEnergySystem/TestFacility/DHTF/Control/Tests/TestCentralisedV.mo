within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedV
  //extends TestCentralisedIV(plant(heatGeneration(redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100)), openLoopActuatorBase_III(bool_omegaP101(y=false), omegaP101(table=[0,2; 1e6,2])));

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
