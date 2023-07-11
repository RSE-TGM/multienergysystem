within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseII_II
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseII(X_start_H2 = {0.822493,0.101895,0.0276716,0.00364738,0.031643, 0.0126504});
annotation (
    experiment(
      StopTime=250,
      Interval=0.1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
  Diagram(coordinateSystem(extent = {{-180, -160}, {180, 160}})));
end PaperCaseII_II;
