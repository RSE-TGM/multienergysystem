within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_CH4_A
  extends PaperCaseI_CH4(m_flow_H2_ref = 0.005);
  annotation (experiment(
      StopTime=100,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_CH4_A;
