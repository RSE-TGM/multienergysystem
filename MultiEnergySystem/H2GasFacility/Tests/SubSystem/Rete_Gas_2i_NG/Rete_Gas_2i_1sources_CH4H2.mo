within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_1sources_CH4H2 "Test using a fluid with components CH4 (100%) and H2 (0%) and one immission"
  extends Rete_Gas_2i_1sources(redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
        nX = 2,
        X_start = {1, 0},
        constantFrictionFactor = false,
        massFractionDynamicBalance = false);
  annotation (experiment(
      StopTime=56000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_1sources_CH4H2;
