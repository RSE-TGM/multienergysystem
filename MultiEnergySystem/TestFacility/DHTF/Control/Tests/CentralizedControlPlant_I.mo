within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model CentralizedControlPlant_I
  extends DHTF.Control.Tests.PlantControlBase;
equation
  controller.TT701SP = 70 + 273.15;
  controller.TT711SP = 70 + 273.15;
  controller.TT721SP = 70 + 273.15;
  controller.TT731SP = 70 + 273.15;
  controller.booldTT701 = true;
  controller.booldTT711 = true;
  controller.booldTT721 = true;
  controller.booldTT731 = true;
  controller.PtEX701SP = if time < 5e3 then 40e3 else 37.5e3;
  controller.PtEX711SP = 35e3;
  controller.PtEX721SP = 35e3;
  controller.PtEX731SP = 25e3;
  controller.booldPtEX701 = true;
  controller.booldPtEX711 = true;
  controller.booldPtEX721 = true;
  controller.booldPtEX731 = true;
  annotation (
    experiment(StopTime = 10000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end CentralizedControlPlant_I;
