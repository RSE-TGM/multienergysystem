within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model CentralizedControlPlant_III
  extends DHTF.Control.Tests.PlantControlBaseIII;
equation
  controller.TT701SP = if time < 2e3 then 70 + 273.15 else 65 + 273.15;
  controller.TT711SP = if time < 2e3 then 70 + 273.15 else 65 + 273.15;
  controller.TT721SP = if time < 2e3 then 70 + 273.15 else 65 + 273.15;
  controller.TT731SP = if time < 2e3 then 70 + 273.15 else 65 + 273.15;
  controller.booldTT701 = true;
  controller.booldTT711 = true;
  controller.booldTT721 = true;
  controller.booldTT731 = true;
  controller.PtEX701SP = if time < 5e3 then 40e3 else 37.5e3;
  controller.PtEX711SP = 35e3;
  controller.PtEX721SP = if time < 5e3 then 35e3 else 30e3;
  controller.PtEX731SP = if time < 5e3 then 25e3 else 30e3;
  controller.booldPtEX701 = true;
  controller.booldPtEX711 = true;
  controller.booldPtEX721 = true;
  controller.booldPtEX731 = true;
end CentralizedControlPlant_III;
