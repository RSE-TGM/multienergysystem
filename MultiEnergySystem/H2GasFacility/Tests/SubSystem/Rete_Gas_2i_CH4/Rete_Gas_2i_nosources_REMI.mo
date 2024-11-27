within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4;
model Rete_Gas_2i_nosources_REMI
  "Simplified version of Rete Gas 2i with only backbone and no sources with the Valve REMI station"
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4.Rete_Gas_2i_nosources
                                                                               (break REMI);
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_nom=0.41267,
    rho_in_nom=40.17625,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-138,26})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    redeclare model Medium = Medium,
    p0=6000000,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-104,26})));
  Modelica.Blocks.Sources.Ramp opening1(
    height=0,
    duration=0,
    offset=1,
    startTime=200)                                                                                 annotation (
    Placement(visible = true, transformation(origin={-116,-8},   extent={{-6,-6},
            {6,6}},                                                                               rotation=0)));
equation
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{-114,26},{-128,26}},
      color={182,109,49},
      thickness=0.5));
  connect(opening1.y,valveLinearOpening. opening)
    annotation (Line(points={{-109.4,-8},{-98,-8},{-98,8},{-138,8},{-138,18}},
                                                        color={0,0,127}));
  connect(s1.inlet, valveLinearOpening.outlet) annotation (Line(
      points={{-162,26},{-148,26}},
      color={182,109,49},
      thickness=0.5));
end Rete_Gas_2i_nosources_REMI;
