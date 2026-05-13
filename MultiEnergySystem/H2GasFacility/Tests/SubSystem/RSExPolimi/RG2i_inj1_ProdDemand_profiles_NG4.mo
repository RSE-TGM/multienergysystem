within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model RG2i_inj1_ProdDemand_profiles_NG4
  extends RG2i_inj1_ProdDemand_profiles(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG4_H2,
    nX=5,
    X_start={0.922,0.065,0.011,0.002,0},
    Immissione_1(X0={0,0,0,0,1}),
    gain(k=1),
    GRM_1(m_flow0=2*0.112338),
    GRM_2(m_flow0=2*0.119588),
    GRM_4(m_flow0=2*0.02162),
    GRM_5(m_flow0=2*0.007765),
    GRM_6(m_flow0=2*0.019358),
    GRM_7(m_flow0=2*0.098685));
    //  X_start = {0.922, 0.065, 0.011, 0.002, 0} Algerian Natural Gas

  annotation (experiment(
      StopTime=86400,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p><span style=\"font-size: 9pt;\">Doubled demand profile</span></p>
</html>"));
end RG2i_inj1_ProdDemand_profiles_NG4;
