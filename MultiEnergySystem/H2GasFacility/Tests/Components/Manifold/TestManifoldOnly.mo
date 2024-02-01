within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;
model TestManifoldOnly
  extends Modelica.Icons.Example;
  replaceable model MediumIn1 = H2GasFacility.Media.IdealGases.CO_H2_CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumIn2 = H2GasFacility.Media.IdealGases.CO_H2_CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CO_H2_CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable MultiEnergySystem.H2GasFacility.Components.Manifold.GManifold2I1O manifold(redeclare
      model                                                                                              MediumIn1 = MediumIn1, redeclare
      model                                                                                                                                     MediumIn2 = MediumIn2, redeclare
      model                                                                                                                                                                            MediumOut = MediumOut, Tin_start1(displayUnit = "K") = 293, Tin_start2(displayUnit = "K") = 298, Tout_start(displayUnit = "K") = 295, V = 0.15708, Xin_start1 = {0.15, 0.25, 0.6}, Xin_start2 = {0.2, 0.2, 0.6}, Xout_start = {0.15, 0.25, 0.6}, noInitialPressure = false, p_start(displayUnit = "Pa") = 499999.9999999999) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{30, -30}, {-30, 30}}, rotation = 90)));

  parameter Types.Area A_v = 9.979654e-3;

  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sink(redeclare model Medium = MediumOut, R = 0, T0(displayUnit = "K") = 293, X0 = {0.15, 0.25, 0.6}, computeTransport = false, p0(displayUnit = "Pa") = 399999.9999999999) annotation (
    Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow source1(redeclare model Medium = MediumIn1, T0(displayUnit = "K") = 293, X0 = {0.15, 0.25, 0.6}, m_flow0 = 1.5, p0(displayUnit = "Pa") = 499999.9999999999, use_in_X0 = true) annotation (
    Placement(visible = true, transformation(origin = {-12, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow source2(redeclare model Medium = MediumIn2, T0(displayUnit = "K") = 298, X0 = {0.2, 0.2, 0.6}, m_flow0 = 2, p0(displayUnit = "Pa") = 499999.9999999999) annotation (
    Placement(visible = true, transformation(origin = {12, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression X_valve1[3](y = if time < 250 then {0.15, 0.25, 0.6} elseif time < 300 then {-0.001*time + 0.4, 0.001*time, 0.6} else {0.1, 0.3, 0.6}) annotation (
    Placement(visible = true, transformation(origin = {-70, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valveout(A_v = A_v, K_v = 0.00003500, redeclare
      model                                                                                                                  Medium = MediumOut, PressureDropLinear = false, Tin_start = 22 + 273, Tout_start = 22 + 273, X_start = {0.15, 0.25, 0.6}, dp_nom( displayUnit = "Pa")= 99999.99999999999, pin_start( displayUnit = "Pa")= 499999.9999999999) annotation (
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp openingout(duration = 0, height = 0, offset = 1, startTime = 300) annotation (
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source1.outlet, manifold.inlet1) annotation (
    Line(points = {{-12, 60}, {-12, 24}}, color = {182, 109, 49}));
  connect(source2.outlet, manifold.inlet2) annotation (
    Line(points = {{12, 60}, {12, 24}}, color = {182, 109, 49}));
  connect(X_valve1.y, source1.in_X0) annotation (
    Line(points = {{-59, 64}, {-17, 64}}, color = {0, 0, 127}, thickness = 0.5));
  connect(valveout.outlet, sink.inlet) annotation (
    Line(points = {{0, -60}, {0, -80}, {10, -80}}, color = {182, 109, 49}));
  connect(manifold.outlet, valveout.inlet) annotation (
    Line(points = {{0, -24}, {0, -40}}, color = {182, 109, 49}));
  connect(openingout.y, valveout.opening) annotation (
    Line(points = {{-38, -50}, {-8, -50}}, color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.0666889),
    Diagram);
end TestManifoldOnly;
