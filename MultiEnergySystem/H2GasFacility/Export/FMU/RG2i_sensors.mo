within MultiEnergySystem.H2GasFacility.Export.FMU;
model RG2i_sensors
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
        origin={261,-81},
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
        origin={233,-281},
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
        origin={-11,-111},
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
        origin={-271,179},
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
        origin={-43,291},
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
        origin={207,287},
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
        origin={181,217},
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
  Sensors.IdealPressureSensor idealPressureSensor2(
    redeclare model Medium = Medium,
    pin_start=454700,
    pout_start=454700,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.119588)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={198,-82})));
  Sensors.IdealPressureSensor idealPressureSensor3(
    redeclare model Medium = Medium,
    pin_start=459100,
    pout_start=459100,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.034069)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-110})));
  Sensors.IdealPressureSensor idealPressureSensor4(
    redeclare model Medium = Medium,
    pin_start=463200,
    pout_start=463200,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.021261)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-178,180})));
  Sensors.IdealPressureSensor idealPressureSensor5(
    redeclare model Medium = Medium,
    pin_start=454700,
    pout_start=454700,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.119588)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,274})));
  Sensors.IdealPressureSensor idealPressureSensor6(
    redeclare model Medium = Medium,
    pin_start=437100,
    pout_start=437100,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.098685)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,244})));
  Sensors.IdealPressureSensor idealPressureSensor7(
    redeclare model Medium = Medium,
    pin_start=461900,
    pout_start=461900,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.019358)
                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={114,218})));
  Sensors.IdealYSensor idealYSensor(
    pin_start=Data.PipelineData_2i.s36.pin_start,
    pout_start=Data.PipelineData_2i.s36.pin_start,
    Tin_start=Data.PipelineData_2i.s36.Tin_start,
    Tout_start=Data.PipelineData_2i.s36.Tin_start,
    X_start=X_start,
    m_flow_start=0.036)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={24,-110})));
  Sensors.IdealYSensor idealYSensor1(
    pin_start=Data.PipelineData_2i.s28.pin_start,
    pout_start=Data.PipelineData_2i.s28.pin_start,
    Tin_start=Data.PipelineData_2i.s28.Tin_start,
    Tout_start=Data.PipelineData_2i.s28.Tout_start,
    X_start=X_start,
    m_flow_start=0.119588)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={234,-246})));
  Sensors.IdealYSensor idealYSensor2(
    pin_start=Data.PipelineData_2i.s21.pin_start,
    pout_start=Data.PipelineData_2i.s21.pin_start,
    Tin_start=Data.PipelineData_2i.s21.Tin_start,
    Tout_start=Data.PipelineData_2i.s21.Tin_start,
    X_start=X_start,
    m_flow_start=0.112338)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={232,-80})));
  Sensors.IdealYSensor idealYSensor3(
    pin_start=Data.PipelineData_2i.sds10.pin_start,
    pout_start=Data.PipelineData_2i.sds10.pin_start,
    Tin_start=Data.PipelineData_2i.sds10.Tin_start,
    Tout_start=Data.PipelineData_2i.sds10.Tin_start,
    X_start=X_start,
    m_flow_start=0.021261)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-218,180})));
  Sensors.IdealYSensor idealYSensor4(
    pin_start=460300,
    pout_start=460300,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_strat,
    m_flow_start=0.007765)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,292})));
  Sensors.IdealYSensor idealYSensor5(
    pin_start=461900,
    pout_start=461900,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.019358)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={148,218})));
  Sensors.IdealYSensor idealYSensor6(
    pin_start=437100,
    pout_start=437100,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.098685)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,274})));
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
  connect(s28e30.outlet, idealPressureSensor1.inlet) annotation (Line(
      points={{234,-204},{236,-204},{236,-208},{242,-208}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.outlet, idealPressureSensor2.inlet) annotation (Line(
      points={{182,-82},{188,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.outlet, idealPressureSensor3.inlet) annotation (Line(
      points={{72,-110},{60,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.outlet, idealPressureSensor4.inlet) annotation (Line(
      points={{-164,180},{-168,180}},
      color={182,109,49},
      thickness=0.5));
  connect(sds15.outlet, idealPressureSensor5.inlet) annotation (Line(
      points={{46,252},{44,252},{44,264},{40,264}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.outlet, idealPressureSensor6.inlet) annotation (Line(
      points={{242,220},{242,234}},
      color={182,109,49},
      thickness=0.5));
  connect(sds14.outlet, idealPressureSensor7.inlet) annotation (Line(
      points={{80,216},{80,218},{104,218}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_3.inlet, idealYSensor.outlet) annotation (Line(
      points={{4,-111},{4,-110},{14,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor3.outlet, idealYSensor.inlet) annotation (Line(
      points={{40,-110},{34,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor1.outlet, idealYSensor1.inlet) annotation (Line(
      points={{242,-228},{234,-228},{234,-236}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_2.inlet, idealYSensor1.outlet) annotation (Line(
      points={{233,-262},{234,-260},{234,-256}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor2.outlet, idealYSensor2.inlet) annotation (Line(
      points={{208,-82},{208,-80},{222,-80}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_1.inlet, idealYSensor2.outlet) annotation (Line(
      points={{248,-81},{248,-80},{242,-80}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_4.inlet, idealYSensor3.outlet) annotation (Line(
      points={{-256,179},{-256,180},{-228,180}},
      color={182,109,49},
      thickness=0.5));
  connect(idealYSensor3.inlet, idealPressureSensor4.outlet) annotation (Line(
      points={{-208,180},{-188,180}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_5.inlet, idealYSensor4.outlet) annotation (Line(
      points={{-28,291},{-28,292},{4,292}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor5.outlet, idealYSensor4.inlet) annotation (Line(
      points={{40,284},{24,284},{24,292}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor7.outlet, idealYSensor5.inlet) annotation (Line(
      points={{124,218},{138,218}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_6.inlet, idealYSensor5.outlet) annotation (Line(
      points={{166,217},{168,218},{158,218}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor6.outlet, idealYSensor6.inlet) annotation (Line(
      points={{242,254},{242,264}},
      color={182,109,49},
      thickness=0.5));
  connect(demand_7.inlet, idealYSensor6.outlet) annotation (Line(
      points={{222,287},{224,284},{242,284}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=6000, __Dymola_Algorithm="Dassl"),
                                   Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
end RG2i_sensors;
