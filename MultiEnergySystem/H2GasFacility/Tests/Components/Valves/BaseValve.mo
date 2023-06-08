within MultiEnergySystem.H2GasFacility.Tests.Components.Valves;

model BaseValve
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valve1(redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = {0.9, 0.1}, dp_nom(displayUnit = "Pa") = 369.9, pin_start(displayUnit = "Pa") = 49999.99999999999) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveQuadraticOpening valve2(redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = {0.9, 0.1}, dp_nom(displayUnit = "Pa") = 369.9, pin_start(displayUnit = "Pa") = 0.5e5) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = {0.9, 0.1}, p0(displayUnit = "Pa") = 49999.99999999999) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sink(G = 0, redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = {0.9, 0.1}, m_flow0 = 0.10458, p0(displayUnit = "Pa") = 49630.1, pin_start(displayUnit = "Pa") = 49630.1) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp opening1(duration = 0, height = -0.5, offset = 1, startTime = 200)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp opening2(duration = 0, height = -0.5, offset = 1, startTime = 100)  annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source.outlet, valve1.inlet) annotation(
    Line(points = {{-60, 0}, {-40, 0}, {-40, 40}, {-10, 40}}, color = {182, 109, 49}));
  connect(source.outlet, valve2.inlet) annotation(
    Line(points = {{-60, 0}, {-40, 0}, {-40, -40}, {-10, -40}}, color = {182, 109, 49}));
  connect(opening2.y, valve2.opening) annotation(
    Line(points = {{-18, -70}, {0, -70}, {0, -48}}, color = {0, 0, 127}));
  connect(opening1.y, valve1.opening) annotation(
    Line(points = {{-19, 70}, {0, 70}, {0, 48}}, color = {0, 0, 127}));
  connect(valve2.outlet, sink.inlet) annotation(
    Line(points = {{10, -40}, {40, -40}, {40, 0}, {60, 0}}, color = {182, 109, 49}));
  connect(valve1.outlet, sink.inlet) annotation(
    Line(points = {{10, 40}, {40, 40}, {40, 0}, {60, 0}}, color = {182, 109, 49}));
  annotation(
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6));
end BaseValve;
