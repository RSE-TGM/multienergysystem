within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model RG2i_low_GRM1
  extends Rete_Gas_2i_low_pipes_GRM1(
  constantFrictionFactor = false,
    massFractionDynamicBalance = false);
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_nom=0.4138,
    A_v=5.5e-6,
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
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_1(
    redeclare model Medium = Medium,
    p0=459500,
    m_flow0=0.112338 + 0.119588 + 0.034069,
    X0=X_start)
    annotation (Placement(transformation(extent={{254,-140},{294,-100}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_2(
    redeclare model Medium = Medium,
    p0=454700,
    m_flow0=0.03,
    X0=X_start)
    annotation (Placement(transformation(extent={{234,-278},{278,-234}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(
    redeclare model Medium = Medium,
    p0=459100,
    m_flow0=0.25,
    X0=X_start)
    annotation (Placement(transformation(extent={{8,-156},{44,-120}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(
    redeclare model Medium = Medium,
    p0=463200,
    m_flow0=0.021261,
    X0=X_start)
    annotation (Placement(transformation(extent={{-230,184},{-186,228}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_5(
    redeclare model Medium = Medium,
    p0=460300,
    m_flow0=0.007765,
    X0=X_start)
    annotation (Placement(transformation(extent={{32,280},{70,318}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(
    redeclare model Medium = Medium,
    p0=461900,
    m_flow0=0.019358,
    X0=X_start)                                                                                     "Via Marx"
    annotation (Placement(transformation(extent={{124,218},{158,252}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_7(
    redeclare model Medium = Medium,
    p0=437100,
    m_flow0=0.098685,
    X0=X_start)
    annotation (Placement(transformation(extent={{242,248},{282,288}})));
equation
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
  connect(GRM_1.inlet, s21.outlet) annotation (Line(
      points={{274,-120},{240,-120},{240,-122},{230,-122}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_2.inlet, s28e30.outlet) annotation (Line(
      points={{256,-256},{256,-234}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.outlet, GRM_3.inlet) annotation (Line(
      points={{36,-112},{36,-124},{26,-124},{26,-138}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_4.inlet, sds10.outlet) annotation (Line(
      points={{-208,206},{-208,208},{-168,208},{-168,202},{-158,202}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_5.inlet, sds15.outlet) annotation (Line(
      points={{51,299},{50,299},{50,280}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_6.inlet, sds14.outlet) annotation (Line(
      points={{141,235},{140,234},{106,234}},
      color={182,109,49},
      thickness=0.5));
  connect(sds7e8.outlet, GRM_7.inlet) annotation (Line(
      points={{170,162},{262,162},{262,268}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=6000, __Dymola_Algorithm="Dassl"),
                                   Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
end RG2i_low_GRM1;
