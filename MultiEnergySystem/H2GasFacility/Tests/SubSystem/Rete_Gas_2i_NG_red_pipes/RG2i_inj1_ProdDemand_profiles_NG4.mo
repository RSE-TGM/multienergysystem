within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG_red_pipes;
model RG2i_inj1_ProdDemand_profiles_NG4
  extends RG2i_inj1_ProdDemand_profiles(
  redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG4_H2,
  nX = 5,
  X_start = {0.922, 0.065, 0.011, 0.002, 0},
    Immissione_1(X0={0,0,0,0,1}),
    gain(k=1));                              // Algerian Natural Gas

  annotation (experiment(
      StopTime=86400,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_inj1_ProdDemand_profiles_NG4;
