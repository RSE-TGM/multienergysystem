within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model CentralisedSystemGB_InitForward
  extends Interfaces.SignalBusConnector;
  extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
  extends Networks.Thermal.Configurations.Centralised.CentralisedSystem_GB(
    Kvalve=40,
    redeclare model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp,
    redeclare model WaterCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp,
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


  OffSetBlocks.InputOffset omegaP101Offset(
    fixInput=fixomegaP101,
    u_norm=omegaP101_nom,
    u_start=omegaP101_nom) annotation (Placement(visible=true, transformation(
        origin={-390,-240},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV101Offset(
    fixInput=fixthetaFCV101,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-390,-270},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset omegaP901Offset(
    fixInput=fixomegaP901,
    u_norm=omegaP901_nom,
    u_start=omegaP901_nom) annotation (Placement(visible=true, transformation(
        origin={-910,170},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV901Offset(
    fixInput=fixthetaFCV901,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-910,140},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV701Offset(
    fixInput=fixthetaFCV701,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={130,-140},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV711Offset(
    fixInput=fixthetaFCV711,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={460,-140},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV721Offset(
    fixInput=fixthetaFCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={620,-140},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCV731Offset(
    fixInput=fixthetaFCV731,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={300,-140},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV701Offset(
    fixInput=fixthetaTCV701,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={16,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV711Offset(
    fixInput=fixthetaTCV711,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={340,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV721Offset(
    fixInput=fixthetaTCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={506,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV731Offset(
    fixInput=fixthetaTCV731,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={186,-320},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVR01Offset(
    fixInput=fixthetaFCVR01,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={750,-336},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVC01Offset(
    fixInput=fixthetaFCVC01,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={140,300},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVC02Offset(
    fixInput=fixthetaFCVC02,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={758,236},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutGB101Offset(
    fixInput=fixToutGB101,
    u_norm=ToutGB101_nom,
    u_start=TT102_des) annotation (Placement(visible=true, transformation(
        origin={-390,-296},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutRR01Offset(
    fixInput=fixToutRR01,
    u_norm=TTR02_nom,
    u_start=TTR02_des) annotation (Placement(visible=true, transformation(
        origin={752,-58},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT101Offset(
    fixOutput=fixFT101,
    y_fixed=FT101_des,
    y_norm=FT101_nom) annotation (Placement(visible=true, transformation(
        origin={-130,-250},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT102Offset(
    fixOutput=fixPT102,
    y_fixed=dPTS100_des,
    y_norm=PT102_nom) annotation (Placement(visible=true, transformation(
        origin={-130,-310},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT901Offset(
    fixOutput=fixFT901,
    y_fixed=FT901_des,
    y_norm=FT901_nom) annotation (Placement(visible=true, transformation(
        origin={-690,200},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT902Offset(
    fixOutput=fixPT902,
    y_fixed=PT902_des,
    y_norm=PT902_des) annotation (Placement(visible=true, transformation(
        origin={-690,98},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT704Offset(
    fixOutput=fixTT704,
    y_fixed=TT704_des,
    y_norm=TT704_des) annotation (Placement(visible=true, transformation(
        origin={166,-206},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT714Offset(
    fixOutput=fixTT714,
    y_fixed=TT714_des,
    y_norm=TT714_des) annotation (Placement(visible=true, transformation(
        origin={486,-204},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT724Offset(
    fixOutput=fixTT724,
    y_fixed=TT724_des,
    y_norm=TT724_des) annotation (Placement(visible=true, transformation(
        origin={644,-206},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT734Offset(
    fixOutput=fixTT734,
    y_fixed=TT734_des,
    y_norm=TT734_des) annotation (Placement(visible=true, transformation(
        origin={326,-206},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX701PtOffset(
    fixOutput=fixEX701Pt,
    y_fixed=EX701Pt_des,
    y_norm=EX701Pt_nom) annotation (Placement(visible=true, transformation(
        origin={744,-416},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX711PtOffset(
    fixOutput=fixEX711Pt,
    y_fixed=EX711Pt_des,
    y_norm=EX711Pt_nom) annotation (Placement(visible=true, transformation(
        origin={744,-436},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX721PtOffset(
    fixOutput=fixEX721Pt,
    y_fixed=EX721Pt_des,
    y_norm=EX721Pt_nom) annotation (Placement(visible=true, transformation(
        origin={744,-456},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX731PtOffset(
    fixOutput=fixEX731Pt,
    y_fixed=EX731Pt_des,
    y_norm=EX731Pt_nom) annotation (Placement(visible=true, transformation(
        origin={744,-476},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT701Offset(
    fixOutput=fixTT701,
    y_fixed=TT701_des,
    y_norm=TT701_des) annotation (Placement(visible=true, transformation(
        origin={166,-160},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT711Offset(
    fixOutput=fixTT711,
    y_fixed=TT711_des,
    y_norm=TT711_des) annotation (Placement(visible=true, transformation(
        origin={486,-160},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT721Offset(
    fixOutput=fixTT721,
    y_fixed=TT721_des,
    y_norm=TT721_des) annotation (Placement(visible=true, transformation(
        origin={644,-164},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT731Offset(
    fixOutput=fixTT731,
    y_fixed=TT731_des,
    y_norm=TT731_des) annotation (Placement(visible=true, transformation(
        origin={326,-160},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT701Offset(
    fixOutput=fixFT701,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des) annotation (Placement(visible=true, transformation(
        origin={166,-222},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT711Offset(
    fixOutput=fixFT711,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des) annotation (Placement(visible=true, transformation(
        origin={486,-220},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT721Offset(
    fixOutput=fixFT721,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des) annotation (Placement(visible=true, transformation(
        origin={644,-222},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FT731Offset(
    fixOutput=fixFT731,
    y_fixed=m_flowhot_des,
    y_norm=m_flowhot_des) annotation (Placement(visible=true, transformation(
        origin={326,-222},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FTA12Offset(
    fixOutput=fixFTA12,
    y_fixed=FTA12_des,
    y_norm=FTA12_des) annotation (Placement(visible=true, transformation(
        origin={714,194},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT102Offset(
    fixOutput=fixTT102,
    y_fixed=TT102_des,
    y_norm=TT102_des) annotation (Placement(visible=true, transformation(
        origin={-130,-280},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT902Offset(
    fixOutput=fixTT902,
    y_fixed=TT902_des,
    y_norm=Theat_nom) annotation (Placement(visible=true, transformation(
        origin={-690,148},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT901Offset(
    fixOutput=fixPT901,
    y_fixed=PT901_des,
    y_norm=PT901_des) annotation (Placement(visible=true, transformation(
        origin={-690,122},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT702Offset(
    fixOutput=fixPT702,
    y_fixed=PT702_des,
    y_norm=PT702_nom) annotation (Placement(visible=true, transformation(
        origin={166,-254},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT712Offset(
    fixOutput=fixPT712,
    y_fixed=PT712_des,
    y_norm=PT712_nom) annotation (Placement(visible=true, transformation(
        origin={486,-252},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT722Offset(
    fixOutput=fixPT722,
    y_fixed=PT722_des,
    y_norm=PT722_nom) annotation (Placement(visible=true, transformation(
        origin={644,-254},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT732Offset(
    fixOutput=fixPT732,
    y_fixed=PT732_des,
    y_norm=PT732_nom) annotation (Placement(visible=true, transformation(
        origin={326,-254},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT701Offset(
    fixOutput=fixPT701,
    y_fixed=PT701_des,
    y_norm=PT701_nom) annotation (Placement(visible=true, transformation(
        origin={166,-238},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT711Offset(
    fixOutput=fixPT711,
    y_fixed=PT711_des,
    y_norm=PT711_nom) annotation (Placement(visible=true, transformation(
        origin={486,-236},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT721Offset(
    fixOutput=fixPT721,
    y_fixed=PT721_des,
    y_norm=PT721_nom) annotation (Placement(visible=true, transformation(
        origin={644,-238},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset PT731Offset(
    fixOutput=fixPT731,
    y_fixed=PT731_des,
    y_norm=PT731_nom) annotation (Placement(visible=true, transformation(
        origin={326,-238},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset dPTA1Offset(
    fixOutput=fixdPTA1,
    y_fixed=dPTA1_des,
    y_norm=dPTA1_des) annotation (Placement(visible=true, transformation(
        origin={300,294},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OffSetBlocks.OutputOffset dPTA2Offset(
    fixOutput=fixdPTA2,
    y_fixed=dPTA2_des,
    y_norm=dPTA2_des) annotation (Placement(visible=true, transformation(
        origin={810,260},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FTR01Offset(
    fixOutput=fixFTR01,
    y_fixed=FTR01_des,
    y_norm=FTR01_nom) annotation (Placement(visible=true, transformation(
        origin={851,-221},
        extent={{-7,-7},{7,7}},
        rotation=0)));
  OffSetBlocks.OutputOffset TTR02Offset(
    fixOutput=fixTTR02,
    y_fixed=TTR02_des,
    y_norm=TTR02_des) annotation (Placement(visible=true, transformation(
        origin={730,-292},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset dFTR01Offset(
    fixOutput=fixdFTR00,
    y_fixed=dFTR00_des,
    y_norm=dFTR00_nom) annotation (Placement(visible=true, transformation(
        origin={934,-342},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder FCV101Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{-360,-280},{-340,-260}})));
  Modelica.Blocks.Continuous.FirstOrder FCV901Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{-890,130},{-870,150}})));
  Modelica.Blocks.Continuous.FirstOrder FCVC01Dynamics(
    k=0,
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=0) annotation (Placement(transformation(extent={{170,290},{190,310}})));
  Modelica.Blocks.Continuous.FirstOrder FCVC02Dynamics(
    k=0,
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=0) annotation (Placement(transformation(extent={{732,226},{712,246}})));
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
  OffSetBlocks.OutputOffset TT901Offset(
    fixOutput=fixTT901,
    y_fixed=TT901_des,
    y_norm=Theat_nom) annotation (Placement(visible=true, transformation(
        origin={-690,174},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression GBPower(y=PtGB) annotation (Placement(transformation(extent={{702,-508},{722,-488}})));
  OffSetBlocks.OutputOffset GB101PtOffset(
    fixOutput=fixGB101Pt,
    y_fixed=GB101Pt_des,
    y_norm=GB101Pt_nom) annotation (Placement(visible=true, transformation(
        origin={744,-498},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder P101Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=2*Modelica.Constants.pi*30)
               annotation (Placement(transformation(extent={{-360,-250},{-340,-230}})));
  Modelica.Blocks.Continuous.FirstOrder P901Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=2*Modelica.Constants.pi*30)
               annotation (Placement(transformation(extent={{-890,160},{-870,180}})));
  Modelica.Blocks.Continuous.FirstOrder FCV701Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{110,-150},{90,-130}})));
  Modelica.Blocks.Continuous.FirstOrder FCV711Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{430,-150},{410,-130}})));
  Modelica.Blocks.Continuous.FirstOrder FCV721Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{590,-150},{570,-130}})));
  Modelica.Blocks.Continuous.FirstOrder FCV731Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{270,-150},{250,-130}})));
  Modelica.Blocks.Continuous.FirstOrder TCV701Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{40,-330},{60,-310}})));
  Modelica.Blocks.Continuous.FirstOrder TCV711Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{358,-330},{378,-310}})));
  Modelica.Blocks.Continuous.FirstOrder TCV721Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{520,-330},{540,-310}})));
  Modelica.Blocks.Continuous.FirstOrder TCV731Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=1) annotation (Placement(transformation(extent={{200,-330},{220,-310}})));
  OffSetBlocks.OutputOffset TT702Offset(
    fixOutput=fixTT702,
    y_fixed=TT702_des,
    y_norm=TT702_nom) annotation (Placement(visible=true, transformation(
        origin={166,-176},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT712Offset(
    fixOutput=fixTT712,
    y_fixed=TT712_des,
    y_norm=TT712_nom) annotation (Placement(visible=true, transformation(
        origin={486,-176},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT722Offset(
    fixOutput=fixTT722,
    y_fixed=TT722_des,
    y_norm=TT722_nom) annotation (Placement(visible=true, transformation(
        origin={644,-180},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT732Offset(
    fixOutput=fixTT732,
    y_fixed=TT732_des,
    y_norm=TT732_nom) annotation (Placement(visible=true, transformation(
        origin={326,-176},
        extent={{-6,-6},{6,6}},
        rotation=0)));
equation
  Pt1 = S701.EX7X1.Pt;
  Pt2 = S711.EX7X1.Pt;
  Pt3 = S721.EX7X1.Pt;
  Pt4 = S731.EX7X1.Pt;
  PtGB = S100.GB.Pheat;
  connect(controlSignalBus.domegaP101, omegaP101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-737,-3},{-737,-200},{-785,-200},{-785,-208},{-841,-208},{-841,-200},{-897,-200},{-897,-240},{-398,-240}},
      thickness=0.5,
      pattern=LinePattern.None),
                      Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV101, thetaFCV101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-530,-3},{-530,-4},{-676,-4},{-676,-80},{-548,-80},{-548,-270},{-398,-270}},
      thickness=0.5,
      pattern=LinePattern.None),
                      Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.domegaP901, omegaP901Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-932,-3},{-932,170},{-918,170}},
      thickness=0.5,
      pattern=LinePattern.None),
                      Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV901, thetaFCV901Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-926,-3},{-926,140},{-918,140}},
      thickness=0.5,
      pattern=LinePattern.None),
                      Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV701, thetaFCV701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-724,-3},{-724,-434},{196,-434},{196,-140},{134.8,-140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV711, thetaFCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{480,-3},{480,-140},{464.8,-140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV721, thetaFCV721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{640,-3},{640,-140},{624.8,-140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaFCV731, thetaFCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{312,-3},{312,-140},{304.8,-140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaTCV701, thetaTCV701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{6,-3},{6,-320},{11.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaTCV711, thetaTCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-64,-3},{-64,-344},{320,-344},{320,-320},{335.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaTCV721, thetaTCV721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-648,-3},{-648,-444},{488,-444},{488,-320},{501.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaTCV731, thetaTCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-40,-3},{-40,-340},{172,-340},{172,-320},{181.2,-320}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaFCVR01, thetaFCVR01Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-656,-3},{-656,-442},{352,-442},{352,-448},{548,-448},{548,-336},{745.2,-336}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaFCVC01, thetaFCVC01Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-940,-3},{-940,300},{132,300}},
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
  connect(controlSignalBus.dToutGB101, ToutGB101Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-1038,-3},{-1038,-296},{-398,-296}},
      thickness=0.5,
      pattern=LinePattern.None),
                      Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dToutRR01, ToutRR01Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-234,-3},{-234,-28},{714,-28},{714,-58},{747.2,-58}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FTA12.m_flow, FTA12Offset.y) annotation (Line(points={{672.8,200.6},{672.8,194},{709.2,194}},         color={0,0,127}));
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{-202,61},{-208,61},{-208,62},{-218,62},{
          -218,46.6}}, color={255,0,255}));
  connect(PT102Offset.deltaYnorm, processVariableBus.dPT102) annotation (Line(points={{-121,-310},{40,-310},{40,-3},{896,-3}}, pattern=LinePattern.None),
                                                                          Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT101Offset.deltaYnorm, processVariableBus.dFT101) annotation (Line(points={{-121,-250},{-46,-250},{-46,-396},{1180,-396},{1180,-3},{896,-3}}, pattern=LinePattern.None),
                                                                             Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(processVariableBus.dPT902, PT902Offset.deltaYnorm) annotation (Line(
      points={{896,-3},{-160,-3},{-160,98},{-681,98}},
      thickness=0.5,
      pattern=LinePattern.None),
                      Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT901Offset.deltaYnorm, processVariableBus.dFT901) annotation (Line(points={{-681,200},{-70,200},{-70,134},{2,134},{2,-3},{896,-3}}, pattern=LinePattern.None),
                                                                       Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT704Offset.deltaYnorm, processVariableBus.dTT704) annotation (Line(points={{171.4,-206},{186,-206},{186,-3},{896,-3}},
                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT714Offset.deltaYnorm, processVariableBus.dTT714) annotation (Line(points={{491.4,-204},{508,-204},{508,-3},{896,-3}},
                                                                                color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT724Offset.deltaYnorm, processVariableBus.dTT724) annotation (Line(points={{649.4,-206},{660,-206},{660,-3},{896,-3}},
                                                          color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT734Offset.deltaYnorm, processVariableBus.dTT734) annotation (Line(points={{331.4,-206},{344,-206},{344,-3},{896,-3}},
                                                          color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX701PtOffset.deltaYnorm, processVariableBus.dEX701Pt) annotation (Line(points={{749.4,-416},{794,-416},{794,-3},{896,-3}}, pattern=LinePattern.None),
                                                                                                                                                        Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX711PtOffset.deltaYnorm, processVariableBus.dEX711Pt) annotation (Line(points={{749.4,-436},{778,-436},{778,-434},{804,-434},{804,-3},{896,-3}}, pattern=LinePattern.None),
                                                                                                                                                                              Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX721PtOffset.deltaYnorm, processVariableBus.dEX721Pt) annotation (Line(points={{749.4,-456},{814,-456},{814,-3},{896,-3}}, pattern=LinePattern.None),
                                                                                                                                                        Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX731PtOffset.deltaYnorm, processVariableBus.dEX731Pt) annotation (Line(points={{749.4,-476},{828,-476},{828,-3},{896,-3}}, pattern=LinePattern.None),
                                                                                                                                                        Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT701Offset.deltaYnorm, processVariableBus.dTT701) annotation (Line(points={{171.4,-160},{180,-160},{180,-6},{896,-6},{896,-3}},
                                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT711Offset.deltaYnorm, processVariableBus.dTT711) annotation (Line(points={{491.4,-160},{502,-160},{502,-3},{896,-3}},
                                                       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT721Offset.deltaYnorm, processVariableBus.dTT721) annotation (Line(points={{649.4,-164},{656,-164},{656,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT731Offset.deltaYnorm, processVariableBus.dTT731) annotation (Line(points={{331.4,-160},{336,-160},{336,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT701Offset.deltaYnorm, processVariableBus.dFT701) annotation (Line(points={{171.4,-222},{188,-222},{188,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT711Offset.deltaYnorm, processVariableBus.dFT711) annotation (Line(points={{491.4,-220},{510,-220},{510,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT721Offset.deltaYnorm, processVariableBus.dFT721) annotation (Line(points={{649.4,-222},{662,-222},{662,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FT731Offset.deltaYnorm, processVariableBus.dFT731) annotation (Line(points={{331.4,-222},{346,-222},{346,-3},{896,-3}},
                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FTA12Offset.deltaYnorm, processVariableBus.dFTA12) annotation (Line(points={{719.4,194},{726,194},{726,-3},{896,-3}},
                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT102Offset.deltaYnorm, processVariableBus.dTT102) annotation (Line(points={{-121,-280},{-84,-280},{-84,-2},{896,-2},{896,-3}}, pattern=LinePattern.None),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT902Offset.deltaYnorm, processVariableBus.dTT902) annotation (Line(points={{-681,148},{-8,148},{-8,-3},{896,-3}}, pattern=LinePattern.None),
                                                     Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT901Offset.deltaYnorm, processVariableBus.dPT901) annotation (Line(points={{-681,122},{-18,122},{-18,-3},{896,-3}}, pattern=LinePattern.None),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT702Offset.deltaYnorm, processVariableBus.dPT702) annotation (Line(points={{171.4,-254},{192,-254},{192,-3},{896,-3}},            color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT712Offset.deltaYnorm, processVariableBus.dPT712) annotation (Line(points={{491.4,-252},{514,-252},{514,-4},{646,-4},{646,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT722Offset.deltaYnorm, processVariableBus.dPT722) annotation (Line(points={{649.4,-254},{666,-254},{666,-3},{896,-3}},      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT732Offset.deltaYnorm, processVariableBus.dPT732) annotation (Line(points={{331.4,-254},{350,-254},{350,-3},{896,-3}},                                                                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PT701Offset.deltaYnorm, processVariableBus.dPT701) annotation (Line(points={{171.4,-238},{190,-238},{190,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT711Offset.deltaYnorm, processVariableBus.dPT711) annotation (Line(points={{491.4,-236},{512,-236},{512,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT721Offset.deltaYnorm, processVariableBus.dPT721) annotation (Line(points={{649.4,-238},{664,-238},{664,-3},{896,-3}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PT731Offset.deltaYnorm, processVariableBus.dPT731) annotation (Line(points={{331.4,-238},{348,-238},{348,-3},{896,-3}},                                                                                                                            color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dPTA1Offset.deltaYnorm, processVariableBus.dPTA1) annotation (Line(points={{309,294},{858,294},{858,-12},{896,-12},{896,-3}},                                                                                                                                        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dPTA2Offset.deltaYnorm, processVariableBus.dPTA2) annotation (Line(points={{815.4,260},{848,260},{848,-3},{896,-3}},                                                                                                                            color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FTR01Offset.deltaYnorm, processVariableBus.dFTR01) annotation (Line(points={{857.3,-221},{857.3,-220},{960,-220},{960,-3},{896,-3}},                                                                                                                             color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TTR02Offset.deltaYnorm, processVariableBus.dTTR02) annotation (Line(points={{735.4,-292},{874,-292},{874,-298},{998,-298},{998,-3},{896,-3}},                                                                                                                                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dFTR01Offset.deltaYnorm, processVariableBus.ddFTR00) annotation (Line(points={{939.4,-342},{982,-342},{982,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PTA20.p, diffPT2.u2) annotation (Line(points={{681,197.8},{681,196},{706,196},{706,254},{762,254}},                     color={0,0,127}));
  connect(PTA19.p, diffPT2.u1) annotation (Line(points={{684,254.2},{684,276},{754,276},{754,266},{762,266}}, color={0,0,127}));
  connect(diffPT2.y, dPTA2Offset.y) annotation (Line(points={{785,260},{805.2,260}},
                                                                                   color={0,0,127}));
  connect(PTA07.p, diffPT1.u1) annotation (Line(points={{234,246.2},{234,300},{256,300}},             color={0,0,127}));
  connect(PTA08.p, diffPT1.u2) annotation (Line(points={{224,197.8},{224,190},{234,190},{234,288},{256,288}}, color={0,0,127}));
  connect(diffPT1.y, dPTA1Offset.y) annotation (Line(points={{279,294},{292,294}}, color={0,0,127}));
  connect(FCVC02Dynamics.y, FCVC02.opening) annotation (Line(points={{711,236},{711,221},{682,221}}, color={0,0,127}));
  connect(FCVC02Dynamics.u, thetaFCVC02Offset.u) annotation (Line(points={{734,236},{752.6,236}},
                                                                                                color={0,0,127}));
  connect(diffPTS100.y, PT102Offset.y) annotation (Line(points={{-147,-310},{-138,-310}},
                                                                                        color={0,0,127}));
  connect(EX701Power.y, EX701PtOffset.y) annotation (Line(points={{723,-416},{739.2,-416}}, color={0,0,127}));
  connect(EX711Power.y, EX711PtOffset.y) annotation (Line(points={{723,-436},{739.2,-436}}, color={0,0,127}));
  connect(EX721Power.y, EX721PtOffset.y) annotation (Line(points={{723,-456},{739.2,-456}}, color={0,0,127}));
  connect(EX731Power.y, EX731PtOffset.y) annotation (Line(points={{723,-476},{739.2,-476}}, color={0,0,127}));
  connect(RR101_Status.y, RR01.cold_on) annotation (Line(points={{720,-120},{724.225,-120},{724.225,-118.5},{728.45,-118.5}}, color={255,0,255}));
  connect(ToutRR01Offset.u, RR01.in_Tout_cold_set) annotation (Line(points={{757.4,-58},{764,-58},{764,-60},{767.5,-60},{767.5,-93.65}}, color={0,0,127}));
  connect(thetaFCVR01Offset.u, FCVR01.opening) annotation (Line(points={{755.4,-336},{762,-336},{762,-338},{766,-338},{766,-352}}, color={0,0,127}));
  connect(TTR02.T, TTR02Offset.y) annotation (Line(points={{693.2,-286},{680,-286},{680,-292},{725.2,-292}}, color={0,0,127}));
  connect(FTR01.m_flow, FTR01Offset.y) annotation (Line(points={{831,-225.5},{831,-222},{838,-222},{838,-221},{845.4,-221}}, color={0,0,127}));
  connect(diffPTRR01.y,dFTR01Offset. y) annotation (Line(points={{922.6,-342},{929.2,-342}}, color={0,0,127}));
  connect(FTR03.m_flow, diffPTRR01.u1) annotation (Line(points={{815.5,-355},{902,-355},{902,
          -345.6},{908.8,-345.6}},                                                                                    color={0,0,127}));
  connect(diffPTRR01.u2, FTR01Offset.y) annotation (Line(points={{908.8,-338.4},{840,-338.4},{840,-236},{838,-222},{838,-221},{845.4,-221}}, color={0,0,127}));
  connect(thetaFCV901Offset.u, FCV901Dynamics.u) annotation (Line(points={{-901,140},{-892,140}}, color={0,0,127}));
  connect(FCV901Dynamics.y, S900.theta) annotation (Line(points={{-869,140},{-860,140},{-860,
          148.5},{-845.1,148.5}}, color={0,0,127}));
  connect(S900.m_flow_, FT901Offset.y) annotation (Line(points={{-732.9,158.7},{-716,
          158.7},{-716,200},{-698,200}}, color={0,0,127}));
  connect(S900.TTout, TT902Offset.y) annotation (Line(points={{-732.9,138.3},{-716,138.3},
          {-716,138},{-706,138},{-706,148},{-698,148}}, color={0,0,127}));
  connect(S900.PTin, PT901Offset.y) annotation (Line(points={{-732.9,128.1},{-706,128.1},
          {-706,122},{-698,122}}, color={0,0,127}));
  connect(S900.PTout, PT902Offset.y) annotation (Line(points={{-732.9,117.9},{-712,117.9},
          {-712,98},{-698,98}}, color={0,0,127}));
  connect(S900.TTin, TT901Offset.y) annotation (Line(points={{-732.9,148.5},{-710,148.5},
          {-710,174},{-698,174}}, color={0,0,127}));
  connect(TT901Offset.deltaYnorm, processVariableBus.dTT901) annotation (Line(points={{-681,174},{-32,174},{-32,-3},{896,-3}}, pattern=LinePattern.None),
                                                                                        Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(thetaFCV101Offset.u, FCV101Dynamics.u) annotation (Line(points={{-381,-270},{-362,-270}},
                                                                                                  color={0,0,127}));
  connect(FCV101Dynamics.y, S100.theta) annotation (Line(points={{-339,-270},{-339,-262},{-298.4,-262}},
                                                                                           color={0,0,127}));
  connect(ToutGB101Offset.u, S100.Toutset) annotation (Line(points={{-381,-296},{-320,-296},{-320,-270.8},{-298.4,-270.8}},          color={0,0,127}));
  connect(GB101Status.y, S100.status) annotation (Line(points={{-379,-326},{-379,-320},{-312,-320},{-312,-279.6},{-298.4,-279.6}},           color={255,0,255}));
  connect(S100.m_flow_, FT101Offset.y) annotation (Line(points={{-201.6,-253.2},{-172.8,-253.2},{-172.8,-250},{-138,-250}},
                                                                                                                    color={0,0,127}));
  connect(S100.TTout, TT102Offset.y) annotation (Line(points={{-201.6,-270.8},{-150,-270.8},{-150,-280},{-138,-280}}, color={0,0,127}));
  connect(S100.PTin, diffPTS100.u1) annotation (Line(points={{-201.6,-279.6},{-180,-279.6},{-180,-304},{-170,-304},{-170,-304}}, color={0,0,127}));
  connect(S100.PTout, diffPTS100.u2) annotation (Line(points={{-201.6,-288.4},{-188,-288.4},{-188,-316},{-170,-316}}, color={0,0,127}));
  connect(FCVC01Dynamics.u, thetaFCVC01Offset.u) annotation (Line(points={{168,300},{149,300}}, color={0,0,127}));
  connect(FCVC01Dynamics.y, FCVC01.opening) annotation (Line(points={{191,300},{200,300},{200,223},{245,223}}, color={0,0,127}));
  connect(GBPower.y, GB101PtOffset.y) annotation (Line(points={{723,-498},{739.2,-498}}, color={0,0,127}));
  connect(GB101PtOffset.deltaYnorm, processVariableBus.dGB101Pt)
    annotation (Line(points={{749.4,-498},{780,-498},{780,-496},{1022,-496},{1022,-3},{896,-3}}, pattern=LinePattern.None),
                                                                                                                   Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P101Dynamics.y, S100.omega) annotation (Line(points={{-339,-240},{-320,-240},{-320,-253.2},{-298.4,-253.2}}, color={0,0,127}));
  connect(omegaP101Offset.u, P101Dynamics.u) annotation (Line(points={{-381,-240},{-362,-240}}, color={0,0,127}));
  connect(omegaP901Offset.u, P901Dynamics.u) annotation (Line(points={{-901,170},{-892,170}}, color={0,0,127}));
  connect(P901Dynamics.y, S900.omega) annotation (Line(points={{-869,170},{-860,170},{-860,
          158.7},{-845.1,158.7}}, color={0,0,127}));
  connect(FCV701Dynamics.u, thetaFCV701Offset.u)
    annotation (Line(points={{112,-140},{124.6,-140}}, color={0,0,127}));
  connect(thetaFCV711Offset.u, FCV711Dynamics.u) annotation (Line(points={{454.6,-140},{432,-140}}, color={0,0,127}));
  connect(thetaFCV721Offset.u, FCV721Dynamics.u) annotation (Line(points={{614.6,-140},{592,-140}}, color={0,0,127}));
  connect(thetaFCV731Offset.u, FCV731Dynamics.u) annotation (Line(points={{294.6,-140},{272,-140}}, color={0,0,127}));
  connect(thetaTCV701Offset.u, TCV701Dynamics.u) annotation (Line(points={{21.4,-320},{38,-320}}, color={0,0,127}));
  connect(TCV701Dynamics.y, TCV701.opening) annotation (Line(points={{61,-320},{72,-320}}, color={0,0,127}));
  connect(thetaTCV711Offset.u, TCV711Dynamics.u) annotation (Line(points={{345.4,-320},{356,-320}}, color={0,0,127}));
  connect(TCV711Dynamics.y, TCV711.opening) annotation (Line(points={{379,-320},{392,-320}}, color={0,0,127}));
  connect(thetaTCV721Offset.u, TCV721Dynamics.u) annotation (Line(points={{511.4,-320},{518,-320}}, color={0,0,127}));
  connect(TCV721Dynamics.y, TCV721.opening) annotation (Line(points={{541,-320},{552,-320}},   color={0,0,127}));
  connect(thetaTCV731Offset.u, TCV731Dynamics.u) annotation (Line(points={{191.4,-320},{198,-320}}, color={0,0,127}));
  connect(TCV731Dynamics.y, TCV731.opening) annotation (Line(points={{221,-320},{232,-320}}, color={0,0,127}));
  connect(TT702Offset.deltaYnorm, processVariableBus.dTT702)
    annotation (Line(points={{171.4,-176},{182,-176},{182,-3},{896,-3}},
                                                                      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT712Offset.deltaYnorm, processVariableBus.dTT712)
    annotation (Line(points={{491.4,-176},{504,-176},{504,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT722Offset.deltaYnorm, processVariableBus.dTT722)
    annotation (Line(points={{649.4,-180},{658,-180},{658,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT732Offset.deltaYnorm, processVariableBus.dTT732)
    annotation (Line(points={{331.4,-176},{340,-176},{340,-4},{896,-4},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PR01.in_omega, PR01_omega.y) annotation (Line(points={{710.5,-207.8},{714.25,-207.8},{714.25,-209},{718,-209}}, color={0,0,127}));
  connect(S721.TT7X1_TT, TT721Offset.y) annotation (Line(points={{624,-178},{632,-178},{632,-164},{639.2,-164}}, color={0,0,127}));
  connect(S721.TT7X2_TT, TT722Offset.y) annotation (Line(points={{624,-186},{630,-186},{630,-188},{634,-188},{634,-180},{639.2,-180}}, color={0,0,127}));
  connect(S721.TT7X4_TT, TT724Offset.y) annotation (Line(points={{624,-202},{634,-202},{634,-206},{639.2,-206}}, color={0,0,127}));
  connect(S721.FT7X1_FT, FT721Offset.y) annotation (Line(points={{624,-210},{636,-210},{636,-222},{639.2,-222}}, color={0,0,127}));
  connect(S721.PT7X1_PT, PT721Offset.y) annotation (Line(points={{624,-218},{634,-218},{634,-238},{639.2,-238}}, color={0,0,127}));
  connect(S711.TT7X1_TT, TT711Offset.y) annotation (Line(points={{464,-178},{474,-178},{474,-160},{481.2,-160}}, color={0,0,127}));
  connect(S711.TT7X2_TT, TT712Offset.y) annotation (Line(points={{464,-186},{476,-186},{476,-176},{481.2,-176}}, color={0,0,127}));
  connect(S711.TT7X4_TT, TT714Offset.y) annotation (Line(points={{464,-202},{474,-202},{474,-204},{481.2,-204}}, color={0,0,127}));
  connect(S711.FT7X1_FT, FT711Offset.y) annotation (Line(points={{464,-210},{476,-210},{476,-220},{481.2,-220}}, color={0,0,127}));
  connect(S711.PT7X1_PT, PT711Offset.y) annotation (Line(points={{464,-218},{474,-218},{474,-236},{481.2,-236}}, color={0,0,127}));
  connect(S711.PT7X2_PT, PT712Offset.y) annotation (Line(points={{464,-226},{472,-226},{472,-252},{481.2,-252}}, color={0,0,127}));
  connect(FCV721Dynamics.y, S721.theta) annotation (Line(points={{569,-140},{528,-140},{528,-182},{536,-182}}, color={0,0,127}));
  connect(S721.PT7X2_PT, PT722Offset.y) annotation (Line(points={{624,-226},{632,-226},{632,-254},{639.2,-254}}, color={0,0,127}));
  connect(FCV731Dynamics.y, S731.theta) annotation (Line(points={{249,-140},{206,-140},{206,-182},{216,-182}}, color={0,0,127}));
  connect(S731.TT7X1_TT, TT731Offset.y) annotation (Line(points={{304,-178},{312,-178},{312,-160},{321.2,-160}}, color={0,0,127}));
  connect(S731.TT7X2_TT, TT732Offset.y) annotation (Line(points={{304,-186},{316,-186},{316,-176},{321.2,-176}}, color={0,0,127}));
  connect(S731.TT7X4_TT, TT734Offset.y) annotation (Line(points={{304,-202},{316,-202},{316,-206},{321.2,-206}}, color={0,0,127}));
  connect(S731.FT7X1_FT, FT731Offset.y) annotation (Line(points={{304,-210},{318,-210},{318,-222},{321.2,-222}}, color={0,0,127}));
  connect(S731.PT7X1_PT, PT731Offset.y) annotation (Line(points={{304,-218},{316,-218},{316,-238},{321.2,-238}}, color={0,0,127}));
  connect(S731.PT7X2_PT, PT732Offset.y) annotation (Line(points={{304,-226},{314,-226},{314,-254},{321.2,-254}}, color={0,0,127}));
  connect(FCV711Dynamics.y, S711.theta) annotation (Line(points={{409,-140},{368,-140},{368,-182},{376,-182}}, color={0,0,127}));
  connect(FCV701Dynamics.y, S701.theta) annotation (Line(points={{89,-140},{42,-140},{42,-182},{56,-182}}, color={0,0,127}));
  connect(S701.TT7X1_TT, TT701Offset.y) annotation (Line(points={{144,-178},{152,-178},{152,-160},{161.2,-160}}, color={0,0,127}));
  connect(S701.TT7X2_TT, TT702Offset.y) annotation (Line(points={{144,-186},{156,-186},{156,-176},{161.2,-176}}, color={0,0,127}));
  connect(S701.TT7X4_TT, TT704Offset.y) annotation (Line(points={{144,-202},{156,-202},{156,-206},{161.2,-206}}, color={0,0,127}));
  connect(S701.FT7X1_FT, FT701Offset.y) annotation (Line(points={{144,-210},{156,-210},{156,-222},{161.2,-222}}, color={0,0,127}));
  connect(S701.PT7X1_PT, PT701Offset.y) annotation (Line(points={{144,-218},{154,-218},{154,-238},{161.2,-238}}, color={0,0,127}));
  connect(S701.PT7X2_PT, PT702Offset.y) annotation (Line(points={{144,-226},{152,-226},{152,-254},{161.2,-254}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-70,100},{70,-100}},
          textColor={140,56,54},
          textStyle={TextStyle.Bold},
          textString="Thermal
Facility")}),                                                    Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=2000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CentralisedSystemGB_InitForward;
