within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseII_IV
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseII(X_start_H2 = {0, 0, 0, 0, 1});
equation
  annotation(
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-06, Interval = 0.5),
    Diagram(coordinateSystem(extent = {{-180, -160}, {180, 160}})));
end PaperCaseII_IV;
