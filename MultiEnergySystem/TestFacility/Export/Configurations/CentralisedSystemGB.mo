within MultiEnergySystem.TestFacility.Export.Configurations;
model CentralisedSystemGB
  extends Export.Interfaces.TwoSignalBusConnector;
  extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
  extends DHTF.Networks.Centralised.CentralisedSystem_GB(
    Kvalve=40,
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
    EX701_Tout_cold=25 + 273.15,
    EX711_Tout_cold=25 + 273.15,
    EX721_Tout_cold=25 + 273.15,
    EX731_Tout_cold=25 + 273.15,
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
  final parameter Boolean fixdTT701 = not fixthetaFCV701;
  final parameter Boolean fixdTT711 = not fixthetaFCV711;
  final parameter Boolean fixdTT721 = not fixthetaFCV721;
  final parameter Boolean fixdTT731 = not fixthetaFCV731;
//   final parameter Boolean fixTT701 = not fixmflowcoolEX701;
//   final parameter Boolean fixTT711 = not fixmflowcoolEX711;
//   final parameter Boolean fixTT721 = not fixmflowcoolEX721;
//   final parameter Boolean fixTT731 = not fixmflowcoolEX731;
  final parameter Boolean fixTT102 = not fixToutGB101;
  final parameter Boolean fixTT402 = not fixToutEB401;
  final parameter Boolean fixEX701Pt = not fixthetaTCV701;
  final parameter Boolean fixEX711Pt = not fixthetaTCV711;
  final parameter Boolean fixEX721Pt = not fixthetaTCV721;
  final parameter Boolean fixEX731Pt = not fixthetaTCV731;
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
  final parameter Boolean fixTT701 = false;
  final parameter Boolean fixTT711 = false;
  final parameter Boolean fixTT721 = false;
  final parameter Boolean fixTT731 = false;

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

  Modelica.Blocks.Math.Add diffPTS100(k1=-1) annotation (Placement(transformation(extent={{-168,-320},{-148,-300}})));
  Modelica.Blocks.Sources.RealExpression EX701Power(y=Pt1) annotation (Placement(transformation(extent={{702,-426},{722,-406}})));
  Modelica.Blocks.Sources.RealExpression EX711Power(y=Pt2) annotation (Placement(transformation(extent={{702,-446},{722,-426}})));
  Modelica.Blocks.Sources.RealExpression EX721Power(y=Pt3) annotation (Placement(transformation(extent={{702,-466},{722,-446}})));
  Modelica.Blocks.Sources.RealExpression EX731Power(y=Pt4) annotation (Placement(transformation(extent={{702,-486},{722,-466}})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega) annotation (Placement(transformation(extent={{739,-219},{719,-199}})));
  Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working" annotation (Placement(transformation(extent={{699,-130},{719,-110}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false) annotation (Placement(transformation(extent={{-181,51},{-201,71}})));
  Modelica.Blocks.Math.Add diffPT1(k1=-1) annotation (Placement(transformation(extent={{258,284},{278,304}})));
  Modelica.Blocks.Math.Add diffPT2(k1=-1) annotation (Placement(transformation(extent={{764,250},{784,270}})));
  Modelica.Blocks.Math.Add diffPTRR01(k1=-1) annotation (Placement(transformation(extent={{910,-336},{922,-348}})));
  Modelica.Blocks.Sources.BooleanConstant GB101Status annotation (Placement(transformation(extent={{-400,-336},{-380,-316}})));
  Modelica.Blocks.Sources.RealExpression GBPower(y=PtGB) annotation (Placement(transformation(extent={{702,-508},{722,-488}})));
equation
  Pt1 = S701.EX7X1.Pt;
  Pt2 = S711.EX7X1.Pt;
  Pt3 = S721.EX7X1.Pt;
  Pt4 = S731.EX7X1.Pt;
  PtGB = S100.GB.Pheat;
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{-202,61},{-208,61},{-208,62},{-218,62},{
          -218,46.6}}, color={255,0,255}));
  connect(PTA20.p, diffPT2.u2) annotation (Line(points={{681,197.8},{681,196},{706,196},{706,254},{762,254}},                     color={0,0,127}));
  connect(PTA19.p, diffPT2.u1) annotation (Line(points={{684,254.2},{684,276},{754,276},{754,266},{762,266}}, color={0,0,127}));
  connect(PTA07.p, diffPT1.u1) annotation (Line(points={{234,246.2},{234,274},{
          226,274},{226,300},{256,300}},                                                              color={0,0,127}));
  connect(PTA08.p, diffPT1.u2) annotation (Line(points={{224,197.8},{224,186},{
          204,186},{204,288},{256,288}},                                                                      color={0,0,127}));
  connect(RR101_Status.y, RR01.cold_on) annotation (Line(points={{720,-120},{724.225,-120},{724.225,-118.5},{728.45,-118.5}}, color={255,0,255}));
  connect(FTR03.m_flow, diffPTRR01.u1) annotation (Line(points={{815.5,-355},{902,-355},{902,
          -345.6},{908.8,-345.6}},                                                                                    color={0,0,127}));
  connect(GB101Status.y, S100.status) annotation (Line(points={{-379,-326},{-379,-320},{-312,-320},{-312,-279.6},{-298.4,-279.6}},           color={255,0,255}));
  connect(S100.PTin, diffPTS100.u1) annotation (Line(points={{-201.6,-279.6},{-180,-279.6},{-180,-304},{-170,-304},{-170,-304}}, color={0,0,127}));
  connect(S100.PTout, diffPTS100.u2) annotation (Line(points={{-201.6,-288.4},{-188,-288.4},{-188,-316},{-170,-316}}, color={0,0,127}));
  connect(PR01.in_omega, PR01_omega.y) annotation (Line(points={{710.5,-207.8},{714.25,-207.8},{714.25,-209},{718,-209}}, color={0,0,127}));
  connect(S900.theta, controlSignalBus.thetaFCV901) annotation (Line(points={{
          -845.1,148.5},{-897,148.5},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S900.pumpset, controlSignalBus.omegaP901) annotation (Line(points={{
          -845.1,158.7},{-897,158.7},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC01.opening, controlSignalBus.thetaFCVC01) annotation (Line(points
        ={{245,223},{180,223},{180,294},{-897,294},{-897,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S100.pumpset, controlSignalBus.omegaP101) annotation (Line(points={{
          -298.4,-253.2},{-897,-253.2},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S100.theta, controlSignalBus.thetaFCV101) annotation (Line(points={{
          -298.4,-262},{-410,-262},{-410,-258},{-894,-258},{-894,-50},{-897,-50},
          {-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S100.Toutset, controlSignalBus.ToutGB101) annotation (Line(points={{
          -298.4,-270.8},{-897,-270.8},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S701.theta_TCV7X1, controlSignalBus.thetaTCV701) annotation (Line(
        points={{56,-186},{-238,-186},{-238,-174},{-897,-174},{-897,-3}}, color
        ={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S701.theta_FCV7X1, controlSignalBus.thetaFCV701) annotation (Line(
        points={{56,-178},{-152,-178},{-152,-172},{-882,-172},{-882,-3},{-897,
          -3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S731.theta_TCV7X1, controlSignalBus.thetaTCV731) annotation (Line(
        points={{216,-186},{204,-186},{204,-330},{-897,-330},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S731.theta_FCV7X1, controlSignalBus.thetaFCV731) annotation (Line(
        points={{216,-178},{212,-178},{212,-338},{-897,-338},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S711.theta_TCV7X1, controlSignalBus.thetaTCV711) annotation (Line(
        points={{376,-186},{364,-186},{364,-348},{-897,-348},{-897,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S711.theta_FCV7X1, controlSignalBus.thetaFCV711) annotation (Line(
        points={{376,-178},{360,-178},{360,-340},{-914,-340},{-914,-3},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S721.theta_TCV7X1, controlSignalBus.thetaTCV721) annotation (Line(
        points={{536,-186},{520,-186},{520,-326},{-922,-326},{-922,-3},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S721.theta_FCV7X1, controlSignalBus.thetaFCV721) annotation (Line(
        points={{536,-178},{518,-178},{518,-334},{-932,-334},{-932,-3},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVR01.opening, controlSignalBus.thetaFCVR01) annotation (Line(points
        ={{766,-352},{766,-332},{540,-332},{540,-454},{-894,-454},{-894,-3},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(diffPTRR01.y, processVariableBus.dFTR01) annotation (Line(points={{
          922.6,-342},{932,-342},{932,-172},{896,-172},{896,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FTR01.q_m3hr, processVariableBus.FTR01) annotation (Line(points={{
          834.5,-229},{834.5,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FTR01.q_m3hr, diffPTRR01.u2) annotation (Line(points={{834.5,-229},{
          870,-229},{870,-338.4},{908.8,-338.4}}, color={0,0,127}));
  connect(TTR02.T, processVariableBus.TTR02) annotation (Line(points={{693.2,
          -286},{680,-286},{680,-288},{782,-288},{782,-286},{896,-286},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX701Power.y, processVariableBus.EX701Pt) annotation (Line(points={{
          723,-416},{814,-416},{814,-414},{896,-414},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(GBPower.y, processVariableBus.GB101Pt) annotation (Line(points={{723,
          -498},{896,-498},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX731Power.y, processVariableBus.EX731Pt) annotation (Line(points={{
          723,-476},{784,-476},{784,-478},{848,-478},{848,-476},{896,-476},{896,
          -3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX721Power.y, processVariableBus.EX721Pt) annotation (Line(points={{
          723,-456},{896,-456},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX711Power.y, processVariableBus.EX711Pt) annotation (Line(points={{
          723,-436},{806,-436},{806,-438},{896,-438},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FTA12.q_m3hr, processVariableBus.FTA12) annotation (Line(points={{670,
          197.8},{670,90},{896,90},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(RR01.in_Tout_cold_set, controlSignalBus.ToutRR01) annotation (Line(
        points={{767.5,-93.65},{767.5,-36},{-856,-36},{-856,-3},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC02.opening, controlSignalBus.thetaFCVC02) annotation (Line(points
        ={{682,221},{630,221},{630,344},{-897,344},{-897,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(diffPT2.y, processVariableBus.dPTA2) annotation (Line(points={{785,
          260},{840,260},{840,254},{896,254},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(diffPT1.y, processVariableBus.dPTA1) annotation (Line(points={{279,
          294},{896,294},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S100.TTout, processVariableBus.TT102) annotation (Line(points={{
          -201.6,-270.8},{-68,-270.8},{-68,-2},{896,-2},{896,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S100.m_flow_, processVariableBus.FT101) annotation (Line(points={{
          -201.6,-253.2},{-68,-253.2},{-68,-3},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.TT7X1_TT, processVariableBus.TT701) annotation (Line(points={{
          144,-178},{184,-178},{184,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.TT7X2_TT, processVariableBus.TT702) annotation (Line(points={{
          144,-186},{164,-186},{164,-188},{184,-188},{184,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.TT7X4_TT, processVariableBus.TT704) annotation (Line(points={{
          144,-202},{182,-202},{182,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.FT7X1_FT, processVariableBus.FT701) annotation (Line(points={{
          144,-210},{184,-210},{184,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.PT7X1_PT, processVariableBus.PT701) annotation (Line(points={{
          144,-218},{186,-218},{186,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S701.PT7X2_PT, processVariableBus.PT702) annotation (Line(points={{
          144,-226},{184,-226},{184,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.TT7X1_TT, processVariableBus.TT731) annotation (Line(points={{
          304,-178},{334,-178},{334,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.TT7X2_TT, processVariableBus.TT732) annotation (Line(points={{
          304,-186},{334,-186},{334,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.TT7X4_TT, processVariableBus.TT734) annotation (Line(points={{
          304,-202},{322,-202},{322,-200},{332,-200},{332,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.FT7X1_FT, processVariableBus.FT731) annotation (Line(points={{
          304,-210},{334,-210},{334,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.PT7X1_PT, processVariableBus.PT731) annotation (Line(points={{
          304,-218},{332,-218},{332,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S731.PT7X2_PT, processVariableBus.PT732) annotation (Line(points={{
          304,-226},{324,-226},{324,-228},{332,-228},{332,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.TT7X1_TT, processVariableBus.TT711) annotation (Line(points={{
          464,-178},{484,-178},{484,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.TT7X2_TT, processVariableBus.TT712) annotation (Line(points={{
          464,-186},{476,-186},{476,-188},{484,-188},{484,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.TT7X4_TT, processVariableBus.TT714) annotation (Line(points={{
          464,-202},{488,-202},{488,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.FT7X1_FT, processVariableBus.FT711) annotation (Line(points={{
          464,-210},{488,-210},{488,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.PT7X1_PT, processVariableBus.PT711) annotation (Line(points={{
          464,-218},{476,-218},{476,-220},{484,-220},{484,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S711.PT7X2_PT, processVariableBus.PT712) annotation (Line(points={{
          464,-226},{486,-226},{486,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.TT7X1_TT, processVariableBus.TT721) annotation (Line(points={{
          624,-178},{648,-178},{648,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.TT7X2_TT, processVariableBus.TT722) annotation (Line(points={{
          624,-186},{636,-186},{636,-188},{648,-188},{648,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.TT7X4_TT, processVariableBus.TT724) annotation (Line(points={{
          624,-202},{650,-202},{650,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.FT7X1_FT, processVariableBus.FT721) annotation (Line(points={{
          624,-210},{634,-210},{634,-212},{652,-212},{652,-3},{896,-3}}, color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.PT7X1_PT, processVariableBus.PT721) annotation (Line(points={{
          624,-218},{654,-218},{654,-4},{896,-4},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S721.PT7X2_PT, processVariableBus.PT722) annotation (Line(points={{
          624,-226},{648,-226},{648,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.m_flow_, processVariableBus.FT901) annotation (Line(points={{
          -732.9,158.7},{-64,158.7},{-64,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.TTin, processVariableBus.TT901) annotation (Line(points={{-732.9,
          148.5},{-64,148.5},{-64,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.TTout, processVariableBus.TT902) annotation (Line(points={{
          -732.9,138.3},{-64,138.3},{-64,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.PTin, processVariableBus.PT901) annotation (Line(points={{-732.9,
          128.1},{-64,128.1},{-64,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S900.PTout, processVariableBus.PT902) annotation (Line(points={{
          -732.9,117.9},{-64,117.9},{-64,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(diffPTS100.y, processVariableBus.diffPTS100) annotation (Line(points=
          {{-147,-310},{-106,-310},{-106,-306},{-78,-306},{-78,-3},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=2000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CentralisedSystemGB;
