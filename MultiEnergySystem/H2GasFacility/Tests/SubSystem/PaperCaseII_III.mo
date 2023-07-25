within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseII_III "Same as PaperCaseII with injection of biomethane in node 3"
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseII(X_start_H2 = H2GasFacility.Data.MassMolFractionData.Bio_Abeysekera.X, m_flow_H2_ref = 0.000480657);
  annotation (
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-06, Interval = 0.5),
    Diagram(coordinateSystem(extent = {{-180, -160}, {180, 160}})));
end PaperCaseII_III;
