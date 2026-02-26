within MultiEnergySystem.H2GasFacility.Export.FMU;
model RG2i_pipes_users
  extends MultiEnergySystem.H2GasFacility.Export.FMU.RG2i_pipes(
    raccordo2(pin_start=Data.PipelineData_2i.sds8.pout_start, pout_start=Data.PipelineData_2i.sds8.pout_start),
    constantFrictionFactor=false,
    massFractionDynamicBalance=false);

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
  Sources.SinkMassFlow demand_1(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.112338,
    p0=459500,
    pin_start=459500,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={217,-81},
        extent={{-13,-13},{13,13}},
        rotation=0)));
  Sources.SinkMassFlow demand_2(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.119588,
    p0=454700,
    pin_start=454700,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={235,-257},
        extent={{-19,-19},{19,19}},
        rotation=270)));
  Sources.SinkMassFlow demand_3(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.034069,
    p0=459100,
    pin_start=459100,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={39,-111},
        extent={{-15,-15},{15,15}},
        rotation=180)));
  Sources.SinkMassFlow demand_4(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.021261,
    p0=463200,
    pin_start=463200,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-199,181},
        extent={{-15,-15},{15,15}},
        rotation=180)));
  Sources.SinkMassFlow demand_5(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.007765,
    p0=460300,
    pin_start=460300,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={27,273},
        extent={{-15,-15},{15,15}},
        rotation=180)));
  Sources.SinkMassFlow demand_7(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.098685,
    p0=437100,
    pin_start=437100,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={221,259},
        extent={{-15,-15},{15,15}},
        rotation=180)));
  Sources.SinkMassFlow demand_6(
    G=1e-10,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=0.019358,
    p0=461900,
    pin_start=461900,
    use_in_m_flow0=true)  annotation (Placement(visible=true, transformation(
        origin={117,215},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  Sensors.IdealPressureSensor idealPressureSensor1(
    redeclare model Medium = Medium,
    pin_start=454700,
    pout_start=454700,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.119588)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={242,-218})));
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
  connect(s21.outlet, demand_1.inlet) annotation (Line(
      points={{182,-82},{192,-82},{192,-81},{204,-81}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.outlet, demand_3.inlet) annotation (Line(
      points={{72,-110},{72,-111},{54,-111}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.outlet, demand_4.inlet) annotation (Line(
      points={{-164,180},{-164,181},{-184,181}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_5.inlet, sds15.outlet) annotation (Line(
      points={{42,273},{46,273},{46,252}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.outlet, demand_7.inlet) annotation (Line(
      points={{242,220},{242,259},{236,259}},
      color={182,109,49},
      thickness=0.5));
  connect(sds14.outlet, demand_6.inlet) annotation (Line(
      points={{80,216},{80,215},{102,215}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_2.inlet, idealPressureSensor1.outlet) annotation (Line(
      points={{235,-238},{235,-236},{242,-236},{242,-228}},
      color={182,109,49},
      thickness=0.5));
  connect(s28e30.outlet, idealPressureSensor1.inlet) annotation (Line(
      points={{234,-204},{236,-204},{236,-208},{242,-208}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=6000, __Dymola_Algorithm="Dassl"),
                                   Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
end RG2i_pipes_users;
