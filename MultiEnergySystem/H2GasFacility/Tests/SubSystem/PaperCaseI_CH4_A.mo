within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_CH4_A "Same as PaperCaseI_CH4 with pure CH4 and with at step H2 injection in node 3"
  extends PaperCaseI_CH4(
  hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
  m_flow_H2_ref = 0.005,
  sourceH2_A(G=1e-8));
  annotation (experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=1000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_CH4_A;
