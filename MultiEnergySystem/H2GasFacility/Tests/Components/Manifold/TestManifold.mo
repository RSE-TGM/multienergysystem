within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;
model TestManifold
  extends Modelica.Icons.Example;
  replaceable model MediumIn1 = H2GasFacility.Media.IdealGases.CH4 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumIn2 = H2GasFacility.Media.IdealGases.H2 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CH4H2 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O manifold(redeclare model
            MediumIn1 =                                                                                             MediumIn1, redeclare model
            MediumIn2 =                                                                                                                                    MediumIn2, redeclare
      model MediumOut =                                                                                                                                                                           MediumOut, Xout_start = {0.5, 0.5}, p_start(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sink(redeclare model Medium = MediumOut, R = 0, T0 = 15 + 273.15, X0 = {0.5, 0.5}, computeTransport = false, p0(displayUnit = "Pa") = 49630) annotation (
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valve2(redeclare model
      Medium =                                                                                         MediumIn2, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = {1}, dp_nom(displayUnit = "Pa") = 369.9, pin_start(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {-12, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valve1(redeclare model
      Medium =                                                                                         MediumIn1, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = {1}, dp_nom(displayUnit = "Pa") = 369.9, pin_start(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {12, 50}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp opening1(duration = 0, height = -0.5, offset = 1, startTime = 200) annotation (
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp opening2(duration = 0, height = -0.5, offset = 1, startTime = 100) annotation (
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valveout(redeclare model
      Medium =                                                                                           MediumOut, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = {0.5, 0.5}, dp_nom(displayUnit = "Pa") = 369.9, pin_start(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp openingout(duration = 0, height = -0.5, offset = 1, startTime = 300) annotation (
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source1(redeclare model Medium = MediumIn1, T0 = 15 + 273.15, X0 = {1}, p0(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {12, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source2(redeclare model Medium = MediumIn2, T0 = 15 + 273.15, X0 = {1}, p0(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {-12, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(valve2.outlet, manifold.inlet2) annotation (
    Line(points = {{-12, 40}, {-12, 24}}, color = {182, 109, 49}));
  connect(valve1.outlet, manifold.inlet1) annotation (
    Line(points = {{12, 40}, {12, 24}}, color = {182, 109, 49}));
  connect(opening1.y, valve2.opening) annotation (
    Line(points = {{-38, 50}, {-20, 50}}, color = {0, 0, 127}));
  connect(opening2.y, valve1.opening) annotation (
    Line(points = {{40, 50}, {20, 50}}, color = {0, 0, 127}));
  connect(manifold.outlet, valveout.inlet) annotation (
    Line(points = {{0, -24}, {0, -50}}, color = {182, 109, 49}));
  connect(valveout.outlet, sink.inlet) annotation (
    Line(points = {{0, -70}, {0, -80}, {20, -80}}, color = {182, 109, 49}));
  connect(openingout.y, valveout.opening) annotation (
    Line(points = {{-38, -60}, {-8, -60}}, color = {0, 0, 127}));
  connect(source1.outlet, valve1.inlet) annotation (
    Line(points = {{12, 76}, {12, 60}}, color = {182, 109, 49}));
  connect(source2.outlet, valve2.inlet) annotation (
    Line(points = {{-12, 76}, {-12, 60}}, color = {182, 109, 49}));
  annotation (
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.2),
    Diagram);
end TestManifold;
