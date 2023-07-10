within MultiEnergySystem.H2GasFacility.Tests.Media;
model NaturalGasPR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
    redeclare model Medium = H2GasFacility.Media.RealGases.NaturalGasPR,
    T_ref = 15 + 273.15,
    p_ref = 101325,
    Y = {0.97201, 0.01862, 0.00393, 0.00000,0.00000,0.00000,0.00000, 0.00000, 0.00544});

    //X = {0.97201, 0.01862, 0.00393, 0.00001, 0.00543}

  //parameter Types.MoleFraction Y[:] = {0.9, 0.06, 0.015, 0.005, 0.02};
  //parameter Types.MoleFraction Y[:] = {0.97201, 0.01862, 0.00393, 0.00000,0.00000,0.00000,0.00000, 0.00000, 0.00544} "paper 2. Firenze";
  //parameter Types.MoleFraction Y[:] = {0.9651, 0.0166, 0.0062, 0.0032, 0.0089} "paper 3. Polimi";
  //parameter Types.MoleFraction Y[:] = {0.85306, 0.06486, 0.02058, 0.0028, 0.00437, 0.00099, 0.00063, 0.03882, 0.01268} "ref paper: https://doi.org/10.1016/j.ijhydene.2021.04.065";
  //parameter Types.MoleFraction Y[:] = {0.86486, 0.08788, 0.01179, 0.01323, 0.01894} "paper 5. xxx";


equation

end NaturalGasPR;
