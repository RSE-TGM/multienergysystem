within MultiEnergySystem.H2GasFacility.Tests.Media;
model NaturalGasPR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
    redeclare model MediumIdeal = H2GasFacility.Media.IdealGases.H2,
    redeclare model MediumReal = H2GasFacility.Media.RealGases.NaturalGasPR,
    T_min = 25 + 273.15,
    T_max = 500 + 273.15,
    p = 1E5,
    X = X_start);

    //X = {0.97201, 0.01862, 0.00393, 0.00001, 0.00543}

  parameter Types.MoleFraction Y[:] = {0.97201, 0.01862, 0.00393, 0.00001, 0.00543};
  //parameter Types.MoleFraction Y[:] = {0.9, 0.06, 0.015, 0.005, 0.02};
  parameter Types.Mass M[:] = Y.*realGas.MM;
  parameter Types.Mass Mt = sum(M);
  parameter Types.MassFraction X_start[:] = M/Mt;

equation

end NaturalGasPR;
