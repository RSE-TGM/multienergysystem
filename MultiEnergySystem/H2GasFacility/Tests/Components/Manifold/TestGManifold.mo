within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;

model TestGManifold
  replaceable model MediumIn = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestManifold(
      redeclare model MediumIn1 = MediumIn, 
      redeclare model MediumIn2 = MediumIn, 
      redeclare model MediumOut = MediumOut, 
      redeclare H2GasFacility.Components.Manifold.GManifold2I1O manifold, source2.X0 = {0, 1}, source1.X0 = {1, 0});

equation

annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end TestGManifold;
