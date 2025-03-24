within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model CentralisedSystemCoolingSimplifiedI_B_InitForward
  extends Interfaces.SignalBusConnector;
  extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
  extends Networks.Thermal.Configurations.Centralised.CentralizedSystemLoadSimplifiedI_B(
    T_start_hot = 80 +273.15,
    T_start_cold = 70 + 273.15,
    GB101(Pmaxnom = 147.6e3*0.8),
    EX701_Tin_cold = 15 + 273.15,
    EX711_Tin_cold = 15 + 273.15,
    EX721_Tin_cold = 15 + 273.15,
    EX731_Tin_cold = 15 + 273.15,
    EX701_Tout_cold = 25 + 273.15,
    EX711_Tout_cold = 25 + 273.15,
    EX721_Tout_cold = 25 + 273.15,
    EX731_Tout_cold = 25 + 273.15,
    EX701(wall(Tstart1=345.15, TstartN=328.15)),
    EX731(wall(Tstart1=345.15, TstartN=328.15)),
    EX711(wall(Tstart1=345.15, TstartN=328.15)),
    sourceGas(computeTransport=false, computeEnergyVariables=false));

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
  parameter Boolean fixthetaFCVC01 = ForwardInit "True if forward, False if backward";
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
  //final parameter Boolean fixPT902 = not fixomegaP901;
  final parameter Boolean fixdPTA2 = not fixomegaP901;
  final parameter Boolean fixPT102 = not fixomegaP101;
  final parameter Boolean fixPT402 = not fixomegaP401;
  final parameter Boolean fixFT901 = not fixthetaFCV901;
  final parameter Boolean fixFT101 = not fixthetaFCV101;
  final parameter Boolean fixFT401 = not fixthetaFCV401;
  final parameter Boolean fixdPTA1 = not fixthetaFCVC01;
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
  final parameter Boolean fixPT902 = false;
  final parameter Boolean fixEX701Pt = false;
  final parameter Boolean fixEX711Pt = false;
  final parameter Boolean fixEX721Pt = false;
  final parameter Boolean fixEX731Pt = false;

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
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT901_nom= TestFacility.Data.PumpData.P901.qnommax_inm3h*980/3600 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT101_nom= TestFacility.Data.PumpData.P101.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_nom= TestFacility.Data.PumpData.P401.qnommax_inm3h*980/3600;
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
  parameter DistrictHeatingNetwork.Types.Pressure EX701Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));

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
  parameter DistrictHeatingNetwork.Types.Pressure dPTS100_des = 0E5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure dPTS400_des = 0E5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure dPTA1_des = 0.015e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.Pressure dPTA2_des = 0.015e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT901_des= TestFacility.Data.PumpData.P901.qnom_inm3h*980/3600 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT101_des= TestFacility.Data.PumpData.P101.qnom_inm3h*980/3600  "Desired gas boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_des= TestFacility.Data.PumpData.P401.qnom_inm3h*980/3600  "Desired electric boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowhot_des= 1.3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTA12_des= 0.2 "Desired recirculation mass flowrate";
  parameter DistrictHeatingNetwork.Types.Pressure EX701Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));

  DistrictHeatingNetwork.Types.Power Pt1(nominal = 50e3, start = 40e3);
  DistrictHeatingNetwork.Types.Power Pt2(nominal = 50e3, start = 40e3);
  DistrictHeatingNetwork.Types.Power Pt3(nominal = 50e3, start = 40e3);
  DistrictHeatingNetwork.Types.Power Pt4(nominal = 50e3, start = 40e3);

  OffSetBlocks.InputOffset omegaP101Offset(
    fixInput=fixomegaP101,
    u_norm=omegaP101_nom,
    u_start=omegaP101_nom) annotation (Placement(visible=true, transformation(
        origin={-200,-180},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset omegaP401Offset(
    fixInput=fixomegaP401,
    u_norm=omegaP401_nom,
    u_start=omegaP401_nom) annotation (Placement(visible=true, transformation(
        origin={-300,-176},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV701Offset(
    fixInput=fixthetaFCV701,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={166,-150},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV731Offset(
    fixInput=fixthetaFCV731,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={326,-150},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV711Offset(
    fixInput=fixthetaFCV711,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={486,-150},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV721Offset(
    fixInput=fixthetaFCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={642,-150},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX721Offset(
    fixInput=fixmflowcoolEX721,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={534,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV711Offset(
    fixInput=fixmflowcoolEX711,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={374,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV731Offset(
    fixInput=fixmflowcoolEX731,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={220,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX701Offset(
    fixInput=fixmflowcoolEX701,
    u_norm=m_flowcool_nom,
    u_start=m_flowcool_nom)
                       annotation (Placement(visible=true, transformation(
        origin={62,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV901Offset(
    fixInput=fixthetaFCV901,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-704,112},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset omegaP901Offset(
    fixInput=fixomegaP901,
    u_norm=omegaP901_nom,
    u_start=omegaP901_nom)
                       annotation (Placement(visible=true, transformation(
        origin={-734,66},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV101Offset(
    fixInput=fixthetaFCV101,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-184,-110},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV401Offset(
    fixInput=fixthetaFCV401,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-266,-140},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT902Offset(
    fixOutput=fixTT902,
    y_fixed=TT902_des,
    y_norm=TT902_des) annotation (Placement(visible=true, transformation(
        origin={-734,198},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT902Offset(
    fixOutput=fixPT902,
    y_fixed=PT902_des,
    y_norm=PT902_des) annotation (Placement(visible=true, transformation(
        origin={-734,182},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVC02Offset(
    fixInput=fixthetaFCVC02,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={758,236},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT701Offset(
    fixOutput=fixTT701,
    y_fixed=TT701_des,
    y_norm=TT701_des) annotation (Placement(visible=true, transformation(
        origin={166,-88},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT731Offset(
    fixOutput=fixTT731,
    y_fixed=TT731_des,
    y_norm=TT731_des) annotation (Placement(visible=true, transformation(
        origin={326,-90},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT711Offset(
    fixOutput=fixTT711,
    y_fixed=TT711_des,
    y_norm=TT711_des) annotation (Placement(visible=true, transformation(
        origin={486,-86},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT721Offset(
    fixOutput=fixTT721,
    y_fixed=TT721_des,
    y_norm=TT721_des) annotation (Placement(visible=true, transformation(
        origin={642,-86},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT704Offset(
    fixOutput=fixTT704,
    y_fixed=TT704_des,
    y_norm=TT704_des) annotation (Placement(visible=true, transformation(
        origin={80,-252},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT734Offset(
    fixOutput=fixTT734,
    y_fixed=TT734_des,
    y_norm=TT734_des) annotation (Placement(visible=true, transformation(
        origin={232,-252},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT714Offset(
    fixOutput=fixTT714,
    y_fixed=TT714_des,
    y_norm=TT714_des) annotation (Placement(visible=true, transformation(
        origin={388,-250},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT724Offset(
    fixOutput=fixTT724,
    y_fixed=TT724_des,
    y_norm=TT724_des) annotation (Placement(visible=true, transformation(
        origin={560,-254},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT901Offset(
    fixOutput=fixFT901,
    y_fixed=FT901_des,
    y_norm=FT901_nom) annotation (Placement(visible=true, transformation(
        origin={-734,166},
        extent={{-6,-6},{6,6}},
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
        origin={166,-104},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT711Offset(
    fixOutput=fixFT711,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={486,-102},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT721Offset(
    fixOutput=fixFT721,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={642,-102},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT731Offset(
    fixOutput=fixFT731,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des)
                      annotation (Placement(visible=true, transformation(
        origin={326,-106},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression TcoolSP(y=15 + 273.15)
    annotation (Placement(transformation(extent={{722,-356},{702,-336}})));
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
    y_fixed=dPTS100_des,
    y_norm=PT102_nom) annotation (Placement(visible=true, transformation(
        origin={-152,-80},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT402Offset(
    fixOutput=fixPT402,
    y_fixed=dPTS400_des,
    y_norm=PT402_nom) annotation (Placement(visible=true, transformation(
        origin={-150,-30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FTA12Offset(
    fixOutput=fixFTA12,
    y_fixed=FTA12_des,
    y_norm=FTA12_des) annotation (Placement(visible=true, transformation(
        origin={714,194},
        extent={{-6,-6},{6,6}},
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
        origin={166,-72},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT702Offset(
    fixOutput=fixPT702,
    y_fixed=PT702_des,
    y_norm=PT702_nom) annotation (Placement(visible=true, transformation(
        origin={78,-80},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT732Offset(
    fixOutput=fixPT732,
    y_fixed=PT732_des,
    y_norm=PT732_nom) annotation (Placement(visible=true, transformation(
        origin={242,-80},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT712Offset(
    fixOutput=fixPT712,
    y_fixed=PT712_des,
    y_norm=PT712_nom) annotation (Placement(visible=true, transformation(
        origin={402,-80},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT722Offset(
    fixOutput=fixPT722,
    y_fixed=PT722_des,
    y_norm=PT722_nom) annotation (Placement(visible=true, transformation(
        origin={560,-80},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT731Offset(
    fixOutput=fixPT731,
    y_fixed=PT731_des,
    y_norm=PT731_nom) annotation (Placement(visible=true, transformation(
        origin={326,-74},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT711Offset(
    fixOutput=fixPT711,
    y_fixed=PT711_des,
    y_norm=PT711_nom) annotation (Placement(visible=true, transformation(
        origin={486,-70},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT721Offset(
    fixOutput=fixPT721,
    y_fixed=PT721_des,
    y_norm=PT721_nom) annotation (Placement(visible=true, transformation(
        origin={642,-70},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutEB401Offset(
    fixInput=fixToutEB401,
    u_norm=ToutEB401_nom,
    u_start=TT402_des)     annotation (Placement(visible=true, transformation(
        origin={-414,-300},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutGB101Offset(
    fixInput=fixToutGB101,
    u_norm=ToutGB101_nom,
    u_start=TT102_des)     annotation (Placement(visible=true, transformation(
        origin={-414,-280},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset dPTA2Offset(
    fixOutput=fixdPTA2,
    y_fixed=dPTA2_des,
    y_norm=dPTA2_des) annotation (Placement(visible=true, transformation(
        origin={810,260},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Math.Add diffPT2(k1=-1) annotation (Placement(transformation(extent={{764,250},{784,270}})));
  OffSetBlocks.InputOffset thetaFCVC01Offset(
    fixInput=fixthetaFCVC01,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={314,234},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset dPTA1Offset(
    fixOutput=fixdPTA1,
    y_fixed=dPTA1_des,
    y_norm=dPTA1_des) annotation (Placement(visible=true, transformation(
        origin={300,294},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Math.Add diffPT1(k1=-1) annotation (Placement(transformation(extent={{258,284},{278,304}})));
  Modelica.Blocks.Continuous.FirstOrder FCVC01Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=0) annotation (Placement(transformation(extent={{290,224},{270,244}})));
  Modelica.Blocks.Continuous.FirstOrder FCVC02Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=0) annotation (Placement(transformation(extent={{732,226},{712,246}})));
  Modelica.Blocks.Continuous.FirstOrder FCV101Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{-208,-116},{-220,-104}})));
  Modelica.Blocks.Continuous.FirstOrder FCV901Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{-720,102},{-740,122}})));
  Modelica.Blocks.Math.Add diffPTS400(k1=-1) annotation (Placement(transformation(extent={{-204,-40},{-184,-20}})));
  Modelica.Blocks.Math.Add diffPTS100(k1=-1) annotation (Placement(transformation(extent={{-200,-86},{-188,-74}})));
  Modelica.Blocks.Sources.RealExpression EX701Power(y=Pt1) annotation (Placement(transformation(extent={{704,-250},{724,-230}})));
  Modelica.Blocks.Sources.RealExpression EX711Power(y=Pt2) annotation (Placement(transformation(extent={{704,-270},{724,-250}})));
  Modelica.Blocks.Sources.RealExpression EX721Power(y=Pt3) annotation (Placement(transformation(extent={{704,-290},{724,-270}})));
  Modelica.Blocks.Sources.RealExpression EX731Power(y=Pt4) annotation (Placement(transformation(extent={{704,-310},{724,-290}})));
  OffSetBlocks.OutputOffset EX701PtOffset(
    fixOutput=fixEX701Pt,
    y_fixed=EX701Pt_des,
    y_norm=EX701Pt_nom) annotation (Placement(visible=true, transformation(
        origin={746,-240},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX711PtOffset(
    fixOutput=fixEX711Pt,
    y_fixed=EX711Pt_des,
    y_norm=EX711Pt_nom) annotation (Placement(visible=true, transformation(
        origin={746,-260},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX721PtOffset(
    fixOutput=fixEX721Pt,
    y_fixed=EX721Pt_des,
    y_norm=EX721Pt_nom) annotation (Placement(visible=true, transformation(
        origin={746,-280},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX731PtOffset(
    fixOutput=fixEX731Pt,
    y_fixed=EX731Pt_des,
    y_norm=EX731Pt_nom) annotation (Placement(visible=true, transformation(
        origin={746,-300},
        extent={{-6,-6},{6,6}},
        rotation=0)));
equation
  Pt1 = EX701.Pt;
  Pt2 = EX711.Pt;
  Pt3 = EX721.Pt;
  Pt4 = EX731.Pt;
  connect(FCV701.opening, thetaFCV701Offset.u)    annotation (Line(points={{148,-150},{160.6,-150}},
                                                                                                   color={0,0,127}));
  connect(thetaFCV731Offset.u, FCV731.opening)    annotation (Line(points={{320.6,-150},{308,-150}},
                                                                                                   color={0,0,127}));
  connect(thetaFCV711Offset.u, FCV711.opening)    annotation (Line(points={{480.6,-150},{468,-150}},
                                                                                                   color={0,0,127}));
  connect(thetaFCV721Offset.u, FCV721.opening)    annotation (Line(points={{636.6,-150},{628,-150}},
                                                                                                   color={0,0,127}));
  connect(omegaP901Offset.u, P901.in_omega) annotation (Line(points={{-739.4,66},{-739.4,66.3},{-747.25,66.3}},
                                 color={0,0,127}));
  connect(TT902.T,TT902Offset. y)    annotation (Line(points={{-748.575,196.25},{-743.688,196.25},{-743.688,198},{-738.8,198}},
                                                                           color={0,0,127}));
  connect(PT902.p, PT902Offset.y)    annotation (Line(points={{-748.5,181.5},{-748.5,182},{-738.8,182}},
                                                                                 color={0,0,127}));
  connect(TT701.T, TT701Offset.y)    annotation (Line(points={{148.5,-88},{161.2,-88}},                         color={0,0,127}));
  connect(TT731.T, TT731Offset.y)    annotation (Line(points={{308.5,-90},{321.2,-90}},
                                                                                      color={0,0,127}));
  connect(TT711.T, TT711Offset.y)    annotation (Line(points={{468.5,-86},{481.2,-86}},                   color={0,0,127}));
  connect(TT721.T, TT721Offset.y)    annotation (Line(points={{628.5,-86},{637.2,-86}},                   color={0,0,127}));
  connect(TT704.T, TT704Offset.y)    annotation (Line(points={{90.2,-251},{90.2,-252},{84.8,-252}},           color={0,0,127}));
  connect(TT734.T, TT734Offset.y) annotation (Line(points={{250.35,-251.5},{243.575,-251.5},{243.575,-252},{236.8,-252}},
                             color={0,0,127}));
  connect(TT714.T, TT714Offset.y)    annotation (Line(points={{410.2,-250},{392.8,-250}},            color={0,0,127}));
  connect(TT724.T, TT724Offset.y)    annotation (Line(points={{570.2,-254},{564.8,-254}},                         color={0,0,127}));
  connect(controlSignalBus.domegaP901, omegaP901Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-700,-3},{-700,66},{-729.2,66}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV901, thetaFCV901Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-692,-3},{-692,112},{-699.2,112}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(mflowEX701Offset.u, FT703.in_m_flow)    annotation (Line(points={{67.4,-320},{80,-320},{80,-305}},
                                                                                                           color={0,0,127}));
  connect(thetaTCV731Offset.u, FT733.in_m_flow)    annotation (Line(points={{225.4,-320},{238,-320},{238,-305}},
                                                                                                               color={0,0,127}));
  connect(thetaTCV711Offset.u, FT713.in_m_flow)    annotation (Line(points={{379.4,-320},{400,-320},{400,-305}},
                                                                                                               color={0,0,127}));
  connect(mflowEX721Offset.u, FT723.in_m_flow)    annotation (Line(points={{539.4,-320},{566,-320},{566,-305}},
                                                                                                              color={0,0,127}));
  connect(EB401Status.y, EB401.heat_on)    annotation (Line(points={{-403,-350},{-388,-350},{-388,-318.5},{-361.5,-318.5}},
                                                                                                                      color={255,0,255}));
  connect(GB101Status.y, GB101.heat_on)    annotation (Line(points={{-313,-368},{-300,-368},{-300,-318.5},{-281.5,-318.5}},
                                                                                                                      color={255,0,255}));
  connect(FV402_OnOff.y, FV402.u)    annotation (Line(points={{-301,-16},{-314.8,-16}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401.u) annotation (Line(points={{-377,-14},{-369.1,-14},{-369.1,-16},{-361.2,
          -16}}, color={255,0,255}));
  connect(omegaP101Offset.u, P101.in_omega) annotation (Line(points={{-205.4,-180},{-219.7,-180},{-219.7,-179.8},{-234,-179.8}},
                                  color={0,0,127}));
  connect(omegaP401Offset.u, P401.in_omega) annotation (Line(points={{-305.4,-176},{-308.5,-176},{-308.5,-175.8},{-312,-175.8}},
                                  color={0,0,127}));
  connect(FT701.m_flow, FT701Offset.y) annotation (Line(points={{145,-100.5},{145,-98},{154,-98},{154,-104},{161.2,-104}},
                             color={0,0,127}));
  connect(FT711.m_flow, FT711Offset.y) annotation (Line(points={{465,-98.5},{466,-98.5},{466,-98},{474,-98},{474,-102},{481.2,-102}},
                             color={0,0,127}));
  connect(FT721.m_flow, FT721Offset.y) annotation (Line(points={{625,-98.5},{626,-98.5},{626,-98},{632,-98},{632,-102},{637.2,-102}},
                             color={0,0,127}));
  connect(FT731.m_flow, FT731Offset.y) annotation (Line(points={{305,-102.5},{313.1,-102.5},{313.1,-106},{321.2,-106}},
                                 color={0,0,127}));
  connect(TcoolSP.y, coldSourcePEX701.in_T0) annotation (Line(points={{701,-346},{450,-346},{450,-354},{182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(coldSourcePEX731.in_T0, coldSourcePEX701.in_T0)
    annotation (Line(points={{319,-290.6},{319,-278},{342,-278},{342,-354},{182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(coldSourcePEX711.in_T0, coldSourcePEX701.in_T0)
    annotation (Line(points={{479,-290.6},{479,-278},{502,-278},{502,-346},{450,-346},{450,-354},{182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(coldSourcePEX721.in_T0, coldSourcePEX701.in_T0)
    annotation (Line(points={{641,-288.6},{641,-270},{674,-270},{674,-346},{450,-346},{450,-354},{182,-354},{182,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(controlSignalBus.domegaP101, omegaP101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-336,-3},{-336,-200},{-288,-200},{-288,-208},{-232,-208},{-232,-200},{-176,-200},{-176,-180},{-195.2,-180}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV101, thetaFCV101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-530,-3},{-530,-4},{-166,-4},{-166,-110},{-179.2,-110}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.domegaP401, omegaP401Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-710,-3},{-710,-196},{-266,-196},{-266,-176},{-295.2,-176}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV401, thetaFCV401Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-578,-3},{-578,-4},{-258,-4},{-258,-140},{-261.2,-140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCVC02, thetaFCVC02Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{784,-3},{784,236},{762.8,236}},
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
  connect(FTA12.m_flow, FTA12Offset.y)    annotation (Line(points={{672.8,200.6},{672.8,194},{709.2,194}},         color={0,0,127}));
  connect(controlSignalBus.dthetaFCV701, thetaFCV701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-724,-3},{-724,-434},{200,-434},{200,-150},{170.8,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV731, thetaFCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{360,-3},{360,-150},{330.8,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV711, thetaFCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{510,-3},{510,-150},{490.8,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV721, thetaFCV721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{688,-3},{688,-150},{646.8,-150}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dmflowcoolEX701, mflowEX701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{26,-3},{26,-320},{57.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowcoolEX731, thetaTCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-740,-3},{-740,-408},{188,-408},{188,-320},{215.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowcoolEX711, thetaTCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-744,-3},{-744,-416},{352,-416},{352,-320},{369.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowcoolEX721, mflowEX721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{516,-3},{516,-320},{529.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{-202,61},{-208,61},{-208,62},{-218,62},{
          -218,46.6}}, color={255,0,255}));
  connect(processVariableBus.dPT902, PT902Offset.deltaYnorm) annotation (Line(
      points={{896,-3},{-160,-3},{-160,182},{-728.6,182}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT901Offset.deltaYnorm, processVariableBus.dFT901) annotation (Line(points={{-728.6,166},{0,166},{0,-3},{896,-3}},
                                                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT102Offset.deltaYnorm, processVariableBus.dPT102) annotation (Line(points={{-146.6,-80},{40,-80},{40,-3},{896,-3}},
                                                        color={0,0,127}), Text(
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
  connect(PT402Offset.deltaYnorm, processVariableBus.dPT402) annotation (Line(points={{-141,-30},{-40,-30},{-40,-3},{896,-3}},
                                                      color={0,0,127}), Text(
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
  connect(FTA12Offset.deltaYnorm, processVariableBus.dFTA12) annotation (Line(points={{719.4,194},{726,194},{726,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT701Offset.deltaYnorm, processVariableBus.dFT701) annotation (Line(points={{171.4,-104},{198,-104},{198,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT711Offset.deltaYnorm, processVariableBus.dFT711) annotation (Line(points={{491.4,-102},{528,-102},{528,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT721Offset.deltaYnorm, processVariableBus.dFT721) annotation (Line(points={{647.4,-102},{768,-102},{768,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT731Offset.deltaYnorm, processVariableBus.dFT731) annotation (Line(points={{331.4,-106},{376,-106},{376,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT704Offset.deltaYnorm, processVariableBus.dTT704) annotation (Line(points={{74.6,-252},{48,-252},{48,-3},{896,-3}},
                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT714Offset.deltaYnorm, processVariableBus.dTT714) annotation (Line(points={{382.6,-250},{368,-250},{368,-130},{432,-130},{432,-3},{896,-3}},
                                                                                color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT724Offset.deltaYnorm, processVariableBus.dTT724) annotation (Line(points={{554.6,-254},{540,-254},{540,-3},{896,-3}},
                                                          color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT734Offset.deltaYnorm, processVariableBus.dTT734) annotation (Line(points={{226.6,-252},{208,-252},{208,-3},{896,-3}},
                                                          color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT701Offset.deltaYnorm, processVariableBus.dTT701) annotation (Line(points={{171.4,-88},{226,-88},{226,-6},{896,-6},{896,-3}},
                                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT711Offset.deltaYnorm, processVariableBus.dTT711) annotation (Line(points={{491.4,-86},{520,-86},{520,-3},{896,-3}},
                                                       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT721Offset.deltaYnorm, processVariableBus.dTT721) annotation (Line(points={{647.4,-86},{680,-86},{680,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT731Offset.deltaYnorm, processVariableBus.dTT731) annotation (Line(points={{331.4,-90},{360,-90},{360,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT902Offset.deltaYnorm, processVariableBus.dTT902) annotation (Line(points={{-728.6,198},{-152,198},{-152,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT901.m_flow, FT901Offset.y) annotation (
    Line(points={{-752,169.5},{-752,170},{-746,170},{-746,166},{-738.8,166}},
                                                                        color = {0, 0, 127}));
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
  connect(PT701.p, PT701Offset.y) annotation (Line(points={{148.5,-74},{156,-74},{156,-72},{161.2,-72}},
                                                                                                       color={0,0,127}));
  connect(PT702.p, PT702Offset.y) annotation (Line(points={{91.5,-80},{82.8,-80}},
                                                                                 color={0,0,127}));
  connect(PT701Offset.deltaYnorm, processVariableBus.dPT701) annotation (Line(points={{171.4,-72},{190,-72},{190,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT702Offset.deltaYnorm, processVariableBus.dPT702) annotation (Line(points={{72.6,-80},{56,-80},{56,-3},{896,-3}},                 color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT732.p, PT732Offset.y) annotation (Line(points={{251.5,-80},{246.8,-80}},
                                                                                   color={0,0,127}));
  connect(PT712.p, PT712Offset.y) annotation (Line(points={{411.5,-80},{406.8,-80}},
                                                                                   color={0,0,127}));
  connect(PT722.p, PT722Offset.y) annotation (Line(points={{571.5,-80},{564.8,-80}},
                                                                                   color={0,0,127}));
  connect(PT732Offset.deltaYnorm, processVariableBus.dPT732) annotation (Line(points={{236.6,-80},{220,-80},{220,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT712Offset.deltaYnorm, processVariableBus.dPT712) annotation (Line(points={{396.6,-80},{392,-80},{392,-4},{646,-4},{646,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT722Offset.deltaYnorm, processVariableBus.dPT722) annotation (Line(points={{554.6,-80},{550,-80},{550,-3},{896,-3}},        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT731.p, PT731Offset.y) annotation (Line(points={{308.5,-76},{312,-76},{312,-74},{321.2,-74}},         color={0,0,127}));
  connect(PT711.p, PT711Offset.y) annotation (Line(points={{468.5,-72},{474,-72},{474,-70},{481.2,-70}},
                                                                                                       color={0,0,127}));
  connect(PT721.p, PT721Offset.y) annotation (Line(points={{628.5,-72},{632,-72},{632,-70},{637.2,-70}},                   color={0,0,127}));
  connect(PT731Offset.deltaYnorm, processVariableBus.dPT731) annotation (Line(points={{331.4,-74},{358,-74},{358,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT711Offset.deltaYnorm, processVariableBus.dPT711) annotation (Line(points={{491.4,-70},{504,-70},{504,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT721Offset.deltaYnorm, processVariableBus.dPT721) annotation (Line(points={{647.4,-70},{662,-70},{662,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ToutEB401Offset.u, EB401.Tout_ref) annotation (Line(points={{-408.6,-300},{-408.6,-301},{-361.5,-301}},               color={0,0,127}));
  connect(controlSignalBus.dToutEB401, ToutEB401Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-696,-3},{-696,-288},{-432,-288},{-432,-300},{-418.8,-300}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(ToutGB101Offset.u, GB101.Tout_ref) annotation (Line(points={{-408.6,-280},{-290,-280},{-290,-301},{-281.5,-301}},
                                                                                                                          color={0,0,127}));
  connect(controlSignalBus.dToutGB101, ToutGB101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-852,-3},{-852,-280},{-418.8,-280}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(PTA20.p, diffPT2.u2) annotation (Line(points={{681,197.8},{681,196},{706,196},{706,254},{762,254}},                     color={0,0,127}));
  connect(PTA19.p, diffPT2.u1) annotation (Line(points={{682,272.2},{682,276},{754,276},{754,266},{762,266}}, color={0,0,127}));
  connect(diffPT2.y, dPTA2Offset.y) annotation (Line(points={{785,260},{805.2,260}},
                                                                                   color={0,0,127}));
  connect(dPTA2Offset.deltaYnorm, processVariableBus.dPTA2) annotation (Line(points={{815.4,260},{848,260},{848,-3},{896,-3}},
                                                                                                                             color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PTA07.p, diffPT1.u1) annotation (Line(points={{238,272.2},{240,272.2},{240,300},{256,300}}, color={0,0,127}));
  connect(PTA08.p, diffPT1.u2) annotation (Line(points={{224,197.8},{224,190},{244,190},{244,288},{256,288}}, color={0,0,127}));
  connect(diffPT1.y, dPTA1Offset.y) annotation (Line(points={{279,294},{295.2,294}},
                                                                                   color={0,0,127}));
  connect(dPTA1Offset.deltaYnorm, processVariableBus.dPTA1) annotation (Line(points={{305.4,294},{858,294},{858,-12},{896,-12},{896,-3}},
                                                                                                                                        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCVC01, thetaFCVC01Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-834,-3},{-834,248},{314,248},{314,234},{322,234}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCVC02Dynamics.y, FCVC02.opening) annotation (Line(points={{711,236},{711,235},{698,235}}, color={0,0,127}));
  connect(FCVC02Dynamics.u, thetaFCVC02Offset.u) annotation (Line(points={{734,236},{752.6,236}},
                                                                                                color={0,0,127}));
  connect(FCVC01Dynamics.y, FCVC01.opening) annotation (Line(points={{269,234},{263.5,234},{263.5,235},{258,235}}, color={0,0,127}));
  connect(thetaFCVC01Offset.u, FCVC01Dynamics.u) annotation (Line(points={{305,234},{292,234}}, color={0,0,127}));
  connect(thetaFCV101Offset.u, FCV101Dynamics.u) annotation (Line(points={{-189.4,-110},{-206.8,-110}},
                                                                                                    color={0,0,127}));
  connect(FCV101Dynamics.y, FCV101.opening) annotation (Line(points={{-220.6,-110},{-232,-110}},
                                                                                               color={0,0,127}));
  connect(thetaFCV901Offset.u, FCV901Dynamics.u) annotation (Line(points={{-709.4,112},{-718,112}},                     color={0,0,127}));
  connect(FCV901Dynamics.y, FCV901.opening) annotation (Line(points={{-741,112},{-744,112},{-744,140.5},{-749.9,140.5}}, color={0,0,127}));
  connect(PT402.p, diffPTS400.u2) annotation (Line(points={{-308.2,-82},{-254,-82},{-254,-36},{-206,-36}}, color={0,0,127}));
  connect(PT401.p, diffPTS400.u1) annotation (Line(points={{-367.8,-114},{-384,-114},{-384,-76},{-260,-76},{-260,-24},{-206,-24}}, color={0,0,127}));
  connect(diffPTS400.y, PT402Offset.y) annotation (Line(points={{-183,-30},{-158,-30}}, color={0,0,127}));
  connect(diffPTS100.y, PT102Offset.y) annotation (Line(points={{-187.4,-80},{-156.8,-80}},
                                                                                        color={0,0,127}));
  connect(PT102.p, diffPTS100.u2) annotation (Line(points={{-230.2,-84},{-220,-84},{-220,-83.6},{-201.2,-83.6}},                 color={0,0,127}));
  connect(PT101.p, diffPTS100.u1) annotation (Line(points={{-285.8,-124},{-290,-124},{-290,-78},{-206,-78},{-206,-76.4},{-201.2,-76.4}},
                                                                                                                                   color={0,0,127}));
  connect(EX701Power.y, EX701PtOffset.y) annotation (Line(points={{725,-240},{741.2,-240}}, color={0,0,127}));
  connect(EX711Power.y, EX711PtOffset.y) annotation (Line(points={{725,-260},{741.2,-260}}, color={0,0,127}));
  connect(EX721Power.y, EX721PtOffset.y) annotation (Line(points={{725,-280},{741.2,-280}}, color={0,0,127}));
  connect(EX731Power.y, EX731PtOffset.y) annotation (Line(points={{725,-300},{741.2,-300}}, color={0,0,127}));
  connect(EX701PtOffset.deltaYnorm, processVariableBus.dEX701Pt) annotation (Line(points={{751.4,-240},{796,-240},{796,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX711PtOffset.deltaYnorm, processVariableBus.dEX711Pt) annotation (Line(points={{751.4,-260},{780,-260},{780,-258},{806,-258},{806,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX721PtOffset.deltaYnorm, processVariableBus.dEX721Pt) annotation (Line(points={{751.4,-280},{816,-280},{816,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX731PtOffset.deltaYnorm, processVariableBus.dEX731Pt) annotation (Line(points={{751.4,-300},{830,-300},{830,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(thetaFCV401Offset.u, FCV401.opening) annotation (Line(points={{-271.4,-140},{-300,-140},{-300,-110},{-310,-110}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-70,100},{70,-100}},
          textColor={140,56,54},
          textStyle={TextStyle.Bold},
          textString="Thermal
Facility")}),                                                    Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralisedSystemCoolingSimplifiedI_B_InitForward;
