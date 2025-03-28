within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestActuator_IdealWater
  extends DHTF.Control.Tests.TestActuator(centralisedSystemI_B_InitForward(redeclare model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidIdeal, redeclare model WaterCold = DistrictHeatingNetwork.Media.WaterLiquidIdeal));
  annotation (
    experiment(StopTime = 6000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end TestActuator_IdealWater;
