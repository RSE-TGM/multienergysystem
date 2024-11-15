within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_2sources_REMI_nV
  extends Rete_Gas_2i_2sources_nV(
    break REMI,
    m_flow_H2(offset=0.001),
    m_flow_H1(offset=0.001),
    Immissione_1(m_flow0=0.001),
    Immissione_2(m_flow0=0.001));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    rho_in_nom=40.17625,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-134,26})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,26})));
  Modelica.Blocks.Sources.Ramp opening1(
    height=0,
    duration=0,
    offset=1,
    startTime=200)                                                                                 annotation (
    Placement(visible = true, transformation(origin={-152,0},    extent={{-6,-6},
            {6,6}},                                                                               rotation=0)));
equation
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{-110,26},{-124,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s1.inlet, valveLinearOpening.outlet) annotation (Line(
      points={{-162,26},{-144,26}},
      color={182,109,49},
      thickness=0.5));
  connect(opening1.y, valveLinearOpening.opening)
    annotation (Line(points={{-145.4,0},{-134,0},{-134,18}}, color={0,0,127}));
end Rete_Gas_2i_2sources_REMI_nV;
