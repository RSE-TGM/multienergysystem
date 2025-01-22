within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model TestProgressive_CH4H2
  extends TestProgressive(
    redeclare model Medium = MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX = 2,
    X_start = {1, 0},
    const(k=1));
end TestProgressive_CH4H2;
