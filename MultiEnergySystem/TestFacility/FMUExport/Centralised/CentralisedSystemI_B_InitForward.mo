within MultiEnergySystem.TestFacility.FMUExport.Centralised;
partial model CentralisedSystemI_B_InitForward
  extends Interfaces.SignalBusConnector;
  extends Networks.Thermal.Configurations.Centralised.CentralizedSystemI_B;
  OffSetBlocks.InputOffset m_flowP101Offset(
    fixInput=fixqP101,
    u_norm=m_flowP101_nom,
    u_start=m_flowP101_nom) annotation (Placement(visible=true, transformation(
        origin={-210,-180},
        extent={{10,-10},{-10,10}},
        rotation=0)));

  //Boolean Parameters
  //Initialization type
  parameter Boolean ForwardInit = true "True if forward, False if backward";
  //Input
  parameter Boolean fixqP101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixqP401 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixomegaP901 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutGB101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutEB401 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCVC01 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCVC02 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV401 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV901 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCVR01 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixTCool = ForwardInit "True if forward, False if backward";
  //Output
  final parameter Boolean fixPT902 = not fixomegaP901;
  final parameter Boolean fixTT701 = not fixthetaFCV701;
  final parameter Boolean fixTT711 = not fixthetaFCV711;
  final parameter Boolean fixTT721 = not fixthetaFCV721;
  final parameter Boolean fixTT731 = not fixthetaFCV731;
  final parameter Boolean fixTT704 = not fixthetaTCV701;
  final parameter Boolean fixTT714 = not fixthetaTCV711;
  final parameter Boolean fixTT724 = not fixthetaTCV721;
  final parameter Boolean fixTT734 = not fixthetaTCV731;
  final parameter Boolean fixFTR01 = not fixthetaFCVR01;

  //Additional variables
  final parameter Boolean fixTT902 = false;
  final parameter Boolean fixFT902 = false;

//Normalisation values
  //Nominal values
  parameter Real qP101_nom(unit = "m3/h") = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h "Nominal fuel m.f.r." annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter Real qP401_nom(unit = "m3/h") = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h "Nominal CO2 m.f.r. going through pump P6" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1 "Nom. opening valve in the system" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Non dimensional"));
  parameter DistrictHeatingNetwork.Types.Temperature THot_nom = 80 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature TCool_nom = 30 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP901_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));

  //  Desired Outputs values
  parameter DistrictHeatingNetwork.Types.Temperature ToutLoad_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT902_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT701_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT711_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT721_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT731_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT704_des = 20 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT714_des = 20 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT724_des = 20 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT734_des = 20 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Pressure PT902_des = 2.8e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter Real FT902_des(unit = "m3/h") = 16 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter Real FTR01_des(unit = "m3/h") = 35 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));

  OffSetBlocks.InputOffset m_flowP401Offset(
    fixInput=fixqP401,
    u_norm=m_flowP401_nom,
    u_start=m_flowP401_nom) annotation (Placement(visible=true, transformation(
        origin={-296,-176},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV701Offset(
    fixInput=fixthetaFCV701,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={170,-150},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV731Offset(
    fixInput=fixthetaFCV731,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={330,-150},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV711Offset(
    fixInput=fixthetaFCV711,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={470,-150},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV721Offset(
    fixInput=fixthetaFCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={630,-150},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV721Offset(
    fixInput=fixthetaTCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={530,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV711Offset(
    fixInput=fixthetaTCV711,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={370,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV731Offset(
    fixInput=fixthetaTCV731,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={230,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV701Offset(
    fixInput=fixthetaTCV701,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={70,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV901Offset(
    fixInput=fixthetaFCV901,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-730,114},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVR01Offset(
    fixInput=fixthetaFCVR01,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={790,-330},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset TCoolOffset(
    fixInput=fixTCool,
    u_norm=TCool_nom,
    u_start=TCool_nom) annotation (Placement(visible=true, transformation(
        origin={790,-70},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset omegaP901Offset(
    fixInput=fixomegaP901,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-730,66},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV101Offset(
    fixInput=fixthetaFCV101,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-210,-140},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV401Offset(
    fixInput=fixthetaFCV401,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-294,-136},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutEB401Offset(
    fixInput=fixToutEB401,
    u_norm=THot_nom,
    u_start=THot_nom)  annotation (Placement(visible=true, transformation(
        origin={-390,-300},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutGB101Offset(
    fixInput=fixToutGB101,
    u_norm=THot_nom,
    u_start=THot_nom)  annotation (Placement(visible=true, transformation(
        origin={-304,-300},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT902Offset(
    fixOutput=fixTT902,
    y_fixed=TT902_des,
    y_norm=TT902_des) annotation (Placement(visible=true, transformation(
        origin={-730,190},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT902Offset(
    fixOutput=fixPT902,
    y_fixed=PT902_des,
    y_norm=PT902_des) annotation (Placement(visible=true, transformation(
        origin={-730,150},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVC02Offset(
    fixInput=fixthetaFCVC02,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={718,236},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVC01Offset(
    fixInput=fixthetaFCVC01,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={282,236},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT701Offset(
    fixOutput=fixTT701,
    y_fixed=TT701_des,
    y_norm=TT701_des) annotation (Placement(visible=true, transformation(
        origin={170,-90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT731Offset(
    fixOutput=fixTT731,
    y_fixed=TT731_des,
    y_norm=TT731_des) annotation (Placement(visible=true, transformation(
        origin={330,-90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT711Offset(
    fixOutput=fixTT711,
    y_fixed=TT711_des,
    y_norm=TT711_des) annotation (Placement(visible=true, transformation(
        origin={470,-90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT721Offset(
    fixOutput=fixTT721,
    y_fixed=TT721_des,
    y_norm=TT721_des) annotation (Placement(visible=true, transformation(
        origin={630,-90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT704Offset(
    fixOutput=fixTT704,
    y_fixed=TT704_des,
    y_norm=TT704_des) annotation (Placement(visible=true, transformation(
        origin={70,-270},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT734Offset(
    fixOutput=fixTT734,
    y_fixed=TT734_des,
    y_norm=TT734_des) annotation (Placement(visible=true, transformation(
        origin={230,-270},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT714Offset(
    fixOutput=fixTT714,
    y_fixed=TT714_des,
    y_norm=TT714_des) annotation (Placement(visible=true, transformation(
        origin={370,-270},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT724Offset(
    fixOutput=fixTT724,
    y_fixed=TT724_des,
    y_norm=TT724_des) annotation (Placement(visible=true, transformation(
        origin={530,-270},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FTR01Offset(
    fixOutput=fixFTR01,
    y_fixed=FTR01_des,
    y_norm=FTR01_des) annotation (Placement(visible=true, transformation(
        origin={850,-230},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT902Offset(
    fixOutput=fixFT902,
    y_fixed=FT902_des,
    y_norm=FT902_des) annotation (Placement(visible=true, transformation(
        origin={-690,166},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(m_flowP101Offset.u, P101.in_m_flow) annotation (Line(points={{-219,-180},{-229.74,-180},{
          -229.74,-179.8},{-234.48,-179.8}}, color={0,0,127}));
  connect(m_flowP401Offset.u, P401.in_m_flow) annotation (Line(points={{-305,-176},{-307.84,-176},{
          -307.84,-175.8},{-312.48,-175.8}}, color={0,0,127}));
  connect(FCV701.opening, thetaFCV701Offset.u)
    annotation (Line(points={{146,-150},{161,-150}}, color={0,0,127}));
  connect(thetaFCV731Offset.u, FCV731.opening)
    annotation (Line(points={{321,-150},{306,-150}}, color={0,0,127}));
  connect(thetaFCV711Offset.u, FCV711.opening)
    annotation (Line(points={{461,-150},{446,-150}}, color={0,0,127}));
  connect(thetaFCV721Offset.u, FCV721.opening)
    annotation (Line(points={{621,-150},{606,-150}}, color={0,0,127}));
  connect(thetaTCV721Offset.u, TCV721.opening)
    annotation (Line(points={{539,-320},{549.1,-320}}, color={0,0,127}));
  connect(thetaTCV731Offset.u, TCV731.opening)
    annotation (Line(points={{239,-320},{250,-320}}, color={0,0,127}));
  connect(thetaTCV711Offset.u, TCV711.opening)
    annotation (Line(points={{379,-320},{390,-320}}, color={0,0,127}));
  connect(thetaTCV701Offset.u, TCV701.opening)
    annotation (Line(points={{79,-320},{90,-320}}, color={0,0,127}));
  connect(thetaFCVR01Offset.u, FCVR01.opening)
    annotation (Line(points={{781,-330},{766,-330},{766,-352}}, color={0,0,127}));
  connect(TCoolOffset.u, RR01.Tout_SP)
    annotation (Line(points={{781,-70},{767.5,-70},{767.5,-97.2}}, color={0,0,127}));
  connect(thetaFCV901Offset.u, FCV901.opening)
    annotation (Line(points={{-739,114},{-744,114},{-744,115},{-749,115}}, color={0,0,127}));
  connect(omegaP901Offset.u, P901.in_omega) annotation (Line(points={{-739,66},{-743.125,66},{-743.125,
          66.3},{-747.25,66.3}}, color={0,0,127}));
  connect(thetaFCV101Offset.u, FCV101.opening)
    annotation (Line(points={{-219,-140},{-232,-140}}, color={0,0,127}));
  connect(thetaFCV401Offset.u, FCV401.opening)
    annotation (Line(points={{-303,-136},{-310,-136}}, color={0,0,127}));
  connect(ToutEB401Offset.u, EB401.Tout_ref)
    annotation (Line(points={{-381,-300},{-381,-301},{-365,-301}}, color={0,0,127}));
  connect(ToutGB101Offset.u, GB101.Tout_ref)
    annotation (Line(points={{-295,-300},{-295,-301},{-285,-301}}, color={0,0,127}));
  connect(TT902.T,TT902Offset. y)
    annotation (Line(points={{-748.575,196.25},{-748.575,190},{-738,190}}, color={0,0,127}));
  connect(PT902.p, PT902Offset.y)
    annotation (Line(points={{-748.5,181.5},{-748.5,168},{-738,168},{-738,150}}, color={0,0,127}));
  connect(thetaFCVC02Offset.u, FCVC02.opening)
    annotation (Line(points={{709,236},{709,235},{698,235}}, color={0,0,127}));
  connect(thetaFCVC01Offset.u, FCVC01.opening)
    annotation (Line(points={{273,236},{273,235},{258,235}}, color={0,0,127}));
  connect(TT701.T, TT701Offset.y)
    annotation (Line(points={{146.5,-88},{154.25,-88},{154.25,-90},{162,-90}}, color={0,0,127}));
  connect(TT731.T, TT731Offset.y)
    annotation (Line(points={{306.5,-90},{322,-90}}, color={0,0,127}));
  connect(TT711.T, TT711Offset.y)
    annotation (Line(points={{446.5,-86},{452,-86},{452,-90},{462,-90}}, color={0,0,127}));
  connect(TT721.T, TT721Offset.y)
    annotation (Line(points={{606.5,-86},{612,-86},{612,-90},{622,-90}}, color={0,0,127}));
  connect(TT704.T, TT704Offset.y)
    annotation (Line(points={{88.2,-269},{83.1,-269},{83.1,-270},{78,-270}}, color={0,0,127}));
  connect(TT734.T, TT734Offset.y) annotation (Line(points={{248.35,-269.5},{243.175,-269.5},{243.175,
          -270},{238,-270}}, color={0,0,127}));
  connect(TT714.T, TT714Offset.y)
    annotation (Line(points={{388.2,-268},{388.2,-270},{378,-270}}, color={0,0,127}));
  connect(TT724.T, TT724Offset.y)
    annotation (Line(points={{548.2,-272},{543.1,-272},{543.1,-270},{538,-270}}, color={0,0,127}));
  connect(FTR01.q_m3hr, FTR01Offset.y) annotation (Line(points={{834.5,-229},{838.25,-229},{838.25,-230},
          {842,-230}}, color={0,0,127}));
  connect(FT901.q_m3hr, FT902Offset.y)
    annotation (Line(points={{-748.5,166},{-698,166}}, color={0,0,127}));
  connect(controlSignalBus.domegaP901, omegaP901Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-708,-3},{-708,66},{-722,66}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV901, thetaFCV901Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-708,-3},{-708,114},{-722,114}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralisedSystemI_B_InitForward;
