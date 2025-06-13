within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedTwoGenGB_SC_EB_FC "Gas Boiler System with rotational speed and Electric Boiler System with ideal flow control"
  extends CentralizedTwoGenGBEB(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400);
end CentralizedTwoGenGB_SC_EB_FC;
