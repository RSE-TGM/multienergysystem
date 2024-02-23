within MultiEnergySystem.H2GasFacility.Tests.Media;
model CH4PR
  extends SinglePTXFluidTest(
    redeclare model Medium = H2GasFacility.Media.RealGases.CH4PR,
    T_ref = 15 + 273.15,
    p_ref = 1.3e5,
    Y = {1});

equation

  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end CH4PR;
