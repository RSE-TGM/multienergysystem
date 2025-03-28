within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model CentralizedControlPlant_IV
  extends DHTF.Control.Tests.PlantControlBaseIV;
equation
  controller.TT701SP = if time < 6e3 then 67 + 273.15 else 70 + 273.15;
  controller.TT711SP = if time < 6e3 then 67 + 273.15 else 70 + 273.15;
  controller.TT721SP = if time < 6e3 then 67 + 273.15 else 70 + 273.15;
  controller.TT731SP = if time < 6e3 then 67 + 273.15 else if time < 10.4e3 then 60 + 273.15 else 65 + 273.15;
  controller.booldTT701 = true;
  controller.booldTT711 = true;
  controller.booldTT721 = true;
  controller.booldTT731 = true;
  // 1650s
  controller.PtEX701SP = 30e3;
  controller.PtEX711SP = 30e3;
  controller.PtEX721SP = 30e3;
  controller.PtEX731SP = if time < 14e3 then 30e3 else if time < 17e3 then 28e3 else if time < 17e3 + 1650 then 25e3 else 20e3;
  controller.booldPtEX701 = true;
  controller.booldPtEX711 = true;
  controller.booldPtEX721 = true;
  controller.booldPtEX731 = true;
  controller.FT901SP = 3;
  controller.FT101SP = 1.3;
  controller.FT401SP = 0.4;
  controller.FT501SP = 0.25;
  annotation (
    experiment(StartTime = 0, StopTime = 20000, Tolerance = 1e-06, Interval = 2));
end CentralizedControlPlant_IV;
