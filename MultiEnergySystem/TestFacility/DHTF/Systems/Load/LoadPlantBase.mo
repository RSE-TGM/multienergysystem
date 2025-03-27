within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
partial model LoadPlantBase

  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model MediumLPHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model MediumLPCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;
  //replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient;
  replaceable model Pipe = DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV;

  // EX701
  parameter Real EX701_q_m3h_hot(unit = "m3/h") = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=45 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=EX701_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;

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

  // EX731
  parameter Real EX731_q_m3h_hot(unit = "m3/h") = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=45 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=0.5*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15;

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
  parameter Real Kvalve(unit = "m3/h") = 90;
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
  parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT711_rackL3L4=1 + 0.7 + 5 + 9.2 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT711_rackL3L4=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT721_rackL4L5=1 + 2 + 5 + 9 + 1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT721_rackL4L5=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT731_rackL6L7=1.2 + 4 + 0.25 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_FT731_rackL6L7=-0.25 - 0.5;

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

  parameter Real ToutcoolSP[:,:] = [0, 7; 50, 7; 60, 17; 100, 17];

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV701(
    Kv=TestFacility.Data.ValveData.FCV701.Kv,
    dp_nom(displayUnit="Pa") = TestFacility.Data.ValveData.FCV701.dp_nom,
    Tin_start(displayUnit="K") = EX701_Tout_hot,
    pin_start=EX701_pout_hot,
    q_m3h_start=EX701_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={138,-150})));

  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701(
    redeclare model Medium = MediumLPHot,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={117,-215.5})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX711(
    redeclare model Medium = MediumLPHot,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=TestFacility.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=TestFacility.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=TestFacility.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=TestFacility.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={419,-218.5})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX721(
    redeclare model Medium = MediumLPHot,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.8257757,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.8257757,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=TestFacility.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=TestFacility.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=TestFacility.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=TestFacility.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={577,-218.5})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX731(
    redeclare model Medium = MediumLPHot,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=TestFacility.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=TestFacility.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=TestFacility.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=TestFacility.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={277,-217.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
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
        origin={138,-122})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    pin_start=EX701_pout_hot,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={138,-182})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={140,-104})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={140,-92})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={140,-82})));
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
        origin={138,-58})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={98,-152})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT702(T_start=
        EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={96,-120})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={96,-94})));
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
        origin={98,-58})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV711(
    Kv=TestFacility.Data.ValveData.FCV711.Kv,
    dp_nom(displayUnit="Pa") = TestFacility.Data.ValveData.FCV711.dp_nom,
    Tin_start(displayUnit="K") = EX711_Tout_hot,
    pin_start=EX711_pout_hot,
    q_m3h_start=EX711_q_m3h_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={438,-150})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FCV711_FT711(
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
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
        origin={438,-120})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_SourceOut_FCV711(
    L=L_HX711_SourceOut_FCV711,
    h=h_HX711_SourceOut_FCV711,
    t=t_S700,
    pin_start=EX711_pout_hot,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={438,-180})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={440,-102})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={440,-86})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={440,-72})));
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
        origin={438,-56})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_TT712_SourceIn(
    L=L_HX711_TT712_SourceIn,
    h=h_HX711_TT712_SourceIn,
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
        origin={398,-150})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT712(T_start=
        EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={396,-120})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={396,-80})));
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
        origin={398,-56})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV721(
    Kv=TestFacility.Data.ValveData.FCV721.Kv,
    dp_nom(displayUnit="Pa") = TestFacility.Data.ValveData.FCV721.dp_nom,
    Tin_start(displayUnit="K") = EX721_Tout_hot,
    pin_start=EX721_pout_hot,
    q_m3h_start=EX721_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={598,-150})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FCV721_FT721(
    L=L_FCV721_FT721,
    h=h_FCV721_FT721,
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
        origin={598,-122})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_SourceOut_FCV721(
    L=L_HX721_SourceOut_FCV721,
    h=h_HX721_SourceOut_FCV721,
    t=t_S700,
    pin_start=EX721_pout_hot,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={598,-180})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={600,-102})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={600,-86})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={600,-72})));
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
        origin={598,-56})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_TT722_SourceIn(
    L=L_HX721_TT722_SourceIn,
    h=h_HX721_TT722_SourceIn,
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
        origin={558,-150})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT722(T_start=
        EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={556,-120})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={556,-80})));
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
        origin={558,-56})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV731(
    Kv=TestFacility.Data.ValveData.FCV731.Kv,
    dp_nom(displayUnit="Pa") = TestFacility.Data.ValveData.FCV731.dp_nom,
    Tin_start(displayUnit="K") = EX731_Tout_hot,
    pin_start=EX731_pout_hot,
    q_m3h_start=EX731_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={298,-150})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FCV731_FT731(
    L=L_FCV731_FT731,
    h=h_FCV731_FT731,
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
        origin={298,-124})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_SourceOut_FCV731(
    L=L_HX731_SourceOut_FCV731,
    h=h_HX731_SourceOut_FCV731,
    t=t_S700,
    pin_start=EX731_pout_hot,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={298,-180})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={300,-106})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={300,-90})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={300,-76})));
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
        origin={298,-60})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_TT732_SourceIn(
    L=L_HX731_TT732_SourceIn,
    h=h_HX731_TT732_SourceIn,
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
        origin={258,-150})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT732(T_start=
        EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={256,-120})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={256,-80})));
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
        origin={258,-60})));
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
        origin={258,-320})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT734(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={255.5,-269.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT734_TCV731(
    L=L_TT734_TCV731,
    h=h_TT734_TCV731,
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
        origin={258,-290})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT703(
    L=L_rUsersIn_TT703,
    h=h_rUsersIn_TT703,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={138,-266})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT723(
    L=L_rUsersIn_TT723,
    h=h_rUsersIn_TT723,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={598,-320})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV721(
    Kv=TestFacility.Data.ValveData.TCV721.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV721.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV721.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV721.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV721.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={557.5,-320})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT723(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={595,-271})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT724(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={556,-272})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT724_TCV721(
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
        origin={558,-290})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT713(
    L=L_rUsersIn_TT713,
    h=h_rUsersIn_TT713,
    t=t_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={438,-319})));
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
        origin={398,-320})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT713(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={435,-268})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT714(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={396,-268})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT714_TCV711(
    L=L_TT714_TCV711,
    h=h_TT714_TCV711,
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
        origin={398,-290})));
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
        origin={98,-296})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT704(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={96,-245})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT704_TCV701(
    L=L_TT704_TCV701,
    h=h_TT704_TCV701,
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
        origin={98,-266})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT703(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={134,-246})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT733(
    L=L_rUsersIn_TT733,
    h=h_rUsersIn_TT733,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={296,-320})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT733(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={295,-270})));
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
        origin={98,-378})));
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
        origin={258,-378})));
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
        origin={398,-378})));
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
        origin={558,-379})));
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
        origin={622,-360})));
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
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
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
        extent={{-13,13},{13,-13}},
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
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool,
    V=0.001) "Chiller"
    annotation (Placement(transformation(extent={{732,-154},{803,-83}})));

  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{668,-370},{648,-350}})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange                   suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{646,-410},{666,-390}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction
    annotation (Placement(transformation(extent={{302,-354},{290,-366}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction1
    annotation (Placement(transformation(extent={{444,-354},{432,-366}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction2
    annotation (Placement(transformation(extent={{604,-354},{592,-366}})));
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
        origin={558,-400})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction6
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={398,-400})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction7
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=0,
        origin={258,-400})));
equation
  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{138,-132},{138,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{138,-160},{138,-172}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{138,-192},{138,-206.75},{137.3,-206.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{138,-107},{138,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.inlet,PT701. inlet) annotation (Line(
      points={{138,-68},{138,-82}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{98,-142},{98,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{98,-120},{98,-94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{98,-162},{96.7,-162},{96.7,-206.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.outlet,PT702. inlet) annotation (Line(
      points={{98,-68},{98,-94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet,FCV711. outlet) annotation (Line(
      points={{438,-130},{438,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{438,-160},{438,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet,EX711. outhot) annotation (Line(
      points={{438,-190},{438,-193.375},{439.3,-193.375},{439.3,-209.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet,PL711_FCV711_FT711. outlet) annotation (Line(
      points={{438,-105},{438,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet,PT711. inlet) annotation (Line(
      points={{438,-66},{438,-72}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet,TT712. inlet) annotation (Line(
      points={{398,-140},{398,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{398,-120},{398,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet,PL711_rackL3L4_TT712. outlet) annotation (Line(
      points={{398,-80},{398,-66}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet,EX711. inhot) annotation (Line(
      points={{398,-160},{398.7,-160},{398.7,-209.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{138,-82},{138,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{138,-92},{138,-101}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{438,-72},{438,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{438,-99},{438,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet,FCV721. outlet) annotation (Line(
      points={{598,-132},{598,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721.outlet) annotation (Line(
      points={{598,-160},{598,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet,EX721.outhot) annotation (Line(
      points={{598,-190},{598,-199.875},{597.3,-199.875},{597.3,-209.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet,PL721_FCV721_FT721. outlet) annotation (Line(
      points={{598,-105},{598,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.inlet,PT721. inlet) annotation (Line(
      points={{598,-66},{598,-72}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet,TT722.inlet) annotation (Line(
      points={{558,-140},{558,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{558,-120},{558,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet,PL721_rackL4L5_TT722.outlet) annotation (Line(
      points={{558,-80},{558,-66}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet,EX721. inhot) annotation (Line(
      points={{558,-160},{558,-210},{556,-210},{556,-209.75},{556.7,-209.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet,FCV731. outlet) annotation (Line(
      points={{298,-134},{298,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{298,-160},{298,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet,EX731. outhot) annotation (Line(
      points={{298,-190},{298,-197.875},{297.3,-197.875},{297.3,-208.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet,PL731_FCV731_FT731. outlet) annotation (Line(
      points={{298,-109},{298,-114}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.inlet,PT731. inlet) annotation (Line(
      points={{298,-70},{298,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet,TT732. inlet) annotation (Line(
      points={{258,-140},{258,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{258,-120},{258,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet,EX731. inhot) annotation (Line(
      points={{258,-160},{258,-194},{256.7,-194},{256.7,-208.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.outlet,PT732. inlet) annotation (Line(
      points={{258,-70},{258,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{598,-72},{598,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{598,-99},{598,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{298,-76},{298,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{298,-90},{298,-103}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{258,-280},{258,-275},{257.7,-275},{257.7,-269.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{258,-310},{258,-300}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold,TT734. inlet) annotation (Line(
      points={{256.7,-226.25},{256.7,-247.875},{257.7,-247.875},{257.7,-269.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,PL_rackUsersIn_TT723. outlet) annotation (Line(
      points={{597.3,-227.25},{597.3,-298.125},{598,-298.125},{598,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,TT723. inlet) annotation (Line(
      points={{597.3,-227.25},{597.3,-261.125},{597.4,-261.125},{597.4,-271}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TT724. inlet) annotation (Line(
      points={{556.7,-227.25},{558.4,-227.25},{558.4,-272}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,PL_TT724_TCV721. inlet) annotation (Line(
      points={{556.7,-227.25},{558,-227.25},{558,-280}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,TT714. inlet) annotation (Line(
      points={{398.7,-227.25},{398.4,-227.25},{398.4,-268}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,PL_TT714_TCV711. inlet) annotation (Line(
      points={{398.7,-227.25},{398,-227.25},{398,-280}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{398,-300},{398,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.outlet,TT713. inlet) annotation (Line(
      points={{438,-309},{438,-288.5},{437.4,-288.5},{437.4,-268}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet,EX711. incold) annotation (Line(
      points={{437.4,-268},{437.4,-247.625},{439.3,-247.625},{439.3,-227.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,TT704. inlet) annotation (Line(
      points={{96.7,-224.25},{98.4,-224.25},{98.4,-245}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,PL_TT704_TCV701. inlet) annotation (Line(
      points={{96.7,-224.25},{98,-224.25},{98,-256}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{98,-276},{98,-286}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT703.outlet,TT703. inlet) annotation (Line(
      points={{138,-256},{136.4,-256},{136.4,-246}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{136.4,-246},{136.4,-244.125},{137.3,-244.125},{137.3,-224.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,PL_rackUsersIn_TT733. outlet) annotation (Line(
      points={{297.3,-226.25},{297.3,-283.625},{296,-283.625},{296,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,TT733. inlet) annotation (Line(
      points={{297.3,-226.25},{297.3,-248.125},{297.4,-248.125},{297.4,-270}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet,TCV721. inlet) annotation (Line(
      points={{558,-300},{558,-305},{557.5,-305},{557.5,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{98,-306},{98,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL_TCV731_rackUsersOut. inlet) annotation (Line(
      points={{258,-330},{258,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{398,-330},{398,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{557.5,-330},{557.5,-340.5},{558,-340.5},{558,-369}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{158,-400},{98,-400},{98,-388}},
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
      points={{648,-360},{632,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet, PL_rackUsersIn_TT703.inlet) annotation (Line(
      points={{190,-360},{138,-360},{138,-276}},
      color={140,56,54},
      thickness=0.5));
  connect(junction.inoutlet, PL_rackUsersIn_TT733.inlet) annotation (Line(
      points={{296,-354},{296,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet, junction.inlet) annotation (Line(
      points={{348,-360},{302,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction.outlet, PL_EX711_EX701_cold.inlet) annotation (Line(
      points={{290,-360},{210,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet, junction1.inlet) annotation (Line(
      points={{476,-360},{444,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction1.inoutlet, PL_rackUsersIn_TT713.inlet) annotation (Line(
      points={{438,-354},{438,-329}},
      color={140,56,54},
      thickness=0.5));
  connect(junction1.outlet, PL_EX701_EX731_cold.inlet) annotation (Line(
      points={{432,-360},{368,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2.inoutlet, PL_rackUsersIn_TT723.inlet) annotation (Line(
      points={{598,-354},{598,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet, junction2.inlet) annotation (Line(
      points={{612,-360},{604,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2.outlet, PL_EX721_EX711_cold.inlet) annotation (Line(
      points={{592,-360},{496,-360}},
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
      points={{558,-394},{558,-389}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet, junction5.outlet) annotation (Line(
      points={{587,-400},{564,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction5.inlet, PL_EX721_EX711_hot.outlet) annotation (Line(
      points={{552,-400},{488,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction6.inoutlet, PL_TCV711_rackUsersOut.outlet) annotation (Line(
      points={{398,-394},{398,-388}},
      color={140,56,54},
      thickness=0.5));
  connect(junction6.inlet, PL_EX711_EX701_hot.outlet) annotation (Line(
      points={{392,-400},{328,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet, junction6.outlet) annotation (Line(
      points={{468,-400},{404,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction7.inoutlet, PL_TCV731_rackUsersOut.outlet) annotation (Line(
      points={{258,-394},{258,-388}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet, junction7.outlet) annotation (Line(
      points={{308,-400},{264,-400}},
      color={140,56,54},
      thickness=0.5));
  connect(junction7.inlet, PL_EX701_EX731_hot.outlet) annotation (Line(
      points={{252,-400},{178,-400}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-900,-500},{900,320}})));
end LoadPlantBase;
