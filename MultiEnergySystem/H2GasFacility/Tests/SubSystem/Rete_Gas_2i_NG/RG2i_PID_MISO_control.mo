within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_PID_MISO_control
  "Multiple Input Single Output pressure controller for REMI station"
  extends Rete_Gas_2i_pipes(raccordo2(pin_start=Data.PipelineData_2i.sds8.pout_start, pout_start=Data.PipelineData_2i.sds8.pout_start));
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;

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
        origin={-186,180})));
  Sensors.IdealPressureSensor idealPressureSensor1(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={36,268})));
  Sensors.IdealPressureSensor idealPressureSensor2(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={102,216})));
  Sensors.IdealPressureSensor idealPressureSensor3(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={234,238})));
  Sensors.IdealPressureSensor idealPressureSensor5(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,-110})));
  Sensors.IdealPressureSensor idealPressureSensor6(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={206,-82})));
  Sensors.IdealPressureSensor idealPressureSensor7(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={222,-258})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(
    redeclare model Medium = Medium,
    p0=463200,
    m_flow0=0.021261,
    X0=X_start)
    "Viale Berlinguer"
    annotation (Placement(transformation(extent={{-258,164},{-214,208}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_5(
    redeclare model Medium = Medium,
    p0=460300,
    m_flow0=0.007765,
    X0=X_start)
    "Via 25 Aprile"
    annotation (Placement(transformation(extent={{-20,248},{18,286}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(
    redeclare model Medium = Medium,
    p0=461900,
    m_flow0=0.019358,
    X0=X_start)                                                                                     "Via Marx"
    annotation (Placement(transformation(extent={{118,200},{152,234}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_7(
    redeclare model Medium = Medium,
    p0=437100,
    m_flow0=0.098685,
    X0=X_start)
    "Contessa Entellina Ingresso paese SP.12 "
    annotation (Placement(transformation(extent={{182,224},{222,264}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(
    redeclare model Medium = Medium,
    p0=459100,
    m_flow0=0.034069,
    X0=X_start)
    "C.so Marsiglia"
    annotation (Placement(transformation(extent={{-10,-126},{26,-90}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_1(
    redeclare model Medium = Medium,
    p0=459500,
    m_flow0=0.112338,
    X0=X_start)                                                                                     "Osèedaòe"
    annotation (Placement(transformation(extent={{220,-104},{260,-64}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_2(
    redeclare model Medium = Medium,
    p0=454700,
    m_flow0=0.119588,
    X0=X_start)                                                                                     "Via Lioni"
    annotation (Placement(transformation(extent={{126,-280},{170,-236}})));
  Modelica.Blocks.Sources.Constant const_4(k=4.632)
    annotation (Placement(transformation(extent={{-230,132},{-214,148}})));
  Modelica.Blocks.Math.Feedback feedback_4 annotation (Placement(visible=true,
        transformation(
        origin={-196,140},
        extent={{-10,10},{10,-10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const_5(k=4.603)
    annotation (Placement(transformation(extent={{2,284},{18,300}})));
  Modelica.Blocks.Math.Feedback feedback_5 annotation (Placement(visible=true,
        transformation(
        origin={36,292},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const_7(k=4.371)
    annotation (Placement(transformation(extent={{196,264},{212,280}})));
  Modelica.Blocks.Math.Feedback feedback_7 annotation (Placement(visible=true,
        transformation(
        origin={234,272},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const_3(k=4.591)
    annotation (Placement(transformation(extent={{-6,-154},{10,-138}})));
  Modelica.Blocks.Math.Feedback feedback_3 annotation (Placement(visible=true,
        transformation(
        origin={32,-146},
        extent={{-10,10},{10,-10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const_1(k=4.595)
    annotation (Placement(transformation(extent={{260,-64},{244,-48}})));
  Modelica.Blocks.Math.Feedback feedback_1 annotation (Placement(visible=true,
        transformation(
        origin={222,-56},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const_2(k=4.547)
    annotation (Placement(transformation(extent={{174,-294},{190,-278}})));
  Modelica.Blocks.Math.Feedback feedback_2 annotation (Placement(visible=true,
        transformation(
        origin={212,-286},
        extent={{-10,10},{10,-10}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain(k=1e-10) annotation (
        Placement(visible = true, transformation(origin={-138,4},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.REMI_station REMI_station(redeclare
      model Medium =                                                                         Medium,
    nX=nX,
    X_start=X_start)
    annotation (Placement(transformation(extent={{-114,16},{-94,36}})));
  Modelica.Blocks.Math.Feedback feedback_6 annotation (Placement(visible=true,
        transformation(
        origin={104,250},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const_6(k=4.619)
    annotation (Placement(transformation(extent={{72,242},{88,258}})));
  Controllers.MultiplMax multiplMax
    annotation (Placement(transformation(extent={{-258,-6},{-238,14}})));
equation
  connect(sds14.outlet, idealPressureSensor2.inlet) annotation (Line(
      points={{80,216},{92,216}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.outlet, idealPressureSensor.inlet) annotation (Line(
      points={{-164,180},{-176,180}},
      color={182,109,49},
      thickness=0.5));
  connect(sds15.outlet, idealPressureSensor1.inlet) annotation (Line(
      points={{46,252},{46,268}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.outlet, idealPressureSensor3.inlet) annotation (Line(
      points={{242,220},{244,220},{244,238}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.outlet, idealPressureSensor5.inlet) annotation (Line(
      points={{72,-110},{52,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.outlet, idealPressureSensor6.inlet) annotation (Line(
      points={{182,-82},{196,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s30.outlet, idealPressureSensor7.inlet) annotation (Line(
      points={{234,-242},{236,-242},{236,-248},{232,-248},{232,-258}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_4.inlet, idealPressureSensor.outlet) annotation (Line(
      points={{-236,186},{-236,188},{-204,188},{-204,180},{-196,180}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_5.inlet, idealPressureSensor1.outlet) annotation (Line(
      points={{-1,267},{0,268},{26,268}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_7.inlet, idealPressureSensor3.outlet) annotation (Line(
      points={{202,244},{216,244},{216,238},{224,238}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_3.inlet, idealPressureSensor5.outlet) annotation (Line(
      points={{8,-108},{8,-110},{32,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_1.inlet, idealPressureSensor6.outlet) annotation (Line(
      points={{240,-84},{240,-82},{216,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_2.inlet, idealPressureSensor7.outlet) annotation (Line(
      points={{148,-258},{212,-258}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_6.inlet, idealPressureSensor2.outlet) annotation (Line(
      points={{135,217},{136,216},{112,216}},
      color={182,109,49},
      thickness=0.5));
  connect(feedback_4.u1, const_4.y)
    annotation (Line(points={{-204,140},{-213.2,140}}, color={0,0,127}));
  connect(idealPressureSensor.p_meas, feedback_4.u2) annotation (Line(points={{-189.8,
          172.6},{-188,172.6},{-188,160},{-196,160},{-196,148}}, color={0,0,127}));
  connect(feedback_5.u1,const_5. y)
    annotation (Line(points={{28,292},{18.8,292}}, color={0,0,127}));
  connect(feedback_7.u1,const_7. y)
    annotation (Line(points={{226,272},{212.8,272}}, color={0,0,127}));
  connect(idealPressureSensor1.p_meas, feedback_5.u2) annotation (Line(points={{
          32.2,275.4},{36,276},{36,284}}, color={0,0,127}));
  connect(idealPressureSensor3.p_meas, feedback_7.u2) annotation (Line(points={{
          230.2,245.4},{234,245.4},{234,264}}, color={0,0,127}));
  connect(feedback_3.u1, const_3.y)
    annotation (Line(points={{24,-146},{10.8,-146}}, color={0,0,127}));
  connect(feedback_3.u2, idealPressureSensor5.p_meas) annotation (Line(points={{
          32,-138},{32,-128},{38.2,-128},{38.2,-117.4}}, color={0,0,127}));
  connect(feedback_1.u1, const_1.y)
    annotation (Line(points={{230,-56},{243.2,-56}}, color={0,0,127}));
  connect(feedback_1.u2, idealPressureSensor6.p_meas) annotation (Line(points={{
          222,-64},{216,-64},{216,-74.6},{209.8,-74.6}}, color={0,0,127}));
  connect(feedback_2.u1, const_2.y)
    annotation (Line(points={{204,-286},{190.8,-286}}, color={0,0,127}));
  connect(idealPressureSensor7.p_meas, feedback_2.u2) annotation (Line(points={{
          218.2,-265.4},{220,-265.4},{220,-272},{212,-272},{212,-278}}, color={0,
          0,127}));
  connect(s1.inlet, REMI_station.fluidPortOutlet) annotation (Line(
      points={{-162,26},{-114,26}},
      color={182,109,49},
      thickness=0.5));
  connect(gain.y, REMI_station.in_opening) annotation (Line(points={{-127,4},{
          -84,4},{-84,44},{-98.4,44},{-98.4,34.4}},              color={0,0,127}));
  connect(idealPressureSensor2.p_meas, feedback_6.u2) annotation (Line(points={
          {105.8,223.4},{104,223.4},{104,242}}, color={0,0,127}));
  connect(feedback_6.u1, const_6.y)
    annotation (Line(points={{96,250},{88.8,250}}, color={0,0,127}));
  connect(multiplMax.y, gain.u)
    annotation (Line(points={{-237.4,4},{-150,4}}, color={0,0,127}));
  connect(feedback_1.y, multiplMax.u5) annotation (Line(points={{213,-56},{204,
          -56},{204,-52},{198,-52},{198,-32},{316,-32},{316,-336},{-292,-336},{
          -292,1.3},{-257.9,1.3}}, color={0,0,127}));
  connect(feedback_2.y, multiplMax.u6) annotation (Line(points={{221,-286},{252,
          -286},{252,-300},{-284,-300},{-284,-1.7},{-257.9,-1.7}}, color={0,0,
          127}));
  connect(feedback_3.y, multiplMax.u7) annotation (Line(points={{41,-146},{54,
          -146},{54,-148},{62,-148},{62,-174},{-276,-174},{-276,-4.7},{-257.9,
          -4.7}}, color={0,0,127}));
  connect(feedback_4.y, multiplMax.u1) annotation (Line(points={{-187,140},{
          -176,140},{-176,132},{-168,132},{-168,104},{-272,104},{-272,12.9},{
          -257.9,12.9}}, color={0,0,127}));
  connect(feedback_7.y, multiplMax.u4) annotation (Line(points={{243,272},{266,
          272},{266,324},{-316,324},{-316,4.1},{-257.9,4.1}}, color={0,0,127}));
  connect(feedback_6.y, multiplMax.u3) annotation (Line(points={{113,250},{128,
          250},{128,248},{142,248},{142,316},{-298,316},{-298,7.3},{-257.9,7.3}},
        color={0,0,127}));
  connect(multiplMax.u2, feedback_5.y) annotation (Line(points={{-257.9,10.1},{
          -290,10.1},{-290,302},{66,302},{66,292},{45,292}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RG2i_PID_MISO_control;
