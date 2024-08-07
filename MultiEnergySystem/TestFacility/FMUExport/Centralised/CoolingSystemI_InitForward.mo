within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model CoolingSystemI_InitForward "Analysis of the cooling system using InputOffset/OutputOffset blocks"
  extends Interfaces.SignalBusConnector;
  extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
  import Pump = MultiEnergySystem.DistrictHeatingNetwork.Data.PumpData;


//Boolean Parameters
  //Initialization type
  parameter Boolean ForwardInit = true "True if forward, False if backward";
  //Input
  parameter Boolean fixthetaTCV701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaTCV731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixthetaFCVR01 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowhotEX701 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowhotEX711 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowhotEX721 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixmflowhotEX731 = ForwardInit "True if forward, False if backward";
  parameter Boolean fixToutRR01 = ForwardInit "True if forward, False if backward";

//Output
  final parameter Boolean fixEX701Pt = not fixthetaTCV701;
  final parameter Boolean fixEX711Pt = not fixthetaTCV711;
  final parameter Boolean fixEX721Pt = not fixthetaTCV721;
  final parameter Boolean fixEX731Pt = not fixthetaTCV731;
  final parameter Boolean fixdFTR00 = not fixthetaFCVR01;
  final parameter Boolean fixTT704 = not fixmflowhotEX701;
  final parameter Boolean fixTT714 = not fixmflowhotEX711;
  final parameter Boolean fixTT724 = not fixmflowhotEX721;
  final parameter Boolean fixTT734 = not fixmflowhotEX731;
  final parameter Boolean fixTTR02 = not fixToutRR01;

  final parameter Boolean fixFTR01 = false;



//Normalisation values
  //Nominal values
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1 "Nom. opening valve in the system" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Non dimensional"));
  parameter DistrictHeatingNetwork.Types.Temperature THot_nom = 80 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature TCool_nom = 15 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature ToutRR01_nom = 30 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature ToutEB401_nom = 100 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP901_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP101_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP401_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowcool_nom= 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flowhot_nom= 1.3;

  parameter DistrictHeatingNetwork.Types.Pressure EX701Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731Pt_nom = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR01_nom= DistrictHeatingNetwork.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR03_nom= DistrictHeatingNetwork.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate dFTR00_nom= DistrictHeatingNetwork.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.Temperature TTR02_nom = 30 + 273.15 "Desired temperature at the outlet of the loads";


  parameter DistrictHeatingNetwork.Types.Pressure EX701Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731Pt_des = 50e3 "Desired low circuit pressure" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Power"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR01_des= DistrictHeatingNetwork.Data.PumpData.PR01.qnom_inm3h*980/3600 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate FTR03_des= 5 "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate dFTR00_des= FTR01_des-FTR03_des "Desired total hot mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.Temperature TTR02_des = 15 + 273.15 "Desired temperature at the outlet of the loads";
  parameter DistrictHeatingNetwork.Types.Temperature TT704_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT714_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT724_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));
  parameter DistrictHeatingNetwork.Types.Temperature TT734_des = 30 + 273.15 "Desired temperature at the outlet of the loads" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Temperature"));

  parameter Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_total = 2.4;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;


  // EX701
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=45 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=
      EX701_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;

  // EX711
  parameter Real EX711_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=45 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=
      EX711_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15;

  // EX721
  parameter Real EX721_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=45 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=
      EX721_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=14 + 273.15;

  // EX731
  parameter Real EX731_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=45 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=0.5*1000/
      3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;


  //1. Cooling System

  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Cool = 0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Cool = 0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_PR01 = 2e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_Cool = 20 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_Cool = 15 + 273.15;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Cool = 8.88;
  parameter Real q_Cool(unit = "m3/h") = 32;
  parameter DistrictHeatingNetwork.Types.Length t_RR = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_RR = 85e-3;
  parameter Real Kvalve(unit = "m3/h") = 90;
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 4e-3;
  parameter DistrictHeatingNetwork.Types.Pressure dp_RR01 = 0.5e5;
  parameter Real FCVR01theta[:,:] = [0, 1; 100, 1];
  parameter Real PR01omega[:,:] = [0, 2*pi*50; 100, 2*pi*50];
  parameter Real PTR01_profile[:,:] = [0, 1.23e5; 1780, 1.23e5; 1780, 1.03e5; 3000, 1.03e5];
  parameter Real TTR01_profile[:,:] = [0, 16 + 273.15; 500, 16 + 273.15; 1000, 25 + 273.15; 3000, 16 + 273.15; 4000, 16 + 273.15];
  parameter Real TTRSP_profile[:,:] = [0, 15 + 273.15; 3000, 15 + 273.15];
  parameter Real PTR02_profile[:,:] = [0, 2.2e5; 3000, 2.2e5];

  //2. Users System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users = 3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users = 2.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature T_start_UserIn = 7 + 273.15;
  parameter Real q_Users_total(unit = "m3/h") = 20;
  parameter Real q_Users(unit = "m3/h") = q_Users_total/4;
  parameter DistrictHeatingNetwork.Types.Length t_Users = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Users = 32e-3;
  parameter DistrictHeatingNetwork.Types.Length t_Rack = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Rack = 51e-3;
  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];

   // Lengths of pipelines source side
  parameter DistrictHeatingNetwork.Types.Length L_VER901_FCVR01=1;
  parameter DistrictHeatingNetwork.Types.Length h_VER901_FCVR01=-0.8;
  parameter DistrictHeatingNetwork.Types.Length L_FCVR01_FTR03=2.95;
  parameter DistrictHeatingNetwork.Types.Length h_FCVR01_FTR03=2.35;
  parameter DistrictHeatingNetwork.Types.Length L_FTR03_PTR01=1.05;
  parameter DistrictHeatingNetwork.Types.Length h_FTR03_PTR01=0.25;
  parameter DistrictHeatingNetwork.Types.Length L_PTR01_FTR01=1.90;
  parameter DistrictHeatingNetwork.Types.Length h_PTR01_FTR01=-1.90;
  parameter DistrictHeatingNetwork.Types.Length L_FTR01_RR01=1.97;
  parameter DistrictHeatingNetwork.Types.Length h_FTR01_RR01=-0.72;
  parameter DistrictHeatingNetwork.Types.Length L_RR01_PR01=1.275;
  parameter DistrictHeatingNetwork.Types.Length h_RR01_PR01=0;
  parameter DistrictHeatingNetwork.Types.Length L_PR01_PTR02=2.8;
  parameter DistrictHeatingNetwork.Types.Length h_PR01_PTR02=1;
  parameter DistrictHeatingNetwork.Types.Length L_TTR02_VER901=0.43;
  parameter DistrictHeatingNetwork.Types.Length h_TTR02_VER901=0;

  parameter DistrictHeatingNetwork.Types.Length L_UsersIn_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersIn_EX721=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_cold=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_cold=0.50*1;

  parameter DistrictHeatingNetwork.Types.Length L_UsersOut_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersOut_EX721=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_hot=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_hot=0;

  parameter DistrictHeatingNetwork.Types.Length L_TT704_TCV701=0.85;
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0.85; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.80;
  parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.80; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=1.25;//0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=1.25; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.40; //0.65;

  parameter DistrictHeatingNetwork.Types.Length L_TCV701_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV701_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV711_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV711_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV721_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV721_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV731_rUsersOut=1 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_TCV731_rUsersOut=1;

  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT703=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT703=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT713=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT713=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT723=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT723=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT733=1.65 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT733=-1.65*0.1;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersIn=0.8 + 1.2 + 0.5 + 2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersIn=0.8 + 0.6;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersOut=2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersOut=0;


  parameter Real m_flow_Cool_approx[:, :] = [0, 6; 1E3, 6];

  DistrictHeatingNetwork.Types.Power Pt1(nominal = 50e3, start = 40e3);
  DistrictHeatingNetwork.Types.Power Pt2(nominal = 50e3, start = 40e3);
  DistrictHeatingNetwork.Types.Power Pt3(nominal = 50e3, start = 40e3);
  DistrictHeatingNetwork.Types.Power Pt4(nominal = 50e3, start = 40e3);
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    PR01(
    Tin_start(displayUnit="K") = Tout_start_Cool,
    Tout_start(displayUnit="K") = Tout_start_Cool,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    m_flow_start=m_flow_Cool,
    dpnom=Pump.PR01.dpnom,
    etaelec=Pump.PR01.etaelec,
    etamech=Pump.PR01.etamech,
    etanom=Pump.PR01.etanom,
    hin_start=Pump.PR01.hin_start,
    m_flow_nom=Pump.PR01.m_flow_nom,
    omeganom=Pump.PR01.omeganom,
    pin_start(displayUnit="Pa") = 2e5,
    pout_start(displayUnit="Pa") = 2.6e5,
    headnom=Pump.PR01.headnom,
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    use_in_omega=true)                           annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={277,8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure PTR02_Source(
    use_in_p0=false,
    p0=220000,
    T0(displayUnit="K") = 14.76 + 273.15,
    R=1E-3)                                                                       "Reference pressure at PTR02"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={235,-67})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PTR01_FTR01(
    L=L_PTR01_FTR01,
    h=h_PTR01_FTR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={387,-7})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={389,-52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={389,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={389,18})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR01_RR01(
    L=L_FTR01_RR01,
    h=h_FTR01_RR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={387,43})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_RR01_PR01(
    L=L_RR01_PR01,
    h=h_RR01_PR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={277,43})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={274,-67})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={274,-57})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PR01_PTR02(
    L=L_PR01_PTR02,
    h=h_PR01_PTR02,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={277,-37})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    use_in_Tout_cold_set=true,
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool,
    V=0.001) "Chiller"
    annotation (Placement(transformation(extent={{297,69},{367,139}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{405,1},{446,36}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_6(use_numberPort=true, significantDigits=4)
    annotation (Placement(transformation(extent={{406,-51},{447,-16}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_7(use_numberPort=true, significantDigits=4)
    annotation (Placement(transformation(extent={{257,-47},{216,-12}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX701(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-361,2.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT701(T_start=EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-338,42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT701(T_start=EX701_Tout_hot, p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-338,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-338,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT702(T_start=EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-382,26})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-382,66})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX711(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-59,-0.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-38,44})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-38,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-38,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT712(T_start=EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-82,26})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-82,66})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX721(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.8257757,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.8257757,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={99,-0.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={122,44})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={122,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={122,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT722(T_start=EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,26})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,66})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX731(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-201,0.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-178,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-178,56})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-178,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT732(T_start=EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-222,26})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-222,66})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV731(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV731.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV731.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV731.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-220,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-222.5,-51.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT734_TCV731(
    L=L_TT734_TCV731,
    h=h_TT734_TCV731,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-220,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT703(
    L=L_rUsersIn_TT703,
    h=h_rUsersIn_TT703,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-340,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT723(
    L=L_rUsersIn_TT723,
    h=h_rUsersIn_TT723,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={120,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV721(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV721.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV721.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={79.5,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT723(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={117,-53})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={78,-54})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT724_TCV721(
    L=L_TT724_TCV721,
    h=h_TT724_TCV721,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT713(
    L=L_rUsersIn_TT713,
    h=h_rUsersIn_TT713,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-40,-101})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV711(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV711.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV711.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV711.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-80,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT713(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-43,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-82,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT714_TCV711(
    L=L_TT714_TCV711,
    h=h_TT714_TCV711,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV701(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV701.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV701.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV701.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-380,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-382,-51})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT704_TCV701(
    L=L_TT704_TCV701,
    h=h_TT704_TCV701,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-380,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT703(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-344,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT733(
    L=L_rUsersIn_TT733,
    h=h_rUsersIn_TT733,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-180,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT733(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-183,-52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX721_EX711_cold(
    L=L_EX721_EX711_cold,
    h=h_EX721_EX711_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={8,-142})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX701_EX731_cold(
    L=L_EX701_EX731_cold,
    h=h_EX701_EX731_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-120,-142})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX711_EX701_cold(
    L=L_EX711_EX701_cold,
    h=h_EX711_EX701_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-280,-143})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV701_rackUsersOut(
    L=L_TCV701_rUsersOut,
    h=h_TCV701_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-380,-160})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV731_rackUsersOut(
    L=L_TCV731_rUsersOut,
    h=h_TCV731_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-220,-160})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX711_EX701_hot(
    L=L_EX711_EX701_hot,
    h=h_EX711_EX701_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-160,-182})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV711_rackUsersOut(
    L=L_TCV711_rUsersOut,
    h=h_TCV711_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-160})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX721_EX711_hot(
    L=L_EX721_EX711_hot,
    h=h_EX721_EX711_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={0,-182})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX701_EX731_hot(
    L=L_EX701_EX731_hot,
    h=h_EX701_EX731_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-310,-182})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV721_rackUsersOut(
    L=L_TCV721_rUsersOut,
    h=h_TCV721_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-161})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_UsersIn_EX721(
    L=L_UsersIn_EX721,
    h=h_UsersIn_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={144,-142})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_UsersOut_EX721(
    L=L_UsersOut_EX721,
    h=h_UsersOut_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=m_flow_Cool_approx[1, 1],
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={119,-182})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVR01(
    Kv=Kvalve,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = 2.77476e5,
    q_m3h_start=18)                          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={327,-139})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_VER901_FCVR01(
    L=L_VER901_FCVR01,
    h=h_VER901_FCVR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool - q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={297,-139})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FCVR01_FTR03(
    L=L_FCVR01_FTR03,
    h=h_FCVR01_FTR03,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool - q_Users_total,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={357,-139})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=0,
        origin={377,-141})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={275,-117})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR03_PTR01(
    L=L_FTR03_PTR01,
    h=h_FTR03_PTR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={387,-119})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{202,-152},{182,-132}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{182,-194},{202,-174}})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{229,5},{249,25}})));
  Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working"
    annotation (Placement(transformation(extent={{259,94},{279,114}})));
  OffSetBlocks.InputOffset thetaTCV701Offset(
    fixInput=fixthetaTCV701,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-412,-102},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV731Offset(
    fixInput=fixthetaTCV731,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-246,-102},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV711Offset(
    fixInput=fixthetaTCV711,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={-106,-102},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaTCV721Offset(
    fixInput=fixthetaTCV721,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={58,-102},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset thetaFCVR01Offset(
    fixInput=fixthetaFCVR01,
    u_norm=theta_nom,
    u_start=theta_nom) annotation (Placement(visible=true, transformation(
        origin={312,-112},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression EX701Power(y=Pt1) annotation (Placement(transformation(extent={{492,-116},{512,-96}})));
  Modelica.Blocks.Sources.RealExpression EX711Power(y=Pt2) annotation (Placement(transformation(extent={{492,-136},{512,-116}})));
  Modelica.Blocks.Sources.RealExpression EX721Power(y=Pt3) annotation (Placement(transformation(extent={{492,-156},{512,-136}})));
  Modelica.Blocks.Sources.RealExpression EX731Power(y=Pt4) annotation (Placement(transformation(extent={{492,-176},{512,-156}})));
  OffSetBlocks.OutputOffset EX701PtOffset(
    fixOutput=fixEX701Pt,
    y_fixed=EX701Pt_des,
    y_norm=EX701Pt_nom) annotation (Placement(visible=true, transformation(
        origin={534,-106},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX711PtOffset(
    fixOutput=fixEX711Pt,
    y_fixed=EX711Pt_des,
    y_norm=EX711Pt_nom) annotation (Placement(visible=true, transformation(
        origin={534,-126},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX721PtOffset(
    fixOutput=fixEX721Pt,
    y_fixed=EX721Pt_des,
    y_norm=EX721Pt_nom) annotation (Placement(visible=true, transformation(
        origin={534,-146},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset EX731PtOffset(
    fixOutput=fixEX731Pt,
    y_fixed=EX731Pt_des,
    y_norm=EX731Pt_nom) annotation (Placement(visible=true, transformation(
        origin={534,-166},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset FTR01Offset(
    fixOutput=fixFTR01,
    y_fixed=FTR01_des,
    y_norm=FTR01_nom)     annotation (Placement(visible=true, transformation(
        origin={426,36},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset ToutRR01Offset(
    fixInput=fixToutRR01,
    u_norm=TTR02_nom,
    u_start=TTR02_des) annotation (Placement(visible=true, transformation(
        origin={314,156},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TTR02Offset(
    fixOutput=fixTTR02,
    y_fixed=TTR02_des,
    y_norm=TTR02_des) annotation (Placement(visible=true, transformation(
        origin={296,-80},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression ThotSP(y=80 + 273.15) annotation (Placement(transformation(extent={{-464,108},{-444,128}})));
  OffSetBlocks.InputOffset mflowEX701Offset(
    fixInput=fixmflowhotEX701,
    u_norm=m_flowhot_nom,
    u_start=m_flowhot_nom) annotation (Placement(visible=true, transformation(
        origin={-346,138},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX711Offset(
    fixInput=fixmflowhotEX711,
    u_norm=m_flowhot_nom,
    u_start=m_flowhot_nom) annotation (Placement(visible=true, transformation(
        origin={-38,138},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX721Offset(
    fixInput=fixmflowhotEX721,
    u_norm=m_flowhot_nom,
    u_start=m_flowhot_nom) annotation (Placement(visible=true, transformation(
        origin={120,140},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.InputOffset mflowEX731Offset(
    fixInput=fixmflowhotEX731,
    u_norm=m_flowhot_nom,
    u_start=m_flowhot_nom) annotation (Placement(visible=true, transformation(
        origin={-184,138},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT704Offset(
    fixOutput=fixTT704,
    y_fixed=TT704_des,
    y_norm=TT704_des) annotation (Placement(visible=true, transformation(
        origin={-402,-50},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT714Offset(
    fixOutput=fixTT714,
    y_fixed=TT714_des,
    y_norm=TT714_des) annotation (Placement(visible=true, transformation(
        origin={-100,-50},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT724Offset(
    fixOutput=fixTT724,
    y_fixed=TT724_des,
    y_norm=TT724_des) annotation (Placement(visible=true, transformation(
        origin={58,-54},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  OffSetBlocks.OutputOffset TT734Offset(
    fixOutput=fixTT734,
    y_fixed=TT734_des,
    y_norm=TT734_des) annotation (Placement(visible=true, transformation(
        origin={-242,-52},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  Modelica.Blocks.Math.Add diffPTRR01(k1=-1) annotation (Placement(transformation(extent={{434,-94},{446,-106}})));
  OffSetBlocks.OutputOffset dFTR01Offset(
    fixOutput=fixdFTR00,
    y_fixed=dFTR00_des,
    y_norm=dFTR00_nom)    annotation (Placement(visible=true, transformation(
        origin={458,-100},
        extent={{-6,-6},{6,6}},
        rotation=0)));
protected
  DistrictHeatingNetwork.Sources.SourcePressure sourceP0(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-418,96},{-398,116}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP1(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-118,96},{-98,116}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP2(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{42,96},{62,116}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP3(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-256,96},{-236,116}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP3(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-174,96},{-154,116}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP1(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-30,96},{-10,116}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow                        sinkMassFlowP2(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{134,96},{154,116}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow                        sinkMassFlowP0(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=338.15)
    annotation (Placement(transformation(extent={{-332,96},{-312,116}})));
  inner System                        system
    annotation (Placement(transformation(extent={{410,442},{430,462}})));
equation
  Pt1 = EX701.Pt;
  Pt2 = EX711.Pt;
  Pt3 = EX721.Pt;
  Pt4 = EX731.Pt;
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{277,33},{277,18.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{277,-2.4},{277,-27}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{277,-47},{277,-52},{276.4,-52},{276.4,-57}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{276.4,-57},{276.4,-67}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{386.6,-52},{386.6,-42}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{386.6,-42},{386.6,-24.5},{387,-24.5},{387,-17}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{387,3},{387,15}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{387,21},{387,33}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{387,53},{387,64},{353,64},{353,83}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold,RR00_PL_RR01_PR01. inlet) annotation (Line(
      points={{311,83},{311,63},{277,63},{277,53}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.q_m3hr,FTR01_. numberPort) annotation (Line(points={{395.5,18},{398.712,18},{398.712,18.5},{401.925,18.5}},
                                                       color={0,0,127}));
  connect(PTR01.p,FTR01_6. numberPort) annotation (Line(points={{396.8,-42},{400.862,-42},{400.862,-33.5},{402.925,-33.5}},
                                                      color={0,0,127}));
  connect(FTR01_7.numberPort,PTR02. p) annotation (Line(points={{260.075,-29.5},{266.2,-29.5},{266.2,-57}},
                                    color={0,0,127}));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-380,26},{-380,66}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{-80,26},{-80,66}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{-340,72},{-340,58}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{-340,58},{-340,45}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{-40,74},{-40,60}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{-40,47},{-40,60}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{80,26},{80,66}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{-220,26},{-220,66}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{120,74},{120,60}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{120,47},{120,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{-180,70},{-180,56}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{-180,56},{-180,43}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{-220,-62},{-220,-57},{-220.3,-57},{-220.3,-51.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{-220,-92},{-220,-82}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{-80,-82},{-80,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.outlet,TT713. inlet) annotation (Line(
      points={{-40,-91},{-40,-70.5},{-40.6,-70.5},{-40.6,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{-380,-82},{-380,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT703.outlet,TT703. inlet) annotation (Line(
      points={{-340,-62},{-340,-54},{-341.6,-54},{-341.6,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet,TCV721. inlet) annotation (Line(
      points={{80,-82},{80,-87},{79.5,-87},{79.5,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{-2,-142},{-40,-142},{-40,-111}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.inlet,PL_rackUsersIn_TT723. inlet) annotation (
      Line(
      points={{18,-142},{120,-142},{120,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.inlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{-110,-142},{-40,-142},{-40,-111}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-130,-142},{-180,-142},{-180,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-270,-143},{-180,-143},{-180,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.inlet,PL_rackUsersIn_TT703. inlet) annotation (
      Line(
      points={{-290,-143},{-340,-143},{-340,-82}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{-380,-112},{-380,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL_TCV731_rackUsersOut. inlet) annotation (Line(
      points={{-220,-112},{-220,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{-80,-112},{-80,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet,PL_TCV711_rackUsersOut. outlet) annotation (
      Line(
      points={{-10,-182},{-80,-182},{-80,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{79.5,-112},{79.5,-122.5},{80,-122.5},{80,-151}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV721_rackUsersOut.outlet,PL_EX721_EX711_hot. outlet) annotation (
     Line(
      points={{80,-171},{80,-182},{10,-182}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet,PL_TCV711_rackUsersOut. outlet) annotation (
     Line(
      points={{-150,-182},{-80,-182},{-80,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet,PL_TCV731_rackUsersOut. outlet) annotation (
      Line(
      points={{-170,-182},{-220,-182},{-220,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet,PL_TCV731_rackUsersOut. outlet) annotation (
     Line(
      points={{-300,-182},{-220,-182},{-220,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{-320,-182},{-380,-182},{-380,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet,PL_rackUsersIn_TT723. inlet) annotation (Line(
      points={{134,-142},{120,-142},{120,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet,PL_EX721_EX711_hot. outlet) annotation (Line(
      points={{109,-182},{10,-182}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP0.outlet,PT702. inlet) annotation (Line(
      points={{-398,106},{-380,106},{-380,66}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,sinkMassFlowP0. inlet) annotation (Line(
      points={{-340,72},{-340,106},{-332,106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet,sourceP3. outlet) annotation (Line(
      points={{-220,66},{-220,106},{-236,106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,sinkMassFlowP3. inlet) annotation (Line(
      points={{-180,70},{-180,106},{-174,106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet,sourceP1. outlet) annotation (Line(
      points={{-80,66},{-80,106},{-98,106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,sinkMassFlowP1. inlet) annotation (Line(
      points={{-40,74},{-40,106},{-30,106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet,sourceP2. outlet) annotation (Line(
      points={{80,66},{80,106},{62,106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,sinkMassFlowP2. inlet) annotation (Line(
      points={{120,74},{120,106},{134,106}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.inhot,TT702. inlet) annotation (Line(
      points={{-381.3,11.25},{-381.3,18},{-380,18},{-380,26}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outhot,FT701. inlet) annotation (Line(
      points={{-340.7,11.25},{-340,11.25},{-340,39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.inhot,TT732. inlet) annotation (Line(
      points={{-221.3,9.25},{-221.3,18},{-220,18},{-220,26}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outhot,FT731. inlet) annotation (Line(
      points={{-180.7,9.25},{-180,9.25},{-180,37}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.inhot,TT712. inlet) annotation (Line(
      points={{-79.3,8.25},{-79.3,17.125},{-80,17.125},{-80,26}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outhot,FT711. inlet) annotation (Line(
      points={{-38.7,8.25},{-38.7,24.625},{-40,24.625},{-40,41}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.inhot,TT722. inlet) annotation (Line(
      points={{78.7,8.25},{78.7,18},{80,18},{80,26}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outhot,FT721. inlet) annotation (Line(
      points={{119.3,8.25},{119.3,26},{120,26},{120,41}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT733.outlet,TT733. inlet) annotation (Line(
      points={{-180,-92},{-180,-72},{-180.6,-72},{-180.6,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT723.outlet,TT723. inlet) annotation (Line(
      points={{120,-92},{120,-72.5},{119.4,-72.5},{119.4,-53}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723.inlet,EX721. incold) annotation (Line(
      points={{119.4,-53},{119.4,-31.125},{119.3,-31.125},{119.3,-9.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.inlet,TT724. inlet) annotation (Line(
      points={{80,-62},{80,-54},{80.4,-54}},
      color={140,56,54},
      thickness=0.5));
  connect(TT724.inlet,EX721. outcold) annotation (Line(
      points={{80.4,-54},{80,-54},{80,-9.25},{78.7,-9.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.inlet,TT714. inlet) annotation (Line(
      points={{-80,-62},{-80,-56},{-79.6,-56},{-79.6,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet,EX711. incold) annotation (Line(
      points={{-40.6,-50},{-40.6,-29.625},{-38.7,-29.625},{-38.7,-9.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT714.inlet,EX711. outcold) annotation (Line(
      points={{-79.6,-50},{-79.6,-29.625},{-79.3,-29.625},{-79.3,-9.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT733.inlet,EX731. incold) annotation (Line(
      points={{-180.6,-52},{-180.6,-30.125},{-180.7,-30.125},{-180.7,-8.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT734.inlet,EX731. outcold) annotation (Line(
      points={{-220.3,-51.5},{-220.3,-29.875},{-221.3,-29.875},{-221.3,-8.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{-341.6,-46},{-341.6,-26.125},{-340.7,-26.125},{-340.7,-6.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.inlet,TT704. inlet) annotation (Line(
      points={{-380,-62},{-380,-56.5},{-379.6,-56.5},{-379.6,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(TT704.inlet,EX701. outcold) annotation (Line(
      points={{-379.6,-51},{-380,-51},{-380,-24},{-381.3,-24},{-381.3,-6.25}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.inlet, TTR02.inlet) annotation (Line(
      points={{275,-107},{275,-86},{276.4,-86},{276.4,-67}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{287,-139},{275,-139},{275,-127}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.inlet, RR00_PL_VER901_FCVR01.outlet) annotation (Line(
      points={{317,-139},{307,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FCVR01_FTR03.inlet, FCVR01.outlet) annotation (Line(
      points={{347,-139},{337,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet, RR00_PL_FCVR01_FTR03.outlet) annotation (Line(
      points={{374,-139},{367,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{380,-139},{382,-139},{382,-138},{387,-138},{387,-129}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR03_PTR01.outlet, TTR01.inlet) annotation (Line(
      points={{387,-109},{387,-80.5},{386.6,-80.5},{386.6,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.inlet, suddenAreaChange.outlet) annotation (Line(
      points={{154,-142},{182,-142}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{202,-142},{238,-142},{238,-138},{275,-138},{275,-127}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, PL_UsersOut_EX721.outlet) annotation (Line(
      points={{182,-184},{182,-182},{129,-182}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{202,-184},{386,-184},{386,-138},{387,-138},{387,-129}},
      color={140,56,54},
      thickness=0.5));

  connect(PTR02_Source.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{235,-77},{235,-142},{238,-142},{238,-138},{275,-138},{275,-127}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.in_omega, PR01_omega.y) annotation (Line(points={{270.5,13.2},{270.5,15},{250,15}}, color={0,0,127}));
  connect(RR101_Status.y, RR01.cold_on) annotation (Line(points={{280,104},{293.5,104}}, color={255,0,255}));
  connect(thetaTCV701Offset.u, TCV701.opening) annotation (Line(points={{-406.6,-102},{-388,-102}}, color={0,0,127}));
  connect(thetaTCV731Offset.u, TCV731.opening) annotation (Line(points={{-240.6,-102},{-228,-102}}, color={0,0,127}));
  connect(thetaTCV711Offset.u, TCV711.opening) annotation (Line(points={{-100.6,-102},{-88,-102}}, color={0,0,127}));
  connect(thetaTCV721Offset.u, TCV721.opening) annotation (Line(points={{63.4,-102},{71.1,-102}}, color={0,0,127}));
  connect(EX701Power.y,EX701PtOffset. y) annotation (Line(points={{513,-106},{529.2,-106}}, color={0,0,127}));
  connect(EX711Power.y,EX711PtOffset. y) annotation (Line(points={{513,-126},{529.2,-126}}, color={0,0,127}));
  connect(EX721Power.y,EX721PtOffset. y) annotation (Line(points={{513,-146},{529.2,-146}}, color={0,0,127}));
  connect(EX731Power.y,EX731PtOffset. y) annotation (Line(points={{513,-166},{529.2,-166}}, color={0,0,127}));
  connect(ToutRR01Offset.u, RR01.in_Tout_cold_set) annotation (Line(points={{319.4,156},{332,156},{332,128.5}}, color={0,0,127}));
  connect(TTR02.T,TTR02Offset. y) annotation (Line(points={{266.2,-67},{258,-67},{258,-80},{291.2,-80}},                   color={0,0,127}));
  connect(ThotSP.y, sourceP0.in_T0) annotation (Line(points={{-443,118},{-424,118},{-424,114.4},{-404,114.4}}, color={0,0,127}));
  connect(ThotSP.y, sourceP3.in_T0) annotation (Line(points={{-443,118},{-388,118},{-388,122},{-242,122},{-242,114.4}}, color={0,0,127}));
  connect(sourceP1.in_T0, sourceP3.in_T0) annotation (Line(points={{-104,114.4},{-104,122},{-242,122},{-242,114.4}}, color={0,0,127}));
  connect(sourceP2.in_T0, sourceP3.in_T0) annotation (Line(points={{56,114.4},{56,120},{-104,120},{-104,122},{-242,122},{-242,114.4}}, color={0,0,127}));
  connect(mflowEX701Offset.u, sinkMassFlowP0.in_m_flow) annotation (Line(points={{-340.6,138},{-340.6,111},{-328,111}}, color={0,0,127}));
  connect(mflowEX711Offset.u, sinkMassFlowP1.in_m_flow) annotation (Line(points={{-32.6,138},{-32.6,111},{-26,111}}, color={0,0,127}));
  connect(mflowEX721Offset.u, sinkMassFlowP2.in_m_flow) annotation (Line(points={{125.4,140},{136,140},{136,124},{124,124},{124,111},{138,111}}, color={0,0,127}));
  connect(mflowEX731Offset.u, sinkMassFlowP3.in_m_flow) annotation (Line(points={{-178.6,138},{-178.6,111},{-170,111}}, color={0,0,127}));
  connect(controlSignalBus.dthetaTCV701, thetaTCV701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-554,-3},{-554,-84},{-428,-84},{-428,-102},{-416.8,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.dthetaTCV711, thetaTCV711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-696,-3},{-696,-124},{-152,-124},{-152,-102},{-110.8,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaTCV721, thetaTCV721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-708,-3},{-708,-116},{44,-116},{44,-102},{53.2,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaTCV731, thetaTCV731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-897,0},{-648,0},{-648,-122},{-276,-122},{-276,-102},{-250.8,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dthetaFCVR01, thetaFCVR01Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-806,-3},{-806,-112},{307.2,-112}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowhotEX701, mflowEX701Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-586,-3},{-586,138},{-350.8,138}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowhotEX711, mflowEX711Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-624,-3},{-624,166},{-76,166},{-76,138},{-42.8,138}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowhotEX721, mflowEX721Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-642,-3},{-642,172},{92,172},{92,140},{115.2,140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dmflowhotEX731, mflowEX731Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-606,-3},{-606,156},{-224,156},{-224,138},{-188.8,138}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.dToutRR01, ToutRR01Offset.deltaUnorm) annotation (Line(
      points={{-897,-3},{-672,-3},{-672,186},{276,186},{276,156},{309.2,156}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX701PtOffset.deltaYnorm, processVariableBus.dEX701Pt) annotation (Line(points={{539.4,-106},{652,-106},{652,2},{896,2},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX711PtOffset.deltaYnorm, processVariableBus.dEX711Pt) annotation (Line(points={{539.4,-126},{668,-126},{668,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX721PtOffset.deltaYnorm, processVariableBus.dEX721Pt) annotation (Line(points={{539.4,-146},{682,-146},{682,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX731PtOffset.deltaYnorm, processVariableBus.dEX731Pt) annotation (Line(points={{539.4,-166},{700,-166},{700,-14},{896,-14},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FTR01Offset.deltaYnorm, processVariableBus.dFTR01)  annotation (Line(points={{431.4,36},{672,36},{672,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT704.T, TT704Offset.y) annotation (Line(points={{-389.8,-51},{-393.5,-51},{-393.5,-50},{-397.2,-50}}, color={0,0,127}));
  connect(TT714.T, TT714Offset.y) annotation (Line(points={{-89.8,-50},{-95.2,-50}}, color={0,0,127}));
  connect(TT724Offset.y, TT724.T) annotation (Line(points={{62.8,-54},{70.2,-54}}, color={0,0,127}));
  connect(TT734.T, TT734Offset.y) annotation (Line(points={{-229.65,-51.5},{-233.425,-51.5},{-233.425,-52},{-237.2,-52}}, color={0,0,127}));
  connect(TT704Offset.deltaYnorm, processVariableBus.dTT704) annotation (Line(points={{-407.4,-50},{-418,-50},{-418,-52},{-426,-52},{-426,-216},{608,-216},{608,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT714Offset.deltaYnorm, processVariableBus.dTT714) annotation (Line(points={{-105.4,-50},{-136,-50},{-136,-238},{620,-238},{620,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT724Offset.deltaYnorm, processVariableBus.dTT724) annotation (Line(points={{52.6,-54},{42,-54},{42,-248},{658,-248},{658,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT734Offset.deltaYnorm, processVariableBus.dTT734) annotation (Line(points={{-247.4,-52},{-270,-52},{-270,-228},{616,-228},{616,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TTR02Offset.deltaYnorm, processVariableBus.dTTR02) annotation (Line(points={{301.4,-80},{564,-80},{564,-3},{896,-3}},                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(thetaFCVR01Offset.u, FCVR01.opening) annotation (Line(points={{317.4,-112},{327,-112},{327,-131}}, color={0,0,127}));
  connect(FTR01Offset.y, FTR01.m_flow) annotation (Line(points={{421.2,36},{392,36},{392,21.5}}, color={0,0,127}));
  connect(FTR03.m_flow, diffPTRR01.u1) annotation (Line(points={{380.5,-144},{410,-144},{410,-103.6},{432.8,-103.6}}, color={0,0,127}));
  connect(FTR01.m_flow, diffPTRR01.u2) annotation (Line(points={{392,21.5},{392,36},{410,36},{410,-96.4},{432.8,-96.4}}, color={0,0,127}));
  connect(diffPTRR01.y, dFTR01Offset.y) annotation (Line(points={{446.6,-100},{453.2,-100}}, color={0,0,127}));
  connect(dFTR01Offset.deltaYnorm, processVariableBus.ddFTR00)
    annotation (Line(points={{463.4,-100},{476,-100},{476,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-70,100},{70,-100}},
          textColor={140,56,54},
          textStyle={TextStyle.Bold},
          textString="Cooling
System")}),                                                        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-560,-240},{560,240}})));
end CoolingSystemI_InitForward;
