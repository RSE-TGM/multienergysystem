within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedTwoGenGBEB_PC_freeGB
  extends CentralizedTwoGenGBEB(
  redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerNoPUMP S100,
  redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400);
equation

end CentralizedTwoGenGBEB_PC_freeGB;
