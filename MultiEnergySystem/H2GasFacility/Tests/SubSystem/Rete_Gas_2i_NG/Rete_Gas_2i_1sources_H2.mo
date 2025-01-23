within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_1sources_H2 "Immissione 1 with H2"
  extends Rete_Gas_2i_1sources(redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
        nX = 2,
        X_start = {1, 0},
        constantFrictionFactor = false,
        massFractionDynamicBalance = true,
        raccordo2(m_flow_start=0.098),
    Immissione_1(X0={0.9,0.1}),
    m_flow_H2(offset=0.001),
    m_flow_H3(duration=60));
  annotation (experiment(
      StopTime=56000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_1sources_H2;
