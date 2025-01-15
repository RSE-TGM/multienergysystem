within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4H2;
model Rete2i_nosources_controlled
  extends Rete2i_nosources_nV(break REMI, X_start = {0.95, 0.05});
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_nom=0.41245 + 0*0.41055,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-108,26})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,26})));
  Sensors.IdealPressureSensor idealPressureSensor(
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    m_flow_start=0.4110,
    hin_start=-4650159.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-138,26})));
  Controllers.Valve_controller valve_controller
    annotation (Placement(transformation(extent={{-134,-10},{-114,10}})));
equation
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{-84,26},{-98,26}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor.inlet,valveLinearOpening. outlet) annotation (
      Line(
      points={{-128,26},{-118,26}},
      color={182,109,49},
      thickness=0.5));
  connect(valve_controller.P_meas,idealPressureSensor. p_meas) annotation (Line(
        points={{-134.8,0},{-144,0},{-144,18},{-141.8,18},{-141.8,18.6}}, color
        ={0,0,127}));
  connect(valve_controller.ACT_x,valveLinearOpening. opening)
    annotation (Line(points={{-112.6,0},{-108,0},{-108,18}}, color={0,0,127}));
  connect(s1.inlet, idealPressureSensor.outlet) annotation (Line(
      points={{-162,26},{-148,26}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=0,
      Tolerance=0.001,
      __Dymola_Algorithm="Dassl"));
end Rete2i_nosources_controlled;
