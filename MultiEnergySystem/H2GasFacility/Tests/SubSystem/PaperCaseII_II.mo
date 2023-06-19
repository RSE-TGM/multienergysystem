within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseII_II
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseII(X_start_H2 = {0.848265,0.105996,0.0287853,0.00379418,0.0131595});
equation
annotation(
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-6, Interval = 0.5),
  Diagram(coordinateSystem(extent = {{-180, -160}, {180, 160}})));
end PaperCaseII_II;
