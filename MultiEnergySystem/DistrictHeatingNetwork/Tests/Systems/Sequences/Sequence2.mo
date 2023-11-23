within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence2
  extends Sequence1(
    omega_P401(height=0),
    omega_P101(height=0),
    omega_P901(height=0.),
    FCV901_theta(
      height=-0.2,
      duration=5,
      startTime=60),
    FCV101_theta(
      height=-0.2,
      duration=5,
      offset=1,
      startTime=120),
    FCV401_theta(
      height=-0.2,
      duration=5.,
      offset=1,
      startTime=180));
end Sequence2;
