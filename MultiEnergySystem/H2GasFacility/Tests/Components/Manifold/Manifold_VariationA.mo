within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;
model Manifold_VariationA
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestManifold(manifold(
                                                                                 V =          1));
equation

  annotation (
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.0266667));
end Manifold_VariationA;
