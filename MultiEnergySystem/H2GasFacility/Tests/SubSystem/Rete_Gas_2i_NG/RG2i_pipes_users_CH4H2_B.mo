within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_pipes_users_CH4H2_B "Gas composition is 95% di CH4 and 5% of H2, without immissions"
  extends Rete_Gas_2i_pipes_users_CH4H2(X_start= {0.95, 0.05}, valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5))));
end RG2i_pipes_users_CH4H2_B;
