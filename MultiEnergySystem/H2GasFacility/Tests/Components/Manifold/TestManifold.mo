within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;

model TestManifold
  replaceable model MediumIn1 = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumIn2 = H2GasFacility.Media.IdealGases.H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O manifold(
    redeclare model MediumIn1 = MediumIn1,
    redeclare model MediumIn2 = MediumIn2,
    redeclare model MediumOut = MediumOut, Xout_start = {0.5, 0.5}, p_start(displayUnit = "Pa") = 49999.99999999999, wout_start = 2) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow source1(G = 0,redeclare model Medium = MediumIn1, T0 = 15 + 273.15, X0 = {1}, m_flow0 = 1, p0(displayUnit = "Pa") = 49999.99999999999) annotation(
    Placement(visible = true, transformation(origin = {12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow source2(G = 0,redeclare model Medium = MediumIn2, T0 = 15 + 273.15, X0 = {1}, m_flow0 = 1, p0(displayUnit = "Pa") = 49999.99999999999) annotation(
    Placement(visible = true, transformation(origin = {-12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sink(redeclare model Medium = MediumOut, R = 0, T0 = 15 + 273.15, X0 = {0.5, 0.5}, computeTransport = false, p0(displayUnit = "Pa") = 49999.99999999999) annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sink.inlet, manifold.outlet) annotation(
    Line(points = {{20, -60}, {0, -60}, {0, -24}}, color = {182, 109, 49}));
  connect(source2.outlet, manifold.inlet2) annotation(
    Line(points = {{-12, 50}, {-12, 24}}, color = {182, 109, 49}));
  connect(source1.outlet, manifold.inlet1) annotation(
    Line(points = {{12, 50}, {12, 24}}, color = {182, 109, 49}));

annotation(
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6));
end TestManifold;
