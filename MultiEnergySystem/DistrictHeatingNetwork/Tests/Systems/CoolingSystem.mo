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

  parameter Real q_m3h(unit = "m3/h") = 7*3600/1000;

  parameter Types.Power Pchiller = -148751;
  parameter Types.Power Pchillervar = 0;

  parameter Types.Length L_Users = 4;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;



  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-100,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-121,-8.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-41,-7.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={39,-7.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={119,-8.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-20,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={60,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={140,30})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers(y=1)
    annotation (Placement(transformation(extent={{229,40},{209,60}})));
  Sources.SourceMassFlow sourceHot(
    use_in_m_flow=true,
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_Users_total) annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={-214,90})));
  Sources.SinkPressure sinkHot(p0=200000, T0=(60 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-210,130})));
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
        origin={-140,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_HotIn_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-120,90})));
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
        origin={-100,110})));
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
        origin={-60,70})));
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
        origin={-20,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_HotIn_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-40,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL700_HotSide_ColdOut(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_Source_total,
    pin_start=pout_start_Users - 0.03e5,
    pout_start=pout_start_Users - 0.04e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-160,130})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_ColdOut_PL701(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*3,
    pin_start=pout_start_Users - 0.02e5,
    pout_start=pout_start_Users - 0.03e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-80,130})));
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
        origin={20,70})));
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
        origin={60,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_ColdOut_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,130})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_HotIn_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={40,90})));
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
        origin={100,70})));
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
        origin={140,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_HotSide_ColdOut_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users,
    pout_start=pout_start_Users - 0.01e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={80,130})));
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
        origin={-140,-110})));
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
        origin={-60,-110})));
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
        origin={20,-110})));
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
        origin={100,-110})));
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
        origin={-100,-140})));
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
        origin={-20,-140})));
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
        origin={60,-140})));
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
        origin={-100,-50})));
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
        origin={-20,-50})));
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
        origin={60,-50})));
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
        origin={140,-50})));
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
        origin={-80,-80})));
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
        origin={0,-80})));
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
        origin={80,-80})));
  Modelica.Blocks.Sources.RealExpression PR01_m_flow(y=q_m3h)
    annotation (Placement(transformation(extent={{207,-1},{187,19}})));
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
        origin={190,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV701(
      Kv=Valve.TCV701.Kv,
      dp_nom=Valve.TCV701.dp_nom,
      rho_nom=Valve.TCV701.rho_nom,
      Tin_start=Valve.TCV701.Tin_start,
      pin_start=Valve.TCV701.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-140,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV711(
      Kv=Valve.TCV711.Kv,
      dp_nom=Valve.TCV711.dp_nom,
      rho_nom=Valve.TCV711.rho_nom,
      Tin_start=Valve.TCV711.Tin_start,
      pin_start=Valve.TCV711.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-60,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV721(
      Kv=Valve.TCV721.Kv,
      dp_nom=Valve.TCV721.dp_nom,
      rho_nom=Valve.TCV721.rho_nom,
      Tin_start=Valve.TCV721.Tin_start,
      pin_start=Valve.TCV721.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV731(
      Kv=Valve.TCV731.Kv,
      dp_nom=Valve.TCV731.dp_nom,
      rho_nom=Valve.TCV731.rho_nom,
      Tin_start=Valve.TCV731.Tin_start,
      pin_start=Valve.TCV731.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={100,-50})));
  Modelica.Blocks.Sources.RealExpression TCV_thetaconsumers1(y=1)
    annotation (Placement(transformation(extent={{-190,-60},{-170,-40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=m_flow_Users_total*m_flow_factor*0,
    duration=100,
    offset=m_flow_Source_total,
    startTime=100)
    annotation (Placement(transformation(extent={{-250,64},{-230,84}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer
    powerTransfer
    annotation (Placement(transformation(extent={{220,-30},{200,-10}})));
  Modelica.Blocks.Sources.RealExpression CoolingPower(y=Pchiller)
    annotation (Placement(transformation(extent={{177,-15},{193,1}})));
  Modelica.Blocks.Sources.RealExpression TCV_thetaconsumers2(y=0.87)
    annotation (Placement(transformation(extent={{-190,-75},{-170,-55}})));
  Modelica.Blocks.Sources.RealExpression TCV_thetaconsumers3(y=0.6)
    annotation (Placement(transformation(extent={{-190,-89},{-170,-69}})));
  Modelica.Blocks.Sources.RealExpression TCV_thetaconsumers4(y=0.42)
    annotation (Placement(transformation(extent={{-190,-104},{-170,-84}})));
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
        origin={210,-80})));
  Modelica.Blocks.Sources.RealExpression FCVR01_theta(y=if time < 800 then 0
         else 0)
    annotation (Placement(transformation(extent={{183,-109},{199,-93}})));
  Sources.SourcePressure VER901(p0=250000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={164,-51})));
  Modelica.Blocks.Sources.Ramp CoolingP(
    height=Pchillervar,
    duration=100,
    offset=Pchiller,
    startTime=200)
    annotation (Placement(transformation(extent={{250,-10},{230,10}})));
equation
  connect(FCV701.inlet, EX701.outhot) annotation (Line(
      points={{-100,20},{-100,0.25},{-100.7,0.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet, EX711.outhot) annotation (Line(
      points={{-20,20},{-20,11.625},{-20.7,11.625},{-20.7,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet, EX721.outhot) annotation (Line(
      points={{60,20},{60,11.125},{59.3,11.125},{59.3,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet, EX731.outhot) annotation (Line(
      points={{140,20},{140,11.125},{139.3,11.125},{139.3,0.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers.y, FCV731.opening)
    annotation (Line(points={{208,50},{160,50},{160,30},{148,30}},
                                                 color={0,0,127}));
  connect(FCV721.opening, FCV731.opening) annotation (Line(points={{68,30},{80,30},
          {80,50},{160,50},{160,30},{148,30}},      color={0,0,127}));
  connect(FCV711.opening, FCV731.opening) annotation (Line(points={{-12,30},{0,30},
          {0,50},{160,50},{160,30},{148,30}},  color={0,0,127}));
  connect(FCV701.opening, FCV731.opening) annotation (Line(points={{-92,30},{-80,
          30},{-80,50},{160,50},{160,30},{148,30}},
                                              color={0,0,127}));
  connect(PL701_HotSide_ColdOut.outlet, PL700_HotSide_ColdOut.inlet)
    annotation (Line(
      points={{-100,120},{-100,130},{-150,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut_PL701.outlet, PL700_HotSide_ColdOut.inlet)
    annotation (Line(
      points={{-90,130},{-150,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut.outlet, PL711_HotSide_ColdOut_PL701.inlet)
    annotation (Line(
      points={{-20,120},{-20,130},{-70,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut_PL711.outlet, PL711_HotSide_ColdOut_PL701.inlet)
    annotation (Line(
      points={{-10,130},{-70,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut_PL721.outlet, PL721_HotSide_ColdOut_PL711.inlet)
    annotation (Line(
      points={{70,130},{10,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut.outlet, PL721_HotSide_ColdOut_PL711.inlet)
    annotation (Line(
      points={{60,120},{60,130},{10,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut_PL721.inlet, PL731_HotSide_ColdOut.outlet)
    annotation (Line(
      points={{90,130},{140,130},{140,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn.outlet, EX701.inhot) annotation (Line(
      points={{-140,60},{-140,-21.875},{-141.3,-21.875},{-141.3,0.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_HotIn.outlet, EX711.inhot) annotation (Line(
      points={{-60,60},{-60,1.25},{-61.3,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn.outlet, EX721.inhot) annotation (Line(
      points={{20,60},{20,1.25},{18.7,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_HotIn.outlet, EX731.inhot) annotation (Line(
      points={{100,60},{100,0.25},{98.7,0.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn.inlet, PL701_HotSide_HotIn_PL711.inlet)
    annotation (Line(
      points={{-140,80},{-140,90},{-130,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn_PL711.outlet, PL711_HotSide_HotIn_PL721.inlet)
    annotation (Line(
      points={{-110,90},{-50,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_HotIn.inlet, PL711_HotSide_HotIn_PL721.inlet)
    annotation (Line(
      points={{-60,80},{-60,90},{-50,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_HotIn_PL721.outlet, PL721_HotSide_HotIn_PL731.inlet)
    annotation (Line(
      points={{-30,90},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn.inlet, PL721_HotSide_HotIn_PL731.inlet)
    annotation (Line(
      points={{20,80},{20,90},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn_PL731.outlet, PL731_HotSide_HotIn.inlet)
    annotation (Line(
      points={{50,90},{100,90},{100,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut.inlet, FCV701.outlet) annotation (Line(
      points={{-100,100},{-100,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut.inlet, FCV711.outlet) annotation (Line(
      points={{-20,100},{-20,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut.inlet, FCV721.outlet) annotation (Line(
      points={{60,100},{60,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut.inlet, FCV731.outlet) annotation (Line(
      points={{140,100},{140,40}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, PL701_HotSide_HotIn_PL711.inlet) annotation (Line(
      points={{-201,90},{-130,90}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, PL700_HotSide_ColdOut.outlet) annotation (Line(
      points={{-200,130},{-170,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut.outlet, PL701_ColdSide_HotOut_PL711.inlet)
    annotation (Line(
      points={{-140,-120},{-140,-140},{-110,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut_PL711.outlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-90,-140},{-60,-140},{-60,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_HotOut_PL721.inlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-30,-140},{-60,-140},{-60,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut.outlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{20,-120},{20,-140},{-10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.inlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{50,-140},{-10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{70,-140},{100,-140},{100,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, PL701_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-100.7,-17.25},{-100.7,-17},{-100,-17},{-100,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, PL711_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-20.7,-16.25},{-20.7,-28.125},{-20,-28.125},{-20,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, PL721_ColdSide_ColdIn.outlet) annotation (Line(
      points={{59.3,-16.25},{59.3,-28.125},{60,-28.125},{60,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, PL731_ColdSide_ColdIn.outlet) annotation (Line(
      points={{139.3,-17.25},{139.3,-28.625},{140,-28.625},{140,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_ColdIn_PL711.outlet, PL701_ColdSide_ColdIn.inlet)
    annotation (Line(
      points={{-90,-80},{-100,-80},{-100,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn.inlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-20,-60},{-20,-80},{-70,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn_PL721.outlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-10,-80},{-70,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn.inlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{60,-60},{60,-80},{10,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL731.outlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{70,-80},{10,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_ColdSide_ColdIn.inlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{140,-60},{140,-80},{90,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{190,-60.4},{190,-80},{90,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, TCV701.inlet) annotation (Line(
      points={{-141.3,-17.25},{-140,-17.25},{-140,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL701_ColdSide_HotOut.inlet) annotation (Line(
      points={{-140,-60},{-140,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TCV711.inlet) annotation (Line(
      points={{-61.3,-16.25},{-60,-16.25},{-60,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL711_ColdSide_HotOut.inlet) annotation (Line(
      points={{-60,-60},{-60,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TCV721.inlet) annotation (Line(
      points={{18.7,-16.25},{20,-16.25},{20,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL721_ColdSide_HotOut.inlet) annotation (Line(
      points={{20,-60},{20,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TCV731.inlet) annotation (Line(
      points={{98.7,-17.25},{98.7,-26},{100,-26},{100,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, PL731_ColdSide_HotOut.inlet) annotation (Line(
      points={{100,-60},{100,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV_thetaconsumers1.y, TCV701.opening)
    annotation (Line(points={{-169,-50},{-148,-50}}, color={0,0,127}));
  connect(ramp.y, sourceHot.in_m_flow) annotation (Line(points={{-229,74},{-229,
          78},{-221.8,78},{-221.8,83.5}}, color={0,0,127}));
  connect(powerTransfer.outlet, PR01.inlet) annotation (Line(
      points={{200,-20},{190,-20},{190,-39.6}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV_thetaconsumers2.y, TCV711.opening) annotation (Line(points={{-169,
          -65},{-79,-65},{-79,-50},{-68,-50}}, color={0,0,127}));
  connect(TCV_thetaconsumers3.y, TCV721.opening) annotation (Line(points={{-169,
          -79},{-156,-79},{-156,-36},{0,-36},{0,-50},{12,-50}}, color={0,0,127}));
  connect(TCV_thetaconsumers4.y, TCV731.opening) annotation (Line(points={{-169,
          -94},{-160,-94},{-160,-34},{86,-34},{86,-50},{92,-50}}, color={0,0,
          127}));
  connect(FCVR01.inlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{200,-80},{90,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet, powerTransfer.inlet) annotation (Line(
      points={{220,-80},{230,-80},{230,-20},{220,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{199.8,-101},
          {210,-101},{210,-88}}, color={0,0,127}));
  connect(PL721_ColdSide_HotOut_PL731.outlet, powerTransfer.inlet) annotation (
      Line(
      points={{70,-140},{230,-140},{230,-20},{220,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.outlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{164,-61},{164,-80},{90,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01_m_flow.y, PR01.in_q_m3hr) annotation (Line(points={{186,9},{166,9},
          {166,-33},{179,-33},{179,-44.8},{184.02,-44.8}}, color={0,0,127}));
  connect(CoolingP.y, powerTransfer.Ptransfer)
    annotation (Line(points={{229,0},{210,0},{210,-12}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-260,-160},{260,160}}, grid={1,1})),
      experiment(
      StopTime=1200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CoolingSystem;
