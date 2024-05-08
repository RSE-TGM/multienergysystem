within MultiEnergySystem.TestFacility.FMUExport.Systems;
model CoolingLoadSystem
 extends MultiEnergySystem.TestFacility.Loads.Thermal.Configurations.BaseClass.LoadPlantBase;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_hot = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_hot = 65 + 273.15;
  parameter DistrictHeatingNetwork.Types.Pressure pin_hot = 3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_hot = 2.5e5;

  DistrictHeatingNetwork.Types.Power Pt_EX701(nominal = 50e3);
  DistrictHeatingNetwork.Types.Power Pt_EX711(nominal = 50e3);
  DistrictHeatingNetwork.Types.Power Pt_EX721(nominal = 50e3);
  DistrictHeatingNetwork.Types.Power Pt_EX731(nominal = 50e3);


  DistrictHeatingNetwork.Sources.SourcePressure sourceP0(use_in_p0=true, use_in_T0=true,
    p0=pin_hot,
    T0=Tin_hot,
    R=1e-3)                                                                                  annotation (
    Placement(transformation(extent={{64,-38},{84,-18}})));

  DistrictHeatingNetwork.Sources.SourcePressure sourceP1(use_in_p0=true, use_in_T0=true,
    p0=pin_hot,
    T0=Tin_hot,
    R=1e-3)                                                                                  annotation (
    Placement(transformation(extent={{364,-38},{384,-18}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP2(use_in_p0=true, use_in_T0=true,
    p0=pin_hot,
    T0=Tin_hot,
    R=1e-3)                                                                                  annotation (
    Placement(transformation(extent={{524,-38},{544,-18}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP3(use_in_p0=true, use_in_T0=true,
    p0=pin_hot,
    T0=Tin_hot,
    R=1e-3)                                                                                  annotation (
    Placement(transformation(extent={{226,-38},{246,-18}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP0(use_in_p0=true,
    p0=pout_hot,
    T0=Tin_hot,
    R=1e-3)                                                          annotation (Placement(transformation(extent={{148,-38},{168,-18}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP3(use_in_p0=true,
    p0=pout_hot,
    T0=Tout_hot,
    R=1e-3)                                                          annotation (Placement(transformation(extent={{308,-40},{328,-20}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP1(use_in_p0=true,
    p0=pout_hot,
    T0=Tout_hot,
    R=1e-3)                                                          annotation (Placement(transformation(extent={{454,-40},{474,-20}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP2(use_in_p0=true,
    p0=pout_hot,
    T0=Tout_hot,
    R=1e-3)                                                          annotation (Placement(transformation(extent={{610,-40},{630,-20}})));
  inner DistrictHeatingNetwork.System system annotation (
    Placement(transformation(extent={{876,290},{896,310}})));
  Modelica.Blocks.Interfaces.RealInput Tinhot_EX701 annotation (Placement(transformation(extent={{12,10},{52,50}})));
  Modelica.Blocks.Interfaces.RealInput pinhot_EX701 annotation (Placement(transformation(extent={{12,-18},{52,22}})));
  Modelica.Blocks.Interfaces.RealInput Tinhot_EX711 annotation (Placement(transformation(extent={{320,16},{360,56}})));
  Modelica.Blocks.Interfaces.RealInput Tinhot_EX721 annotation (Placement(transformation(extent={{488,18},{528,58}})));
  Modelica.Blocks.Interfaces.RealInput Tinhot_EX731 annotation (Placement(transformation(extent={{188,12},{228,52}})));
  Modelica.Blocks.Interfaces.RealInput pinhot_EX711 annotation (Placement(transformation(extent={{320,-10},{360,30}})));
  Modelica.Blocks.Interfaces.RealInput pinhot_EX721 annotation (Placement(transformation(extent={{486,-10},{526,30}})));
  Modelica.Blocks.Interfaces.RealInput pinhot_EX731 annotation (Placement(transformation(extent={{188,-16},{228,24}})));
  Modelica.Blocks.Interfaces.RealInput pouthot_EX701 annotation (Placement(transformation(extent={{106,-22},{146,18}})));
  Modelica.Blocks.Interfaces.RealInput TcoolSP annotation (Placement(transformation(extent={{708,-84},{748,-44}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV701 annotation (Placement(transformation(extent={{206,-170},{166,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV711 annotation (Placement(transformation(extent={{500,-170},{460,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV721 annotation (Placement(transformation(extent={{660,-170},{620,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV731 annotation (Placement(transformation(extent={{360,-170},{320,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_TCV701 annotation (Placement(transformation(extent={{28,-340},{68,-300}})));
  Modelica.Blocks.Interfaces.RealInput theta_TCV731 annotation (Placement(transformation(extent={{190,-340},{230,-300}})));
  Modelica.Blocks.Interfaces.RealInput theta_TCV711 annotation (Placement(transformation(extent={{332,-340},{372,-300}})));
  Modelica.Blocks.Interfaces.RealInput theta_TCV721 annotation (Placement(transformation(extent={{492,-340},{532,-300}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCVR01 annotation (Placement(transformation(extent={{716,-336},{756,-296}})));
  Modelica.Blocks.Interfaces.RealInput omega_PR01 annotation (Placement(transformation(extent={{642,-228},{682,-188}})));
  Modelica.Blocks.Interfaces.RealInput pouthot_EX731 annotation (Placement(transformation(extent={{264,-20},{304,20}})));
  Modelica.Blocks.Interfaces.RealInput pouthot_EX711 annotation (Placement(transformation(extent={{410,-20},{450,20}})));
  Modelica.Blocks.Interfaces.RealInput pouthot_EX721 annotation (Placement(transformation(extent={{562,-20},{602,20}})));
  Modelica.Blocks.Interfaces.RealOutput TT701_ annotation (Placement(transformation(extent={{166,-108},{206,-68}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT731_ annotation (Placement(transformation(extent={{318,-110},{358,-70}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT711_ annotation (Placement(transformation(extent={{460,-108},{500,-68}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT721_ annotation (Placement(transformation(extent={{620,-110},{660,-70}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TTR02_ annotation (Placement(transformation(extent={{678,-304},{638,-264}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TTR01_ annotation (Placement(transformation(extent={{852,-320},{892,-280}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT702_ annotation (Placement(transformation(extent={{80,-140},{40,-100}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT732_ annotation (Placement(transformation(extent={{234,-142},{194,-102}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT712_ annotation (Placement(transformation(extent={{382,-140},{342,-100}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT722_ annotation (Placement(transformation(extent={{540,-140},{500,-100}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT704_ annotation (Placement(transformation(extent={{58,-288},{18,-248}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT734_ annotation (Placement(transformation(extent={{230,-288},{190,-248}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT714_ annotation (Placement(transformation(extent={{378,-288},{338,-248}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT724_ annotation (Placement(transformation(extent={{530,-290},{490,-250}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT703_ annotation (Placement(transformation(extent={{84,-268},{44,-228}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT733_ annotation (Placement(transformation(extent={{242,-262},{202,-222}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT713_ annotation (Placement(transformation(extent={{384,-262},{344,-222}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput TT723_ annotation (Placement(transformation(extent={{538,-260},{498,-220}}), iconTransformation(extent={{166,-108},{206,-68}})));
  Modelica.Blocks.Interfaces.RealOutput EX701_Pt annotation (Placement(transformation(extent={{18,-178},{38,-158}})));
  Modelica.Blocks.Sources.RealExpression PtEX701(y=Pt_EX701) annotation (Placement(transformation(extent={{-14,-178},{6,-158}})));
  Modelica.Blocks.Sources.RealExpression PtEX711(y=Pt_EX711) annotation (Placement(transformation(extent={{-14,-194},{6,-174}})));
  Modelica.Blocks.Interfaces.RealOutput EX711_Pt annotation (Placement(transformation(extent={{18,-194},{38,-174}})));
  Modelica.Blocks.Sources.RealExpression PtEX721(y=Pt_EX721) annotation (Placement(transformation(extent={{-14,-210},{6,-190}})));
  Modelica.Blocks.Sources.RealExpression PtEX731(y=Pt_EX731) annotation (Placement(transformation(extent={{-14,-226},{6,-206}})));
  Modelica.Blocks.Interfaces.RealOutput EX721_Pt annotation (Placement(transformation(extent={{18,-210},{38,-190}})));
  Modelica.Blocks.Interfaces.RealOutput EX731_Pt annotation (Placement(transformation(extent={{18,-226},{38,-206}})));
equation

  Pt_EX701 = EX701.Pt;
  Pt_EX711 = EX711.Pt;
  Pt_EX721 = EX721.Pt;
  Pt_EX731 = EX731.Pt;
  connect(sourceP0.outlet, PL701_rackL2L3_TT702.inlet) annotation (
    Line(points={{84,-28},{98,-28},{98,-48}},        color = {140, 56, 54}, thickness = 0.5));
  connect(sourceP3.outlet, PL731_rackL6L7_TT732.inlet) annotation (
    Line(points={{246,-28},{258,-28},{258,-50}},        color = {140, 56, 54}, thickness = 0.5));
  connect(sourceP1.outlet, PL711_rackL3L4_TT712.inlet) annotation (
    Line(points={{384,-28},{398,-28},{398,-46}},        color = {140, 56, 54}, thickness = 0.5));
  connect(sourceP2.outlet, PL721_rackL4L5_TT722.inlet) annotation (
    Line(points={{544,-28},{558,-28},{558,-46}},        color = {140, 56, 54}, thickness = 0.5));
  connect(sinkP0.inlet, PL701_FT701_rackL2L3.outlet) annotation (Line(
      points={{148,-28},{138,-28},{138,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP3.inlet, PL731_FT731_rackL6L7.outlet) annotation (Line(
      points={{308,-30},{298,-30},{298,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP1.inlet, PL711_FT711_rackL3L4.outlet) annotation (Line(
      points={{454,-30},{438,-30},{438,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP2.inlet, PL721_FT721_rackL4L5.outlet) annotation (Line(
      points={{610,-30},{598,-30},{598,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP0.in_T0, Tinhot_EX701) annotation (Line(points={{78,-19.6},{78,30},{32,30}}, color={0,0,127}));
  connect(sourceP3.in_T0, Tinhot_EX731) annotation (Line(points={{240,-19.6},{240,32},{208,32}}, color={0,0,127}));
  connect(sourceP1.in_T0, Tinhot_EX711) annotation (Line(points={{378,-19.6},{378,36},{340,36}}, color={0,0,127}));
  connect(sourceP2.in_T0, Tinhot_EX721) annotation (Line(points={{538,-19.6},{538,36},{508,36},{508,38}}, color={0,0,127}));
  connect(pinhot_EX721, sourceP2.in_p0) annotation (Line(points={{506,10},{530,10},{530,-19.6}}, color={0,0,127}));
  connect(sourceP1.in_p0, pinhot_EX711) annotation (Line(points={{370,-19.6},{370,10},{340,10}}, color={0,0,127}));
  connect(sourceP0.in_p0, pinhot_EX701) annotation (Line(points={{70,-19.6},{70,2},{32,2}}, color={0,0,127}));
  connect(pinhot_EX731, sourceP3.in_p0) annotation (Line(points={{208,4},{220,4},{220,6},{232,6},{232,-19.6}}, color={0,0,127}));
  connect(FCV711.opening, theta_FCV711) annotation (Line(points={{446,-150},{480,-150}}, color={0,0,127}));
  connect(FCV721.opening, theta_FCV721) annotation (Line(points={{606,-150},{640,-150}}, color={0,0,127}));
  connect(FCV731.opening, theta_FCV731) annotation (Line(points={{306,-150},{340,-150}}, color={0,0,127}));
  connect(FCV701.opening, theta_FCV701) annotation (Line(points={{146,-150},{186,-150}}, color={0,0,127}));
  connect(TCV701.opening, theta_TCV701) annotation (Line(points={{90,-320},{48,-320}}, color={0,0,127}));
  connect(TCV731.opening, theta_TCV731) annotation (Line(points={{250,-320},{210,-320}}, color={0,0,127}));
  connect(theta_TCV711, TCV711.opening) annotation (Line(points={{352,-320},{390,-320}}, color={0,0,127}));
  connect(TCV721.opening, theta_TCV721) annotation (Line(points={{549.1,-320},{512,-320}}, color={0,0,127}));
  connect(theta_FCVR01, FCVR01.opening) annotation (Line(points={{736,-316},{766,-316},{766,-352}}, color={0,0,127}));
  connect(omega_PR01, PR01.in_omega) annotation (Line(points={{662,-208},{679.75,-208},{679.75,-207.8},{697.5,-207.8}}, color={0,0,127}));
  connect(sinkP0.in_p0, pouthot_EX701) annotation (Line(points={{154,-19.6},{136,-19.6},{136,-2},{126,-2}}, color={0,0,127}));
  connect(sinkP3.in_p0, pouthot_EX731) annotation (Line(points={{314,-21.6},{316,-21.6},{316,0},{284,0}}, color={0,0,127}));
  connect(sinkP1.in_p0, pouthot_EX711) annotation (Line(points={{460,-21.6},{460,0},{430,0}}, color={0,0,127}));
  connect(sinkP2.in_p0, pouthot_EX721) annotation (Line(points={{616,-21.6},{618,-21.6},{618,0},{582,0}}, color={0,0,127}));
  connect(TcoolSP, RR01.Tout_SP) annotation (Line(points={{728,-64},{767.5,-64},{767.5,-97.2}}, color={0,0,127}));
  connect(TT701.T, TT701_) annotation (Line(points={{146.5,-88},{186,-88}}, color={0,0,127}));
  connect(TT731.T, TT731_) annotation (Line(points={{306.5,-90},{338,-90}}, color={0,0,127}));
  connect(TTR01.T, TTR01_) annotation (Line(points={{835.8,-299},{853.9,-299},{853.9,-300},{872,-300}}, color={0,0,127}));
  connect(TTR02.T, TTR02_) annotation (Line(points={{693.2,-286},{693.2,-284},{658,-284}}, color={0,0,127}));
  connect(TT702.T, TT702_) annotation (Line(points={{89.5,-120},{60,-120}}, color={0,0,127}));
  connect(TT732.T, TT732_) annotation (Line(points={{249.5,-120},{231.75,-120},{231.75,-122},{214,-122}}, color={0,0,127}));
  connect(TT712.T, TT712_) annotation (Line(points={{389.5,-120},{362,-120}}, color={0,0,127}));
  connect(TT722.T, TT722_) annotation (Line(points={{549.5,-120},{520,-120}}, color={0,0,127}));
  connect(TT704_, TT704_) annotation (Line(points={{38,-268},{38,-268}}, color={0,0,127}));
  connect(TT724.T, TT724_) annotation (Line(points={{548.2,-272},{529.1,-272},{529.1,-270},{510,-270}}, color={0,0,127}));
  connect(TT714.T, TT714_) annotation (Line(points={{388.2,-268},{358,-268}}, color={0,0,127}));
  connect(TT734.T, TT734_) annotation (Line(points={{248.35,-269.5},{248.35,-268},{210,-268}}, color={0,0,127}));
  connect(TT704.T, TT704_) annotation (Line(points={{88.2,-269},{88.2,-268},{38,-268}}, color={0,0,127}));
  connect(TT703.T, TT703_) annotation (Line(points={{126.2,-264},{114,-264},{114,-248},{64,-248}}, color={0,0,127}));
  connect(TT723.T, TT723_) annotation (Line(points={{587.2,-271},{574,-271},{574,-244},{518,-244},{518,-240}}, color={0,0,127}));
  connect(TT733.T, TT733_) annotation (Line(points={{287.2,-270},{276,-270},{276,-242},{222,-242}}, color={0,0,127}));
  connect(TT713.T, TT713_) annotation (Line(points={{427.2,-268},{416,-268},{416,-242},{364,-242}}, color={0,0,127}));
  connect(TT711.T, TT711_) annotation (Line(points={{446.5,-86},{463.25,-86},{463.25,-88},{480,-88}}, color={0,0,127}));
  connect(TT721.T, TT721_) annotation (Line(points={{606.5,-86},{623.25,-86},{623.25,-90},{640,-90}}, color={0,0,127}));
  connect(PtEX701.y, EX701_Pt) annotation (Line(points={{7,-168},{28,-168}}, color={0,0,127}));
  connect(PtEX721.y, EX721_Pt) annotation (Line(points={{7,-200},{28,-200}}, color={0,0,127}));
  connect(PtEX711.y, EX711_Pt) annotation (Line(points={{7,-184},{28,-184}}, color={0,0,127}));
  connect(PtEX731.y, EX731_Pt) annotation (Line(points={{7,-216},{28,-216}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CoolingLoadSystem;
