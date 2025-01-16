within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_3sources_H2
  extends Rete_Gas_2i_3sources(redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
        nX = 2,
        X_start = {0.95, 0.05});
end Rete_Gas_2i_3sources_H2;
