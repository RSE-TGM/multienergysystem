within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseI_MFC
  extends TestBaseI(heatGen(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.CHPFC S500),
    actuator(omegaP101(table=[0,1.7; 1e3,1.7]),
    domegaP401(table=[0,1.34; 1e3,1.34]),
      domegaP501_var(y=1.17)),
    ramp(height=0, offset=2e5),
    sinkPressure(p0=2e5));
end TestBaseI_MFC;
