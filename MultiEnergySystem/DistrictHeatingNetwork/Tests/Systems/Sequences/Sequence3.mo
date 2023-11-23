within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence3
  extends Sequence1(
    omega_P401(height=0),
    omega_P101(height=0),
    omega_P901(height=0.),
    FCV901_theta(
      height=0,
      duration=5,
      startTime=60),
    FCV101_theta(
      height=0,
      duration=5,
      offset=1,
      startTime=120),
    FCV401_theta(
      height=0,
      duration=5.,
      offset=1,
      startTime=180),
    FCVC01_theta(
      height=1,
      duration=5,
      offset=0,
      startTime=60),
    FCVC02_theta(
      height=-1,
      duration=5,
      offset=1,
      startTime=120));
end Sequence3;
