within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence1
  extends GBEBPumpingSystem(
    omega_P901(
      height=2*3.141592654*5,
      duration=5,
      offset=2*3.141592654*35,
      startTime=60),
    omega_P101(
      height=-2*3.141592654*5,
      duration=10,
      offset=2*3.141592654*50,
      startTime=120),
    omega_P401(
      height=-2*3.141592654*5,
      duration=10,
      offset=2*3.141592654*50,
      startTime=180),
    FCVC02_theta(height=0, offset=1),
    FCVC01_theta(height=1, offset=0),
    FCV901_theta(height=0, offset=1),
    VE901(p0=220000));
end Sequence1;
