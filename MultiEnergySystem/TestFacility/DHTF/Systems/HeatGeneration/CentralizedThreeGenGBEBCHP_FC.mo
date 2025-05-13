within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedThreeGenGBEBCHP_FC
  extends CentralizedThreeGenGBEBCHP(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.CHPFC S500);
end CentralizedThreeGenGBEBCHP_FC;
