within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
partial model LoadPlantFourHXBase
  extends DistrictHeatingNetwork.Icons.Water.Load;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter Integer nHX = 5 "Number of volumes in each heat exchanger";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model MediumHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model MediumCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;
  replaceable model Pipe = DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV;

  //-------------------------------
  // Initialization
  //-------------------------------

  // ------ Mass Flow Rates ------
  parameter Real EX701_q_m3h_hot(unit = "m3/h") = 2.5 "Start volumetric flow rate EX701 hotside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  parameter Real EX711_q_m3h_hot(unit = "m3/h") = 2.5 "Start volumetric flow rate EX711 hotside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  parameter Real EX721_q_m3h_hot(unit = "m3/h") = 2.5 "Start volumetric flow rate EX721 hotside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  parameter Real EX731_q_m3h_hot(unit = "m3/h") = 2.5 "Start volumetric flow rate EX731 hotside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_hot=EX701_q_m3h_hot*980/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_hot=EX711_q_m3h_hot*980/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_hot=EX721_q_m3h_hot*980/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_hot=EX731_q_m3h_hot*980/3600;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5 "Start volumetric flow rate EX701 coldside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5 "Start volumetric flow rate EX711 coldside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5 "Start volumetric flow rate EX721 coldside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1 "Start volumetric flow rate EX731 coldside" annotation(Dialog(tab = "Initialization", group = "Flows"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=EX701_q_m3h_cold*998/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=EX711_q_m3h_cold*998/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=EX721_q_m3h_cold*998/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=EX731_q_m3h_cold*998/3600;

  // ------ Temperatures ------
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=60 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=45 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=60 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=45 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=60 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=45 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=60 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=45 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));

  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=7 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=14 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15 annotation(Dialog(tab = "Initialization", group = "Temperatures"));

  parameter DistrictHeatingNetwork.Types.Temperature EX701_T1_wall_start = 70 + 273.15 "Start temperature at the inlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX701_TN_wall_start = 50 + 273.15 "Start temperature at the outlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX711_T1_wall_start = 70 + 273.15 "Start temperature at the inlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX711_TN_wall_start = 50 + 273.15 "Start temperature at the outlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX721_T1_wall_start = 70 + 273.15 "Start temperature at the inlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX721_TN_wall_start = 50 + 273.15 "Start temperature at the outlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX731_T1_wall_start = 70 + 273.15 "Start temperature at the inlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));
  parameter DistrictHeatingNetwork.Types.Temperature EX731_TN_wall_start = 50 + 273.15 "Start temperature at the outlet of the wall" annotation(Dialog(tab = "Initialization", group = "Temperatures"));

  // ------ Pressures ------
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5 "Start inlet pressure EX701 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5 "Start outlet pressure EX701 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5 "Start inlet pressure EX711 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5 "Start outlet pressure EX711 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5 "Start inlet pressure EX721 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5 "Start outlet pressure EX721 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5 "Start inlet pressure EX731 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5 "Start outlet pressure EX731 hotside" annotation(Dialog(tab = "Initialization", group = "Pressures"));

  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5 annotation(Dialog(tab = "Initialization", group = "Pressures"));

  //1. Cooling System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Cool = 0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Cool = 0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_PR01 = 2e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_Cool = 20 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_Cool = 15 + 273.15;
  parameter Real q_Cool(unit = "m3/h") = 32;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Cool_total = q_Cool*998/1000;
  parameter DistrictHeatingNetwork.Types.Length t_RR = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_RR = 85e-3;
  parameter Real Kvalve(unit = "m3/h") = TestFacility.Data.ValveData.FCVR01.Kv; //90;
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.004;
  parameter DistrictHeatingNetwork.Types.Pressure dp_RR01 = 0.5e5;

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

  // Lengths of pipelines COLD SIDE
//   parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
//   parameter DistrictHeatingNetwork.Types.Length L_HX711_SourceOut_FCV711=0.6;
//   parameter DistrictHeatingNetwork.Types.Length L_HX721_SourceOut_FCV721=0.6;
//   parameter DistrictHeatingNetwork.Types.Length L_HX731_SourceOut_FCV731=0.6;
//   parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX711_SourceOut_FCV711=0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX721_SourceOut_FCV721=0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX731_SourceOut_FCV731=0;

//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=2.25;

//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=0;


  // ------ Dimensions hot side ------

  final parameter DistrictHeatingNetwork.Types.Length Di_hot=51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_hot=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length L_rackL3L4_TT712=1 + 0.7 + 5 + 9.2 + 1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_rackL3L4_TT712=-1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length L_rackL4L5_TT722=1 + 2 + 5 + 9 + 1 + 1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_rackL4L5_TT722=-1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length L_rackL6L7_TT732=1.2 + 4 + 0.25 + 0.3 + 3 + 0.4 + 0.5 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_rackL6L7_TT732=-0.25 - 0.5 annotation(Dialog(tab = "Dimensions", group = "Hot side"));

  parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-0.7 annotation(Dialog(tab = "Dimensions", group = "Hot side")); //-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT711_rackL3L4=1 + 0.7 + 5 + 9.2 + 1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_FT711_rackL3L4=-1.4 annotation(Dialog(tab = "Dimensions", group = "Hot side")); //-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT721_rackL4L5=1 + 2 + 5 + 9 + 1 + 1 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_FT721_rackL4L5=-1.6 annotation(Dialog(tab = "Dimensions", group = "Hot side")); //-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT731_rackL6L7=1.2 + 4 + 0.25 + 0.25 + 0.3 + 3 + 0.4 + 0.5 annotation(Dialog(tab = "Dimensions", group = "Hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_FT731_rackL6L7=-2.4 annotation(Dialog(tab = "Dimensions", group = "Hot side")); //-0.25 - 0.5;

  // Lengths of pipelines HOT SIDE
//   parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length L_HX711_TT712_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length L_HX721_TT722_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length L_HX731_TT732_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=1.5 + 1.0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX711_TT712_SourceIn=1.5 + 1.0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX721_TT722_SourceIn=1.5 + 1.0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX731_TT732_SourceIn=1.5 + 1.0;

  // Internal diameters & thickness
  //parameter DistrictHeatingNetwork.Types.Length t_Source=1.5e-3;
  //parameter DistrictHeatingNetwork.Types.Length Di_Source=32e-3;

  // ------ Dimensions cold side ------
  parameter DistrictHeatingNetwork.Types.Length L_VER901_FCVR01=1;
  parameter DistrictHeatingNetwork.Types.Length h_VER901_FCVR01=-0.8*0;
  parameter DistrictHeatingNetwork.Types.Length L_FCVR01_FTR03=2.95;
  parameter DistrictHeatingNetwork.Types.Length h_FCVR01_FTR03=2.35*0;
  parameter DistrictHeatingNetwork.Types.Length L_FTR03_PTR01=1.05;
  parameter DistrictHeatingNetwork.Types.Length h_FTR03_PTR01=0.25;
  parameter DistrictHeatingNetwork.Types.Length L_PTR01_FTR01=1.90;
  parameter DistrictHeatingNetwork.Types.Length h_PTR01_FTR01=-1.90;
  parameter DistrictHeatingNetwork.Types.Length L_FTR01_RR01=1.97;
  parameter DistrictHeatingNetwork.Types.Length h_FTR01_RR01=-0.72;
  parameter DistrictHeatingNetwork.Types.Length L_RR01_PR01=1.275;
  parameter DistrictHeatingNetwork.Types.Length h_RR01_PR01=0;
  parameter DistrictHeatingNetwork.Types.Length L_PR01_PTR02=2.8;
  parameter DistrictHeatingNetwork.Types.Length h_PR01_PTR02=1*0;
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
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0.30; //0.85; //0.65;
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

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    allowFlowReversal=false,
    redeclare model Medium = MediumHot,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_hot,
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
    t=t_hot,
    pin_start=EX701_pout_hot,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_hot,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-302,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    allowFlowReversal=false,
    redeclare model Medium = MediumHot,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_hot,
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
    t=t_hot,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_hot,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-342,150})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX711_hot,
    redeclare model Medium = MediumHot,
    L=L_FT711_rackL3L4,
    h=h_FT711_rackL3L4,
    t=t_hot,
    pin_start=EX711_pout_hot,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_hot,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_rackL3L4_TT712(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX711_hot,
    redeclare model Medium = MediumHot,
    L=L_rackL3L4_TT712,
    h=h_rackL3L4_TT712,
    t=t_hot,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_hot,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-22,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX721_hot,
    redeclare model Medium = MediumHot,
    L=L_FT721_rackL4L5,
    h=h_FT721_rackL4L5,
    t=t_hot,
    pin_start=EX721_pout_hot,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_hot,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={178,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_rackL4L5_TT722(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX721_hot,
    redeclare model Medium = MediumHot,
    L=L_rackL4L5_TT722,
    h=h_rackL4L5_TT722,
    t=t_hot,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_hot,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={138,150})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX731_hot,
    redeclare model Medium = MediumHot,
    L=L_FT731_rackL6L7,
    h=h_FT731_rackL6L7,
    t=t_hot,
    pin_start=EX731_pout_hot,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_hot,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-142,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_rackL6L7_TT732(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX731_hot,
    redeclare model Medium = MediumHot,
    L=L_rackL6L7_TT732,
    h=h_rackL6L7_TT732,
    t=t_hot,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_hot,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-182,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_cold(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_EX721_EX711_cold,
    h=h_EX721_EX711_cold,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold + m_flow_EX731_cold + m_flow_EX711_cold,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users_total,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={64,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_cold(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_EX701_EX731_cold,
    h=h_EX701_EX731_cold,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold + m_flow_EX731_cold,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users_total,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-64,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_cold(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_EX711_EX701_cold,
    h=h_EX711_EX701_cold,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-222,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV701_rackUsersOut(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_TCV701_rUsersOut,
    h=h_TCV701_rUsersOut,
    t=t_Users,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-342,-170})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV731_rackUsersOut(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_TCV731_rUsersOut,
    h=h_TCV731_rUsersOut,
    t=t_Users,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX731_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-182,-170})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_hot(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_EX711_EX701_hot,
    h=h_EX711_EX701_hot,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold + m_flow_EX731_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-104,-192})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV711_rackUsersOut(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_TCV711_rUsersOut,
    h=h_TCV711_rUsersOut,
    t=t_Users,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX711_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-22,-170})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_hot(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_EX721_EX711_hot,
    h=h_EX721_EX711_hot,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold + m_flow_EX731_cold + m_flow_EX711_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={56,-192})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_hot(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_EX701_EX731_hot,
    h=h_EX701_EX731_hot,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-254,-192})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV721_rackUsersOut(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_TCV721_rUsersOut,
    h=h_TCV721_rUsersOut,
    t=t_Users,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX721_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={138,-171})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersIn_EX721(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_UsersIn_EX721,
    h=h_UsersIn_EX721,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold + m_flow_EX731_cold + m_flow_EX711_cold + m_flow_EX721_cold,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={206,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersOut_EX721(
    allowFlowReversal=false,
    redeclare model Medium = MediumCold,
    L=L_UsersOut_EX721,
    h=h_UsersOut_EX721,
    t=t_Rack,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_cold + m_flow_EX731_cold + m_flow_EX711_cold + m_flow_EX721_cold,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={175,-192})));

  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{246,-162},{226,-142}})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{224,-202},{244,-182}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction
    annotation (Placement(transformation(extent={{-136,-146},{-148,-158}})));
  DistrictHeatingNetwork.Components.Fittings.Junction juncEX711Going annotation (Placement(transformation(extent={{24,-146},{12,-158}})));
  DistrictHeatingNetwork.Components.Fittings.Junction juncEX721Going annotation (Placement(transformation(extent={{184,-146},{172,-158}})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 juncEX721Return annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={138,-192})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 juncEX711Return annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-22,-192})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction7
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-182,-192})));
  replaceable DHTF.Subsystems.Load.CoolingSingleLoad S701(
    redeclare model MediumHot = MediumHot,
    redeclare model MediumCold = MediumCold,
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV701.Kv,
    openingChar_FCV=TestFacility.Data.ValveData.FCV701.openingChar,
    q_m3h_nom_valve=EX701_q_m3h_hot,
    Tin_start_valve=EX701_Tout_hot,
    t_S700=TestFacility.Data.PipelineData.S700.t_hot,
    Di_S700=TestFacility.Data.PipelineData.S700.Di_hot,
    Kv_TCV=TestFacility.Data.ValveData.TCV701.Kv,
    openingChar_TCV=TestFacility.Data.ValveData.TCV701.openingChar,
    q_m3h_nom_valve_TCV=EX701_q_m3h_cold,
    Tin_start_valve_TCV=EX701_Tout_cold,
    EX7X1_q_m3h_hot=EX701_q_m3h_hot,
    EX7X1_pin_hot=EX701_pin_hot,
    EX7X1_pout_hot=EX701_pout_hot,
    EX7X1_Tin_hot=EX701_Tin_hot,
    EX7X1_Tout_hot=EX701_Tout_hot,
    EX7X1_q_m3h_cold=EX701_q_m3h_cold,
    EX7X1_pin_cold=EX701_pin_cold,
    EX7X1_pout_cold=EX701_pout_cold,
    EX7X1_Tin_cold=EX701_Tin_cold,
    EX7X1_Tout_cold=EX701_Tout_cold,
    T1_wall_start=EX701_T1_wall_start,
    TN_wall_start=EX701_TN_wall_start,
    gamma_nom_hot=TestFacility.Data.BPHEData.E701.gamma_nom_hot,
    gamma_nom_cold=TestFacility.Data.BPHEData.E701.gamma_nom_cold,
    alpha_hot=TestFacility.Data.BPHEData.E701.alpha_hot,
    alpha_cold=TestFacility.Data.BPHEData.E701.alpha_cold,
    Di_Users=TestFacility.Data.PipelineData.S700.Di_cold,
    t_Users=TestFacility.Data.PipelineData.S700.t_cold,
    L_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S701_TT7X2_InHot.L,
    h_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S701_TT7X2_InHot.h,
    L_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S701_OutHot_FCV7X1.L,
    h_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S701_OutHot_FCV7X1.h,
    L_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S701_FCV7X1_FT7X1.L,
    h_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S701_FCV7X1_FT7X1.h,
    L_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S701_TT7X3_InCold.L,
    h_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S701_TT7X3_InCold.h,
    L_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S701_TT7X4_TCV7X1.L,
    h_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S701_TT7X4_TCV7X1.h) "System EX701" annotation (Placement(transformation(extent={{-362,-38},{-282,42}})));
  replaceable DHTF.Subsystems.Load.CoolingSingleLoad S731(
    redeclare model MediumHot = MediumHot,
    redeclare model MediumCold = MediumCold,
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV731.Kv,
    openingChar_FCV=TestFacility.Data.ValveData.FCV731.openingChar,
    q_m3h_nom_valve=EX731_q_m3h_hot,
    Tin_start_valve=EX731_Tout_hot,
    t_S700=TestFacility.Data.PipelineData.S700.t_hot,
    Di_S700=TestFacility.Data.PipelineData.S700.Di_hot,
    Kv_TCV=TestFacility.Data.ValveData.TCV731.Kv,
    openingChar_TCV=TestFacility.Data.ValveData.TCV731.openingChar,
    q_m3h_nom_valve_TCV=EX731_q_m3h_cold,
    Tin_start_valve_TCV=EX731_Tout_cold,
    EX7X1_q_m3h_hot=EX731_q_m3h_hot,
    EX7X1_pin_hot=EX731_pin_hot,
    EX7X1_pout_hot=EX731_pin_hot,
    EX7X1_Tin_hot=EX731_Tin_hot,
    EX7X1_Tout_hot=EX731_Tout_hot,
    EX7X1_q_m3h_cold=EX731_q_m3h_cold,
    EX7X1_pin_cold=EX731_pin_cold,
    EX7X1_pout_cold=EX731_pout_cold,
    EX7X1_Tin_cold=EX731_Tin_cold,
    EX7X1_Tout_cold=EX731_Tout_cold,
    T1_wall_start=EX731_T1_wall_start,
    TN_wall_start=EX731_TN_wall_start,
    gamma_nom_hot=TestFacility.Data.BPHEData.E731.gamma_nom_hot,
    gamma_nom_cold=TestFacility.Data.BPHEData.E731.gamma_nom_cold,
    alpha_hot=TestFacility.Data.BPHEData.E731.alpha_hot,
    alpha_cold=TestFacility.Data.BPHEData.E731.alpha_cold,
    Di_Users=TestFacility.Data.PipelineData.S700.Di_cold,
    t_Users=TestFacility.Data.PipelineData.S700.t_cold,
    L_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S731_TT7X2_InHot.L,
    h_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S731_TT7X2_InHot.h,
    L_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S731_OutHot_FCV7X1.L,
    h_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S731_OutHot_FCV7X1.h,
    L_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S731_FCV7X1_FT7X1.L,
    h_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S731_FCV7X1_FT7X1.h,
    L_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S731_TT7X3_InCold.L,
    h_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S731_TT7X3_InCold.h,
    L_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S731_TT7X4_TCV7X1.L,
    h_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S731_TT7X4_TCV7X1.h) "System EX731" annotation (Placement(transformation(extent={{-202,-38},{-122,42}})));
  replaceable DHTF.Subsystems.Load.CoolingSingleLoad S711(
    redeclare model MediumHot = MediumHot,
    redeclare model MediumCold = MediumCold,
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV711.Kv,
    openingChar_FCV=TestFacility.Data.ValveData.FCV711.openingChar,
    q_m3h_nom_valve=EX711_q_m3h_hot,
    Tin_start_valve=EX711_Tout_hot,
    t_S700=TestFacility.Data.PipelineData.S700.t_hot,
    Di_S700=TestFacility.Data.PipelineData.S700.Di_hot,
    Kv_TCV=TestFacility.Data.ValveData.TCV711.Kv,
    openingChar_TCV=TestFacility.Data.ValveData.TCV711.openingChar,
    q_m3h_nom_valve_TCV=EX711_q_m3h_cold,
    Tin_start_valve_TCV=EX711_Tout_cold,
    EX7X1_q_m3h_hot=EX711_q_m3h_hot,
    EX7X1_pin_hot=EX711_pin_hot,
    EX7X1_pout_hot=EX711_pin_hot,
    EX7X1_Tin_hot=EX711_Tin_hot,
    EX7X1_Tout_hot=EX711_Tout_hot,
    EX7X1_q_m3h_cold=EX711_q_m3h_cold,
    EX7X1_pin_cold=EX711_pin_cold,
    EX7X1_pout_cold=EX711_pout_cold,
    EX7X1_Tin_cold=EX711_Tin_cold,
    EX7X1_Tout_cold=EX711_Tout_cold,
    T1_wall_start=EX711_T1_wall_start,
    TN_wall_start=EX711_TN_wall_start,
    gamma_nom_hot=TestFacility.Data.BPHEData.E711.gamma_nom_hot,
    gamma_nom_cold=TestFacility.Data.BPHEData.E711.gamma_nom_cold,
    alpha_hot=TestFacility.Data.BPHEData.E711.alpha_hot,
    alpha_cold=TestFacility.Data.BPHEData.E711.alpha_cold,
    Di_Users=TestFacility.Data.PipelineData.S700.Di_cold,
    t_Users=TestFacility.Data.PipelineData.S700.t_cold,
    L_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S711_TT7X2_InHot.L,
    h_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S711_TT7X2_InHot.h,
    L_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S711_OutHot_FCV7X1.L,
    h_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S711_OutHot_FCV7X1.h,
    L_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S711_FCV7X1_FT7X1.L,
    h_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S711_FCV7X1_FT7X1.h,
    L_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S711_TT7X3_InCold.L,
    h_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S711_TT7X3_InCold.h,
    L_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S711_TT7X4_TCV7X1.L,
    h_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S711_TT7X4_TCV7X1.h) "System EX711" annotation (Placement(transformation(extent={{-42,-38},{38,42}})));
  replaceable DHTF.Subsystems.Load.CoolingSingleLoad S721(
    redeclare model MediumHot = MediumHot,
    redeclare model MediumCold = MediumCold,
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV721.Kv,
    openingChar_FCV=TestFacility.Data.ValveData.FCV721.openingChar,
    q_m3h_nom_valve=EX721_q_m3h_hot,
    Tin_start_valve=EX721_Tout_hot,
    t_S700=TestFacility.Data.PipelineData.S700.t_hot,
    Di_S700=TestFacility.Data.PipelineData.S700.Di_hot,
    Kv_TCV=TestFacility.Data.ValveData.TCV721.Kv,
    openingChar_TCV=TestFacility.Data.ValveData.TCV721.openingChar,
    q_m3h_nom_valve_TCV=EX721_q_m3h_cold,
    Tin_start_valve_TCV=EX721_Tout_cold,
    EX7X1_q_m3h_hot=EX721_q_m3h_hot,
    EX7X1_pin_hot=EX721_pin_hot,
    EX7X1_pout_hot=EX721_pin_hot,
    EX7X1_Tin_hot=EX721_Tin_hot,
    EX7X1_Tout_hot=EX721_Tout_hot,
    EX7X1_q_m3h_cold=EX721_q_m3h_cold,
    EX7X1_pin_cold=EX721_pin_cold,
    EX7X1_pout_cold=EX721_pout_cold,
    EX7X1_Tin_cold=EX721_Tin_cold,
    EX7X1_Tout_cold=EX721_Tout_cold,
    T1_wall_start=EX721_T1_wall_start,
    TN_wall_start=EX721_TN_wall_start,
    gamma_nom_hot=TestFacility.Data.BPHEData.E721.gamma_nom_hot,
    gamma_nom_cold=TestFacility.Data.BPHEData.E721.gamma_nom_cold,
    alpha_hot=TestFacility.Data.BPHEData.E721.alpha_hot,
    alpha_cold=TestFacility.Data.BPHEData.E721.alpha_cold,
    Di_Users=TestFacility.Data.PipelineData.S700.Di_cold,
    t_Users=TestFacility.Data.PipelineData.S700.t_cold,
    L_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S721_TT7X2_InHot.L,
    h_HX7X1_TT7X2_SourceIn=TestFacility.Data.PipelineData.S700.PL_S721_TT7X2_InHot.h,
    L_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S721_OutHot_FCV7X1.L,
    h_HX7X1_SourceOut_FCV7X1=TestFacility.Data.PipelineData.S700.PL_S721_OutHot_FCV7X1.h,
    L_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S721_FCV7X1_FT7X1.L,
    h_FCV7X1_FT7X1=TestFacility.Data.PipelineData.S700.PL_S721_FCV7X1_FT7X1.h,
    L_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S721_TT7X3_InCold.L,
    h_rUsersIn_TT7X3=TestFacility.Data.PipelineData.S700.PL_S721_TT7X3_InCold.h,
    L_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S721_TT7X4_TCV7X1.L,
    h_TT7X4_TCV7X1=TestFacility.Data.PipelineData.S700.PL_S721_TT7X4_TCV7X1.h) "System EX721" annotation (Placement(transformation(extent={{118,-38},{198,42}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-20,280},{20,320}}), iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet[4] fluidPortInlet annotation (Placement(transformation(extent={{-100,250},{-80,270}}), iconTransformation(extent={{-110,-70},{-90,-50}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet[4] fluidPortOutlet annotation (Placement(transformation(extent={{80,250},{100,270}}),
                                                                                                                                       iconTransformation(extent={{-110,50},{-90,70}})));
equation
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{-264,-192},{-342,-192},{-342,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, PL_UsersOut_EX721.outlet) annotation (Line(
      points={{224,-192},{185,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.outlet, PL_UsersIn_EX721.inlet) annotation (Line(
      points={{226,-152},{216,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet, junction.inlet) annotation (Line(
      points={{-74,-152},{-136,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(junction.outlet, PL_EX711_EX701_cold.inlet) annotation (Line(
      points={{-148,-152},{-212,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet, juncEX711Going.inlet) annotation (Line(
      points={{54,-152},{24,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX711Going.outlet, PL_EX701_EX731_cold.inlet) annotation (Line(
      points={{12,-152},{-54,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet, juncEX721Going.inlet) annotation (Line(
      points={{196,-152},{184,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX721Going.outlet, PL_EX721_EX711_cold.inlet) annotation (Line(
      points={{172,-152},{74,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX721Return.inoutlet, PL_TCV721_rackUsersOut.outlet) annotation (Line(
      points={{138,-186},{138,-181}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet, juncEX721Return.outlet) annotation (Line(
      points={{165,-192},{144,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX721Return.inlet, PL_EX721_EX711_hot.outlet) annotation (Line(
      points={{132,-192},{66,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX711Return.inoutlet, PL_TCV711_rackUsersOut.outlet) annotation (Line(
      points={{-22,-186},{-22,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX711Return.inlet, PL_EX711_EX701_hot.outlet) annotation (Line(
      points={{-28,-192},{-94,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet, juncEX711Return.outlet) annotation (Line(
      points={{46,-192},{-16,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet, junction7.outlet) annotation (Line(
      points={{-114,-192},{-176,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(junction7.inlet, PL_EX701_EX731_hot.outlet) annotation (Line(
      points={{-188,-192},{-244,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(S701.inhot, PL701_rackL2L3_TT702.outlet) annotation (Line(
      points={{-341.2,48},{-341.2,94},{-342,94},{-342,140}},
      color={140,56,54},
      thickness=0.5));
  connect(S701.outhot, PL701_FT701_rackL2L3.inlet) annotation (Line(
      points={{-301.6,48},{-301.6,94},{-302,94},{-302,140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet, S701.incold) annotation (Line(
      points={{-232,-152},{-302.4,-152},{-302.4,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(junction.inoutlet, S731.incold) annotation (Line(
      points={{-142,-146},{-142,-95},{-142.4,-95},{-142.4,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(S731.inhot, PL731_rackL6L7_TT732.outlet) annotation (Line(
      points={{-181.2,48},{-181.2,93},{-182,93},{-182,140}},
      color={140,56,54},
      thickness=0.5));
  connect(S731.outhot, PL731_FT731_rackL6L7.inlet) annotation (Line(
      points={{-141.6,48},{-141.6,93},{-142,93},{-142,140}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX711Going.inoutlet, S711.incold) annotation (Line(
      points={{18,-146},{18,-96},{17.6,-96},{17.6,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(S711.inhot, PL711_rackL3L4_TT712.outlet) annotation (Line(
      points={{-21.2,48},{-21.2,94},{-22,94},{-22,140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet, S711.outhot) annotation (Line(
      points={{18,140},{18,100},{18.4,100},{18.4,48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV731_rackUsersOut.outlet, junction7.inoutlet) annotation (Line(
      points={{-182,-180},{-182,-186}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.outhot, PL721_FT721_rackL4L5.inlet) annotation (Line(
      points={{178.4,48},{178.4,95},{178,95},{178,140}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.inhot, PL721_rackL4L5_TT722.outlet) annotation (Line(
      points={{138.8,48},{138.8,95},{138,95},{138,140}},
      color={140,56,54},
      thickness=0.5));
  connect(juncEX721Going.inoutlet, S721.incold) annotation (Line(
      points={{178,-146},{178,-95},{177.6,-95},{177.6,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.outcold, PL_TCV721_rackUsersOut.inlet) annotation (Line(
      points={{138,-44},{138,-161}},
      color={140,56,54},
      thickness=0.5));
  connect(S711.outcold, PL_TCV711_rackUsersOut.inlet) annotation (Line(
      points={{-22,-44},{-22,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(S731.outcold, PL_TCV731_rackUsersOut.inlet) annotation (Line(
      points={{-182,-44},{-182,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(S701.outcold, PL_TCV701_rackUsersOut.inlet) annotation (Line(
      points={{-342,-44},{-342,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.inlet, fluidPortInlet[1]) annotation (Line(
      points={{-342,160},{-342,218},{-90,218},{-90,256.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_rackL3L4_TT712.inlet, fluidPortInlet[2]) annotation (Line(
      points={{-22,160},{-22,216},{-90,216},{-90,258.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_rackL4L5_TT722.inlet, fluidPortInlet[3]) annotation (Line(
      points={{138,160},{138,220},{-82,220},{-82,261.25},{-90,261.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, fluidPortInlet[4]) annotation (Line(
      points={{-182,160},{-182,224},{-90,224},{-90,263.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, fluidPortOutlet[1]) annotation (Line(
      points={{-302,160},{-302,202},{90,202},{90,256.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, fluidPortOutlet[2]) annotation (Line(
      points={{18,160},{18,190},{90,190},{90,258.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, fluidPortOutlet[3]) annotation (Line(
      points={{178,160},{178,208},{100,208},{100,261.25},{90,261.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.outlet, fluidPortOutlet[4]) annotation (Line(
      points={{-142,160},{-142,196},{90,196},{90,263.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (                                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-500,-300},{500,300}}), graphics={
        Line(
          points={{-292,108},{-292,136}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-352,96},{-352,68}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-132,108},{-132,136}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-192,96},{-192,68}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{28,108},{28,136}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-32,96},{-32,68}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-296,-88},{-296,-60}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-136,-88},{-136,-60}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{24,-88},{24,-60}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-354,-146},{-354,-174}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-192,-144},{-192,-172}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-32,-144},{-32,-172}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{184,-88},{184,-60}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{128,-144},{128,-172}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{188,108},{188,136}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{128,94},{128,66}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1)}));
end LoadPlantFourHXBase;
