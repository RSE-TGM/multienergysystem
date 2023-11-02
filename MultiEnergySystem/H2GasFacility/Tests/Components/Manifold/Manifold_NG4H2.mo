within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;
model Manifold_NG4H2
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestGManifold(redeclare
      model                                                                                       MediumIn1 =
        H2GasFacility.Media.IdealGases.NG4_H2,                                                                                                      redeclare
      model                                                                                                                                                         MediumIn2 =
        H2GasFacility.Media.IdealGases.NG4_H2,                                                                                                                                                                         redeclare
      model                                                                                                                                                                                                         MediumOut =
        H2GasFacility.Media.IdealGases.NG4_H2,
    source1(                                                                                                                                                                                                        X0 =         {0.90, 0.034, 0.011, 0.001, 0.054}),manifold(Xin_start1 = {0.90, 0.034, 0.011, 0.001, 0.054}, Xin_start2 = {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}, Xout_start = {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}),
    source2(                                                                                                                                                                                                        X0 =         {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}),
    valve1(                                                                                                                                                                                                        X_start =        {0.90, 0.034, 0.011, 0.001, 0.054}),
    valve2(                                                                                                                                                                                                        X_start =        {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}),
    valveout(                                                                                                                                                                                                        X_start =          {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}),
    sink(                                                                                                                                                                                                        X0 =      {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}),
    opening1(                                                                                                                                                                                                        height =          -0.4),
    opening2(                                                                                                                                                                                                        height =          -0.2),
    openingout(                                                                                                                                                                                                        height =            -0.6));
equation

  annotation (
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.05));
end Manifold_NG4H2;
