within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;
model Manifold_CO_H2_CH4
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestGManifold(
    redeclare model MediumIn1 = H2GasFacility.Media.IdealGases.CO_H2_CH4,
    redeclare model MediumIn2 = H2GasFacility.Media.IdealGases.CO_H2_CH4,
    redeclare model MediumOut = H2GasFacility.Media.IdealGases.CO_H2_CH4,
    source1(
    X0 =         {0.15, 0.25, 0.6},
    T0 =         20 + 273.15,
    p0 =         6e5,
    use_in_T0 =         true,
    use_in_X0 =         true),
    valve1(
    X_start =        {0.15, 0.25, 0.6},
    A_v =        4.877657e-3,
    dp_nom =        1e5,
    pin_start =        6e5),
    source2(
    X0 =         {0.2, 0.2, 0.6},
    T0 =         25 + 273.15,
    p0 =         6e5),
    valve2(
    X_start =        {0.2, 0.2, 0.6},
    A_v =        4.877657e-3,
    dp_nom =        1e5,
    pin_start =        6e5),
    manifold(
      Xin_start1 = {0.15, 0.25, 0.6},
      Xin_start2 = {0.2, 0.2, 0.6},
      Xout_start = {0.1, 0.4, 0.5},
      Tin_start1 = 20 + 273.15,
      Tin_start2 = 25 + 273.15,
      Tout_start = 22 + 273.15,
      V = 0.15708),
    valveout(
    X_start =          {0.1, 0.4, 0.5},
    A_v =          4.877657e-3,
    dp_nom =          1e5,
    pin_start =          5e5),
    sink(
    X0 =      {0.1, 0.4, 0.5},
    p0 =      4e5),
    opening1(
    height =          0),
    opening2(
    height =          0),
    openingout(
    height =            0));


  Modelica.Blocks.Sources.Ramp T_valve1(duration = 60, height = 5, offset = 293, startTime = 120)  annotation (
    Placement(visible = true, transformation(origin = {50, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp X_valve1_CO(duration = 60, height = 5, offset = 293, startTime = 120) annotation (
    Placement(visible = true, transformation(origin = {48, 136}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression[3] X_valve1(y = if time < 250 then {0.15, 0.25, 0.6} else {0.1, 0.3, 0.6})  annotation (
    Placement(visible = true, transformation(origin = {50, 112}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(T_valve1.y, source1.in_T0) annotation (
    Line(points = {{40, 90}, {30, 90}, {30, 86}, {22, 86}}, color = {0, 0, 127}));
  connect(X_valve1.y, source1.in_X0) annotation (
    Line(points = {{40, 112}, {28, 112}, {28, 80}, {20, 80}, {20, 82}}, color = {0, 0, 127}, thickness = 0.5));
  annotation (
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.04375));
end Manifold_CO_H2_CH4;
