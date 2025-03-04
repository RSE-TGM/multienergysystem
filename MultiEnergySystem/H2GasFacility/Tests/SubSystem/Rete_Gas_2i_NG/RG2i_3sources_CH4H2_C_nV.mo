within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_3sources_CH4H2_C_nV
  "Test using a fluid for the network with 100% CH4 and 0% H2 and three immissions with 0% CH4 and 100% H2, including mass compositions dynamics"
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends RG2i_3sources_CH4H2_B(
    X_start = {1, 0},
    massFractionDynamicBalance = true,
    m_flow_H2(height=0.03, offset=1e-3),
    m_flow_H3(height=-0.03),
    m_flow_H1(height=0.01, duration=540),
    m_flow_H5(height=-0.01),
    Immissione_1(X0={0,1}), Immissione_2(X0={0,1}),Immissione_3(X0={0,1}),
    m_flow_H4(height=0.05),
    m_flow_H6(height=-0.05),
    s2(n=nV*5));
  annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end RG2i_3sources_CH4H2_C_nV;
