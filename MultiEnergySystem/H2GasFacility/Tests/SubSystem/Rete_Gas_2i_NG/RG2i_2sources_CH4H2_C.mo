within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_2sources_CH4H2_C "Test using a fluid for the network with 100% CH4 and 0% H2 and two immissions with 0% CH4 and 100% H2, including mass compositions dynamics"
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends RG2i_2sources_CH4H2_B(X_start = {1, 0}, Immissione_1(X0={0,1}), massFractionDynamicBalance = true,
    m_flow_H2(height=0.03, offset=1e-3),
    m_flow_H3(height=-0.03),
    m_flow_H1(height=0.01, duration=540),
    m_flow_H5(height=-0.01),
    Immissione_2(X0={0,1}),
    sds11(n=9));
  annotation (experiment(StopTime=56000, __Dymola_Algorithm="Dassl"));
end RG2i_2sources_CH4H2_C;
