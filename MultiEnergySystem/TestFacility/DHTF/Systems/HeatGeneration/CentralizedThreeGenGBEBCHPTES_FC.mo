within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedThreeGenGBEBCHPTES_FC
  extends CentralizedThreeGenGBEBCHPTES(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.CHPFC S500,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.TESFC S200);
end CentralizedThreeGenGBEBCHPTES_FC;
