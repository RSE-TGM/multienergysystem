within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model BaseTestSystem
  extends GBEBPumpingSystem(
    T_start_hot = 80 + 273.15,
    T_start_cold = 60 + 273.15,
    Tin_start_S9 = 60 + 273.15,
    Tout_start_S9 = 80 + 273.15,
    Tin_start_S1 = 60 + 273.15,
    Tout_start_S1 = 80 + 273.15,
    Tin_start_S4 = 60 + 273.15,
    Tout_start_S4 = 80 + 273.15,
    hctype = Choices.Pipe.HCtypes.Downstream,
    EB401(nR=5),
    GB101(Tout_ref=353.15),
    n = 2);
  //parameter Integer n = 3 "Number of volumes";


  // Pressures

  parameter Types.Pressure pin_start_Source = 2e5;
  parameter Types.Pressure pout_start_Source = 1.8e5;

  parameter Types.Temperature T_start_SourceIn = 80 + 273.15;
  parameter Types.Temperature T_start_SourceOut = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;


  parameter Types.Temperature T_start_UserOut = 15.6 + 273.15;
  //parameter Types.MassFlowRate m_flow_Users_total = 3.75;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;

  //parameter Real q_m3h(unit = "m3/h") = 8*3600/1000;

  parameter Types.Length Di_S700 = 51e-3;
  parameter Types.Length t_S700 = 1.5e-3;

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV731theta[:,:] = [0, 1; 100, 1];

  // Lengths of pipelines COLD SIDE
  parameter Types.Length L_HX701_SourceOut_FCV701 = 0.6;
  parameter Types.Length L_HX711_SourceOut_FCV711 = 0.6;
  parameter Types.Length L_HX721_SourceOut_FCV721 = 0.6;
  parameter Types.Length L_HX731_SourceOut_FCV731 = 0.6;
  parameter Types.Length h_HX701_SourceOut_FCV701 = 0;
  parameter Types.Length h_HX711_SourceOut_FCV711 = 0;
  parameter Types.Length h_HX721_SourceOut_FCV721 = 0;
  parameter Types.Length h_HX731_SourceOut_FCV731 = 0;

  parameter Types.Length L_FCV701_FT701 = 2.50;
  parameter Types.Length h_FCV701_FT701 = 2.50;
  parameter Types.Length L_FCV711_FT711 = 2.50;
  parameter Types.Length h_FCV711_FT711 = 2.50;
  parameter Types.Length L_FCV721_FT721 = 2.50;
  parameter Types.Length h_FCV721_FT721 = 2.50;
  parameter Types.Length L_FCV731_FT731 = 2.25;
  parameter Types.Length h_FCV731_FT731 = 2.25;

  parameter Types.Length L_FT701_rackL2L3 = 5.2 + 5 + 1;
  parameter Types.Length h_FT701_rackL2L3 = -1;
  parameter Types.Length L_FT711_rackL3L4 = 1 + 0.7 + 5 + 9.2 + 1;
  parameter Types.Length h_FT711_rackL3L4 = -1;
  parameter Types.Length L_FT721_rackL4L5 = 1 + 2 + 5 + 9 + 1 + 1;
  parameter Types.Length h_FT721_rackL4L5 = -1;
  parameter Types.Length L_FT731_rackL6L7 = 1.2 + 4 + 0.25 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter Types.Length h_FT731_rackL6L7 = -0.25 - 0.5;

  // Lengths of pipelines HOT SIDE
  parameter Types.Length L_HX701_TT702_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length L_HX711_TT712_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length L_HX721_TT722_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length L_HX731_TT732_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length h_HX701_TT702_SourceIn = 1.5 + 1.0;
  parameter Types.Length h_HX711_TT712_SourceIn = 1.5 + 1.0;
  parameter Types.Length h_HX721_TT722_SourceIn = 1.5 + 1.0;
  parameter Types.Length h_HX731_TT732_SourceIn = 1.5 + 1.0;

  parameter Types.Length L_rackL2L3_TT702 = 5.2 + 5 + 1;
  parameter Types.Length h_rackL2L3_TT702 = -1;
  parameter Types.Length L_rackL3L4_TT712 = 1 + 0.7 + 5 + 9.2 + 1;
  parameter Types.Length h_rackL3L4_TT712 = -1;
  parameter Types.Length L_rackL4L5_TT722 = 1 + 2 + 5 + 9 + 1 + 1;
  parameter Types.Length h_rackL4L5_TT722 = -1;
  parameter Types.Length L_rackL6L7_TT732 = 1.2 + 4 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter Types.Length h_rackL6L7_TT732 = -0.25 - 0.5;

  // Internal diameters & thickness
  parameter Types.Length t_Source = 1.5e-3;
  parameter Types.Length Di_Source = 32e-3;

  //1. Cooling System

  parameter Types.Pressure pin_start_Cool = 0.92e5;
  parameter Types.Pressure pout_start_Cool = 0.92e5;
  parameter Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter Types.Pressure pout_start_PR01 = 2e5;
  parameter Types.Temperature Tin_start_Cool = 16 + 273.15;
  parameter Types.Temperature Tout_start_Cool = 8 + 273.15;
  parameter Types.MassFlowRate m_flow_Cool = 8.88;
  parameter Real q_Cool(unit = "m3/h") = 32;
  parameter Types.Length t_RR = 1.5e-3;
  parameter Types.Length Di_RR = 85e-3;
  parameter Real Kvalve = 15;
  parameter Real FCVR01theta[:,:] = [0, 1; 100, 1];
  parameter Real PR01omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35; 300, 2*3.141592654*40; 400, 2*3.141592654*40];

  //2. Users System
  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Temperature T_start_UserIn = 7 + 273.15;
  parameter Real q_Users_total(unit = "m3/h") = 20;
  parameter Real q_Users(unit = "m3/h") = q_Users_total/4;
  parameter Types.Length t_Users = 1.5e-3;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Rack = 1.5e-3;
  parameter Types.Length Di_Rack = 51e-3;
  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];

  // Lengths of pipelines source side
  parameter Types.Length L_VER901_FCVR01 = 1;
  parameter Types.Length h_VER901_FCVR01 = -0.8;
  parameter Types.Length L_FCVR01_FTR03 = 2.95;
  parameter Types.Length h_FCVR01_FTR03 = 2.35;
  parameter Types.Length L_FTR03_PTR01 = 1.05;
  parameter Types.Length h_FTR03_PTR01 = 0.25;
  parameter Types.Length L_PTR01_FTR01 = 1.90;
  parameter Types.Length h_PTR01_FTR01 = -1.90;
  parameter Types.Length L_FTR01_RR01 = 1.97;
  parameter Types.Length h_FTR01_RR01 = -0.72;
  parameter Types.Length L_RR01_PR01 = 1.275;
  parameter Types.Length h_RR01_PR01 = 0;
  parameter Types.Length L_PR01_PTR02 = 2.8;
  parameter Types.Length h_PR01_PTR02 = 1;
  parameter Types.Length L_TTR02_VER901 = 0.43;
  parameter Types.Length h_TTR02_VER901 = 0;

  parameter Types.Length L_UsersIn_EX721 = 0.75;
  parameter Types.Length h_UsersIn_EX721 = 0;
  parameter Types.Length L_EX721_EX711_cold = 1.50;
  parameter Types.Length h_EX721_EX711_cold = 0;
  parameter Types.Length L_EX711_EX701_cold = 0.50;
  parameter Types.Length h_EX711_EX701_cold = 0;
  parameter Types.Length L_EX701_EX731_cold = 0.50;
  parameter Types.Length h_EX701_EX731_cold = 0;

  parameter Types.Length L_UsersOut_EX721 = 0.75;
  parameter Types.Length h_UsersOut_EX721 = 0;
  parameter Types.Length L_EX721_EX711_hot = 1.50;
  parameter Types.Length h_EX721_EX711_hot = 0;
  parameter Types.Length L_EX711_EX701_hot = 0.50;
  parameter Types.Length h_EX711_EX701_hot = 0;
  parameter Types.Length L_EX701_EX731_hot = 0.50;
  parameter Types.Length h_EX701_EX731_hot = 0;

  parameter Types.Length L_TT704_TCV701 = 0.65;
  parameter Types.Length h_TT704_TCV701 = 0.65;
  parameter Types.Length L_TT714_TCV711 = 0.65;
  parameter Types.Length h_TT714_TCV711 = 0.65;
  parameter Types.Length L_TT724_TCV721 = 0.65;
  parameter Types.Length h_TT724_TCV721 = 0.65;
  parameter Types.Length L_TT734_TCV731 = 0.65;
  parameter Types.Length h_TT734_TCV731 = 0.65;

  parameter Types.Length L_TCV701_rUsersOut = 1 + 0.45;
  parameter Types.Length h_TCV701_rUsersOut = 1;
  parameter Types.Length L_TCV711_rUsersOut = 1 + 0.45;
  parameter Types.Length h_TCV711_rUsersOut = 1;
  parameter Types.Length L_TCV721_rUsersOut = 1 + 0.45;
  parameter Types.Length h_TCV721_rUsersOut = 1;
  parameter Types.Length L_TCV731_rUsersOut = 1 + 0.66 + 0.66;
  parameter Types.Length h_TCV731_rUsersOut = 1;

  parameter Types.Length L_rUsersIn_TT703 = 1.65 + 0.45;
  parameter Types.Length h_rUsersIn_TT703 = -1.65;
  parameter Types.Length L_rUsersIn_TT713 = 1.65 + 0.45;
  parameter Types.Length h_rUsersIn_TT713 = -1.65;
  parameter Types.Length L_rUsersIn_TT723 = 1.65 + 0.45;
  parameter Types.Length h_rUsersIn_TT723 = -1.65;
  parameter Types.Length L_rUsersIn_TT733 = 1.65 + 0.66 + 0.66;
  parameter Types.Length h_rUsersIn_TT733 = -1.65;

  parameter Types.Length L_RR_UsersIn = 0.8+1.2+0.5+2;
  parameter Types.Length h_RR_UsersIn = 0.8+0.6;

  parameter Types.Length L_RR_UsersOut = 2;
  parameter Types.Length h_RR_UsersOut = 0;

  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={275,-127.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={365,-126.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={455,-126.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={185,-127.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV701_rackUsersOut(
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
        origin={256,-264})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV711_rackUsersOut(
    L=L_TCV711_rUsersOut,
    h=h_TCV711_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={346,-264})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV721_rackUsersOut(
    L=L_TCV721_rUsersOut,
    h=h_TCV721_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={436,-263})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_hot(
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
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={226,-280})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_hot(
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
        origin={386,-294})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersOut_EX721(
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
        origin={477,-294})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT703(
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
        origin={296,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT713(
    L=L_rUsersIn_TT713,
    h=h_rUsersIn_TT713,
    t=t_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={386,-203})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT723(
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
        origin={476,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT733(
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
        origin={206,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_cold(
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
        origin={278,-225})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_cold(
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
        origin={416,-234})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersIn_EX721(
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
        origin={506,-234})));
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
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={610,-119})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV701(
    Kv=Valve.TCV701.Kv,
    dp_nom=Valve.TCV701.dp_nom,
    rho_nom=Valve.TCV701.rho_nom,
    q_m3h_nom=Valve.TCV701.q_nom_m3h,
    Tin_start=Valve.TCV701.Tin_start,
    pin_start=Valve.TCV701.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={256,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV711(
    Kv=Valve.TCV711.Kv,
    dp_nom=Valve.TCV711.dp_nom,
    rho_nom=Valve.TCV711.rho_nom,
    q_m3h_nom=Valve.TCV711.q_nom_m3h,
    Tin_start=Valve.TCV711.Tin_start,
    pin_start=Valve.TCV711.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={346,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV721(
    Kv=Valve.TCV721.Kv,
    dp_nom=Valve.TCV721.dp_nom,
    rho_nom=Valve.TCV721.rho_nom,
    q_m3h_nom=Valve.TCV721.q_nom_m3h,
    Tin_start=Valve.TCV721.Tin_start,
    pin_start=Valve.TCV721.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={437,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV731(
    Kv=Valve.TCV731.Kv,
    dp_nom=Valve.TCV731.dp_nom,
    rho_nom=Valve.TCV731.rho_nom,
    q_m3h_nom=Valve.TCV731.q_nom_m3h,
    Tin_start=Valve.TCV731.Tin_start,
    pin_start=Valve.TCV731.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={166,-204})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVR01(
    Kv=Kvalve,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={660,-234})));
  Sources.SinkPressure VER901(p0=199000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={579,-175})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{222,-214},{242,-194}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={254,-153})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={294,-154})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{311,-214},{331,-194}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{401,-214},{421,-194}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{130,-214},{150,-194}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{701,-194},{681,-174}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={383,-152})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={473,-155})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={203,-154})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={344,-152})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={434,-156})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={163.5,-153.5})));
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
        origin={630,-234})));
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
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={690,-234})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={710,-232})));
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
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={720,-134})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={722,-179})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={722,-169})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={722,-109})));
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
    n=n)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={720,-84})));
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
    n=n) "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={610,-84})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={607,-194})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={607,-184})));
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
    n=n)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={610,-164})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={610,-214})));
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
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={720,-214})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{570,-124},{590,-104}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    Tout_cold_set=Tout_start_Cool,
    dp_cold_start=20000,
    m_flow_cold_start=m_flow_Cool)
    annotation (Placement(transformation(extent={{630,-60},{701,11}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_cold(
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
        origin={226,-234})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT734_TCV731(
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
        origin={166,-174})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV731_rackUsersOut(
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
        origin={166,-264})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_RR_UsersIn(
    L=L_RR_UsersIn,
    h=h_RR_UsersIn,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={580,-234})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT704_TCV701(
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
        origin={256,-174})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT714_TCV711(
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
        origin={346,-174})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT724_TCV721(
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
        origin={436,-174})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_hot(
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
        origin={206,-294})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_RR_UsersOut(
    L=L_RR_UsersOut,
    h=h_RR_UsersOut,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={560,-294})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{738,-126},{779,-91}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_1(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{730,-251},{771,-216}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_3(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{242,-165},{213,-141}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_4(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{330,-163},{301,-139}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_5(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{420,-168},{391,-144}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_2(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{147,-165},{118,-141}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV701.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={294,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV711.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={384,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV721.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV721.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={474,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV731.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV731.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={206,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={294,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FCV711_FT711(
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={384,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FCV721_FT721(
    L=L_FCV721_FT721,
    h=h_FCV721_FT721,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={474,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FCV731_FT731(
    L=L_FCV731_FT731,
    h=h_FCV731_FT731,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={206,-28})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{329,-68},{309,-48}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{419,-68},{399,-48}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{509,-68},{489,-48}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{242,-68},{222,-48}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={294,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_SourceOut_FCV711(
    L=L_HX711_SourceOut_FCV711,
    h=h_HX711_SourceOut_FCV711,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={384,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_SourceOut_FCV721(
    L=L_HX721_SourceOut_FCV721,
    h=h_HX721_SourceOut_FCV721,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={474,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_SourceOut_FCV731(
    L=L_HX731_SourceOut_FCV731,
    h=h_HX731_SourceOut_FCV731,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={206,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX701 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={292,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX711 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={382,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX721 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={472,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX731 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={204,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT701(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={292,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT711(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={382,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT721(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={472,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT731(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={204,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT701 "Pressure sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={292,12})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT711 "Pressure sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={382,12})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT721 "Pressure sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={472,12})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT731 "Pressure sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={204,12})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4(
    L=L_FT711_rackL3L4,
    h=h_FT711_rackL3L4,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={384,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={294,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5(
    L=L_FT721_rackL4L5,
    h=h_FT721_rackL4L5,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={474,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7(
    L=L_FT731_rackL6L7,
    h=h_FT731_rackL6L7,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={206,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={254,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_TT712_SourceIn(
    L=L_HX711_TT712_SourceIn,
    h=h_HX711_TT712_SourceIn,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={344,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_TT722_SourceIn(
    L=L_HX721_TT722_SourceIn,
    h=h_HX721_TT722_SourceIn,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={434,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_TT732_SourceIn(
    L=L_HX731_TT732_SourceIn,
    h=h_HX731_TT732_SourceIn,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={166,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT702(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={252,-6})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={252,4})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT712(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={342,-38})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={342,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT722(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={432,-38})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={432,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT732(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={164,-38})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={164,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700,
    n=n)        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={254,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_rackL3L4_TT712(
    L=L_rackL3L4_TT712,
    h=h_rackL3L4_TT712,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={344,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_rackL4L5_TT722(
    L=L_rackL4L5_TT722,
    h=h_rackL4L5_TT722,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={434,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_rackL6L7_TT732(
    L=L_rackL6L7_TT732,
    h=h_rackL6L7_TT732,
    t=t_S700,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_S700,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={166,36})));
equation
  connect(PL_TCV721_rackUsersOut.outlet,PL_EX721_EX711_hot. outlet) annotation (
     Line(
      points={{436,-273},{436,-294},{396,-294}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet,PL_EX721_EX711_hot. outlet) annotation (Line(
      points={{467,-294},{396,-294}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold,PL_rackUsersIn_TT703. outlet) annotation (Line(
      points={{295.3,-136.25},{295.3,-156},{296,-156},{296,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold,PL_rackUsersIn_TT713. outlet) annotation (Line(
      points={{385.3,-135.25},{385.3,-166.125},{386,-166.125},{386,-193}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,PL_rackUsersIn_TT723. outlet) annotation (Line(
      points={{475.3,-135.25},{475.3,-182.125},{476,-182.125},{476,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,PL_rackUsersIn_TT733. outlet) annotation (Line(
      points={{205.3,-136.25},{205.3,-173.625},{206,-173.625},{206,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT723.inlet,PL_EX721_EX711_cold. inlet) annotation (
      Line(
      points={{476,-214},{476,-234},{426,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet,PL_EX721_EX711_cold. inlet) annotation (Line(
      points={{496,-234},{426,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{256,-214},{256,-254}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{346,-214},{346,-254}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{437,-214},{437,-234},{436,-234},{436,-253}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701_theta.y,TCV701. opening)
    annotation (Line(points={{243,-204},{248,-204}}, color={0,0,127}));
  connect(EX701.incold,TT703. inlet) annotation (Line(
      points={{295.3,-136.25},{295.3,-142},{296.4,-142},{296.4,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening,TCV711_theta. y)
    annotation (Line(points={{338,-204},{332,-204}},
                                                   color={0,0,127}));
  connect(EX701.outcold,TT704. inlet) annotation (Line(
      points={{254.7,-136.25},{256.4,-136.25},{256.4,-153}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.opening,TCV721_theta. y)
    annotation (Line(points={{429,-204},{422,-204}},
                                                 color={0,0,127}));
  connect(TCV731.opening,TCV731_theta. y)
    annotation (Line(points={{158,-204},{151,-204}},
                                                   color={0,0,127}));
  connect(EX711.incold,TT713. inlet) annotation (Line(
      points={{385.3,-135.25},{385.3,-131.125},{385.4,-131.125},{385.4,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,TT723. inlet) annotation (Line(
      points={{475.3,-135.25},{475.3,-145.125},{475.4,-145.125},{475.4,-155}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,TT733. inlet) annotation (Line(
      points={{205.3,-136.25},{205.3,-145.125},{205.4,-145.125},{205.4,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,TT714. inlet) annotation (Line(
      points={{344.7,-135.25},{346.4,-135.25},{346.4,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TT724. inlet) annotation (Line(
      points={{434.7,-135.25},{436,-135.25},{436.4,-156}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold,TT734. inlet) annotation (Line(
      points={{164.7,-136.25},{164.7,-145},{165.7,-145},{165.7,-153.5}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.outlet,FCVR01. inlet) annotation (Line(
      points={{640,-234},{650,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{610,-94},{610,-108.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{610,-129.4},{610,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{610,-174},{610,-179},{609.4,-179},{609.4,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{609.4,-184},{609.4,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet,RR00_PL_TTR02_VER901. inlet) annotation (Line(
      points={{609.4,-194},{609.4,-199},{610,-199},{610,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.outlet,RR00_PL_VER901_FCVR01. inlet) annotation (
     Line(
      points={{610,-224},{610,-234},{620,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,RR00_PL_FCVR01_FTR03. inlet) annotation (Line(
      points={{670,-234},{680,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FCVR01_FTR03.outlet,FTR03. inlet) annotation (Line(
      points={{700,-234},{707,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet,RR00_PL_FTR03_PTR01. inlet) annotation (Line(
      points={{713,-234},{720,-234},{720,-224}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{719.6,-179},{719.6,-169}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{719.6,-169},{719.6,-151.5},{720,-151.5},{720,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{720,-124},{720,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{720,-106},{720,-94}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y,FCVR01. opening)
    annotation (Line(points={{680,-184},{660,-184},{660,-226}},
                                                           color={0,0,127}));
  connect(PR01_omega.y,PR01. in_omega) annotation (Line(points={{591,-114},{597.25,
          -114},{597.25,-113.8},{603.5,-113.8}},
                                           color={0,0,127}));
  connect(TTR01.inlet,RR00_PL_FTR03_PTR01. outlet) annotation (Line(
      points={{719.6,-179},{720,-179},{720,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{720,-74},{720,-63},{687,-63},{687,-45.8},{686.8,-45.8}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold,RR00_PL_RR01_PR01. inlet) annotation (Line(
      points={{644.2,-45.8},{644.2,-64},{610,-64},{610,-74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{166,-164},{166,-159},{165.7,-159},{165.7,-153.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{166,-194},{166,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV731_rackUsersOut.inlet,TCV731. outlet) annotation (Line(
      points={{166,-254},{166,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersIn.inlet,RR00_PL_VER901_FCVR01. inlet) annotation (Line(
      points={{590,-234},{620,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersIn.outlet,PL_UsersIn_EX721. inlet) annotation (Line(
      points={{570,-234},{516,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,PL_TT704_TCV701. inlet) annotation (Line(
      points={{254.7,-136.25},{256,-136.25},{256,-164}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{256,-184},{256,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,PL_TT714_TCV711. inlet) annotation (Line(
      points={{344.7,-135.25},{346,-135.25},{346,-164}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{346,-184},{346,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,PL_TT724_TCV721. inlet) annotation (Line(
      points={{434.7,-135.25},{436,-135.25},{436,-164}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet,TCV721. inlet) annotation (Line(
      points={{436,-184},{436,-194},{437,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV731_rackUsersOut. outlet) annotation (
      Line(
      points={{196,-294},{166,-294},{166,-274}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.inlet,RR00_PL_VER901_FCVR01. inlet) annotation (Line(
      points={{579,-185},{578,-185},{578,-222},{596,-222},{596,-234},{620,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet,PL_EX701_EX731_cold. inlet) annotation (
      Line(
      points={{406,-234},{236,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{216,-234},{206,-234},{206,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet,PL_EX711_EX701_cold. inlet) annotation (
      Line(
      points={{216,-234},{206,-234},{206,-220},{262,-220},{262,-225},{268,-225}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet,PL_rackUsersIn_TT703. inlet) annotation (
      Line(
      points={{288,-225},{296,-225},{296,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.inlet,PL_EX701_EX731_cold. inlet) annotation (
      Line(
      points={{386,-213},{386,-234},{236,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet,PL_EX721_EX711_hot. inlet) annotation (Line(
      points={{216,-294},{376,-294}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV711_rackUsersOut.outlet,PL_EX721_EX711_hot. inlet) annotation (
      Line(
      points={{346,-274},{346,-294},{376,-294}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV701_rackUsersOut.outlet,PL_EX711_EX701_hot. inlet) annotation (
      Line(
      points={{256,-274},{256,-280},{236,-280}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet,PL_TCV731_rackUsersOut. outlet) annotation (
     Line(
      points={{216,-280},{166,-280},{166,-274}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.outlet,PL_RR_UsersOut. inlet) annotation (Line(
      points={{487,-294},{550,-294}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersOut.outlet,RR00_PL_FTR03_PTR01. inlet) annotation (Line(
      points={{570,-294},{720,-294},{720,-224}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.q_m3hr,FTR01_. numberPort) annotation (Line(points={{728.5,-109},
          {731.712,-109},{731.712,-108.5},{734.925,-108.5}},
                                                       color={0,0,127}));
  connect(FTR03.q_m3hr, PT901_.numberPort) annotation (Line(points={{710,-225.5},
          {710,-240},{718,-240},{718,162.5},{-836.4,162.5}},    color={0,0,127}));
  connect(TT704.T,FTR01_3. numberPort)
    annotation (Line(points={{246.2,-153},{244.175,-153}},
                                                         color={0,0,127}));
  connect(FTR01_4.numberPort,TT714. T) annotation (Line(points={{332.175,-151},{
          334,-151},{334,-152},{336.2,-152}},
                                        color={0,0,127}));
  connect(FTR01_5.numberPort,TT724. T)
    annotation (Line(points={{422.175,-156},{426.2,-156}},
                                                    color={0,0,127}));
  connect(TT734.T, TT902_.numberPort) annotation (Line(points={{156.35,-153.5},{
          156.35,190},{-741.525,190}},   color={0,0,127}));
  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{294,-38},{294,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet,FCV711. outlet) annotation (Line(
      points={{384,-38},{384,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet,FCV721. outlet) annotation (Line(
      points={{474,-38},{474,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet,FCV731. outlet) annotation (Line(
      points={{206,-38},{206,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711_theta.y,FCV711. opening)
    annotation (Line(points={{398,-58},{396,-58},{396,-59},{395,-59},{395,-58},{
          392,-58}},                            color={0,0,127}));
  connect(FCV731_theta.y,FCV731. opening)
    annotation (Line(points={{221,-58},{214,-58}},
                                                 color={0,0,127}));
  connect(FCV721_theta.y,FCV721. opening)
    annotation (Line(points={{488,-58},{482,-58}},
                                               color={0,0,127}));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{294,-68},{294,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y,FCV701. opening)
    annotation (Line(points={{308,-58},{302,-58}}, color={0,0,127}));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{384,-68},{384,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721. outlet) annotation (Line(
      points={{474,-68},{474,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{206,-68},{206,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{294,-11},{294,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet,PL711_FCV711_FT711. outlet) annotation (Line(
      points={{384,-11},{384,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet,PL721_FCV721_FT721. outlet) annotation (Line(
      points={{474,-11},{474,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet,PL731_FCV731_FT731. outlet) annotation (Line(
      points={{206,-11},{206,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.inlet,PT731. inlet) annotation (Line(
      points={{206,26},{206,12}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{206,12},{206,2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{206,2},{206,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.inlet,PT721. inlet) annotation (Line(
      points={{474,26},{474,12}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{474,12},{474,2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT721.inlet,FT721. outlet) annotation (Line(
      points={{474,2},{474,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet,PT711. inlet) annotation (Line(
      points={{384,26},{384,12}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{384,12},{384,2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT711.inlet,FT711. outlet) annotation (Line(
      points={{384,2},{384,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.inlet,PT701. inlet) annotation (Line(
      points={{294,26},{294,12}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{294,12},{294,2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{294,2},{294,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{254,-48},{254,-6}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{254,-6},{254,4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet,TT712. inlet) annotation (Line(
      points={{344,-48},{344,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{344,-38},{344,-28}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet,PL711_rackL3L4_TT712. outlet) annotation (Line(
      points={{344,-28},{344,26}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet,TT722. inlet) annotation (Line(
      points={{434,-48},{434,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722. inlet) annotation (Line(
      points={{434,-38},{434,-28}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet,PL721_rackL4L5_TT722. outlet) annotation (Line(
      points={{434,-28},{434,26}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet,TT732. inlet) annotation (Line(
      points={{166,-48},{166,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{166,-38},{166,-28}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.outlet,PT702. inlet) annotation (Line(
      points={{254,26},{254,4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.outlet,PT732. inlet) annotation (Line(
      points={{166,26},{166,-28}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet,EX721. outhot) annotation (Line(
      points={{474,-98},{474,-107.875},{475.3,-107.875},{475.3,-117.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet,EX721. inhot) annotation (Line(
      points={{434,-68},{434,-94},{434.7,-94},{434.7,-117.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet,EX711. outhot) annotation (Line(
      points={{384,-98},{384,-107.875},{385.3,-107.875},{385.3,-117.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet,EX711. inhot) annotation (Line(
      points={{344,-68},{344,-92.875},{344.7,-92.875},{344.7,-117.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{294,-98},{294,-108.375},{295.3,-108.375},{295.3,-118.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{254,-68},{254,-93.375},{254.7,-93.375},{254.7,-118.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet,EX731. outhot) annotation (Line(
      points={{206,-98},{206,-108.375},{205.3,-108.375},{205.3,-118.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet,EX731. inhot) annotation (Line(
      points={{166,-68},{166,-118.75},{164.7,-118.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
      Line(
      points={{254,46},{256,46},{256,118},{56,118},{56,205},{60,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet)
    annotation (Line(
      points={{294,46},{296,46},{296,130},{72,130},{72,265},{90,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
      Line(
      points={{344,46},{342,46},{342,98},{340,98},{340,136},{180,136},{180,205},
          {180,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet)
    annotation (Line(
      points={{384,46},{382,46},{382,124},{378,124},{378,146},{200,146},{200,265},
          {110,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
      Line(
      points={{434,46},{432,46},{432,124},{408,124},{408,205},{400,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
      Line(
      points={{474,46},{470,46},{470,128},{436,128},{436,265},{330,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
      Line(
      points={{166,46},{164,46},{164,76},{648,76},{648,205},{640,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
     Line(
      points={{206,46},{206,66},{662,66},{662,265},{650,265}},
      color={140,56,54},
      thickness=0.5));
end BaseTestSystem;
