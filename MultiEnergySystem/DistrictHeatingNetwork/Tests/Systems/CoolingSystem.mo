within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model CoolingSystem
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

  parameter Types.Pressure pin_start_S1 = 1.85e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter Types.Length L_S1 = 8;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;
  parameter Types.Length L_S9 = 8;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;

  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;

  parameter Types.Temperature T_start_hot_Source = 80 + 273.15;
  parameter Types.Temperature T_start_cold_Source = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;

  parameter Types.Temperature T_start_cold_Users = 7 + 273.15;
  parameter Types.Temperature T_start_hot_Users = 15.6 + 273.15;
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

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={264,169},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=true,
    Kv=Valve.FCV701.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-115,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-136,16.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-46,17.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={44,17.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={134,16.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=true,
    Kv=Valve.FCV711.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-25,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=true,
    Kv=Valve.FCV721.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV721.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={65,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=true,
    Kv=Valve.FCV731.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV731.dp_nom,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={155,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-155,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-115,134})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-65,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-25,134})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={25,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={65,134})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={115,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={155,134})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-155,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-65,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={25,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={115,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-115,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-25,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={66,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-115,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-25,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={65,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={155,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-95,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={5,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={95,-80})));
  Modelica.Blocks.Sources.RealExpression PR01_m_flow(y=q_m3h)
    annotation (Placement(transformation(extent={{222,24},{202,44}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    PR01(
    Tin_start(displayUnit="K") = 15 + 273.15,
    Tout_start(displayUnit="K") = 16 + 273.15,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    m_flow_start=8.977481,
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
    use_q_m3hr=true) annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={205,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV701(
      Kv=Valve.TCV701.Kv,
      dp_nom=Valve.TCV701.dp_nom,
      rho_nom=Valve.TCV701.rho_nom,
      Tin_start=Valve.TCV701.Tin_start,
      pin_start=Valve.TCV701.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-155,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV711(
      Kv=Valve.TCV711.Kv,
      dp_nom=Valve.TCV711.dp_nom,
      rho_nom=Valve.TCV711.rho_nom,
      Tin_start=Valve.TCV711.Tin_start,
      pin_start=Valve.TCV711.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-65,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV721(
      Kv=Valve.TCV721.Kv,
      dp_nom=Valve.TCV721.dp_nom,
      rho_nom=Valve.TCV721.rho_nom,
      Tin_start=Valve.TCV721.Tin_start,
      pin_start=Valve.TCV721.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={25,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV731(
      Kv=Valve.TCV731.Kv,
      dp_nom=Valve.TCV731.dp_nom,
      rho_nom=Valve.TCV731.rho_nom,
      Tin_start=Valve.TCV731.Tin_start,
      pin_start=Valve.TCV731.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={115,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer
    powerTransfer
    annotation (Placement(transformation(extent={{235,-25},{215,-5}})));
  Modelica.Blocks.Sources.RealExpression CoolingPower(y=Pchiller)
    annotation (Placement(transformation(extent={{192,10},{208,26}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCVR01(
    Kv=9.5339,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = 7 + 273.15,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={225,-80})));
  Sources.SourcePressure VER901(p0=250000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={180,-51})));
  Modelica.Blocks.Sources.Ramp CoolingP(
    height=Pchillervar,
    duration=100,
    offset=Pchiller,
    startTime=200)
    annotation (Placement(transformation(extent={{265,15},{245,35}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{11,80},{-9,100}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{100,80},{80,100}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{191,80},{171,100}})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{-189,-60},{-169,-40}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=T_start_hot_Users, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-157,-14})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=T_start_cold_Users, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-117,-15})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{79,-60},{99,-40}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{195,-120},{215,-100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=T_start_cold_Users, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-28,-13})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=T_start_cold_Users, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={62,-11})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=T_start_cold_Users, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={152,-11})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=T_start_hot_Users, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-67,-13})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=T_start_hot_Users, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={23,-12})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=T_start_hot_Users, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={113,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_ColdOut1(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-115,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_ColdOut2(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-25,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_ColdOut3(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={65,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_ColdOut4(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={155,50})));
equation
  connect(PL711_HotSide_HotIn.outlet, EX711.inhot) annotation (Line(
      points={{-65,84},{-65,26.25},{-66.3,26.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn.outlet, EX721.inhot) annotation (Line(
      points={{25,84},{25,26.25},{23.7,26.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_HotIn.outlet, EX731.inhot) annotation (Line(
      points={{115,84},{115,25.25},{113.7,25.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut.inlet, FCV701.outlet) annotation (Line(
      points={{-115,124},{-115,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut.inlet, FCV711.outlet) annotation (Line(
      points={{-25,124},{-25,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut.inlet, FCV721.outlet) annotation (Line(
      points={{65,124},{65,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut.inlet, FCV731.outlet) annotation (Line(
      points={{155,124},{155,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut.outlet, PL701_ColdSide_HotOut_PL711.inlet)
    annotation (Line(
      points={{-155,-120},{-155,-140},{-125,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut_PL711.outlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-105,-140},{-65,-140},{-65,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_HotOut_PL721.inlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-35,-140},{-65,-140},{-65,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut.outlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{25,-119},{25,-140},{-15,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.inlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{56,-140},{-15,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{76,-140},{115,-140},{115,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, PL701_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-115.7,7.75},{-115.7,-17},{-115,-17},{-115,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, PL711_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-25.7,8.75},{-25.7,-27.125},{-25,-27.125},{-25,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, PL721_ColdSide_ColdIn.outlet) annotation (Line(
      points={{64.3,8.75},{64.3,-28.125},{65,-28.125},{65,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, PL731_ColdSide_ColdIn.outlet) annotation (Line(
      points={{154.3,7.75},{154.3,-28.625},{155,-28.625},{155,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_ColdIn_PL711.outlet, PL701_ColdSide_ColdIn.inlet)
    annotation (Line(
      points={{-105,-80},{-115,-80},{-115,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn.inlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-25,-59},{-25,-80},{-85,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn_PL721.outlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-5,-80},{-85,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn.inlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{65,-60},{65,-80},{15,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL731.outlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{85,-80},{15,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_ColdSide_ColdIn.inlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{155,-60},{155,-80},{105,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{205,-60.4},{205,-80},{105,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, TCV701.inlet) annotation (Line(
      points={{-156.3,7.75},{-155,7.75},{-155,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL701_ColdSide_HotOut.inlet) annotation (Line(
      points={{-155,-60},{-155,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TCV711.inlet) annotation (Line(
      points={{-66.3,8.75},{-65,8.75},{-65,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL711_ColdSide_HotOut.inlet) annotation (Line(
      points={{-65,-60},{-65,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TCV721.inlet) annotation (Line(
      points={{23.7,8.75},{25,8.75},{25,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL721_ColdSide_HotOut.inlet) annotation (Line(
      points={{25,-60},{25,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TCV731.inlet) annotation (Line(
      points={{113.7,7.75},{113.7,8},{115,8},{115,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, PL731_ColdSide_HotOut.inlet) annotation (Line(
      points={{115,-60},{115,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(powerTransfer.outlet, PR01.inlet) annotation (Line(
      points={{215,-15},{205,-15},{205,-39.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.inlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{215,-80},{105,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet, powerTransfer.inlet) annotation (Line(
      points={{235,-80},{245,-80},{245,-15},{235,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.outlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{180,-61},{180,-80},{105,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01_m_flow.y, PR01.in_q_m3hr) annotation (Line(points={{201,34},{181,
          34},{181,-33},{194,-33},{194,-44.8},{199.02,-44.8}},
                                                           color={0,0,127}));
  connect(CoolingP.y, powerTransfer.Ptransfer)
    annotation (Line(points={{244,25},{225,25},{225,-7}},color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{-10,90},{-17,90}},color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{170,90},{163,90}}, color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{79,90},{73,90}}, color={0,0,127}));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-168,-50},{-163,-50}}, color={0,0,127}));
  connect(EX701.incold, TT703.inlet) annotation (Line(
      points={{-115.7,7.75},{-115.7,-13},{-114.6,-13},{-114.6,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening, TCV711_theta.y)
    annotation (Line(points={{-73,-50},{-79,-50}}, color={0,0,127}));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{-156.3,7.75},{-154.6,7.75},{-154.6,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn.outlet, EX701.inhot) annotation (Line(
      points={{-155,84},{-155,25.25},{-156.3,25.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.opening, TCV721_theta.y)
    annotation (Line(points={{17,-50},{11,-50}}, color={0,0,127}));
  connect(PL721_ColdSide_HotOut_PL731.outlet, powerTransfer.inlet) annotation (
      Line(
      points={{76,-140},{245,-140},{245,-15},{235,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.opening, TCV731_theta.y)
    annotation (Line(points={{107,-50},{100,-50}}, color={0,0,127}));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{216,-110},{
          225,-110},{225,-88}},
                            color={0,0,127}));
  connect(EX711.incold, TT713.inlet) annotation (Line(
      points={{-25.7,8.75},{-25.7,-2.125},{-25.6,-2.125},{-25.6,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, TT723.inlet) annotation (Line(
      points={{64.3,8.75},{64.3,-1.125},{64.4,-1.125},{64.4,-11}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, TT733.inlet) annotation (Line(
      points={{154.3,7.75},{154.3,-1.625},{154.4,-1.625},{154.4,-11}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{-66.3,8.75},{-65,8.75},{-64.6,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{23.7,8.75},{25,8.75},{25.4,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{113.7,7.75},{113.7,8},{115,8},{115.4,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet, PL701_HotSide_ColdOut1.outlet) annotation (Line(
      points={{-115,80},{-115,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut1.inlet, EX701.outhot) annotation (Line(
      points={{-115,40},{-115,25.25},{-115.7,25.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{-101,90},{-107,90}}, color={0,0,127}));
  connect(FCV711.inlet, PL701_HotSide_ColdOut2.outlet) annotation (Line(
      points={{-25,80},{-25,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut2.inlet, EX711.outhot) annotation (Line(
      points={{-25,40},{-25,36.625},{-25.7,36.625},{-25.7,26.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet, PL701_HotSide_ColdOut3.outlet) annotation (Line(
      points={{65,80},{65,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut3.inlet, EX721.outhot) annotation (Line(
      points={{65,40},{65,36.125},{64.3,36.125},{64.3,26.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet, PL701_HotSide_ColdOut4.outlet) annotation (Line(
      points={{155,80},{155,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut4.inlet, EX731.outhot) annotation (Line(
      points={{155,40},{155,36.125},{154.3,36.125},{154.3,25.25}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-260,-180},{260,180}}, grid={1,1})),
      experiment(
      StopTime=1200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-260,-180},{260,180}}, grid={1,1})));
end CoolingSystem;
