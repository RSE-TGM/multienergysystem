within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model CoolingSystem
  "Users Systems and some pipelines connected on the heating side"

  parameter Integer n = 3 "Number of volumes";
  parameter Types.MassFlowRate m_flow_total = 2.4;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Downstream "Location of pressure state";

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

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={290,210},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-151,66.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-61,67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={29,67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-241,66.5})));
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
        origin={-170,-70})));
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
        origin={-80,-70})));
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
        origin={10,-69})));
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
        origin={-200,-86})));
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
        origin={-40,-100})));
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
        origin={51,-100})));
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
        origin={-130,-10})));
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
        origin={-40,-9})));
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
        origin={50,-10})));
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
        origin={-220,-10})));
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
        origin={-148,-31})));
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
        origin={-10,-40})));
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
        origin={80,-40})));
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
        origin={150,75})));
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
        origin={-170,-10})));
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
        origin={-80,-10})));
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
        origin={11,-10})));
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
        origin={-260,-10})));
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
        origin={200,-40})));
  Sources.SinkPressure VER901(p0=199000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={119,19})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{-204,-20},{-184,0}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-172,41})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-132,40})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{-115,-20},{-95,0}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{-25,-20},{-5,0}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{-296,-20},{-276,0}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{241,0},{221,20}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-43,42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={47,39})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-223,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-82,42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={8,38})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-262.5,40.5})));
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
        origin={170,-40})));
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
        origin={230,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={250,-38})));
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
        origin={260,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={262,15})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={262,25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={262,85})));
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
        origin={260,110})));
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
        origin={150,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={147,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={147,10})));
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
        origin={150,30})));
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
        origin={150,-20})));
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
        origin={260,-20})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{110,70},{130,90}})));
  Sources.SourceMassFlow sourceHot(
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_total) annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={-260,130})));
  Sources.SinkPressure sinkHot(p0=200000, T0(displayUnit="K") = 60 + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-220,131})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(Tout_cold_set=Tout_start_Cool,
    dp_cold_start=20000,                m_flow_cold_start=m_flow_Cool)
    annotation (Placement(transformation(extent={{170,134},{241,205}})));
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
        origin={-200,-40})));
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
        origin={-260,20})));
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
        origin={-260,-70})));
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
        origin={120,-40})));
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
        origin={-170,20})));
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
        origin={-80,20})));
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
        origin={10,20})));
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
        origin={-220,-100})));
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
        origin={100,-100})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{278,68},{319,103}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_1(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{270,-57},{311,-22}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_3(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-184,29},{-213,53}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_4(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-96,31},{-125,55}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_5(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-6,26},{-35,50}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_2(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-279,29},{-308,53}})));
equation
  connect(PL_TCV721_rackUsersOut.outlet, PL_EX721_EX711_hot.outlet) annotation (
     Line(
      points={{10,-79},{10,-100},{-30,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet, PL_EX721_EX711_hot.outlet) annotation (Line(
      points={{41,-100},{-30,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, PL_rackUsersIn_TT703.outlet) annotation (Line(
      points={{-130.7,57.75},{-130.7,38},{-130,38},{-130,-3.55271e-15}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, PL_rackUsersIn_TT713.outlet) annotation (Line(
      points={{-40.7,58.75},{-40.7,27.875},{-40,27.875},{-40,1}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, PL_rackUsersIn_TT723.outlet) annotation (Line(
      points={{49.3,58.75},{49.3,11.875},{50,11.875},{50,0}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, PL_rackUsersIn_TT733.outlet) annotation (Line(
      points={{-220.7,57.75},{-220.7,20.375},{-220,20.375},{-220,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT723.inlet, PL_EX721_EX711_cold.inlet) annotation (
      Line(
      points={{50,-20},{50,-40},{0,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet, PL_EX721_EX711_cold.inlet) annotation (Line(
      points={{70,-40},{0,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL_TCV701_rackUsersOut.inlet) annotation (Line(
      points={{-170,-20},{-170,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL_TCV711_rackUsersOut.inlet) annotation (Line(
      points={{-80,-20},{-80,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL_TCV721_rackUsersOut.inlet) annotation (Line(
      points={{11,-20},{11,-40},{10,-40},{10,-59}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-183,-10},{-178,-10}}, color={0,0,127}));
  connect(EX701.incold, TT703.inlet) annotation (Line(
      points={{-130.7,57.75},{-130.7,52},{-129.6,52},{-129.6,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening, TCV711_theta.y)
    annotation (Line(points={{-88,-10},{-94,-10}}, color={0,0,127}));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{-171.3,57.75},{-169.6,57.75},{-169.6,41}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.opening, TCV721_theta.y)
    annotation (Line(points={{3,-10},{-4,-10}},  color={0,0,127}));
  connect(TCV731.opening, TCV731_theta.y)
    annotation (Line(points={{-268,-10},{-275,-10}},
                                                   color={0,0,127}));
  connect(EX711.incold, TT713.inlet) annotation (Line(
      points={{-40.7,58.75},{-40.7,62.875},{-40.6,62.875},{-40.6,42}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, TT723.inlet) annotation (Line(
      points={{49.3,58.75},{49.3,48.875},{49.4,48.875},{49.4,39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, TT733.inlet) annotation (Line(
      points={{-220.7,57.75},{-220.7,48.875},{-220.6,48.875},{-220.6,40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{-81.3,58.75},{-79.6,58.75},{-79.6,42}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{8.7,58.75},{10,58.75},{10.4,38}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{-261.3,57.75},{-261.3,49},{-260.3,49},{-260.3,40.5}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.outlet, FCVR01.inlet) annotation (Line(
      points={{180,-40},{190,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.outlet, PR01.inlet) annotation (Line(
      points={{150,100},{150,85.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet, RR00_PL_PR01_PTR02.inlet) annotation (Line(
      points={{150,64.6},{150,40}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet, PTR02.inlet) annotation (Line(
      points={{150,20},{150,15},{149.4,15},{149.4,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet, TTR02.inlet) annotation (Line(
      points={{149.4,10},{149.4,0}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet, RR00_PL_TTR02_VER901.inlet) annotation (Line(
      points={{149.4,0},{149.4,-5},{150,-5},{150,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.outlet, RR00_PL_VER901_FCVR01.inlet) annotation (
     Line(
      points={{150,-30},{150,-40},{160,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet, RR00_PL_FCVR01_FTR03.inlet) annotation (Line(
      points={{210,-40},{220,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FCVR01_FTR03.outlet, FTR03.inlet) annotation (Line(
      points={{240,-40},{247,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{253,-40},{260,-40},{260,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet, PTR01.inlet) annotation (Line(
      points={{259.6,15},{259.6,25}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet, RR00_PL_PTR01_FTR01.inlet) annotation (Line(
      points={{259.6,25},{259.6,42.5},{260,42.5},{260,50}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet, FTR01.inlet) annotation (Line(
      points={{260,70},{260,82}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{260,88},{260,100}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y, FCVR01.opening)
    annotation (Line(points={{220,10},{200,10},{200,-32}}, color={0,0,127}));
  connect(PR01_omega.y, PR01.in_omega) annotation (Line(points={{131,80},{137.25,
          80},{137.25,80.2},{143.5,80.2}}, color={0,0,127}));
  connect(TTR01.inlet, RR00_PL_FTR03_PTR01.outlet) annotation (Line(
      points={{259.6,15},{260,15},{260,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet, RR01.incold) annotation (Line(
      points={{260,120},{260,131},{227,131},{227,148.2},{226.8,148.2}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold, RR00_PL_RR01_PR01.inlet) annotation (Line(
      points={{184.2,148.2},{184.2,130},{150,130},{150,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet, TT734.inlet) annotation (Line(
      points={{-260,30},{-260,35},{-260.3,35},{-260.3,40.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet, PL_TT734_TCV731.outlet) annotation (Line(
      points={{-260,-1.77636e-15},{-260,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV731_rackUsersOut.inlet, TCV731.outlet) annotation (Line(
      points={{-260,-60},{-260,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersIn.inlet, RR00_PL_VER901_FCVR01.inlet) annotation (Line(
      points={{130,-40},{160,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersIn.outlet, PL_UsersIn_EX721.inlet) annotation (Line(
      points={{110,-40},{90,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, PL_TT704_TCV701.inlet) annotation (Line(
      points={{-171.3,57.75},{-170,57.75},{-170,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet, TCV701.inlet) annotation (Line(
      points={{-170,10},{-170,-1.77636e-15}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, PL_TT714_TCV711.inlet) annotation (Line(
      points={{-81.3,58.75},{-80,58.75},{-80,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet, TCV711.inlet) annotation (Line(
      points={{-80,10},{-80,-1.77636e-15}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, PL_TT724_TCV721.inlet) annotation (Line(
      points={{8.7,58.75},{10,58.75},{10,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet, TCV721.inlet) annotation (Line(
      points={{10,10},{10,0},{11,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet, PL_TCV731_rackUsersOut.outlet) annotation (
      Line(
      points={{-230,-100},{-260,-100},{-260,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, EX731.inhot) annotation (Line(
      points={{-260,117},{-261.3,117},{-261.3,75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.inhot, EX731.inhot) annotation (Line(
      points={{-171.3,75.25},{-171.3,90},{-261.3,90},{-261.3,75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.inhot, EX731.inhot) annotation (Line(
      points={{-81.3,76.25},{-81.3,95},{-261.3,95},{-261.3,75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.inhot, EX731.inhot) annotation (Line(
      points={{8.7,76.25},{8.7,100},{-261.3,100},{-261.3,75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outhot, sinkHot.inlet) annotation (Line(
      points={{-220.7,75.25},{-220.7,74},{-220,74},{-220,121}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outhot, sinkHot.inlet) annotation (Line(
      points={{-130.7,75.25},{-130.7,103},{-220,103},{-220,121}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outhot, sinkHot.inlet) annotation (Line(
      points={{-40.7,76.25},{-40.7,107},{-220,107},{-220,121}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outhot, sinkHot.inlet) annotation (Line(
      points={{49.3,76.25},{49.3,111},{-220,111},{-220,121}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.inlet, RR00_PL_VER901_FCVR01.inlet) annotation (Line(
      points={{119,9},{118,9},{118,-28},{136,-28},{136,-40},{160,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet, PL_EX701_EX731_cold.inlet) annotation (
      Line(
      points={{-20,-40},{-190,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet, PL_rackUsersIn_TT733.inlet) annotation (
      Line(
      points={{-210,-40},{-220,-40},{-220,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet, PL_EX711_EX701_cold.inlet) annotation (
      Line(
      points={{-210,-40},{-220,-40},{-220,-26},{-164,-26},{-164,-31},{-158,-31}},
      color={140,56,54},
      thickness=0.5));

  connect(PL_EX711_EX701_cold.outlet, PL_rackUsersIn_TT703.inlet) annotation (
      Line(
      points={{-138,-31},{-130,-31},{-130,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.inlet, PL_EX701_EX731_cold.inlet) annotation (
      Line(
      points={{-40,-19},{-40,-40},{-190,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet, PL_EX721_EX711_hot.inlet) annotation (Line(
      points={{-210,-100},{-202,-100},{-202,-100},{-50,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV711_rackUsersOut.outlet, PL_EX721_EX711_hot.inlet) annotation (
      Line(
      points={{-80,-80},{-80,-100},{-50,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV701_rackUsersOut.outlet, PL_EX711_EX701_hot.inlet) annotation (
      Line(
      points={{-170,-80},{-170,-86},{-190,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet, PL_TCV731_rackUsersOut.outlet) annotation (
     Line(
      points={{-210,-86},{-260,-86},{-260,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.outlet, PL_RR_UsersOut.inlet) annotation (Line(
      points={{61,-100},{90,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersOut.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{110,-100},{260,-100},{260,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.q_m3hr, FTR01_.numberPort) annotation (Line(points={{268.5,85},
          {271.712,85},{271.712,85.5},{274.925,85.5}}, color={0,0,127}));
  connect(FTR03.q_m3hr, FTR01_1.numberPort) annotation (Line(points={{250,-31.5},
          {250,-46},{258,-46},{258,-39.5},{266.925,-39.5}}, color={0,0,127}));
  connect(TT704.T, FTR01_3.numberPort)
    annotation (Line(points={{-179.8,41},{-181.825,41}}, color={0,0,127}));
  connect(FTR01_4.numberPort, TT714.T) annotation (Line(points={{-93.825,43},{
          -92,43},{-92,42},{-89.8,42}}, color={0,0,127}));
  connect(FTR01_5.numberPort, TT724.T)
    annotation (Line(points={{-3.825,38},{0.2,38}}, color={0,0,127}));
  connect(TT734.T, FTR01_2.numberPort) annotation (Line(points={{-269.65,40.5},
          {-269.65,41},{-276.825,41}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-300,-220},{300,220}}, grid={1,1})),
      experiment(
      StopTime=500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-300,-220},{300,220}}, grid={1,1})));
end CoolingSystem;
