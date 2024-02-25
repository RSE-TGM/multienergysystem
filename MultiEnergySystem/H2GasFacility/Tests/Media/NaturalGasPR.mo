within MultiEnergySystem.H2GasFacility.Tests.Media;
model NaturalGasPR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
    redeclare model Medium = H2GasFacility.Media.RealGases.NaturalGasPR,
    T_ref = 15 + 273.15,
    p_ref = 101325,
    Y = {0.97201, 0.01862, 0.00393, 0.00000,0.00000,0.00000,0.00000, 0.00000, 0.00544});
end NaturalGasPR;
