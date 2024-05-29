within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_C_MSL_H2
  "Same as TestSinglePipe_C_MSL but with a different fluid: SimpleNaturalGas + H2"
  extends TestSinglePipe_C_MSL(
  redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
  nX = 7,
  X_start = {0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1},
    pipe(X_start=X_start),
    boundary(X=X_start),
    boundary1(X=X_start));


end TestSinglePipe_C_MSL_H2;
