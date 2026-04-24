within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model RG2i_pipes_users_low
  extends Rete_Gas_2i_low_pipes(
  constantFrictionFactor = false,
    massFractionDynamicBalance = false);
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(
    redeclare model Medium = Medium,
    p0=459100,
    m_flow0=0.034069,
    X0=X_start)
    annotation (Placement(transformation(extent={{40,-128},{76,-92}})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_nom=0.4138,
    A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5)),
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-102,26})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-68,26})));
  Sensors.IdealPressureSensor idealPressureSensor(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-132,26})));
  Controllers.Valve_controller valve_controller
    annotation (Placement(transformation(extent={{-128,-10},{-108,10}})));
equation
  connect(GRM_3.inlet, s36_Stadio.outlet) annotation (Line(
      points={{58,-110},{72,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{-78,26},{-92,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s1.inlet,idealPressureSensor. outlet) annotation (Line(
      points={{-162,26},{-142,26}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor.inlet,valveLinearOpening. outlet) annotation (
      Line(
      points={{-122,26},{-112,26}},
      color={182,109,49},
      thickness=0.5));
  connect(valve_controller.P_meas,idealPressureSensor. p_meas) annotation (Line(
        points={{-128.8,0},{-138,0},{-138,18},{-135.8,18},{-135.8,18.6}}, color=
         {0,0,127}));
  connect(valve_controller.ACT_x,valveLinearOpening. opening)
    annotation (Line(points={{-106.6,0},{-102,0},{-102,18}}, color={0,0,127}));
  annotation (experiment(StopTime=6000, __Dymola_Algorithm="Dassl"),
                                   Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
end RG2i_pipes_users_low;
