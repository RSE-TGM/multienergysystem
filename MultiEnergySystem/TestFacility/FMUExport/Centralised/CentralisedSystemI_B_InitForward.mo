within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model CentralisedSystemI_B_InitForward
  extends Interfaces.SignalBusConnector;
  extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
  extends Networks.Thermal.Configurations.Centralised.CentralizedSystemLoadSimplifiedI_B(GB101(Pmaxnom = 147.6e3*0.8), FT703(G = 1E-3), FT733(G = 1E-3), FT713(G = 1e-3), FT723(G = 1e-3));
  OffSetBlocks.InputOffset omegaP101Offset(
    fixInput=fixomegaP101,
    u_norm=omegaP101_nom,
    u_start=omegaP101_nom) annotation (Placement(visible=true, transformation(
        origin={-210,-180},
        extent={{10,-10},{-10,10}},
        rotation=0)));

//Boolean Parameters
  //Initialization type
  parameter Boolean ForwardInit = true "True if forward, False if backward";
  //Input
  parameter Boolean fixomegaP901 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixomegaP101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixomegaP401 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV901 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV401 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCVC02 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCV731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowcoolEX701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowcoolEX711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowcoolEX721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowcoolEX731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutGB101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutEB401 = ForwardInit "True if forward, False if backward";

//Output
  final parameter Boolean fixPT902 = not fixomegaP901;
  final parameter Boolean fixPT102 = not fixomegaP101;
  final parameter Boolean fixPT402 = not fixomegaP401;
  final parameter Boolean fixFT901 = not fixthetaFCV901;
  final parameter Boolean fixFT101 = not fixthetaFCV101;
  final parameter Boolean fixFT401 = not fixthetaFCV401;
  final parameter Boolean fixFTA12 = not fixthetaFCVC02;
  final parameter Boolean fixTT704 = not fixthetaFCV701;
  final parameter Boolean fixTT714 = not fixthetaFCV711;
  final parameter Boolean fixTT724 = not fixthetaFCV721;
  final parameter Boolean fixTT734 = not fixthetaFCV731;
  final parameter Boolean fixTT701 = not fixmflowcoolEX701;
  final parameter Boolean fixTT711 = not fixmflowcoolEX711;
  final parameter Boolean fixTT721 = not fixmflowcoolEX721;
  final parameter Boolean fixTT731 = not fixmflowcoolEX731;
  final parameter Boolean fixTT102 = not fixToutGB101;
  final parameter Boolean fixTT402 = not fixToutEB401;


//Additional variables
  final parameter Boolean fixTT902 = false;
  final parameter Boolean fixPT901 = false;
  final parameter Boolean fixPT701 = false;
  final parameter Boolean fixPT702 = false;
  final parameter Boolean fixPT711 = false;
  final parameter Boolean fixPT712 = false;
  final parameter Boolean fixPT721 = false;
  final parameter Boolean fixPT722 = false;
  final parameter Boolean fixPT731 = false;
  final parameter Boolean fixPT732 = false;
  final parameter Boolean fixFT701 = false;
  final parameter Boolean fixFT711 = false;
  final parameter Boolean fixFT721 = false;
  final parameter Boolean fixFT731 = false;

//Normalisation values
  //Nominal values
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1 "Nom. opening valve in the system" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Non dimensional"));
  parameter DistrictHeatingNetwork.Types.Temperature THot_nom = 80 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature TCool_nom = 15 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature ToutGB101_nom = 100 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature ToutEB401_nom = 100 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP901_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP101_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP401_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowcool_nom= 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowhot_nom= 1.3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT901_nom= DistrictHeatingNetwork.Data.PumpData.P901.qnommax_inm3h*980/3600 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT101_nom= DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_nom= DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.Pressure PT901_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT902_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT102_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT402_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT701_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT702_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT711_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT712_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT721_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT722_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT731_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT732_nom = 4e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));

  //  Desired Outputs values
  parameter DistrictHeatingNetwork.Types.Temperature ToutLoad_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT902_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT102_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT402_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
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
  parameter DistrictHeatingNetwork.Types.Pressure PT901_des = 2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT902_des = 2.8e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT102_des = 2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT402_des = 2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT701_des = 2.2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT702_des = 2.7e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT711_des = 2.2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT712_des = 2.7e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT721_des = 2.2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT722_des = 2.7e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT731_des = 2.2e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure PT732_des = 2.7e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT901_des= DistrictHeatingNetwork.Data.PumpData.P901.qnom_inm3h*980/3600 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT101_des= DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h*980/3600  "Desired gas boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_des= DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h*980/3600  "Desired electric boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowhot_des= 1.3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTA12_des= 0.2 "Desired recirculation mass flowrate";


  OffSetBlocks.InputOffset omegaP401Offset(
    fixInput=fixomegaP401,
    u_norm=omegaP401_nom,
    u_start=omegaP401_nom) annotation (Placement(visible=true, transformation(
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
        origin={492,-150},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV721Offset(
    fixInput=fixthetaFCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={646,-150},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX721Offset(
    fixInput=fixmflowcoolEX721,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={530,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV711Offset(
    fixInput=fixmflowcoolEX711,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={370,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV731Offset(
    fixInput=fixmflowcoolEX731,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={214,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX701Offset(
    fixInput=fixmflowcoolEX701,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={56,-320},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV901Offset(
    fixInput=fixthetaFCV901,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-730,114},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset omegaP901Offset(
    fixInput=fixomegaP901,
    u_norm=omegaP901_nom,
    u_start=omegaP901_nom*4/5)
                       annotation (Placement(visible=true, transformation(
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
  OffSetBlocks.OutputOffset TT902Offset(
    fixOutput=fixTT902,
    y_fixed=TT902_des,
    y_norm=TT902_des) annotation (Placement(visible=true, transformation(
        origin={-726,220},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT902Offset(
    fixOutput=fixPT902,
    y_fixed=PT902_des,
    y_norm=PT902_des) annotation (Placement(visible=true, transformation(
        origin={-730,182},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVC02Offset(
    fixInput=fixthetaFCVC02,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={718,236},
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
        origin={492,-90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT721Offset(
    fixOutput=fixTT721,
    y_fixed=TT721_des,
    y_norm=TT721_des) annotation (Placement(visible=true, transformation(
        origin={646,-90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT704Offset(
    fixOutput=fixTT704,
    y_fixed=TT704_des,
    y_norm=TT704_des) annotation (Placement(visible=true, transformation(
        origin={68,-250},
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
  OffSetBlocks.OutputOffset FT901Offset(
    fixOutput=fixFT901,
    y_fixed=FT901_des,
    y_norm=FT901_nom) annotation (Placement(visible=true, transformation(
        origin={-730,150},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.BooleanConstant EB401Status
    annotation (Placement(transformation(extent={{-424,-360},{-404,-340}})));
  Modelica.Blocks.Sources.BooleanConstant GB101Status
    annotation (Placement(transformation(extent={{-334,-378},{-314,-358}})));
  Modelica.Blocks.Sources.BooleanConstant FV401_OnOff(k=FV401_state)
    annotation (Placement(transformation(extent={{-398,-24},{-378,-4}})));
  Modelica.Blocks.Sources.BooleanConstant FV402_OnOff(k=true)
    annotation (Placement(transformation(extent={{-280,-26},{-300,-6}})));
  OffSetBlocks.OutputOffset FT701Offset(
    fixOutput=fixFT701,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={170,-120},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT711Offset(
    fixOutput=fixFT711,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={490,-120},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT721Offset(
    fixOutput=fixFT721,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={646,-120},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT731Offset(
    fixOutput=fixFT731,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={330,-120},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression ThotSP(y=80 + 273.15)
    annotation (Placement(transformation(extent={{-556,-266},{-536,-246}})));
  Modelica.Blocks.Sources.RealExpression TcoolSP(y=15 + 273.15)
    annotation (Placement(transformation(extent={{722,-356},{702,-336}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC01(y=0)
    annotation (Placement(transformation(extent={{292,224},{272,244}})));
  OffSetBlocks.OutputOffset FT401Offset(
    fixOutput=fixFT401,
    y_fixed=FT401_des,
    y_norm=FT401_nom)     annotation (Placement(visible=true, transformation(
        origin={-414,-222},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT101Offset(
    fixOutput=fixFT101,
    y_fixed=FT101_des,
    y_norm=FT101_nom)     annotation (Placement(visible=true, transformation(
        origin={-414,-248},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT102Offset(
    fixOutput=fixPT102,
    y_fixed=PT102_des,
    y_norm=PT102_nom) annotation (Placement(visible=true, transformation(
        origin={-214,-84},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT402Offset(
    fixOutput=fixPT402,
    y_fixed=PT402_des,
    y_norm=PT402_nom) annotation (Placement(visible=true, transformation(
        origin={-292,-82},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FTA12Offset(
    fixOutput=fixFTA12,
    y_fixed=FTA12_des,
    y_norm=FTA12_des) annotation (Placement(visible=true, transformation(
        origin={710,190},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false)
    annotation (Placement(transformation(extent={{-181,51},{-201,71}})));
  OffSetBlocks.OutputOffset TT102Offset(
    fixOutput=fixTT102,
    y_fixed=TT102_des,
    y_norm=TT102_des) annotation (Placement(visible=true, transformation(
        origin={-214,-56},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT402Offset(
    fixOutput=fixTT402,
    y_fixed=TT402_des,
    y_norm=TT402_des) annotation (Placement(visible=true, transformation(
        origin={-292,-56},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT901Offset(
    fixOutput=fixPT901,
    y_fixed=PT901_des,
    y_norm=PT901_des) annotation (Placement(visible=true, transformation(
        origin={-844,162},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT701Offset(
    fixOutput=fixPT701,
    y_fixed=PT701_des,
    y_norm=PT701_nom) annotation (Placement(visible=true, transformation(
        origin={170,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT702Offset(
    fixOutput=fixPT702,
    y_fixed=PT702_des,
    y_norm=PT702_nom) annotation (Placement(visible=true, transformation(
        origin={74,-80},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT732Offset(
    fixOutput=fixPT732,
    y_fixed=PT732_des,
    y_norm=PT732_nom) annotation (Placement(visible=true, transformation(
        origin={238,-80},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT712Offset(
    fixOutput=fixPT712,
    y_fixed=PT712_des,
    y_norm=PT712_nom) annotation (Placement(visible=true, transformation(
        origin={396,-80},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT722Offset(
    fixOutput=fixPT722,
    y_fixed=PT722_des,
    y_norm=PT722_nom) annotation (Placement(visible=true, transformation(
        origin={556,-80},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT731Offset(
    fixOutput=fixPT731,
    y_fixed=PT731_des,
    y_norm=PT731_nom) annotation (Placement(visible=true, transformation(
        origin={330,-64},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT711Offset(
    fixOutput=fixPT711,
    y_fixed=PT711_des,
    y_norm=PT711_nom) annotation (Placement(visible=true, transformation(
        origin={492,-66},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT721Offset(
    fixOutput=fixPT721,
    y_fixed=PT721_des,
    y_norm=PT721_nom) annotation (Placement(visible=true, transformation(
        origin={646,-66},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutEB401Offset(
    fixInput=fixToutEB401,
    u_norm=ToutEB401_nom,
    u_start=TT402_des)     annotation (Placement(visible=true, transformation(
        origin={-418,-300},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutGB101Offset(
    fixInput=fixToutGB101,
    u_norm=ToutGB101_nom,
    u_start=TT102_des)     annotation (Placement(visible=true, transformation(
        origin={-418,-276},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(FCV701.opening, thetaFCV701Offset.u)    annotation (Line(points={{148,-150},{161,-150}}, color={0,0,127}));
  connect(thetaFCV731Offset.u, FCV731.opening)    annotation (Line(points={{321,-150},{308,-150}}, color={0,0,127}));
  connect(thetaFCV711Offset.u, FCV711.opening)    annotation (Line(points={{483,-150},{468,-150}}, color={0,0,127}));
  connect(thetaFCV721Offset.u, FCV721.opening)    annotation (Line(points={{637,-150},{628,-150}}, color={0,0,127}));
  connect(thetaFCV901Offset.u, FCV901.opening)    annotation (Line(points={{-739,114},{-744,114},{-744,140.5},{-749.9,140.5}},
                                                                                                                         color={0,0,127}));
  connect(omegaP901Offset.u, P901.in_omega) annotation (Line(points={{-739,66},{-743.125,66},{-743.125,
          66.3},{-747.25,66.3}}, color={0,0,127}));
  connect(thetaFCV101Offset.u, FCV101.opening)    annotation (Line(points={{-219,-140},{-226,-140},{-226,-110},{-232,-110}},
                                                       color={0,0,127}));
  connect(thetaFCV401Offset.u, FCV401.opening)    annotation (Line(points={{-303,-136},{-306,-136},{-306,-110},{-310,-110}},
                                                                                                     color={0,0,127}));
  connect(TT902.T,TT902Offset. y)    annotation (Line(points={{-748.575,196.25},{-748.575,208},{-734,208},{-734,220}},
                                                                           color={0,0,127}));
  connect(PT902.p, PT902Offset.y)    annotation (Line(points={{-748.5,181.5},{-743.25,181.5},{-743.25,182},{-738,182}},
                                                                                 color={0,0,127}));
  connect(thetaFCVC02Offset.u, FCVC02.opening)    annotation (Line(points={{709,236},{709,235},{698,235}}, color={0,0,127}));
  connect(TT701.T, TT701Offset.y)    annotation (Line(points={{148.5,-88},{154.25,-88},{154.25,-90},{162,-90}}, color={0,0,127}));
  connect(TT731.T, TT731Offset.y)    annotation (Line(points={{308.5,-90},{322,-90}}, color={0,0,127}));
  connect(TT711.T, TT711Offset.y)    annotation (Line(points={{468.5,-86},{452,-86},{452,-90},{484,-90}}, color={0,0,127}));
  connect(TT721.T, TT721Offset.y)    annotation (Line(points={{628.5,-86},{612,-86},{612,-90},{638,-90}}, color={0,0,127}));
  connect(TT704.T, TT704Offset.y)    annotation (Line(points={{90.2,-251},{83.1,-251},{83.1,-250},{76,-250}}, color={0,0,127}));
  connect(TT734.T, TT734Offset.y) annotation (Line(points={{250.35,-251.5},{243.175,-251.5},{243.175,
          -270},{238,-270}}, color={0,0,127}));
  connect(TT714.T, TT714Offset.y)    annotation (Line(points={{410.2,-250},{410.2,-270},{378,-270}}, color={0,0,127}));
  connect(TT724.T, TT724Offset.y)    annotation (Line(points={{570.2,-254},{543.1,-254},{543.1,-270},{538,-270}}, color={0,0,127}));
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
  connect(mflowEX701Offset.u, FT703.in_m_flow)    annotation (Line(points={{65,-320},{80,-320},{80,-305}}, color={0,0,127}));
  connect(thetaTCV731Offset.u, FT733.in_m_flow)    annotation (Line(points={{223,-320},{238,-320},{238,-305}}, color={0,0,127}));
  connect(thetaTCV711Offset.u, FT713.in_m_flow)    annotation (Line(points={{379,-320},{400,-320},{400,-305}}, color={0,0,127}));
  connect(mflowEX721Offset.u, FT723.in_m_flow)    annotation (Line(points={{539,-320},{566,-320},{566,-305}}, color={0,0,127}));
  connect(EB401Status.y, EB401.heat_on)    annotation (Line(points={{-403,-350},{-388,-350},{-388,-318.5},{-361.5,-318.5}},
                                                                                                                      color={255,0,255}));
  connect(GB101Status.y, GB101.heat_on)    annotation (Line(points={{-313,-368},{-300,-368},{-300,-318.5},{-281.5,-318.5}},
                                                                                                                      color={255,0,255}));
  connect(FV402_OnOff.y, FV402.u)    annotation (Line(points={{-301,-16},{-314.8,-16}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401.u) annotation (Line(points={{-377,-14},{-369.1,-14},{-369.1,-16},{-361.2,
          -16}}, color={255,0,255}));
  connect(omegaP101Offset.u, P101.in_omega) annotation (Line(points={{-219,-180},{-226.5,-180},{-226.5,
          -179.8},{-234,-179.8}}, color={0,0,127}));
  connect(omegaP401Offset.u, P401.in_omega) annotation (Line(points={{-305,-176},{-308.5,-176},{-308.5,
          -175.8},{-312,-175.8}}, color={0,0,127}));
  connect(FT701.m_flow, FT701Offset.y) annotation (Line(points={{145,-100.5},{145,-98},{154,-98},{154,
          -120},{162,-120}}, color={0,0,127}));
  connect(FT711.m_flow, FT711Offset.y) annotation (Line(points={{465,-98.5},{465,-96},{472,-96},{472,
          -120},{482,-120}}, color={0,0,127}));
  connect(FT721.m_flow, FT721Offset.y) annotation (Line(points={{625,-98.5},{625,-94},{630,-94},{630,
          -120},{638,-120}}, color={0,0,127}));
  connect(FT731.m_flow, FT731Offset.y) annotation (Line(points={{305,-102.5},{305,-100},{314,-100},{
          314,-120},{322,-120}}, color={0,0,127}));
  connect(TcoolSP.y, VER3.in_T0) annotation (Line(points={{701,-346},{450,-346},{450,-354},{182,-354},
          {182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(VER2.in_T0, VER3.in_T0) annotation (Line(points={{319,-290.6},{319,-278},{342,-278},{342,-354},
          {182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(VER1.in_T0, VER3.in_T0) annotation (Line(points={{479,-290.6},{479,-278},{502,-278},{502,-346},
          {450,-346},{450,-354},{182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(VER901.in_T0, VER3.in_T0) annotation (Line(points={{641,-288.6},{641,-270},{674,-270},{674,
          -346},{450,-346},{450,-354},{182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(thetaFCVC01.y, FCVC01.opening) annotation (Line(points={{271,234},{264.5,234},{264.5,235},{258,235}}, color={0,0,127}));
  connect(controlSignalBus.domegaP101, omegaP101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-706,-3},{-706,-202},{-176,-202},{-176,-180},{-202,-180}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV101, thetaFCV101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-720,-3},{-720,-208},{-170,-208},{-170,-140},{-202,-140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.domegaP401, omegaP401Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-710,-3},{-710,-196},{-266,-196},{-266,-176},{-288,-176}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV401, thetaFCV401Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-704,-3},{-704,-198},{-266,-198},{-266,-136},{-286,-136}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCVC02, thetaFCVC02Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-830,-3},{-830,252},{752,252},{752,236},{726,236}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT401Offset.y, FT401.m_flow) annotation (Line(points={{-406,-222},{-366,-222},{-366,-195.9},
          {-365.2,-195.9}}, color={0,0,127}));
  connect(FT101Offset.y, FT101.m_flow) annotation (Line(points={{-406,-248},{-284,-248},{-284,-199.9},
          {-283.2,-199.9}}, color={0,0,127}));
  connect(PT102.p, PT102Offset.y)    annotation (Line(points={{-230.2,-84},{-222,-84}}, color={0,0,127}));
  connect(PT402.p, PT402Offset.y)    annotation (Line(points={{-308.2,-82},{-300,-82}}, color={0,0,127}));
  connect(FTA12.m_flow, FTA12Offset.y)    annotation (Line(points={{672.8,200.6},{676,200.6},{676,190},{702,190}}, color={0,0,127}));
  connect(controlSignalBus.dthetaFCV701, thetaFCV701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-724,-3},{-724,-434},{200,-434},{200,-150},{178,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV731, thetaFCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-760,-3},{-760,-442},{362,-442},{362,-150},{338,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV711, thetaFCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-766,-3},{-766,-452},{522,-452},{522,-150},{500,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV721, thetaFCV721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-802,-3},{-802,-458},{668,-458},{668,-150},{654,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dmflowcoolEX701, mflowEX701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-726,-3},{-726,-394},{36,-394},{36,-320},{48,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowcoolEX731, thetaTCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-740,-3},{-740,-406},{188,-406},{188,-318},{206,-318},{206,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowcoolEX711, thetaTCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-744,-3},{-744,-416},{352,-416},{352,-320},{362,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowcoolEX721, mflowEX721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-762,-3},{-762,-428},{512,-428},{512,-320},{522,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{-202,61},{-208,61},{-208,62},{-218,62},{
          -218,46.6}}, color={255,0,255}));
  connect(processVariableBus.dPT902, PT902Offset.deltaYnorm) annotation (Line(
      points={{896,-3},{746,-3},{746,182},{-721,182}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT901Offset.deltaYnorm, processVariableBus.dFT901) annotation (Line(points={{-721,150},{0,
          150},{0,154},{732,154},{732,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT102Offset.deltaYnorm, processVariableBus.dPT102) annotation (Line(points={{-205,-84},{-116,
          -84},{-116,-78},{-32,-78},{-32,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT101Offset.deltaYnorm, processVariableBus.dFT101) annotation (Line(points={{-423,-248},{-444,
          -248},{-444,-380},{782,-380},{782,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT402Offset.deltaYnorm, processVariableBus.dPT402) annotation (Line(points={{-283,-82},{-252,
          -82},{-252,-62},{26,-62},{26,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT401Offset.deltaYnorm, processVariableBus.dFT401) annotation (Line(points={{-423,-222},{-464,-222},{-464,-388},{888,-388},{888,-3},{896,-3}},
                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FTA12Offset.deltaYnorm, processVariableBus.dFTA12) annotation (Line(points={{719,190},{770,
          190},{770,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT701Offset.deltaYnorm, processVariableBus.dFT701) annotation (Line(points={{179,-120},{198,
          -120},{198,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT711Offset.deltaYnorm, processVariableBus.dFT711) annotation (Line(points={{499,-120},{514,
          -120},{514,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT721Offset.deltaYnorm, processVariableBus.dFT721) annotation (Line(points={{655,-120},{690,
          -120},{690,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT731Offset.deltaYnorm, processVariableBus.dFT731) annotation (Line(points={{339,-120},{370,
          -120},{370,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT704Offset.deltaYnorm, processVariableBus.dTT704) annotation (Line(points={{59,-250},{40,-250},{40,-180},{838,-180},{838,-3},{896,-3}},
                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT714Offset.deltaYnorm, processVariableBus.dTT714) annotation (Line(points={{361,-270},{352,
          -270},{352,-272},{340,-272},{340,-182},{808,-182},{808,-3},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT724Offset.deltaYnorm, processVariableBus.dTT724) annotation (Line(points={{521,-270},{506,
          -270},{506,-184},{814,-184},{814,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT734Offset.deltaYnorm, processVariableBus.dTT734) annotation (Line(points={{221,-270},{212,
          -270},{212,-180},{808,-180},{808,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT701Offset.deltaYnorm, processVariableBus.dTT701) annotation (Line(points={{179,-90},{200,
          -90},{200,-88},{226,-88},{226,-6},{896,-6},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT711Offset.deltaYnorm, processVariableBus.dTT711) annotation (Line(points={{501,-90},{516,
          -90},{516,-88},{536,-88},{536,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT721Offset.deltaYnorm, processVariableBus.dTT721) annotation (Line(points={{655,-90},{670,
          -90},{670,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT731Offset.deltaYnorm, processVariableBus.dTT731) annotation (Line(points={{339,-90},{382,
          -90},{382,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT902Offset.deltaYnorm, processVariableBus.dTT902) annotation (Line(points={{-717,220},{832,
          220},{832,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT901.m_flow, FT901Offset.y) annotation (
    Line(points={{-752,169.5},{-748,169.5},{-748,150},{-738,150}},      color = {0, 0, 127}));
  connect(TT102.T, TT102Offset.y) annotation (Line(points={{-230.2,-72},{-226,-72},{-226,-56},{-222,-56}}, color={0,0,127}));
  connect(TT402.T, TT402Offset.y) annotation (Line(points={{-308.2,-70},{-306,-70},{-306,-56},{-300,-56}}, color={0,0,127}));
  connect(TT102Offset.deltaYnorm, processVariableBus.dTT102) annotation (Line(points={{-205,-56},{-184,-56},{-184,-54},{-130,-54},{-130,0},{896,0},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT402Offset.deltaYnorm, processVariableBus.dTT402) annotation (Line(points={{-283,-56},{-256,-56},{-256,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT901.p, PT901Offset.y) annotation (Line(points={{-816.5,162.5},{-826.25,162.5},{-826.25,162},{-836,162}}, color={0,0,127}));
  connect(PT901Offset.deltaYnorm, processVariableBus.dPT901) annotation (Line(points={{-853,162},{-876,162},{-876,282},{820,282},{820,14},{896,14},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT701.p, PT701Offset.y) annotation (Line(points={{148.5,-74},{156,-74},{156,-60},{162,-60}}, color={0,0,127}));
  connect(PT702.p, PT702Offset.y) annotation (Line(points={{91.5,-80},{82,-80}}, color={0,0,127}));
  connect(PT701Offset.deltaYnorm, processVariableBus.dPT701) annotation (Line(points={{179,-60},{190,-60},{190,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT702Offset.deltaYnorm, processVariableBus.dPT702) annotation (Line(points={{65,-80},{60,-80},{60,-76},{66,-76},{66,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT732.p, PT732Offset.y) annotation (Line(points={{251.5,-80},{246,-80}}, color={0,0,127}));
  connect(PT712.p, PT712Offset.y) annotation (Line(points={{411.5,-80},{404,-80}}, color={0,0,127}));
  connect(PT722.p, PT722Offset.y) annotation (Line(points={{571.5,-80},{564,-80}}, color={0,0,127}));
  connect(PT732Offset.deltaYnorm, processVariableBus.dPT732) annotation (Line(points={{229,-80},{220,-80},{220,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT712Offset.deltaYnorm, processVariableBus.dPT712) annotation (Line(points={{387,-80},{376,-80},{376,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT722Offset.deltaYnorm, processVariableBus.dPT722) annotation (Line(points={{547,-80},{544,-80},{544,-6},{896,-6},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT731.p, PT731Offset.y) annotation (Line(points={{308.5,-76},{312,-76},{312,-64},{322,-64},{322,-64}}, color={0,0,127}));
  connect(PT711.p, PT711Offset.y) annotation (Line(points={{468.5,-72},{474,-72},{474,-66},{484,-66}}, color={0,0,127}));
  connect(PT721.p, PT721Offset.y) annotation (Line(points={{628.5,-72},{630,-72},{630,-70},{632,-70},{632,-66},{638,-66}}, color={0,0,127}));
  connect(PT731Offset.deltaYnorm, processVariableBus.dPT731) annotation (Line(points={{339,-64},{358,-64},{358,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT711Offset.deltaYnorm, processVariableBus.dPT711) annotation (Line(points={{501,-66},{526,-66},{526,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT721Offset.deltaYnorm, processVariableBus.dPT721) annotation (Line(points={{655,-66},{662,-66},{662,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ToutEB401Offset.u, EB401.Tout_ref) annotation (Line(points={{-409,-300},{-386.25,-300},{-386.25,-301},{-361.5,-301}}, color={0,0,127}));
  connect(controlSignalBus.dToutEB401, ToutEB401Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-850,-3},{-850,-300},{-426,-300}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(ToutGB101Offset.u, GB101.Tout_ref) annotation (Line(points={{-409,-276},{-290,-276},{-290,-301},{-281.5,-301}}, color={0,0,127}));
  connect(controlSignalBus.dToutGB101, ToutGB101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-852,-3},{-852,-280},{-426,-280},{-426,-276}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-60,40},{60,-40}},
          textColor={140,56,54},
          textStyle={TextStyle.Bold},
          textString="Thermal
Facility")}),                                                    Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralisedSystemI_B_InitForward;
