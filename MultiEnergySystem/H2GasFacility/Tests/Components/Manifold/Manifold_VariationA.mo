within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;

model Manifold_VariationA
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestManifold(manifold.V = 1);
equation

annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.01));
end Manifold_VariationA;
