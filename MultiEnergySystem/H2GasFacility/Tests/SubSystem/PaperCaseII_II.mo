within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseII_II "Same as PaperCaseII with injection of natural gas with different mass composition in node 3"
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseII(X_start_H2 = H2GasFacility.Data.MassMolFractionData.NG_Abeysekera.X, m_flow_H2_ref = 0.000480657);
annotation (
    experiment(
      StopTime=250,
      Interval=0.1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
  Diagram(coordinateSystem(extent = {{-180, -160}, {180, 160}})));
end PaperCaseII_II;
