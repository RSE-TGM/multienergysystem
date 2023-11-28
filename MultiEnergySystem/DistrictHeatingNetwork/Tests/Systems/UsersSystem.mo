within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model UsersSystem
  "Users Systems and some pipelines connected on the heating side"

  parameter Integer n = 3 "Number of volumes";
  parameter Real m_flow_factor = 0.5;

  parameter Integer gammahotovercold_factor = 1;
  parameter Integer n_E301 = 5;
  parameter SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  parameter SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
  parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
  parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
  parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;

  // Pressures
  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Pressure pin_start_Source = 2e5;
  parameter Types.Pressure pout_start_Source = 1.8e5;

  parameter Types.Temperature T_start_SourceIn = 80 + 273.15;
  parameter Types.Temperature T_start_SourceOut = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;

  parameter Types.Temperature T_start_UserIn = 7 + 273.15;
  parameter Types.Temperature T_start_UserOut = 15.6 + 273.15;
  parameter Types.MassFlowRate m_flow_Users_total = 5.553528*3600/1000;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;

  parameter Real q_m3h(unit = "m3/h") = 8*3600/1000;

  parameter Types.Power Pchiller = -148751;
  parameter Types.Power Pchillervar = 0;

  parameter Types.Length L_Users = 4;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV731theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];
  parameter Real FCVR01theta[:,:] = [0, 0; 100, 0];

  // Lengths of pipelines source side
  parameter Types.Length L_HX701_SourceOut_FCV701 = 0.8;
  parameter Types.Length L_HX711_SourceOut_FCV711 = 0.8;
  parameter Types.Length L_HX721_SourceOut_FCV721 = 0.8;
  parameter Types.Length L_HX731_SourceOut_FCV731 = 0.8;
  parameter Types.Length L_FCV701_FT701 = 1.60;
  parameter Types.Length h_FCV701_FT701 = 1.60;
  parameter Types.Length L_FCV711_FT711 = 1.60;
  parameter Types.Length h_FCV711_FT711 = 1.60;
  parameter Types.Length L_FCV721_FT721 = 1.60;
  parameter Types.Length h_FCV721_FT721 = 1.60;
  parameter Types.Length L_FCV731_FT731 = 1.60;
  parameter Types.Length h_FCV731_FT731 = 1.60;

  // Internal diameters & thickness
  parameter Types.Length t_Source = 1.5e-3;
  parameter Types.Length Di_Source = 32e-3;



  parameter Types.Length t_RR = 1.5e-3;
  parameter Types.Length Di_RR = 85e-3;
  parameter Types.MassFlowRate m_flow_Cool = 8.88;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Downstream "Location of pressure state";
  parameter Real PR01omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];

  // Lengths of pipelines source side
  parameter Types.Length L_VER901_FCVR01 = 1;
  parameter Types.Length h_VER901_FCVR01 = -0.9;
  parameter Types.Length L_FCVR01_FTR03 = 2.6;
  parameter Types.Length h_FCVR01_FTR03 = 2.170;
  parameter Types.Length L_FTR03_PTR01 = 1;
  parameter Types.Length h_FTR03_PTR01 = 0.265;
  parameter Types.Length L_PTR01_FTR01 = 1.85+0.50;
  parameter Types.Length h_PTR01_FTR01 = -1.8;
  parameter Types.Length L_FTR01_RR01 = 0.72;
  parameter Types.Length h_FTR01_RR01 = -0.72;
  parameter Types.Length L_RR01_PR01 = 1.275;
  parameter Types.Length h_RR01_PR01 = 0.000;
  parameter Types.Length L_PR01_PTR02 = 0.425+1.242+0.850;
  parameter Types.Length h_PR01_PTR02 = 1.242;
  parameter Types.Length L_TTR02_VER901 = 1.062;
  parameter Types.Length h_TTR02_VER901 = 0;

  parameter Types.Pressure pin_start_Cool = 0.92e5;
  parameter Types.Pressure pout_start_Cool = 0.92e5;
  parameter Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter Types.Pressure pout_start_PR01 = 2e5;

  parameter Types.Temperature Tin_start_Cool = 35 + 273.15;
  parameter Types.Temperature Tout_start_Cool = 25 + 273.15;
  parameter Types.MassFlowRate m_flow_total = 1.6;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={250,210},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
        origin={-210,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-231,-43.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-141,-42.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-51,-42.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={39,-43.5})));
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
        origin={-120,20})));
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
        origin={-30,20})));
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
        origin={60,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-250,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-210,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-160,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FCV711_FT711(
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-120,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-70,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FCV721_FT721(
    L=L_FCV721_FT721,
    h=h_FCV721_FT721,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FCV731_FT731(
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-250,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-160,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,-169})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-169})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-210,-200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-120,-200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_UserOut,
    Tout_start=T_start_UserOut,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-29,-200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-210,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-120,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-30,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={60,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-190,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-90,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_UserIn,
    Tout_start=T_start_UserIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={0,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV701(
      Kv=Valve.TCV701.Kv,
      dp_nom=Valve.TCV701.dp_nom,
      rho_nom=Valve.TCV701.rho_nom,
      Tin_start=Valve.TCV701.Tin_start,
      pin_start=Valve.TCV701.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-250,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV711(
      Kv=Valve.TCV711.Kv,
      dp_nom=Valve.TCV711.dp_nom,
      rho_nom=Valve.TCV711.rho_nom,
      Tin_start=Valve.TCV711.Tin_start,
      pin_start=Valve.TCV711.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-160,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV721(
      Kv=Valve.TCV721.Kv,
      dp_nom=Valve.TCV721.dp_nom,
      rho_nom=Valve.TCV721.rho_nom,
      Tin_start=Valve.TCV721.Tin_start,
      pin_start=Valve.TCV721.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-70,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV731(
      Kv=Valve.TCV731.Kv,
      dp_nom=Valve.TCV731.dp_nom,
      rho_nom=Valve.TCV731.rho_nom,
      Tin_start=Valve.TCV731.Tin_start,
      pin_start=Valve.TCV731.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,-110})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{-175,10},{-195,30}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{-85,10},{-105,30}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{5,10},{-15,30}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{96,10},{76,30}})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{-284,-120},{-264,-100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-252,-74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-212,-75})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{-195,-120},{-175,-100}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{-105,-120},{-85,-100}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{-16,-120},{4,-100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-123,-73})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-33,-71})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={57,-71})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-162,-73})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-72,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={18,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
    L=L_HX701_SourceOut_FCV701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-210,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_SourceOut_FCV711(
    L=L_HX711_SourceOut_FCV711,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-120,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_SourceOut_FCV721(
    L=L_HX721_SourceOut_FCV721,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_SourceOut_FCV731(
    L=L_HX731_SourceOut_FCV731,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX701 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-212,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX711 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-122,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX721 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-32,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX731 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT701(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-212,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT711(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-122,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT721(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-32,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT731(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT701 "Pressure sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-212,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT711 "Pressure sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-122,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT721 "Pressure sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-32,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT731 "Pressure sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4_I(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-120,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4_II(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-120,140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4_III(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-120,170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3_I(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-210,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3_II(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-210,140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3_III(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-210,170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5_I(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5_II(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5_III(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7_I(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7_II(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7_III(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_Source,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Source + 0.01e5,
    pout_start=pout_start_Source,
    Tin_start=T_start_SourceOut,
    Tout_start=T_start_SourceOut,
    Di=Di_Source) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-250,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_TT712_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-160,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_TT722_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-70,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_TT732_SourceIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT702(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-252,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-252,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT712(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-162,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-162,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT722(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-72,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-72,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT732(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={18,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={18,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_rackL2L3_hot_II(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-250,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_rackL2L3_hot_I(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-250,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_TT712_rackL3L4_hot_II(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-160,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_TT712_rackL3L4_hot_I(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-160,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_TT722_rackL4L5_hot_II(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-70,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_TT722_rackL4L5_hot_I(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-70,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_TT732_rackL6L7_hot_II(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_TT732_rackL6L7_hot_I(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_SourceIn,
    Tout_start=T_start_SourceIn,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,100})));
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
        origin={156,-35})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVR01(
    Kv=15,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={206,-140})));
  Sources.SinkPressure VER901(p0=200000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={126,-100})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{247,-100},{227,-80}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_VER901_FCVR01(
    L=L_VER901_FCVR01,
    h=h_VER901_FCVR01,
    t=t_RR,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={176,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_FCVR01_FTR03(
    L=L_FCVR01_FTR03,
    h=h_FCVR01_FTR03,
    t=t_RR,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={236,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={256,-138})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_PTR01_FTR01(
    L=L_PTR01_FTR01,
    h=h_PTR01_FTR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={266,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={268,-85})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={268,-75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={268,-25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_FTR01_RR01(
    L=L_FTR01_RR01,
    h=h_FTR01_RR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={266,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_RR01_PR01(
    L=L_RR01_PR01,
    h=h_RR01_PR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={156,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={153,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={153,-90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_PR01_PTR02(
    L=L_PR01_PTR02,
    h=h_PR01_PTR02,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={156,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={156,-120})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_FTR03_PTR01(
    L=L_FTR03_PTR01,
    h=h_FTR03_PTR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={266,-120})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{116,-40},{136,-20}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    Tout_cold_set=Tout_start_Cool,
    dp_cold_start=20000,
    m_flow_cold_start=m_flow_Cool)
    annotation (Placement(transformation(extent={{176,24},{247,95}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut_PL1(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={126,-200})));
  Sources.SourceMassFlow sourceHot(
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_total) annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={-249,210})));
  Sources.SinkPressure sinkHot(p0=200000, T0=(60 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-209,211})));
equation
  connect(PL711_SourceIn.outlet, EX711.inhot) annotation (Line(
      points={{-160,-20},{-161.3,-20},{-161.3,-33.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceIn.outlet, EX721.inhot) annotation (Line(
      points={{-70,-20},{-71.3,-20},{-71.3,-33.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceIn.outlet, EX731.inhot) annotation (Line(
      points={{20,-20},{18.7,-20},{18.7,-34.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FCV701_FT701.inlet, FCV701.outlet) annotation (Line(
      points={{-210,40},{-210,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet, FCV711.outlet) annotation (Line(
      points={{-120,40},{-120,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet, FCV721.outlet) annotation (Line(
      points={{-30,40},{-30,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet, FCV731.outlet) annotation (Line(
      points={{60,40},{60,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut.outlet, PL701_ColdSide_HotOut_PL711.inlet)
    annotation (Line(
      points={{-250,-180},{-250,-200},{-220,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut_PL711.outlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-200,-200},{-160,-200},{-160,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_HotOut_PL721.inlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-130,-200},{-160,-200},{-160,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut.outlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{-70,-179},{-70,-200},{-110,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.inlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{-39,-200},{-110,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-19,-200},{20,-200},{20,-179}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, PL701_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-210.7,-52.25},{-210.7,-77},{-210,-77},{-210,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, PL711_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-120.7,-51.25},{-120.7,-87.125},{-120,-87.125},{-120,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, PL721_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-30.7,-51.25},{-30.7,-88.125},{-30,-88.125},{-30,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, PL731_ColdSide_ColdIn.outlet) annotation (Line(
      points={{59.3,-52.25},{59.3,-88.625},{60,-88.625},{60,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_ColdIn_PL711.outlet, PL701_ColdSide_ColdIn.inlet)
    annotation (Line(
      points={{-200,-140},{-210,-140},{-210,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn.inlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-120,-119},{-120,-140},{-180,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn_PL721.outlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-100,-140},{-180,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn.inlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{-30,-120},{-30,-140},{-80,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL731.outlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{-10,-140},{-80,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_ColdSide_ColdIn.inlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{60,-120},{60,-140},{10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, TCV701.inlet) annotation (Line(
      points={{-251.3,-52.25},{-250,-52.25},{-250,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL701_ColdSide_HotOut.inlet) annotation (Line(
      points={{-250,-120},{-250,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TCV711.inlet) annotation (Line(
      points={{-161.3,-51.25},{-160,-51.25},{-160,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL711_ColdSide_HotOut.inlet) annotation (Line(
      points={{-160,-120},{-160,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TCV721.inlet) annotation (Line(
      points={{-71.3,-51.25},{-70,-51.25},{-70,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL721_ColdSide_HotOut.inlet) annotation (Line(
      points={{-70,-120},{-70,-159}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TCV731.inlet) annotation (Line(
      points={{18.7,-52.25},{18.7,-52},{20,-52},{20,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, PL731_ColdSide_HotOut.inlet) annotation (Line(
      points={{20,-120},{20,-159}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{-106,20},{-108,20},{-108,19},{-109,19},{-109,20},{
          -112,20}},                            color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{75,20},{68,20}},   color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{-16,20},{-22,20}},
                                               color={0,0,127}));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-263,-110},{-258,-110}},
                                                     color={0,0,127}));
  connect(EX701.incold, TT703.inlet) annotation (Line(
      points={{-210.7,-52.25},{-210.7,-73},{-209.6,-73},{-209.6,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening, TCV711_theta.y)
    annotation (Line(points={{-168,-110},{-174,-110}},
                                                   color={0,0,127}));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{-251.3,-52.25},{-249.6,-52.25},{-249.6,-74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceIn.outlet, EX701.inhot) annotation (Line(
      points={{-250,-20},{-251.3,-20},{-251.3,-34.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.opening, TCV721_theta.y)
    annotation (Line(points={{-78,-110},{-84,-110}},
                                                 color={0,0,127}));
  connect(TCV731.opening, TCV731_theta.y)
    annotation (Line(points={{12,-110},{5,-110}},  color={0,0,127}));
  connect(EX711.incold, TT713.inlet) annotation (Line(
      points={{-120.7,-51.25},{-120.7,-62.125},{-120.6,-62.125},{-120.6,-73}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, TT723.inlet) annotation (Line(
      points={{-30.7,-51.25},{-30.7,-61.125},{-30.6,-61.125},{-30.6,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, TT733.inlet) annotation (Line(
      points={{59.3,-52.25},{59.3,-61.625},{59.4,-61.625},{59.4,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{-161.3,-51.25},{-160,-51.25},{-159.6,-73}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{-71.3,-51.25},{-70,-51.25},{-69.6,-72}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{18.7,-52.25},{18.7,-52},{20,-52},{20.4,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{-210,10},{-210,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet, EX701.outhot) annotation (Line(
      points={{-210,-20},{-210,-34.75},{-210.7,-34.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{-196,20},{-202,20}}, color={0,0,127}));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{-120,10},{-120,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet, EX711.outhot) annotation (Line(
      points={{-120,-20},{-120,-23.375},{-120.7,-23.375},{-120.7,-33.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721. outlet) annotation (Line(
      points={{-30,10},{-30,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet, EX721.outhot) annotation (Line(
      points={{-30,-20},{-30,-23.875},{-30.7,-23.875},{-30.7,-33.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{60,10},{60,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet, EX731.outhot) annotation (Line(
      points={{60,-20},{60,-23.875},{59.3,-23.875},{59.3,-34.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet, PL701_FCV701_FT701.outlet) annotation (Line(
      points={{-210,67},{-210,60}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet, PL711_FCV711_FT711.outlet) annotation (Line(
      points={{-120,67},{-120,60}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet, PL721_FCV721_FT721.outlet) annotation (Line(
      points={{-30,67},{-30,60}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet, PL731_FCV731_FT731.outlet) annotation (Line(
      points={{60,67},{60,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_III.inlet, PL731_FT731_rackL6L7_II.outlet)
    annotation (Line(
      points={{60,160},{60,150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_II.inlet, PL731_FT731_rackL6L7_I.outlet)
    annotation (Line(
      points={{60,130},{60,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_I.inlet, PT731.inlet) annotation (Line(
      points={{60,100},{60,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet, TT731.inlet) annotation (Line(
      points={{60,90},{60,80}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet, FT731.outlet) annotation (Line(
      points={{60,80},{60,73}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_III.inlet, PL721_FT721_rackL4L5_II.outlet)
    annotation (Line(
      points={{-30,160},{-30,150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_II.inlet, PL721_FT721_rackL4L5_I.outlet)
    annotation (Line(
      points={{-30,130},{-30,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_I.inlet, PT721.inlet) annotation (Line(
      points={{-30,100},{-30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet, TT721.inlet) annotation (Line(
      points={{-30,90},{-30,80}},
      color={140,56,54},
      thickness=0.5));
  connect(TT721.inlet, FT721.outlet) annotation (Line(
      points={{-30,80},{-30,73}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_III.inlet, PL711_FT711_rackL3L4_II.outlet)
    annotation (Line(
      points={{-120,160},{-120,150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_II.inlet, PL711_FT711_rackL3L4_I.outlet)
    annotation (Line(
      points={{-120,130},{-120,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_I.inlet, PT711.inlet) annotation (Line(
      points={{-120,100},{-120,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet, TT711.inlet) annotation (Line(
      points={{-120,90},{-120,80}},
      color={140,56,54},
      thickness=0.5));
  connect(TT711.inlet, FT711.outlet) annotation (Line(
      points={{-120,80},{-120,73}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3_III.inlet, PL701_FT701_rackL2L3_II.outlet)
    annotation (Line(
      points={{-210,160},{-210,150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3_II.inlet, PL701_FT701_rackL2L3_I.outlet)
    annotation (Line(
      points={{-210,130},{-210,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3_I.inlet, PT701.inlet) annotation (Line(
      points={{-210,100},{-210,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, TT701.inlet) annotation (Line(
      points={{-210,90},{-210,80}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet, FT701.outlet) annotation (Line(
      points={{-210,80},{-210,73}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet, PL731_SourceIn.inlet) annotation (Line(
      points={{20,10},{20,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet, PL721_SourceIn.inlet) annotation (Line(
      points={{-70,10},{-70,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet, PL701_SourceIn.inlet) annotation (Line(
      points={{-250,10},{-250,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet, PL711_SourceIn.inlet) annotation (Line(
      points={{-160,10},{-160,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_rackL6L7_hot_II.inlet, PL731_TT732_rackL6L7_hot_I.outlet)
    annotation (Line(
      points={{20,80},{20,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_rackL4L5_hot_II.inlet, PL721_TT722_rackL4L5_hot_I.outlet)
    annotation (Line(
      points={{-70,80},{-70,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_rackL3L4_hot_II.inlet, PL711_TT712_rackL3L4_hot_I.outlet)
    annotation (Line(
      points={{-160,80},{-160,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_rackL2L3_hot_II.inlet, PL701_TT702_rackL2L3_hot_I.outlet)
    annotation (Line(
      points={{-250,80},{-250,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet, TT702.inlet) annotation (Line(
      points={{-250,30},{-250,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet, PT702.inlet) annotation (Line(
      points={{-250,40},{-250,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PT702.inlet, PL701_TT702_rackL2L3_hot_II.outlet) annotation (Line(
      points={{-250,50},{-250,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet, TT712.inlet) annotation (Line(
      points={{-160,30},{-160,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet, PT712.inlet) annotation (Line(
      points={{-160,40},{-160,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet, PL711_TT712_rackL3L4_hot_II.outlet) annotation (Line(
      points={{-160,50},{-160,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet, TT722.inlet) annotation (Line(
      points={{-70,30},{-70,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet, PT722.inlet) annotation (Line(
      points={{-70,40},{-70,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet, PL721_TT722_rackL4L5_hot_II.outlet) annotation (Line(
      points={{-70,50},{-70,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet, TT732.inlet) annotation (Line(
      points={{20,30},{20,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet, PT732.inlet) annotation (Line(
      points={{20,40},{20,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet, PL731_TT732_rackL6L7_hot_II.outlet) annotation (Line(
      points={{20,50},{20,60}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_VER901_FCVR01.outlet,FCVR01. inlet) annotation (Line(
      points={{186,-140},{196,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{156,-10},{156,-24.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,SR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{156,-45.4},{156,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{156,-80},{156,-85},{155.4,-85},{155.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{155.4,-90},{155.4,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet,SR00_PL_TTR02_VER901. inlet) annotation (Line(
      points={{155.4,-100},{155.4,-105},{156,-105},{156,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_TTR02_VER901.outlet,SR00_PL_VER901_FCVR01. inlet) annotation (
     Line(
      points={{156,-130},{156,-140},{166,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,SR00_PL_FCVR01_FTR03. inlet) annotation (Line(
      points={{216,-140},{226,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_FCVR01_FTR03.outlet,FTR03. inlet) annotation (Line(
      points={{246,-140},{253,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet,SR00_PL_FTR03_PTR01. inlet) annotation (Line(
      points={{259,-140},{266,-140},{266,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{265.6,-85},{265.6,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,SR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{265.6,-75},{265.6,-67.5},{266,-67.5},{266,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{266,-40},{266,-28}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,SR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{266,-22},{266,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y,FCVR01. opening)
    annotation (Line(points={{226,-90},{206,-90},{206,-132}},
                                                           color={0,0,127}));
  connect(PR01_omega.y,PR01. in_omega) annotation (Line(points={{137,-30},{143.25,
          -30},{143.25,-29.8},{149.5,-29.8}},
                                           color={0,0,127}));
  connect(TTR01.inlet,SR00_PL_FTR03_PTR01. outlet) annotation (Line(
      points={{265.6,-85},{266,-85},{266,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{266,10},{266,21},{233,21},{233,38.2},{232.8,38.2}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold,SR00_PL_RR01_PR01. inlet) annotation (Line(
      points={{190.2,38.2},{190.2,20},{156,20},{156,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL1.inlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{116,-200},{20,-200},{20,-179}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_TTR02_VER901.outlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{156,-130},{156,-140},{10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.inlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{126,-110},{126,-140},{10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL1.outlet, SR00_PL_FTR03_PTR01.inlet)
    annotation (Line(
      points={{136,-200},{266,-200},{266,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, PL701_FT701_rackL2L3_III.outlet) annotation (Line(
      points={{-209,201},{-210,201},{-210,180}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, PL701_TT702_rackL2L3_hot_I.inlet) annotation (Line(
      points={{-249,197},{-250,197},{-250,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_rackL6L7_hot_I.inlet, PL701_TT702_rackL2L3_hot_I.inlet)
    annotation (Line(
      points={{20,110},{20,190},{-250,190},{-250,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_rackL3L4_hot_I.inlet, PL701_TT702_rackL2L3_hot_I.inlet)
    annotation (Line(
      points={{-160,110},{-160,190},{-250,190},{-250,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_rackL4L5_hot_I.inlet, PL701_TT702_rackL2L3_hot_I.inlet)
    annotation (Line(
      points={{-70,110},{-70,190},{-250,190},{-250,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_III.outlet, PL701_FT701_rackL2L3_III.outlet)
    annotation (Line(
      points={{60,180},{60,196},{-210,196},{-210,180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_III.outlet, PL701_FT701_rackL2L3_III.outlet)
    annotation (Line(
      points={{-30,180},{-30,196},{-210,196},{-210,180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_III.outlet, PL701_FT701_rackL2L3_III.outlet)
    annotation (Line(
      points={{-120,180},{-120,196},{-210,196},{-210,180}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-300,-220},{300,220}})),
      experiment(
      StopTime=1200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-300,-220},{300,220}})));
end UsersSystem;
