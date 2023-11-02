within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;
model TestGManifold
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestManifold(
  redeclare model MediumIn1 = H2GasFacility.Media.IdealGases.CH4H2, redeclare
      model                                                                         MediumIn2 =
        H2GasFacility.Media.IdealGases.CH4H2,                                                                                         redeclare
      model                                                                                                                                           MediumOut =
        H2GasFacility.Media.IdealGases.CH4H2,
  redeclare H2GasFacility.Components.Manifold.GManifold2I1O manifold,
    source2(                                                          X0 =         {0, 1}),
    source1(                                                                               X0 =         {1, 0}),
    valve2(                                                                                                     X_start =        {0, 1}),
    valve1(                                                                                                                              X_start =        {1, 0}));


equation

  annotation (
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.08));
end TestGManifold;
