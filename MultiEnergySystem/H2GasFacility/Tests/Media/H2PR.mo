within MultiEnergySystem.H2GasFacility.Tests.Media;
model H2PR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
    redeclare model MediumIdeal = H2GasFacility.Media.IdealGases.H2,
    redeclare model MediumReal = H2GasFacility.Media.RealGases.H2PR,
    T_min = 20 + 273.15,
    T_max = 500 + 273.15,
    p = 1e5,
    X = realGas.X_start);

equation

end H2PR;
