within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
partial model LoadPlantBaseII

  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter Integer nHX = 5 "Number of volumes in each heat exchanger";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model MediumLPHot =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingcp                             constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model MediumLPCold =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingcp                              constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;
  //replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient;
  replaceable model Pipe =
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV;

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
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=45 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=EX711_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Temperature EX711_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
  parameter DistrictHeatingNetwork.Types.Temperature EX711_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";

  // EX721
  parameter Real EX721_q_m3h_hot(unit = "m3/h") = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=45 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=EX721_q_m3h_cold*1000/3600;
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

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV731theta[:,:] = [0, 1; 100, 1];

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

  parameter Real ToutcoolSP[:,:] = [0, 7; 50, 7; 60, 17; 100, 17];

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={120,-58})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    redeclare model Medium = MediumLPHot,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={80,-58})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4(
    L=L_FT711_rackL3L4,
    h=h_FT711_rackL3L4,
    t=t_S700,
    pin_start=FCV711_pout,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={440,-56})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_rackL3L4_TT712(
    L=L_rackL3L4_TT712,
    h=h_rackL3L4_TT712,
    t=t_S700,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={400,-56})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5(
    L=L_FT721_rackL4L5,
    h=h_FT721_rackL4L5,
    t=t_S700,
    pin_start=FCV721_pout,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={600,-56})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_rackL4L5_TT722(
    L=L_rackL4L5_TT722,
    h=h_rackL4L5_TT722,
    t=t_S700,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={560,-56})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7(
    L=L_FT731_rackL6L7,
    h=h_FT731_rackL6L7,
    t=t_S700,
    pin_start=FCV731_pout,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={280,-60})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_rackL6L7_TT732(
    L=L_rackL6L7_TT732,
    h=h_rackL6L7_TT732,
    t=t_S700,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={240,-60})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV731(
    Kv=TestFacility.Data.ValveData.TCV731.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV731.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV731.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV731.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV731.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV731.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={240,-320})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV721(
    Kv=TestFacility.Data.ValveData.TCV721.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV721.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV721.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV721.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV721.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={560,-320})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV711(
    Kv=TestFacility.Data.ValveData.TCV711.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV711.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV711.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV711.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV711.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV711.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={400,-320})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV701(
    Kv=TestFacility.Data.ValveData.TCV701.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV701.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV701.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV701.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV701.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV701.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={80,-320})));
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
        origin={486,-360})));
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
        origin={358,-360})));
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
        origin={200,-360})));
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
        origin={80,-378})));
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
        origin={240,-378})));
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
        origin={318,-400})));
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
        origin={400,-378})));
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
        origin={478,-400})));
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
        origin={168,-400})));
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
        origin={560,-379})));
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
        origin={628,-360})));
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
        origin={597,-400})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVR01(
    Kv=Kvalve,
    openingChar=TestFacility.Data.ValveData.FCVR01.openingChar,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = TestFacility.Data.ValveData.FCVR01.pin_start,
    N=10)                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={766,-360})));
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
        origin={736,-360})));
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
        origin={796,-360})));
  DistrictHeatingNetwork.Sources.SinkPressure VER901(
    p0=210000,
    T0(displayUnit="K") = 15 + 273.15,
    R=1e-3)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={687,-331})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={812,-358})));
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
        origin={826,-254})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={828,-299})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTR01
    "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={828,-289})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={828,-229})));
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
        origin={826,-204})));
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
        origin={826,-334})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TTR02(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={701,-286})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTR02
    "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={701,-276})));
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
        origin={704,-256})));
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
        origin={704,-306})));
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
        origin={704,-213})));

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
        origin={704,-178})));

    DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    use_in_Tout_cold_set=true,
    Tin_cold_start=Tin_start_Cool,
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool,
    V=0.001) "Chiller"
    annotation (Placement(transformation(extent={{732,-154},{803,-83}})));

  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{668,-370},{648,-350}})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{646,-410},{666,-390}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction
    annotation (Placement(transformation(extent={{286,-354},{274,-366}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction1
    annotation (Placement(transformation(extent={{446,-354},{434,-366}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction2
    annotation (Placement(transformation(extent={{606,-354},{594,-366}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction3
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={704,-360})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction4
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={826,-360})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction5
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={560,-400})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction6
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={400,-400})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction7
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={240,-400})));
  DHTF.Subsystems.Load.SingleLoad S701(
    np=n,
    nHX=nHX,
    Kv=TestFacility.Data.ValveData.FCV701.Kv,
    openingChar=TestFacility.Data.ValveData.FCV701.openingChar,
    q_m3h_nom_valve=EX701_q_m3h_hot,
    Tin_start_valve=EX701_Tout_hot,
    EX7X1_q_m3h_hot=EX701_q_m3h_hot,
    EX7X1_pin_hot=EX701_pin_hot,
    EX7X1_pout_hot=EX701_pin_hot,
    FCV701_pout=EX701_pout_hot,
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
    L_HX701_TT702_SourceIn=L_HX701_TT702_SourceIn,
    h_HX701_TT702_SourceIn=h_HX701_TT702_SourceIn,
    L_HX701_SourceOut_FCV701=L_HX701_SourceOut_FCV701,
    h_HX701_SourceOut_FCV701=h_HX701_SourceOut_FCV701,
    L_FCV701_FT701=L_FCV701_FT701,
    h_FCV701_FT701=h_FCV701_FT701,
    Tout_start_cold=EX701_Tin_cold,
    Tin_start_cold=EX701_Tout_cold,
    L_rUsersIn_TT7X3=L_rUsersIn_TT703,
    h_rUsersIn_TT7X3=h_rUsersIn_TT703,
    L_TT7X4_TCV7X1=L_TT704_TCV701,
    h_TT7X4_TCV7X1=h_TT704_TCV701,
    t_Users=t_Users,
    Di_Users=Di_Users) "System EX701" annotation (Placement(transformation(extent={{60,-246},{140,-166}})));
  DHTF.Subsystems.Load.SingleLoad S731(
    np=n,
    nHX=nHX,
    Kv=TestFacility.Data.ValveData.FCV731.Kv,
    openingChar=TestFacility.Data.ValveData.FCV731.openingChar,
    q_m3h_nom_valve=EX731_q_m3h_hot,
    Tin_start_valve=EX731_Tout_hot,
    EX7X1_q_m3h_hot=EX731_q_m3h_hot,
    EX7X1_pin_hot=EX731_pin_hot,
    EX7X1_pout_hot=EX731_pin_hot,
    FCV701_pout=EX731_pout_hot,
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
    L_HX701_TT702_SourceIn=L_HX731_TT732_SourceIn,
    h_HX701_TT702_SourceIn=h_HX731_TT732_SourceIn,
    L_HX701_SourceOut_FCV701=L_HX731_SourceOut_FCV731,
    h_HX701_SourceOut_FCV701=h_HX731_SourceOut_FCV731,
    L_FCV701_FT701=L_FCV731_FT731,
    h_FCV701_FT701=h_FCV731_FT731,
    Tout_start_cold=EX731_Tin_cold,
    Tin_start_cold=EX731_Tout_cold,
    L_rUsersIn_TT7X3=L_rUsersIn_TT733,
    h_rUsersIn_TT7X3=h_rUsersIn_TT733,
    L_TT7X4_TCV7X1=L_TT734_TCV731,
    h_TT7X4_TCV7X1=h_TT734_TCV731,
    t_Users=t_Users,
    Di_Users=Di_Users) "System EX731" annotation (Placement(transformation(extent={{220,-246},{300,-166}})));
  DHTF.Subsystems.Load.SingleLoad S711(
    np=n,
    nHX=nHX,
    Kv=TestFacility.Data.ValveData.FCV711.Kv,
    openingChar=TestFacility.Data.ValveData.FCV711.openingChar,
    q_m3h_nom_valve=EX711_q_m3h_hot,
    Tin_start_valve=EX711_Tout_hot,
    EX7X1_q_m3h_hot=EX711_q_m3h_hot,
    EX7X1_pin_hot=EX711_pin_hot,
    EX7X1_pout_hot=EX711_pin_hot,
    FCV701_pout=EX711_pout_hot,
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
    L_HX701_TT702_SourceIn=L_HX711_TT712_SourceIn,
    h_HX701_TT702_SourceIn=h_HX711_TT712_SourceIn,
    L_HX701_SourceOut_FCV701=L_HX711_SourceOut_FCV711,
    h_HX701_SourceOut_FCV701=h_HX711_SourceOut_FCV711,
    L_FCV701_FT701=L_FCV711_FT711,
    h_FCV701_FT701=h_FCV711_FT711,
    Tout_start_cold=EX711_Tin_cold,
    Tin_start_cold=EX711_Tout_cold,
    L_rUsersIn_TT7X3=L_rUsersIn_TT713,
    h_rUsersIn_TT7X3=h_rUsersIn_TT713,
    L_TT7X4_TCV7X1=L_TT714_TCV711,
    h_TT7X4_TCV7X1=h_TT714_TCV711,
    t_Users=t_Users,
    Di_Users=Di_Users) "System EX711" annotation (Placement(transformation(extent={{380,-246},{460,-166}})));
  DHTF.Subsystems.Load.SingleLoad S721(
    np=n,
    nHX=nHX,
    Kv=TestFacility.Data.ValveData.FCV721.Kv,
    openingChar=TestFacility.Data.ValveData.FCV721.openingChar,
    q_m3h_nom_valve=EX721_q_m3h_hot,
    Tin_start_valve=EX721_Tout_hot,
    EX7X1_q_m3h_hot=EX721_q_m3h_hot,
    EX7X1_pin_hot=EX721_pin_hot,
    EX7X1_pout_hot=EX721_pin_hot,
    FCV701_pout=EX721_pout_hot,
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
    L_HX701_TT702_SourceIn=L_HX721_TT722_SourceIn,
    h_HX701_TT702_SourceIn=h_HX721_TT722_SourceIn,
    L_HX701_SourceOut_FCV701=L_HX721_SourceOut_FCV721,
    h_HX701_SourceOut_FCV701=h_HX721_SourceOut_FCV721,
    L_FCV701_FT701=L_FCV721_FT721,
    h_FCV701_FT701=h_FCV721_FT721,
    Tout_start_cold=EX721_Tin_cold,
    Tin_start_cold=EX721_Tout_cold,
    L_rUsersIn_TT7X3=L_rUsersIn_TT723,
    h_rUsersIn_TT7X3=h_rUsersIn_TT723,
    L_TT7X4_TCV7X1=L_TT724_TCV721,
    h_TT7X4_TCV7X1=h_TT724_TCV721,
    t_Users=t_Users,
    Di_Users=Di_Users) "System EX721" annotation (Placement(transformation(extent={{540,-246},{620,-166}})));
equation
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{80,-330},{80,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL_TCV731_rackUsersOut. inlet) annotation (Line(
      points={{240,-330},{240,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{400,-330},{400,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{560,-330},{560,-369}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{158,-400},{80,-400},{80,-388}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.outlet,FCVR01. inlet) annotation (Line(
      points={{746,-360},{756,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,RR00_PL_FCVR01_FTR03. inlet) annotation (Line(
      points={{776,-360},{786,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet,RR00_PL_FCVR01_FTR03. outlet) annotation (Line(
      points={{809,-360},{806,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{825.6,-299},{825.6,-289}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{825.6,-289},{825.6,-271.5},{826,-271.5},{826,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{826,-244},{826,-232}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{826,-226},{826,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,RR00_PL_FTR03_PTR01. outlet) annotation (Line(
      points={{825.6,-299},{826,-299},{826,-324}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{704,-266},{704,-271},{703.4,-271},{703.4,-276}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{703.4,-276},{704,-276},{704,-286},{703.4,-286}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet,RR00_PL_TTR02_VER901. inlet) annotation (Line(
      points={{703.4,-286},{704,-286},{704,-296}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{704,-188},{704,-202.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{704,-223.4},{704,-246}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{826,-194},{826,-162},{790,-162},{790,-139.8},{788.8,-139.8}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.inlet,RR01. outcold) annotation (Line(
      points={{704,-168},{706,-168},{706,-158},{748,-158},{748,-139.8},{746.2,-139.8}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, PL_UsersOut_EX721.outlet) annotation (Line(
      points={{646,-400},{607,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.outlet, PL_UsersIn_EX721.inlet) annotation (Line(
      points={{648,-360},{638,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet, junction.inlet) annotation (Line(
      points={{348,-360},{286,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction.outlet, PL_EX711_EX701_cold.inlet) annotation (Line(
      points={{274,-360},{210,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet, junction1.inlet) annotation (Line(
      points={{476,-360},{446,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction1.outlet, PL_EX701_EX731_cold.inlet) annotation (Line(
      points={{434,-360},{368,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet, junction2.inlet) annotation (Line(
      points={{618,-360},{606,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2.outlet, PL_EX721_EX711_cold.inlet) annotation (Line(
      points={{594,-360},{496,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.outlet, junction3.inlet) annotation (Line(
      points={{704,-316},{704,-354}},
      color={140,56,54},
      thickness=0.5));
  connect(junction3.outlet, suddenAreaChange.inlet) annotation (Line(
      points={{704,-366},{704,-370},{696,-370},{696,-360},{668,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction3.inoutlet, RR00_PL_VER901_FCVR01.inlet) annotation (Line(
      points={{710,-360},{726,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.inlet, suddenAreaChange.inlet) annotation (Line(
      points={{687,-341},{687,-360},{668,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, junction4.inoutlet) annotation (Line(
      points={{815,-360},{820,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction4.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{826,-354},{826,-344}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet, junction4.inlet) annotation (Line(
      points={{666,-400},{826,-400},{826,-366}},
      color={140,56,54},
      thickness=0.5));
  connect(junction5.inoutlet, PL_TCV721_rackUsersOut.outlet) annotation (Line(
      points={{560,-394},{560,-389}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet, junction5.outlet) annotation (Line(
      points={{587,-400},{566,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction5.inlet, PL_EX721_EX711_hot.outlet) annotation (Line(
      points={{554,-400},{488,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction6.inoutlet, PL_TCV711_rackUsersOut.outlet) annotation (Line(
      points={{400,-394},{400,-388}},
      color={140,56,54},
      thickness=0.5));
  connect(junction6.inlet, PL_EX711_EX701_hot.outlet) annotation (Line(
      points={{394,-400},{328,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet, junction6.outlet) annotation (Line(
      points={{468,-400},{406,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet, junction7.outlet) annotation (Line(
      points={{308,-400},{246,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction7.inlet, PL_EX701_EX731_hot.outlet) annotation (Line(
      points={{234,-400},{178,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(S701.inhot, PL701_rackL2L3_TT702.outlet) annotation (Line(
      points={{80.8,-160},{80.8,-114},{80,-114},{80,-68}},
      color={140,56,54},
      thickness=0.5));
  connect(S701.outhot, PL701_FT701_rackL2L3.inlet) annotation (Line(
      points={{120.4,-160},{120.4,-114},{120,-114},{120,-68}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet, S701.incold) annotation (Line(
      points={{190,-360},{119.6,-360},{119.6,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.inlet, S701.outcold) annotation (Line(
      points={{80,-310},{80,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet, S731.outcold) annotation (Line(
      points={{240,-310},{240,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(junction.inoutlet, S731.incold) annotation (Line(
      points={{280,-354},{280,-303},{279.6,-303},{279.6,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(S731.inhot, PL731_rackL6L7_TT732.outlet) annotation (Line(
      points={{240.8,-160},{240.8,-115},{240,-115},{240,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(S731.outhot, PL731_FT731_rackL6L7.inlet) annotation (Line(
      points={{280.4,-160},{280.4,-115},{280,-115},{280,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.inlet, S711.outcold) annotation (Line(
      points={{400,-310},{400,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(junction1.inoutlet, S711.incold) annotation (Line(
      points={{440,-354},{440,-304},{439.6,-304},{439.6,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(S711.inhot, PL711_rackL3L4_TT712.outlet) annotation (Line(
      points={{400.8,-160},{400.8,-114},{400,-114},{400,-66}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet, S711.outhot) annotation (Line(
      points={{440,-66},{440,-108},{440.4,-108},{440.4,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV731_rackUsersOut.outlet, junction7.inoutlet) annotation (Line(
      points={{240,-388},{240,-394}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.outhot, PL721_FT721_rackL4L5.inlet) annotation (Line(
      points={{600.4,-160},{600.4,-113},{600,-113},{600,-66}},
      color={140,56,54},
      thickness=0.5));
  connect(S721.inhot, PL721_rackL4L5_TT722.outlet) annotation (Line(
      points={{560.8,-160},{560.8,-113},{560,-113},{560,-66}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.inlet, S721.outcold) annotation (Line(
      points={{560,-310},{560,-252}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2.inoutlet, S721.incold) annotation (Line(
      points={{600,-354},{600,-303},{599.6,-303},{599.6,-252}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-900,-500},{900,320}}), graphics={
        Line(
          points={{130,-100},{130,-72}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{70,-112},{70,-140}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{290,-100},{290,-72}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{230,-112},{230,-140}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{450,-100},{450,-72}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{390,-112},{390,-140}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{126,-296},{126,-268}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{286,-296},{286,-268}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{446,-296},{446,-268}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{68,-354},{68,-382}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{230,-352},{230,-380}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{390,-352},{390,-380}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{606,-296},{606,-268}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{550,-352},{550,-380}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{0,-14},{0,14}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1,
          origin={768,-374},
          rotation=-90),
        Line(
          points={{610,-100},{610,-72}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{550,-114},{550,-142}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1)}));
end LoadPlantBaseII;
