within MultiEnergySystem.H2GasFacility.Tests.Components.Valves;
model Valve_REMI "Valve test to validate the REMI System"
extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4;
  parameter Types.MassFraction X_start[1] = {1};

  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-12,-6},{8,14}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
      redeclare model Medium = Medium,
    p0=6000000,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-54,-6},{-34,14}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    redeclare model Medium = Medium,
    p0=493000,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{36,-6},{56,14}})));
  inner System system(T_amb=288.15)
    annotation (Placement(transformation(extent={{-90,76},{-70,96}})));
  Modelica.Blocks.Sources.Ramp opening1(
    height=-1,
    duration=300,
    offset=1,
    startTime=200)                                                                                 annotation (
    Placement(visible = true, transformation(origin={-28,48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourcePressure.outlet, valveLinearOpening.inlet) annotation (Line(
      points={{-34,4},{-12,4}},
      color={182,109,49},
      thickness=0.5));
  connect(sinkPressure.inlet, valveLinearOpening.outlet) annotation (Line(
      points={{36,4},{8,4}},
      color={182,109,49},
      thickness=0.5));
  connect(opening1.y, valveLinearOpening.opening)
    annotation (Line(points={{-17,48},{-2,48},{-2,12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end Valve_REMI;
