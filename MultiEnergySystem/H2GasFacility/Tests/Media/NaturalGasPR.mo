within MultiEnergySystem.H2GasFacility.Tests.Media;
model NaturalGasPR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
    redeclare model MediumIdeal = H2GasFacility.Media.IdealGases.H2,
    redeclare model MediumReal = H2GasFacility.Media.RealGases.NaturalGasPR,
    T_min = 15 + 273.15,
    T_max = 25 + 273.15,
    p = 101325,
    X = X_start);

    //X = {0.97201, 0.01862, 0.00393, 0.00001, 0.00543}

  //parameter Types.MoleFraction Y[:] = {0.9, 0.06, 0.015, 0.005, 0.02};
  parameter Types.MoleFraction Y[:] = {0.97201, 0.01862, 0.00393, 0.00000, 0.00544} "paper 2. Firenze";
  //parameter Types.MoleFraction Y[:] = {0.9651, 0.0166, 0.0062, 0.0032, 0.0089} "paper 3. Polimi";
  //parameter Types.MoleFraction Y[:] = {0.85306, 0.06486, 0.02058, 0.01268, 0.03882} "paper 4. xxx";
  //parameter Types.MoleFraction Y[:] = {0.86486, 0.08788, 0.01179, 0.01323, 0.01894} "paper 5. xxx";
  
  parameter Types.Mass M[:] = Y.*realGas.MM;
  parameter Types.Mass Mt = sum(M);
  parameter Types.MassFraction X_start[:] = M/Mt;

equation

end NaturalGasPR;
