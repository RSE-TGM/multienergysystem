within MultiEnergySystem.H2GasFacility.Tests.Components.Valves;
model TestManifold
  extends Modelica.Icons.Example;
  replaceable model MediumIn1 = H2GasFacility.Media.IdealGases.CO_H2_CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumIn2 = H2GasFacility.Media.IdealGases.CO_H2_CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CO_H2_CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valve1(A_v = 4.877657e-3, redeclare
      model                                                                                                      Medium = MediumIn1, Tin_start(displayUnit = "K") = 293, Tout_start(displayUnit = "K") = 293, X_start = {0.15, 0.25, 0.6}, dp_nom(displayUnit = "Pa") = 99999.99999999999, pin_start(displayUnit = "Pa") = 49999.99999999999) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp opening2(duration = 0, height = 0, offset = 1, startTime = 100) annotation (
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source1(redeclare
      model                                                                      Medium = MediumIn1, T0(displayUnit = "K") = 293, X0 = {0.15, 0.25, 0.6}, p0(displayUnit = "Pa") = 600000, use_in_X0 = true) annotation (
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sink(redeclare model Medium = MediumOut, T0(displayUnit = "K") = 293, X0 = {0.15, 0.25, 0.6}, p0(displayUnit = "Pa") = 5e5) annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression X_valve1[3](y = if time < 250 then {0.15, 0.25, 0.6} elseif time < 300 then {-0.001*time + 0.4, 0.001*time, 0.6} else {0.1, 0.3, 0.6}) annotation (
    Placement(visible = true, transformation(origin = {-96, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source1.outlet, valve1.inlet) annotation (
    Line(points = {{-60, 0}, {-10, 0}}, color = {182, 109, 49}));
  connect(valve1.outlet, sink.inlet) annotation (
    Line(points = {{10, 0}, {50, 0}}, color = {182, 109, 49}));
  connect(opening2.y, valve1.opening) annotation (
    Line(points = {{20, 50}, {0, 50}, {0, 8}}, color = {0, 0, 127}));
  connect(X_valve1.y, source1.in_X0) annotation (
    Line(points = {{-84, 38}, {-66, 38}, {-66, 8}}, color = {0, 0, 127}, thickness = 0.5));
  annotation (
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.2),
    Diagram);
end TestManifold;
