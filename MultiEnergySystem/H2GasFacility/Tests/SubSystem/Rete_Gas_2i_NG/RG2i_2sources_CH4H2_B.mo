within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_2sources_CH4H2_B "Test using a fluid with components CH4 (95%) and H2 (5%) and two immissions of same composition"
  extends Rete_Gas_2i_2sources_CH4H2(X_start = {0.95, 0.05}, valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5))));
  annotation (experiment(
      StopTime=56000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_2sources_CH4H2_B;
