within MultiEnergySystem.H2GasFacility.Tests.Media;
model H2PR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
    redeclare model Medium = H2GasFacility.Media.RealGases.H2PR,
    T_ref = 15 + 273.15,
    p_ref = 0.5e5,
    X_ref = {1});
equation

  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end H2PR;
