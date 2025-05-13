within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedTwoGenGBEB_FC
  extends CentralizedTwoGenGBEB(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400);
end CentralizedTwoGenGBEB_FC;
