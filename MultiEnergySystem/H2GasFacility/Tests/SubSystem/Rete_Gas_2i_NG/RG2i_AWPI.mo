within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_AWPI
  extends Rete_Gas_2i_pipes(raccordo2(pin_start=Data.PipelineData_2i.sds8.pout_start, pout_start=Data.PipelineData_2i.sds8.pout_start));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(
    redeclare model Medium = Medium,
    p0=463200,
    m_flow0=0.021261,
    X0=X_start)
    "Viale Berlinguer"
    annotation (Placement(transformation(extent={{-212,154},{-168,198}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_5(
    redeclare model Medium = Medium,
    p0=460300,
    m_flow0=0.007765,
    X0=X_start)
    "Via 25 Aprile"
    annotation (Placement(transformation(extent={{28,262},{66,300}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(
    redeclare model Medium = Medium,
    p0=461900,
    m_flow0=0.019358,
    X0=X_start)                                                                                     "Via Marx"
    annotation (Placement(transformation(extent={{88,200},{122,234}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_7(
    redeclare model Medium = Medium,
    p0=437100,
    m_flow0=0.098685,
    X0=X_start)
    "Contessa Entellina Ingresso paese SP.12 "
    annotation (Placement(transformation(extent={{222,234},{262,274}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(
    redeclare model Medium = Medium,
    p0=459100,
    m_flow0=0.034069,
    X0=X_start)
    "C.so Marsiglia"
    annotation (Placement(transformation(extent={{40,-128},{76,-92}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_1(
    redeclare model Medium = Medium,
    p0=459500,
    m_flow0=0.112338,
    X0=X_start)                                                                                     "Osèedaòe"
    annotation (Placement(transformation(extent={{188,-102},{228,-62}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_2(
    redeclare model Medium = Medium,
    p0=454700,
    m_flow0=0.119588,
    X0=X_start)                                                                                     "Via Lioni"
    annotation (Placement(transformation(extent={{214,-286},{258,-242}})));
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
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.371*10^5,
    height=+0.05*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-155,-8},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sensors.IdealPressureSensor idealPressureSensor1(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={278,234})));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-5,
    Kd=0,
    Ti=5e9,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-128,-22},{-108,-2}})));
equation
  connect(GRM_4.inlet, sds10.outlet) annotation (Line(
      points={{-190,176},{-178,176},{-178,180},{-164,180}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_5.inlet, sds15.outlet) annotation (Line(
      points={{47,281},{46,281},{46,252}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_6.inlet, sds14.outlet) annotation (Line(
      points={{105,217},{104,216},{80,216}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_3.inlet, s36_Stadio.outlet) annotation (Line(
      points={{58,-110},{72,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_1.inlet, s21.outlet) annotation (Line(
      points={{208,-82},{182,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_2.inlet, s30.outlet) annotation (Line(
      points={{236,-264},{234,-264},{234,-242}},
      color={182,109,49},
      thickness=0.5));
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{-78,26},{-92,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s1.inlet, valveLinearOpening.outlet) annotation (Line(
      points={{-162,26},{-112,26}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_7.inlet, idealPressureSensor1.outlet) annotation (Line(
      points={{242,254},{244,254},{244,284},{278,284},{278,244}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.outlet, idealPressureSensor1.inlet) annotation (Line(
      points={{242,220},{242,228},{260,228},{260,216},{278,216},{278,224}},
      color={182,109,49},
      thickness=0.5));
  connect(aWPIDContinuous.FeedBack, idealPressureSensor1.p_meas) annotation (
      Line(points={{-126,-16},{-140,-16},{-140,-36},{-40,-36},{-40,80},{292,80},
          {292,237.8},{285.4,237.8}}, color={0,0,127}));
  connect(p_ref.y, aWPIDContinuous.REF)
    annotation (Line(points={{-144,-8},{-126,-8}}, color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-107,-12},{-100,-12},{-100,8},{-104,8},{-104,18},
          {-102,18}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10000,
      Tolerance=0.001,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
end RG2i_AWPI;
