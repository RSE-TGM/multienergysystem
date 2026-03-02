within MultiEnergySystem.TestFacility.Export.Configurations;
model CentralisedSystemGBEB_InitForward
  extends Export.Interfaces.TwoSignalBusConnector;
  extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
  extends DHTF.Networks.Centralised.CentralisedSystem_GBEB(
    S701(T1_wall_start(displayUnit="K") = 70 + 273.15, TN_wall_start(displayUnit="K") = 50 + 273.15),
    S711(T1_wall_start(displayUnit="K") = 70 + 273.15, TN_wall_start(displayUnit="K") = 50 + 273.15),
    S721(T1_wall_start(displayUnit="K") = 70 + 273.15, TN_wall_start(displayUnit="K") = 50 + 273.15),
    S731(T1_wall_start(displayUnit="K") = 70 + 273.15, TN_wall_start(displayUnit="K") = 50 + 273.15),
    S701(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    S711(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    S721(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    S731(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    Kvalve=22,
    redeclare model WaterHot =
        DistrictHeatingNetwork.Media.WaterLiquidVaryingcp,
    redeclare model WaterCold =
        DistrictHeatingNetwork.Media.WaterLiquidVaryingcp,
    T_start_hot=80 + 273.15,
    T_start_cold=70 + 273.15,
    EX701_Tin_hot=T_start_hot,
    EX701_Tout_hot=T_start_cold,
    EX701_Tin_cold=15 + 273.15,
    EX711_Tin_cold=15 + 273.15,
    EX721_Tin_cold=15 + 273.15,
    EX731_Tin_cold=15 + 273.15,
    EX701_Tout_cold=24 + 273.15,
    EX711_Tout_cold=24 + 273.15,
    EX721_Tout_cold=24 + 273.15,
    EX731_Tout_cold=24 + 273.15,
    sourceGas(computeTransport=false, computeEnergyVariables=false),
    VER901(p0=220000, R=1e-3),
    rackL6L7_FCVC02_cold(h=-h_rL6L7_FCVC02_H*0.5));

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
//   parameter Boolean fixmflowcoolEX701 = ForwardInit "True if forward, False if backward";
//   parameter Boolean fixmflowcoolEX711 = ForwardInit "True if forward, False if backward";
//   parameter Boolean fixmflowcoolEX721 = ForwardInit "True if forward, False if backward";
//   parameter Boolean fixmflowcoolEX731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutGB101 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutEB401 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCVR01 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutRR01 = ForwardInit "True if forward, False if backward";

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
//   final parameter Boolean fixdTT701 = not fixthetaFCV701;
//   final parameter Boolean fixdTT711 = not fixthetaFCV711;
//   final parameter Boolean fixdTT721 = not fixthetaFCV721;
//   final parameter Boolean fixdTT731 = not fixthetaFCV731;
//   final parameter Boolean fixTT701 = not fixmflowcoolEX701;
//   final parameter Boolean fixTT711 = not fixmflowcoolEX711;
//   final parameter Boolean fixTT721 = not fixmflowcoolEX721;
//   final parameter Boolean fixTT731 = not fixmflowcoolEX731;
  final parameter Boolean fixTT102 = not fixToutGB101;
  final parameter Boolean fixTT402 = not fixToutEB401;
  final parameter Boolean fixEX701Pt = not fixthetaFCV701;
  final parameter Boolean fixEX711Pt = not fixthetaFCV711;
  final parameter Boolean fixEX721Pt = not fixthetaFCV721;
  final parameter Boolean fixEX731Pt = not fixthetaFCV731;
  final parameter Boolean fixTT701 = not fixthetaTCV701;
  final parameter Boolean fixTT711 = not fixthetaTCV711;
  final parameter Boolean fixTT721 = not fixthetaTCV721;
  final parameter Boolean fixTT731 = not fixthetaTCV731;
  final parameter Boolean fixdFTR00 = not fixthetaFCVR01;
  final parameter Boolean fixTTR02 = not fixToutRR01;

//Additional variables
  final parameter Boolean fixTT901 = false;
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
  final parameter Boolean fixTT704 = false;
  final parameter Boolean fixTT714 = false;
  final parameter Boolean fixTT724 = false;
  final parameter Boolean fixTT734 = false;
//   final parameter Boolean fixTT701 = false;
//   final parameter Boolean fixTT711 = false;
//   final parameter Boolean fixTT721 = false;
//   final parameter Boolean fixTT731 = false;
  final parameter Boolean fixdTT701 = false;
  final parameter Boolean fixdTT711 = false;
  final parameter Boolean fixdTT721 = false;
  final parameter Boolean fixdTT731 = false;
  final parameter Boolean fixPT902 = false;
  final parameter Boolean fixFTR01 = false;
  final parameter Boolean fixGB101Pt = false;
  final parameter Boolean fixEB401Pt = false;
  final parameter Boolean fixTT702 = false;
  final parameter Boolean fixTT712 = false;
  final parameter Boolean fixTT722 = false;
  final parameter Boolean fixTT732 = false;

//Normalisation values
  //Nominal values
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1 "Nom. opening valve in the system" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Non dimensional"));
  parameter DistrictHeatingNetwork.Types.Temperature Theat_nom = 95 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature TCool_nom = 50 + 273.15 "Desired temperature at the outlet of the loads";
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
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR01_nom= TestFacility.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR03_nom= TestFacility.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate dFTR00_nom= TestFacility.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.Temperature TTR02_nom = 30 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature ToutRR01_nom = 30 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Power GB101Pt_nom = 160e3;
  parameter DistrictHeatingNetwork.Types.Power EB401Pt_nom = 50e3;

  parameter DistrictHeatingNetwork.Types.Temperature TT702_nom = 80 + 273.15 "Desired temperature at the inlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT712_nom = 80 + 273.15 "Desired temperature at the inlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT722_nom = 80 + 273.15 "Desired temperature at the inlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT732_nom = 80 + 273.15 "Desired temperature at the oinlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));

  //  Desired Outputs values
  parameter DistrictHeatingNetwork.Types.Temperature ToutLoad_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT901_des = 65 + 273.15 "Desired temperature at the outlet of the loads" annotation (
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

  parameter DistrictHeatingNetwork.Types.Temperature TT702_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT712_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT722_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT732_des = 80 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));

  parameter DistrictHeatingNetwork.Types.Temperature TT704_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT714_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT724_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT734_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter Real dTT701_des = 15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter Real dTT701_nom = 15 "Desired temperature at the outlet of the loads" annotation (
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
  parameter DistrictHeatingNetwork.Types.Pressure dPTA2_des = 1.5e5 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Pressure"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT901_des= TestFacility.Data.PumpData.P901.qnom_inm3h*980/3600 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT101_des= TestFacility.Data.PumpData.P101.qnom_inm3h*980/3600  "Desired gas boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_des= TestFacility.Data.PumpData.P401.qnom_inm3h*980/3600  "Desired electric boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowhot_des= 1.3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTA12_des= 0.2 "Desired recirculation mass flowrate";
  parameter DistrictHeatingNetwork.Types.Power EX701Pt_des = 30e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Power EX711Pt_des = 30e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Power EX721Pt_des = 30e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Power EX731Pt_des = 30e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Temperature TTR02_des = 15 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR01_des= TestFacility.Data.PumpData.PR01.qnom_inm3h*980/3600 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR03_des= 5 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate dFTR00_des= FTR01_des-FTR03_des "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.Power GB101Pt_des = 120e3;
  parameter DistrictHeatingNetwork.Types.Power EB401Pt_des = 50e3;

  DistrictHeatingNetwork.Types.Power Pt1(nominal = 50e3, start = 30e3);
  DistrictHeatingNetwork.Types.Power Pt2(nominal = 50e3, start = 30e3);
  DistrictHeatingNetwork.Types.Power Pt3(nominal = 50e3, start = 30e3);
  DistrictHeatingNetwork.Types.Power Pt4(nominal = 50e3, start = 30e3);
  DistrictHeatingNetwork.Types.Power PtGB(nominal = 160e3, start = 120e3);
  DistrictHeatingNetwork.Types.Power PtEB(nominal = 50e3, start = 50e3);

  Modelica.Blocks.Sources.RealExpression EX701Power(y=Pt1) annotation (Placement(transformation(extent={{778,-426},{798,-406}})));
  Modelica.Blocks.Sources.RealExpression EX711Power(y=Pt2) annotation (Placement(transformation(extent={{778,-446},{798,-426}})));
  Modelica.Blocks.Sources.RealExpression EX721Power(y=Pt3) annotation (Placement(transformation(extent={{778,-466},{798,-446}})));
  Modelica.Blocks.Sources.RealExpression EX731Power(y=Pt4) annotation (Placement(transformation(extent={{778,-486},{798,-466}})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega) annotation (Placement(transformation(extent={{739,-219},{719,-199}})));
  Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working" annotation (Placement(transformation(extent={{699,-130},{719,-110}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false) annotation (Placement(transformation(extent={{-181,51},{-201,71}})));
  Modelica.Blocks.Math.Add diffPT1(k1=-1) annotation (Placement(transformation(extent={{258,284},{278,304}})));
  Modelica.Blocks.Math.Add diffPT2(k1=-1) annotation (Placement(transformation(extent={{764,250},{784,270}})));
  Modelica.Blocks.Math.Add diffPTRR01(k1=-1) annotation (Placement(transformation(extent={{874,
            -335},{886,-347}})));
  Modelica.Blocks.Sources.BooleanConstant GB101Status annotation (Placement(transformation(extent={{-340,-300},{-330,-290}})));
  Modelica.Blocks.Sources.BooleanConstant EB401Status annotation (Placement(transformation(extent={{-409,-140},{-399,-130}})));
  Modelica.Blocks.Sources.BooleanConstant FV401_OnOff(k=FV401_state) annotation (Placement(transformation(extent={{-386,-26},{-366,-6}})));
  Modelica.Blocks.Sources.BooleanConstant FV402_OnOff(k=true) annotation (Placement(transformation(extent={{-286,-26},{-306,-6}})));
  Modelica.Blocks.Sources.RealExpression GBPower(y=PtGB) annotation (Placement(transformation(extent={{778,-508},{798,-488}})));
  Modelica.Blocks.Sources.RealExpression EBPower(y=PtEB) annotation (Placement(transformation(extent={{778,-530},{798,-510}})));
equation
  Pt1 = S701.EX7X1.Pt;
  Pt2 = S711.EX7X1.Pt;
  Pt3 = S721.EX7X1.Pt;
  Pt4 = S731.EX7X1.Pt;
  PtGB = S100.GB.Pheat;
  PtEB = S400.EB.Pheat;
  connect(FV402_OnOff.y, FV402.u)    annotation (Line(points={{-307,-16},{-314.8,-16}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401.u) annotation (Line(points={{-365,-16},{-357.2,-16}},
                 color={255,0,255}));
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{-202,61},{-208,61},{-208,62},{-218,62},{
          -218,46.6}}, color={255,0,255}));
  connect(PTA20.p, diffPT2.u2) annotation (Line(points={{681,197.8},{681,196},{706,196},{706,254},{762,254}},                     color={0,0,127}));
  connect(PTA19.p, diffPT2.u1) annotation (Line(points={{684,254.2},{684,276},{754,276},{754,266},{762,266}}, color={0,0,127}));
  connect(PTA07.p, diffPT1.u1) annotation (Line(points={{234,246.2},{234,300},{256,300}},             color={0,0,127}));
  connect(PTA08.p, diffPT1.u2) annotation (Line(points={{224,197.8},{224,190},{234,190},{234,288},{256,288}}, color={0,0,127}));
  connect(PR01.in_omega,PR01_omega. y) annotation (Line(points={{710.5,-207.8},{714.25,-207.8},{714.25,-209},{718,-209}},
                                                                                                   color={0,0,127}));
  connect(RR101_Status.y, RR01.cold_on) annotation (Line(points={{720,-120},{724.225,-120},{724.225,-118.5},{728.45,-118.5}}, color={255,0,255}));
  connect(FTR03.m_flow, diffPTRR01.u1) annotation (Line(points={{815.5,-355},{
          815.5,-344.6},{872.8,-344.6}},                                                                              color={0,0,127}));
  connect(GB101Status.y, S100.status) annotation (Line(points={{-329.5,-295},{-307,-295},{-307,-279.6},{-298.4,-279.6}},                     color={255,0,255}));
  connect(EB401Status.y, S400.status) annotation (Line(points={{-398.5,-135},{-396,-135},{-396,-136},{-394,-136},{-394,-121.6},{-384.4,-121.6}}, color={255,0,255}));
  connect(S900.pumpset, controlSignalBus.omegaP901) annotation (Line(points={{
          -845.1,158.7},{-865,158.7},{-865,159},{-893,159},{-893,1},{-897,1},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S900.theta, controlSignalBus.thetaFCV901) annotation (Line(points={{
          -845.1,148.5},{-871,148.5},{-871,149},{-893,149},{-893,0},{-897,0},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC01.opening, controlSignalBus.thetaFCVC01) annotation (Line(points
        ={{245,223},{187,223},{187,303},{-899,303},{-899,-3},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S100.pumpset, controlSignalBus.omegaP101) annotation (Line(points={{
          -298.4,-253.2},{-327,-253.2},{-327,-253},{-355,-253},{-355,-431},{
          -885,-431},{-885,-26},{-897,-26},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S100.theta, controlSignalBus.thetaFCV101) annotation (Line(points={{
          -298.4,-262},{-355,-262},{-355,-431},{-885,-431},{-885,-3},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S100.Toutset, controlSignalBus.ToutGB101) annotation (Line(points={{
          -298.4,-270.8},{-327,-270.8},{-327,-271},{-355,-271},{-355,-431},{
          -885,-431},{-885,-138},{-897,-138},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S400.pumpset, controlSignalBus.omegaP401) annotation (Line(points={{
          -384.4,-95.2},{-897,-95.2},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S400.theta, controlSignalBus.thetaFCV401) annotation (Line(points={{
          -384.4,-104},{-471,-104},{-471,-110},{-897,-110},{-897,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S400.Toutset, controlSignalBus.ToutEB401) annotation (Line(points={{
          -384.4,-112.8},{-897,-112.8},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S701.theta_FCV7X1, controlSignalBus.thetaFCV701) annotation (Line(
        points={{56,-178},{4,-178},{4,-179},{-1,-179},{-1,-516},{-897,-516},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S701.theta_TCV7X1, controlSignalBus.thetaTCV701) annotation (Line(
        points={{56,-186},{-1,-186},{-1,-516},{-897,-516},{-897,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S731.theta_FCV7X1, controlSignalBus.thetaFCV731) annotation (Line(
        points={{216,-178},{201,-178},{201,-524},{-897,-524},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S731.theta_TCV7X1, controlSignalBus.thetaTCV731) annotation (Line(
        points={{216,-186},{201,-186},{201,-524},{-897,-524},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S711.theta_FCV7X1, controlSignalBus.thetaFCV711) annotation (Line(
        points={{376,-178},{356,-178},{356,-525},{-897,-525},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S711.theta_TCV7X1, controlSignalBus.thetaTCV711) annotation (Line(
        points={{376,-186},{367,-186},{367,-184},{356,-184},{356,-525},{-895,
          -525},{-895,-22},{-897,-22},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S721.theta_FCV7X1, controlSignalBus.thetaFCV721) annotation (Line(
        points={{536,-178},{522,-178},{522,-528},{-897,-528},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S721.theta_TCV7X1, controlSignalBus.thetaTCV721) annotation (Line(
        points={{536,-186},{522,-186},{522,-528},{-897,-528},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVR01.opening, controlSignalBus.thetaFCVR01) annotation (Line(points
        ={{766,-352},{764,-352},{764,-331},{521,-331},{521,-528},{-897,-528},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC02.opening, controlSignalBus.thetaFCVC02) annotation (Line(points
        ={{682,221},{630,221},{630,222},{601,222},{601,311},{-899,311},{-899,9},
          {-898,9},{-898,3},{-897,3},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(diffPT1.y, processVariableBus.dPTA1) annotation (Line(points={{279,
          294},{895,294},{895,297},{896,297},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(RR01.in_Tout_cold_set, controlSignalBus.ToutRR01) annotation (Line(
        points={{767.5,-93.65},{767.5,-97},{687,-97},{687,-536},{-896,-536},{
          -896,-3},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(S900.PTout, processVariableBus.PT902) annotation (Line(points={{
          -732.9,117.9},{-85,117.9},{-85,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.PTin, processVariableBus.PT901) annotation (Line(points={{-732.9,
          128.1},{-85,128.1},{-85,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.TTout, processVariableBus.TT902) annotation (Line(points={{
          -732.9,138.3},{-408,138.3},{-408,138},{-85,138},{-85,-3},{897,-3},{
          897,-4},{896,-4},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.TTin, processVariableBus.TT901) annotation (Line(points={{-732.9,
          148.5},{-85,148.5},{-85,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.m_flow_, processVariableBus.FT901) annotation (Line(points={{
          -732.9,158.7},{-85,158.7},{-85,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FTA12.m_flow, processVariableBus.FTA12) annotation (Line(points={{
          672.8,200.6},{896,200.6},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(diffPT2.y, processVariableBus.dPTA2) annotation (Line(points={{785,
          260},{890,260},{890,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S400.TTout, processVariableBus.TT402) annotation (Line(points={{
          -287.6,-112.8},{-233,-112.8},{-233,-113},{-178,-113},{-178,-11},{896,
          -11},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S400.PTout, processVariableBus.PT402) annotation (Line(points={{
          -287.6,-130.4},{-178,-130.4},{-178,-11},{896,-11},{896,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.TT7X1_TT, processVariableBus.TT701) annotation (Line(points={{
          144,-178},{153,-178},{153,-176},{171,-176},{171,-19},{896,-19},{896,
          -3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.TT7X2_TT, processVariableBus.TT702) annotation (Line(points={{
          144,-186},{171,-186},{171,-19},{896,-19},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.TT7X4_TT, processVariableBus.TT704) annotation (Line(points={{
          144,-202},{171,-202},{171,-19},{896,-19},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.FT7X1_FT, processVariableBus.FT701) annotation (Line(points={{
          144,-210},{171,-210},{171,-19},{895,-19},{895,-2},{896,-2},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.PT7X1_PT, processVariableBus.PT701) annotation (Line(points={{
          144,-218},{171,-218},{171,-19},{896,-19},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.PT7X2_PT, processVariableBus.PT702) annotation (Line(points={{
          144,-226},{171,-226},{171,-19},{895,-19},{895,-3},{896,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.TT7X1_TT, processVariableBus.TT731) annotation (Line(points={{
          304,-178},{316,-178},{316,-179},{328,-179},{328,-26},{896,-26},{896,
          -3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.TT7X2_TT, processVariableBus.TT732) annotation (Line(points={{
          304,-186},{328,-186},{328,-26},{895,-26},{895,-1},{896,-1},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.TT7X4_TT, processVariableBus.TT734) annotation (Line(points={{
          304,-202},{328,-202},{328,-26},{895,-26},{895,-2},{896,-2},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.FT7X1_FT, processVariableBus.FT731) annotation (Line(points={{
          304,-210},{328,-210},{328,-26},{896,-26},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.PT7X1_PT, processVariableBus.PT731) annotation (Line(points={{
          304,-218},{328,-218},{328,-26},{894,-26},{894,-2},{895,-2},{895,-3},{
          896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.PT7X2_PT, processVariableBus.PT732) annotation (Line(points={{
          304,-226},{328,-226},{328,-26},{896,-26},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.TT7X1_TT, processVariableBus.TT711) annotation (Line(points={{
          464,-178},{489,-178},{489,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.TT7X2_TT, processVariableBus.TT712) annotation (Line(points={{
          464,-186},{489,-186},{489,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.TT7X4_TT, processVariableBus.TT714) annotation (Line(points={{
          464,-202},{489,-202},{489,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.FT7X1_FT, processVariableBus.FT711) annotation (Line(points={{
          464,-210},{489,-210},{489,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.PT7X1_PT, processVariableBus.PT711) annotation (Line(points={{
          464,-218},{489,-218},{489,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.PT7X2_PT, processVariableBus.PT712) annotation (Line(points={{
          464,-226},{489,-226},{489,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.TT7X1_TT, processVariableBus.TT721) annotation (Line(points={{
          624,-178},{648,-178},{648,-40},{896,-40},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.TT7X2_TT, processVariableBus.TT722) annotation (Line(points={{
          624,-186},{648,-186},{648,-40},{896,-40},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.TT7X4_TT, processVariableBus.TT724) annotation (Line(points={{
          624,-202},{648,-202},{648,-40},{896,-40},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.FT7X1_FT, processVariableBus.FT721) annotation (Line(points={{
          624,-210},{648,-210},{648,-40},{896,-40},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.PT7X1_PT, processVariableBus.PT721) annotation (Line(points={{
          624,-218},{648,-218},{648,-40},{896,-40},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.PT7X2_PT, processVariableBus.PT722) annotation (Line(points={{
          624,-226},{648,-226},{648,-40},{896,-40},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TTR02.T, processVariableBus.TTR02) annotation (Line(points={{693.2,
          -286},{664,-286},{664,-294},{896,-294},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FTR01.m_flow, processVariableBus.FTR01) annotation (Line(points={{831,
          -225.5},{832,-225.5},{832,-219},{887,-219},{887,-11},{896,-11},{896,
          -3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FTR01.m_flow, diffPTRR01.u2) annotation (Line(points={{831,-225.5},{
          840,-225.5},{840,-216},{864,-216},{864,-224},{872,-224},{872,-288},{
          880,-288},{880,-320},{856,-320},{856,-337.4},{872.8,-337.4}}, color={
          0,0,127}));
  connect(diffPTRR01.y, processVariableBus.dFTR01) annotation (Line(points={{
          886.6,-341},{886.6,-344},{968,-344},{968,-3},{896,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX701Power.y, processVariableBus.EX701Pt) annotation (Line(points={{
          799,-416},{896,-416},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX711Power.y, processVariableBus.EX711Pt) annotation (Line(points={{
          799,-436},{896,-436},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX721Power.y, processVariableBus.EX721Pt) annotation (Line(points={{
          799,-456},{896,-456},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX731Power.y, processVariableBus.EX731Pt) annotation (Line(points={{
          799,-476},{896,-476},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(GBPower.y, processVariableBus.GB101Pt) annotation (Line(points={{799,
          -498},{896,-498},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EBPower.y, processVariableBus.EB401Pt) annotation (Line(points={{799,
          -520},{896,-520},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S100.m_flow_, processVariableBus.FT101) annotation (Line(points={{
          -201.6,-253.2},{-96,-253.2},{-96,-3},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S100.TTout, processVariableBus.TT102) annotation (Line(points={{
          -201.6,-270.8},{-149,-270.8},{-149,-271},{-96,-271},{-96,-3},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S100.PTout, processVariableBus.PT102) annotation (Line(points={{
          -201.6,-288.4},{-149,-288.4},{-149,-288},{-96,-288},{-96,-3},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S400.m_flow_, processVariableBus.FT401) annotation (Line(points={{
          -287.6,-95.2},{-232,-95.2},{-232,-95},{-178,-95},{-178,-11},{359,-11},
          {359,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(grid={1,1})),
    experiment(
      StopTime=2000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CentralisedSystemGBEB_InitForward;
