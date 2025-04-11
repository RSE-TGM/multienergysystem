within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
model LoadPlantFourHXControlled
  extends DistrictHeatingNetwork.Icons.Water.Load;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter Integer nHX = 5 "Number of volumes in each heat exchanger";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model MediumLPHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model MediumLPCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;
  replaceable model Pipe = DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV;

  // EX701
  parameter Real EX701_q_m3h_hot(unit = "m3/h") = 2.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_hot=EX701_q_m3h_hot*985/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=45 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=EX701_q_m3h_cold*995/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Temperature EX701_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
  parameter DistrictHeatingNetwork.Types.Temperature EX701_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";

  // EX711
  parameter Real EX711_q_m3h_hot(unit = "m3/h") = 2.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_hot=EX711_q_m3h_hot*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=45 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=EX711_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Temperature EX711_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
  parameter DistrictHeatingNetwork.Types.Temperature EX711_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";

  // EX721
  parameter Real EX721_q_m3h_hot(unit = "m3/h") = 2.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_hot=EX721_q_m3h_hot*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=45 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=EX721_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Temperature EX721_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
  parameter DistrictHeatingNetwork.Types.Temperature EX721_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";

  // EX731
  parameter Real EX731_q_m3h_hot(unit = "m3/h") = 2.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_hot=EX731_q_m3h_hot*985/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=45 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=EX731_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Temperature EX731_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
  parameter DistrictHeatingNetwork.Types.Temperature EX731_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";

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
  parameter Real Kvalve(unit = "m3/h") = TestFacility.Data.ValveData.FCVR01.Kv; //90;
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.004;
  parameter DistrictHeatingNetwork.Types.Pressure dp_RR01 = 0.5e5;

  //FCVR01 Valve
  parameter Real q_FCVR01_start(unit = "m3/h") = q_Cool - q_Users_total;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_FCVR01_start = q_FCVR01_start*1000/3600;
//   parameter Real FCVR01theta[:,:] = [0, 1; 100, 1];
//   parameter Real PR01omega[:,:] = [0, 2*pi*50; 100, 2*pi*50];
//   parameter Real PTR01_profile[:,:] = [0, 1.23e5; 1780, 1.23e5; 1780, 1.03e5; 3000, 1.03e5];
//   parameter Real TTR01_profile[:,:] = [0, 16 + 273.15; 500, 16 + 273.15; 1000, 25 + 273.15; 3000, 16 + 273.15; 4000, 16 + 273.15];
//   parameter Real TTRSP_profile[:,:] = [0, 15 + 273.15; 3000, 15 + 273.15];
//   parameter Real PTR02_profile[:,:] = [0, 2.2e5; 3000, 2.2e5];

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
//   parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
//   parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
//   parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
//   parameter Real TCV731theta[:,:] = [0, 1; 100, 1];

  // Lengths of pipelines COLD SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX711_SourceOut_FCV711=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX721_SourceOut_FCV721=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX731_SourceOut_FCV731=0.6;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX711_SourceOut_FCV711=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX721_SourceOut_FCV721=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX731_SourceOut_FCV731=0;

//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=2.25;

  parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
  parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=0;

  parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-0.7; //-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT711_rackL3L4=1 + 0.7 + 5 + 9.2 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT711_rackL3L4=-1.4; //-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT721_rackL4L5=1 + 2 + 5 + 9 + 1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT721_rackL4L5=-1.6; //-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT731_rackL6L7=1.2 + 4 + 0.25 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_FT731_rackL6L7=-2.4; //-0.25 - 0.5;

  // Lengths of pipelines HOT SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=1.5 + 1.0 + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX711_TT712_SourceIn=1.5 + 1.0 + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX721_TT722_SourceIn=1.5 + 1.0 + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX731_TT732_SourceIn=1.5 + 1.0 + 0.4;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX711_TT712_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX721_TT722_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX731_TT732_SourceIn=1.5 + 1.0;

  parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL3L4_TT712=1 + 0.7 + 5 + 9.2 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL3L4_TT712=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL4L5_TT722=1 + 2 + 5 + 9 + 1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL4L5_TT722=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL6L7_TT732=1.2 + 4 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_rackL6L7_TT732=-0.25 - 0.5;

  // Internal diameters & thickness
  parameter DistrictHeatingNetwork.Types.Length t_Source=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Source=32e-3;

  // Lengths of pipelines source side
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

  //parameter Real ToutcoolSP[:,:] = [0, 7; 50, 7; 60, 17; 100, 17];

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_hot,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-302,150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX701_hot,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    redeclare model Medium = MediumLPHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-342,150})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4(
    L=L_FT711_rackL3L4,
    h=h_FT711_rackL3L4,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX711_hot,
    pin_start=FCV711_pout,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_rackL3L4_TT712(
    L=L_rackL3L4_TT712,
    h=h_rackL3L4_TT712,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX711_hot,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_S700,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-22,152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5(
    L=L_FT721_rackL4L5,
    h=h_FT721_rackL4L5,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX721_hot,
    pin_start=FCV721_pout,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={178,152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_rackL4L5_TT722(
    L=L_rackL4L5_TT722,
    h=h_rackL4L5_TT722,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX721_hot,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_S700,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={138,152})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7(
    L=L_FT731_rackL6L7,
    h=h_FT731_rackL6L7,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX731_hot,
    pin_start=FCV731_pout,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-142,148})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_rackL6L7_TT732(
    L=L_rackL6L7_TT732,
    h=h_rackL6L7_TT732,
    t=t_S700,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX731_hot,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_S700,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-182,148})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_cold(
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
        origin={64,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_cold(
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
        origin={-64,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_cold(
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
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-222,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV701_rackUsersOut(
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
        origin={-342,-170})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV731_rackUsersOut(
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
        origin={-182,-170})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_hot(
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
        origin={-104,-192})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV711_rackUsersOut(
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
        origin={-22,-170})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_hot(
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
        origin={56,-192})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_hot(
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
        origin={-254,-192})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV721_rackUsersOut(
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
        origin={138,-171})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersIn_EX721(
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
        origin={206,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersOut_EX721(
    L=L_UsersOut_EX721,
    h=h_UsersOut_EX721,
    t=t_Rack,
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
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVR01(
    Kv=Kvalve,
    openingChar=TestFacility.Data.ValveData.FCVR01.openingChar,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    q_m3h_nom=TestFacility.Data.ValveData.FCVR01.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = TestFacility.Data.ValveData.FCVR01.pin_start,
    q_m3h_start=q_FCVR01_start,
    N=10)                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={344,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_VER901_FCVR01(
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
        origin={314,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FCVR01_FTR03(
    L=L_FCVR01_FTR03,
    h=h_FCVR01_FTR03,
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
        origin={374,-152})));
  DistrictHeatingNetwork.Sources.SinkPressure VER901(
    p0=210000,
    T0(displayUnit="K") = 15 + 273.15,
    R=1e-3)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={265,-123})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={390,-150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PTR01_FTR01(
    L=L_PTR01_FTR01,
    h=h_PTR01_FTR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={404,-46})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={406,-91})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTR01
    "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={406,-81})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={406,-21})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR01_RR01(
    L=L_FTR01_RR01,
    h=h_FTR01_RR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={404,4})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR03_PTR01(
    L=L_FTR03_PTR01,
    h=h_FTR03_PTR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={404,-126})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TTR02(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={279,-78})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTR02
    "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={279,-68})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PR01_PTR02(
    L=L_PR01_PTR02,
    h=h_PR01_PTR02,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={282,-48})));
  Pipe RR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={282,-98})));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump PR01(
    Tin_start(displayUnit="K") = Tout_start_Cool,
    Tout_start(displayUnit="K") = Tout_start_Cool,
    a=TestFacility.Data.PumpData.PR01.a,
    b=TestFacility.Data.PumpData.PR01.b,
    m_flow_start=m_flow_Cool,
    dpnom=TestFacility.Data.PumpData.PR01.dpnom,
    etaelec=TestFacility.Data.PumpData.PR01.etaelec,
    etamech=TestFacility.Data.PumpData.PR01.etamech,
    etanom=TestFacility.Data.PumpData.PR01.etanom,
    hin_start=TestFacility.Data.PumpData.PR01.hin_start,
    m_flow_nom=TestFacility.Data.PumpData.PR01.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.PR01.omeganom,
    pin_start(displayUnit="Pa") = 2e5,
    pout_start(displayUnit="Pa") = 2.6e5,
    qnom_inm3h=TestFacility.Data.PumpData.PR01.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.PR01.rhonom,
    headnom=TestFacility.Data.PumpData.PR01.headnom,
    headmax=TestFacility.Data.PumpData.PR01.headnommax,
    headmin=TestFacility.Data.PumpData.PR01.headnommin,
    qnom_inm3h_min=TestFacility.Data.PumpData.PR01.qnommin_inm3h,
    qnom_inm3h_max=TestFacility.Data.PumpData.PR01.qnommax_inm3h,
    use_in_omega=true)                                                      annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={282,-5})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_RR01_PR01(
    L=L_RR01_PR01,
    h=h_RR01_PR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={282,30})));

    DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    use_in_Tout_cold_set=true,
    Tin_cold_start=Tin_start_Cool,
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool,
    V=0.001) "Chiller"
    annotation (Placement(transformation(extent={{310,54},{381,125}})));

  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{246,-162},{226,-142}})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{224,-202},{244,-182}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction
    annotation (Placement(transformation(extent={{-136,-146},{-148,-158}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction1
    annotation (Placement(transformation(extent={{24,-146},{12,-158}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction2
    annotation (Placement(transformation(extent={{184,-146},{172,-158}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction3
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={282,-152})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction4
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={404,-152})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction5
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={138,-192})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction6
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-22,-192})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction7
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-182,-192})));
  DHTF.Subsystems.Load.CoolingSingleLoadPowerControl S701(
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV701.Kv,
    q_m3h_nom_valve=EX701_q_m3h_hot,
    Tin_start_valve=EX701_Tout_hot,
    EX7X1_q_m3h_hot=EX701_q_m3h_hot,
    EX7X1_pin_hot=EX701_pin_hot,
    EX7X1_pout_hot=EX701_pin_hot,
    EX7X1_Tin_hot=EX701_Tin_hot,
    EX7X1_Tout_hot=EX701_Tout_hot,
    EX7X1_q_m3h_cold=EX701_q_m3h_cold,
    EX7X1_pin_cold=EX701_pin_cold,
    EX7X1_pout_cold=EX701_pout_cold,
    EX7X1_Tin_cold=EX701_Tin_cold,
    EX7X1_Tout_cold=EX701_Tout_cold,
    T1_wall_start=EX701_T1_wall_start,
    TN_wall_start=EX701_TN_wall_start,
    Di_S700=Di_S700,
    t_S700=t_S700,
    alpha_hot=0.67402256,
    alpha_cold=0.67402256,
    L_rUsersIn_TT7X3=L_rUsersIn_TT703,
    h_rUsersIn_TT7X3=h_rUsersIn_TT703,
    L_TT7X4_TCV7X1=L_TT704_TCV701,
    h_TT7X4_TCV7X1=h_TT704_TCV701,
    t_Users=t_Users,
    Di_Users=Di_Users,
    q_m3h_start_valve_TCV=EX701_q_m3h_cold)
                       "System EX701" annotation (Placement(transformation(extent={{-362,-38},{-282,42}})));
  DHTF.Subsystems.Load.CoolingSingleLoadPowerControl S731(
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV731.Kv,
    q_m3h_nom_valve=EX731_q_m3h_hot,
    Tin_start_valve=EX731_Tout_hot,
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
    Di_S700=Di_S700,
    t_S700=t_S700,
    gamma_nom_hot=3666.84441,
    gamma_nom_cold=9520.42245,
    alpha_hot=0.67402256,
    alpha_cold=0.67402256,
    L_rUsersIn_TT7X3=L_rUsersIn_TT733,
    h_rUsersIn_TT7X3=h_rUsersIn_TT733,
    L_TT7X4_TCV7X1=L_TT734_TCV731,
    h_TT7X4_TCV7X1=h_TT734_TCV731,
    t_Users=t_Users,
    Di_Users=Di_Users) "System EX731" annotation (Placement(transformation(extent={{-202,-38},{-122,42}})));
  DHTF.Subsystems.Load.CoolingSingleLoadPowerControl S711(
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV711.Kv,
    q_m3h_nom_valve=EX711_q_m3h_hot,
    Tin_start_valve=EX711_Tout_hot,
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
    Di_S700=Di_S700,
    t_S700=t_S700,
    alpha_hot=0.67402256,
    alpha_cold=0.67402256,
    L_rUsersIn_TT7X3=L_rUsersIn_TT713,
    h_rUsersIn_TT7X3=h_rUsersIn_TT713,
    L_TT7X4_TCV7X1=L_TT714_TCV711,
    h_TT7X4_TCV7X1=h_TT714_TCV711,
    t_Users=t_Users,
    Di_Users=Di_Users,
    q_m3h_start_valve_TCV=EX711_q_m3h_cold)
                       "System EX711" annotation (Placement(transformation(extent={{-42,-38},{38,42}})));
  DHTF.Subsystems.Load.CoolingSingleLoadPowerControl S721(
    np=n,
    nHX=nHX,
    hctype=hctype,
    Kv=TestFacility.Data.ValveData.FCV721.Kv,
    q_m3h_nom_valve=EX721_q_m3h_hot,
    Tin_start_valve=EX721_Tout_hot,
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
    Di_S700=Di_S700,
    t_S700=t_S700,
    gamma_nom_hot=3666.84441,
    gamma_nom_cold=9520.42245,
    alpha_hot=0.67402256,
    alpha_cold=0.67402256,
    L_rUsersIn_TT7X3=L_rUsersIn_TT723,
    h_rUsersIn_TT7X3=h_rUsersIn_TT723,
    L_TT7X4_TCV7X1=L_TT724_TCV721,
    h_TT7X4_TCV7X1=h_TT724_TCV721,
    t_Users=t_Users,
    Di_Users=Di_Users) "System EX721" annotation (Placement(transformation(extent={{118,-38},{198,42}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-20,280},{20,320}}), iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet[4] fluidPortInlet annotation (Placement(transformation(extent={{-100,250},{-80,270}}), iconTransformation(extent={{-110,-70},{-90,-50}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet[4] fluidPortOutlet annotation (Placement(transformation(extent={{80,250},{100,270}}),
                                                                                                                                       iconTransformation(extent={{-110,50},{-90,70}})));
equation
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut.outlet) annotation (
      Line(
      points={{-264,-192},{-342,-192},{-342,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.outlet,FCVR01. inlet) annotation (Line(
      points={{324,-152},{334,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,RR00_PL_FCVR01_FTR03. inlet) annotation (Line(
      points={{354,-152},{364,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet,RR00_PL_FCVR01_FTR03. outlet) annotation (Line(
      points={{387,-152},{384,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{403.6,-91},{403.6,-81}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{403.6,-81},{403.6,-63.5},{404,-63.5},{404,-56}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{404,-36},{404,-24}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{404,-18},{404,-6}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,RR00_PL_FTR03_PTR01. outlet) annotation (Line(
      points={{403.6,-91},{404,-91},{404,-116}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{282,-58},{282,-63},{281.4,-63},{281.4,-68}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{281.4,-68},{282,-68},{282,-78},{281.4,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet,RR00_PL_TTR02_VER901. inlet) annotation (Line(
      points={{281.4,-78},{282,-78},{282,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{282,20},{282,5.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{282,-15.4},{282,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{404,14},{404,46},{368,46},{368,68.2},{366.8,68.2}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.inlet,RR01. outcold) annotation (Line(
      points={{282,40},{284,40},{284,50},{326,50},{326,68.2},{324.2,68.2}},
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
  connect(PL_EX721_EX711_cold.outlet, junction1.inlet) annotation (Line(
      points={{54,-152},{24,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(junction1.outlet, PL_EX701_EX731_cold.inlet) annotation (Line(
      points={{12,-152},{-54,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet, junction2.inlet) annotation (Line(
      points={{196,-152},{184,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2.outlet, PL_EX721_EX711_cold.inlet) annotation (Line(
      points={{172,-152},{74,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.outlet, junction3.inlet) annotation (Line(
      points={{282,-108},{282,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(junction3.outlet, suddenAreaChange.inlet) annotation (Line(
      points={{282,-158},{282,-162},{274,-162},{274,-152},{246,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(junction3.inoutlet, RR00_PL_VER901_FCVR01.inlet) annotation (Line(
      points={{288,-152},{304,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.inlet, suddenAreaChange.inlet) annotation (Line(
      points={{265,-133},{265,-152},{246,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, junction4.inoutlet) annotation (Line(
      points={{393,-152},{398,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(junction4.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{404,-146},{404,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet, junction4.inlet) annotation (Line(
      points={{244,-192},{404,-192},{404,-158}},
      color={140,56,54},
      thickness=0.5));
  connect(junction5.inoutlet, PL_TCV721_rackUsersOut.outlet) annotation (Line(
      points={{138,-186},{138,-181}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet, junction5.outlet) annotation (Line(
      points={{165,-192},{144,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(junction5.inlet, PL_EX721_EX711_hot.outlet) annotation (Line(
      points={{132,-192},{66,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(junction6.inoutlet, PL_TCV711_rackUsersOut.outlet) annotation (Line(
      points={{-22,-186},{-22,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(junction6.inlet, PL_EX711_EX701_hot.outlet) annotation (Line(
      points={{-28,-192},{-94,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet, junction6.outlet) annotation (Line(
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
      points={{-181.2,48},{-181.2,93},{-182,93},{-182,138}},
      color={140,56,54},
      thickness=0.5));
  connect(S731.outhot, PL731_FT731_rackL6L7.inlet) annotation (Line(
      points={{-141.6,48},{-141.6,93},{-142,93},{-142,138}},
      color={140,56,54},
      thickness=0.5));
  connect(junction1.inoutlet, S711.incold) annotation (Line(
      points={{18,-146},{18,-96},{17.6,-96},{17.6,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(S711.inhot, PL711_rackL3L4_TT712.outlet) annotation (Line(
      points={{-21.2,48},{-21.2,94},{-22,94},{-22,142}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet, S711.outhot) annotation (Line(
      points={{18,142},{18,100},{18.4,100},{18.4,48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV731_rackUsersOut.outlet, junction7.inoutlet) annotation (Line(
      points={{-182,-180},{-182,-186}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.outhot, PL721_FT721_rackL4L5.inlet) annotation (Line(
      points={{178.4,48},{178.4,95},{178,95},{178,142}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.inhot, PL721_rackL4L5_TT722.outlet) annotation (Line(
      points={{138.8,48},{138.8,95},{138,95},{138,142}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2.inoutlet, S721.incold) annotation (Line(
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
      points={{-22,162},{-22,216},{-90,216},{-90,258.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_rackL4L5_TT722.inlet, fluidPortInlet[3]) annotation (Line(
      points={{138,162},{138,220},{-82,220},{-82,261.25},{-90,261.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, fluidPortInlet[4]) annotation (Line(
      points={{-182,158},{-182,224},{-90,224},{-90,263.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, fluidPortOutlet[1]) annotation (Line(
      points={{-302,160},{-302,202},{90,202},{90,256.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, fluidPortOutlet[2]) annotation (Line(
      points={{18,162},{18,190},{90,190},{90,258.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, fluidPortOutlet[3]) annotation (Line(
      points={{178,162},{176,162},{176,206},{100,206},{100,261.25},{90,261.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.outlet, fluidPortOutlet[4]) annotation (Line(
      points={{-142,158},{-142,196},{90,196},{90,263.75}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus.thetaFCVR01, FCVR01.opening) annotation (Line(
      points={{0,300},{2,300},{2,286},{236,286},{236,-136},{344,-136},{344,-144}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaPR01, PR01.in_omega) annotation (Line(
      points={{0,300},{122,300},{122,288},{242,288},{242,10},{288.5,10},{288.5,0.2}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.statusRR01, RR01.cold_on) annotation (Line(
      points={{0,300},{2,300},{2,290},{290,290},{290,89.5},{306.45,89.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutRR01, RR01.in_Tout_cold_set) annotation (Line(
      points={{0,300},{10,300},{10,294},{345.5,294},{345.5,114.35}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.PtEX701, S701.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-2,300},{-2,282},{-374,282},{-374,30},{-366,30}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.PtEX711, S711.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-2,300},{-2,268},{-58,268},{-58,30},{-46,30}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.PtEX721, S721.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{0,270},{102,270},{102,30},{114,30}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.PtEX731, S731.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,276},{-214,276},{-214,30},{-206,30}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutEX701, S701.TT7X1_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,290},{-378,290},{-378,22},{-366,22}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutEX731, S731.TT7X1_SP) annotation (Line(
      points={{0,300},{-2,300},{-2,278},{-218,278},{-218,22},{-206,22}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutEX711, S711.TT7X1_SP) annotation (Line(
      points={{0,300},{0,272},{-62,272},{-62,22},{-46,22}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutEX721, S721.TT7X1_SP) annotation (Line(
      points={{0,300},{0,280},{98,280},{98,22},{114,22}},
      color={255,204,51},
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
          points={{0,-14},{0,14}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1,
          origin={346,-166},
          rotation=-90),
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
end LoadPlantFourHXControlled;
