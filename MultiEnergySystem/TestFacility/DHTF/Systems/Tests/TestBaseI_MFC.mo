within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseI_MFC
  extends TestBaseI(heatGen(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.CHPFC S500),
    actuator(omegaP101(table=[0,1.2; 1e3,1.2]),
    domegaP401(table=[0,1; 1e3,1]),
      domegaP501_var(y=0.8)),
    ramp(height=0, offset=2e5),
    sinkPressure(p0=2e5));
end TestBaseI_MFC;
