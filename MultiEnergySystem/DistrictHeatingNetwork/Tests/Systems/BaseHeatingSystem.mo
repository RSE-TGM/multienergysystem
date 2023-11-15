within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model BaseHeatingSystem
  "Case in which there isn't any source of heat"
  extends Modelica.Icons.Example;

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
  parameter Integer n_E301 = 5;
  parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
  parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
  parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
  parameter Integer gammahotovercold_factor = 1;
  parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;

  parameter Types.Length L_S1 = 10;
  parameter Types.Length L_S9 = 10;
  //parameter Types.MassFlowRate m_flow_total = 2.4095388;
  parameter Types.MassFlowRate m_flow_total = 2.5;

  parameter Types.Temperature Tin_start_Users = 80 + 273.15;
  parameter Types.Temperature Tout_start_Users = 60 + 273.15;

  parameter Types.Temperature Tcool = 27 + 273.15;
  parameter Types.Temperature Tcool_out = 32 + 273.15;
  parameter Types.MassFlowRate m_flow_cool = 1.75;

  parameter Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
  parameter Types.Length L_Users = 2;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;

  parameter Real Kv_UsersValve(unit = "m3/h") = 4 "Metri Flow Coefficient ";
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.Pressure dp_nom_UsersValve = 50000;

  parameter Real theta1change = 0;
  parameter Real theta2change = 0;
  parameter Real theta3change = 0;
  parameter Real thetachange = -0.98;

  // Rack

  parameter Types.Length t = 1.5e-3;
  parameter Types.Length Di = 51e-3;
  parameter Types.Length L_v = 1;
  parameter Types.Length L_RL2L3 = 4.53;
  parameter Types.Length L_RL3L4 = 3.02;
  parameter Types.Length L_RL4L5 = 2.5;
  parameter Types.Length L_RL5L6 = 2.5;
  parameter Types.Length L_RL6L7 = 3;
  parameter Types.Pressure pin_start = 1.69e5;
  parameter Types.Pressure pout_start = 3e5;
  parameter Types.Temperature T_start = 25 + 273.15;
  parameter Types.MassFlowRate m_flow_start = 4.04;

  // System S100

  parameter Types.Pressure pin_start_S1 = 1.695e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;

  parameter Types.Length L_S1_PL1 = 0.4;
  parameter Types.Length L_S1_PL2 = 0.8;
  parameter Types.Length L_S1_PL3 = 1.5;
  parameter Types.Length L_S1_PL4 = 0.7;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;

  // System S900

  parameter Types.Pressure pin_start_S9 = 2.3e5;
  parameter Types.Pressure pout_start_S9 = 3.2e5;
  parameter Types.Temperature Tin_start_S9 = 80 + 273.15;
  parameter Types.Temperature Tout_start_S9 = 80 + 273.15;

  parameter Types.Length L_S9_PL1 = 0.82;
  parameter Types.Length L_S9_PL2 = 2.3;
  parameter Types.Length L_S9_PL3 = 1.5;
  parameter Types.Length L_S9_PL4 = 0.65;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_S9 = 4.04;
  parameter Types.VolumeFlowRate q_P901_computed = 8.1;

  // Cooling System
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
  parameter Types.Power Pchiller = -148751*0;
  parameter Types.Power Pchillervar = 0;
  parameter Types.MassFlowRate m_flow_cold = 0.05;

  parameter Types.Temperature T_start_cold = 13 + 273.15;
  parameter Types.Temperature Tout_cold = 32.09+273.15;
  parameter Real Kv_FCVC02(unit = "m3/h") = 14;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={470,290},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV5(
    L=L_S9,
    t=t_S9,        m_flow_start=m_flow_total,
    pin_start=pin_start_Users + 0.01e5,
    pout_start=pin_start_Users,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S9)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={10,200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV7(L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
                              Di=Di_Users)
                   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={60,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV701.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={100,120})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={80,79.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV11(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={80,200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV12(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={100,220})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={160,80.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV13(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={140,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={240,80.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={320,79.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV711.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={180,120})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV721.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={260,120})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV731.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={340,120})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV18(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={180,220})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV19(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={160,200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV20(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_Users - 0.03e5,
    pout_start=pout_start_Users - 0.04e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_S1)       annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={40,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV21(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pout_start_Users - 0.02e5,
    pout_start=pout_start_Users - 0.03e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={120,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV26(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={220,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV30(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={260,220})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV31(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={200,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV33(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={240,200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV35(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={300,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV39(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={340,220})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV40(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users,
    pout_start=pout_start_Users - 0.01e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={280,240})));
  Modelica.Blocks.Sources.Ramp FCV731_theta(
    height=thetachange,
    duration=100,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{375,110},{355,130}})));
  Modelica.Blocks.Sources.Ramp FCV721_theta(
    height=thetachange,
    duration=100,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{295,110},{275,130}})));
  Sources.SourcePressure VE901(p0=164000, T0(displayUnit="K") = 30 + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-460,200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P901(
    Tin_start=Pump.P901.Tin_start,
    Tout_start=Pump.P901.Tout_start,
    hin_start=Pump.P901.hin_start,
    pin_start=Pump.P901.pin_start,
    pout_start=Pump.P901.pout_start,
    a=Pump.P901.a,
    b=Pump.P901.b,
    dpnom=Pump.P901.dpnom,
    etaelec=Pump.P901.etaelec,
    etamech=Pump.P901.etamech,
    etanom=Pump.P901.etanom,
    headmax=Pump.P901.headnommax,
    headmin=Pump.P901.headnommin,
    m_flow_nom=Pump.P901.m_flow_nom,
    omeganom=Pump.P901.omeganom,
    qnom_inm3h=Pump.P901.qnom_inm3h,
    qnom_inm3h_min=Pump.P901.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    qnom_inm3h_max=Pump.P901.qnommax_inm3h,
    use_q_m3hr=true)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(                 extent={{-10,10},{
            10,-10}},                                                                          rotation=90,
        origin={-359,78})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-361,172})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-361,179.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(T_start=Tout_start_S9, p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"       annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-360.75,187.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S901(
    L=L_S9_PL3,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pout_start_S9,
    pout_start=pout_start_S9,
    Tin_start=Tout_start_S9,
    Tout_start=Tout_start_S9,
    Di=Di_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-359,146})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(T_start=Tin_start_S9, p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-420.75,167.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-421,157.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S901(
    L=L_S9_PL2,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pin_start_S9,
    pout_start=pin_start_S9,
    Tin_start=Tin_start_S9,
    Tout_start=Tin_start_S9,
    Di=Di_S9) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-419,96})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV901(
    Kv=Valve.FCV901.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV901.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-359,106})));
  Modelica.Blocks.Sources.Ramp q_P901(
    height=q_P901_computed*0.5*0,
    duration=100,
    offset=q_P901_computed,
    startTime=400)
    annotation (Placement(transformation(extent={{-320,60},{-341,80}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FV933(
    Kv=11.5,
    dp_nom=50000,
    Tin_start=T_start,
    pin_start=pin_start)       annotation (Placement(visible=true,
        transformation(
        origin={-92,20},
        extent={{-5,5},{5,-5}},
        rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe1(
    L=1,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{-7.5,7.5},{7.5,-7.5}},
        rotation=180,
        origin={-147,41})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe2(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{-7.5,7.5},{7.5,-7.5}},
        rotation=180,
        origin={-201.5,41})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe4(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={-180,1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe3(
    L=0.8,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={-114.5,1})));
  Modelica.Blocks.Sources.Ramp FCV711_theta(
    height=thetachange,
    duration=100,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{215,110},{195,130}})));
  Modelica.Blocks.Sources.Ramp FCV701_theta(
    height=thetachange,
    duration=100,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{135,110},{115,130}})));
  Modelica.Blocks.Sources.Ramp FV933_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=600)
    annotation (Placement(transformation(extent={{-61,10},{-81,30}})));
  Modelica.Blocks.Sources.Ramp FCV901_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=600)
    annotation (Placement(transformation(extent={{-321,96},{-341,116}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=Tout_cold,     p_start=pout_start_S1)
    "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={62,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=Tout_cold,     p_start=pout_start_S1)
    "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={142,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=Tout_cold,     p_start=pout_start_S1)
    "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={222,54})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=Tout_cold,     p_start=pout_start_S1)
    "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={302,54})));
  Sources.SinkMassFlow sinkCold_701(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=m_flow_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={60,15},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_701(
    T0=T_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={100,18},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_1(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=m_flow_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={140,15},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_1(
    T0=T_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={180,18},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_2(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=m_flow_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={220,15},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_2(
    T0=T_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={260,18},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_3(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=m_flow_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={300,15},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_3(
    T0=T_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={340,18},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCVC02(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_FCVC02,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={380,220})));
  Modelica.Blocks.Sources.Ramp FCVC02_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{419,210},{399,230}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCVC01(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV721.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={220,220})));
  Modelica.Blocks.Sources.Ramp FCVC01_theta(
    height=0,
    duration=100,
    offset=0,
    startTime=400)
    annotation (Placement(transformation(extent={{261,250},{241,270}})));
equation
  connect(FCV701.inlet, EX701.outhot) annotation (Line(
      points={{100,110},{100,88.25},{100.3,88.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet, EX711.outhot) annotation (Line(
      points={{180,110},{180,99.625},{180.3,99.625},{180.3,89.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet, EX721.outhot) annotation (Line(
      points={{260,110},{260,99.125},{260.3,99.125},{260.3,89.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet, EX731.outhot) annotation (Line(
      points={{340,110},{340,99.125},{340.3,99.125},{340.3,88.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.outlet, roundPipe1DFV20.inlet) annotation (Line(
      points={{100,230},{100,240},{50,240}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV21.outlet, roundPipe1DFV20.inlet) annotation (Line(
      points={{110,240},{50,240}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.outlet, roundPipe1DFV21.inlet) annotation (Line(
      points={{180,230},{180,240},{130,240}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV31.outlet, roundPipe1DFV21.inlet) annotation (Line(
      points={{190,240},{130,240}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.outlet, roundPipe1DFV31.inlet) annotation (Line(
      points={{270,240},{210,240}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.outlet, roundPipe1DFV31.inlet) annotation (Line(
      points={{260,230},{260,240},{210,240}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.inlet, roundPipe1DFV39.outlet) annotation (Line(
      points={{290,240},{340,240},{340,230}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.outlet, EX701.inhot) annotation (Line(
      points={{60,170},{60,89.125},{59.7,89.125},{59.7,88.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.outlet, EX711.inhot) annotation (Line(
      points={{140,170},{140,89.25},{139.7,89.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.outlet, EX721.inhot) annotation (Line(
      points={{220,170},{220,89.25},{219.7,89.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV35.outlet, EX731.inhot) annotation (Line(
      points={{300,170},{300,88.25},{299.7,88.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.inlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{60,190},{60,200},{70,200}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV11.outlet, roundPipe1DFV19.inlet) annotation (Line(
      points={{90,200},{150,200}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.inlet, roundPipe1DFV19.inlet) annotation (Line(
      points={{140,190},{140,200},{150,200}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV19.outlet, roundPipe1DFV33.inlet) annotation (Line(
      points={{170,200},{230,200}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.inlet, roundPipe1DFV33.inlet) annotation (Line(
      points={{220,190},{220,200},{230,200}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV33.outlet, roundPipe1DFV35.inlet) annotation (Line(
      points={{250,200},{300,200},{300,190}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.inlet, FCV701.outlet) annotation (Line(
      points={{100,210},{100,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.inlet, FCV711.outlet) annotation (Line(
      points={{180,210},{180,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.inlet, FCV721.outlet) annotation (Line(
      points={{260,210},{260,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV39.inlet, FCV731.outlet) annotation (Line(
      points={{340,210},{340,130}},
      color={140,56,54},
      thickness=0.5));

  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{354,120},{348,120}}, color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{274,120},{268,120}}, color={0,0,127}));
  connect(roundPipe1DFV5.outlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{20,200},{70,200}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.outlet,PT902. inlet) annotation (Line(
      points={{-359,175},{-359,179.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet,TT902. inlet) annotation (Line(
      points={{-359,179.5},{-359,187.25},{-358.85,187.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.inlet,PL4_S901. outlet) annotation (Line(
      points={{-359,169},{-359,156}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet,PT901. inlet) annotation (Line(
      points={{-419,106},{-419,157.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet,TT901. inlet) annotation (Line(
      points={{-419,157.5},{-419,162.375},{-418.85,162.375},{-418.85,167.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet,PL4_S901. inlet) annotation (Line(
      points={{-359,116},{-359,136}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet,FCV901. inlet) annotation (Line(
      points={{-359,86},{-359,96}},
      color={140,56,54},
      thickness=0.5));
  connect(q_P901.y, P901.in_q_m3hr)
    annotation (Line(points={{-342.05,70},{-354.4,70},{-354.4,74}},
                                                         color={0,0,127}));
  connect(FV933.outlet,pipe1. inlet) annotation (Line(
      points={{-92,25},{-92,41},{-139.5,41}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe1.outlet,pipe2. inlet) annotation (Line(
      points={{-154.5,41},{-194,41}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe3.outlet,FV933. inlet) annotation (Line(
      points={{-107,1},{-92,1},{-92,15}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe3.inlet,pipe4. outlet) annotation (Line(
      points={{-122,1},{-172.5,1}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe2.outlet, P901.inlet) annotation (Line(
      points={{-209,41},{-359,41},{-359,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, pipe4.inlet) annotation (Line(
      points={{-419,86},{-420,86},{-420,1},{-187.5,1}},
      color={140,56,54},
      thickness=0.5));
  connect(VE901.outlet, PT901.inlet) annotation (Line(
      points={{-460,190},{-460,132},{-419,132},{-419,157.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, roundPipe1DFV5.inlet) annotation (Line(
      points={{-358.85,187.25},{-358.85,200},{0,200}},
      color={140,56,54},
      thickness=0.5));
  connect(TT901.inlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-418.85,167.25},{-418.85,240},{30,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{194,120},{188,120}}, color={0,0,127}));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{114,120},{108,120}}, color={0,0,127}));
  connect(FV933_theta.y, FV933.opening)
    annotation (Line(points={{-82,20},{-88,20}}, color={0,0,127}));
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-342,106},{-351,106}}, color={0,0,127}));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{59.7,70.75},{60,70.75},{59.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{139.7,71.75},{139.7,55.875},{140,55.875},{139.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{219.7,71.75},{219.7,55.875},{220,55.875},{219.6,54}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{299.7,70.75},{299.7,55.375},{299.6,55.375},{299.6,54}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_701.inlet, EX701.outcold) annotation (Line(
      points={{60,28},{60,50},{60,70.75},{59.7,70.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_701.outlet, EX701.incold) annotation (Line(
      points={{100,28},{100,49.375},{100.3,49.375},{100.3,70.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_1.inlet, EX711.outcold) annotation (Line(
      points={{140,28},{140,56},{139.7,56},{139.7,71.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_1.outlet, EX711.incold) annotation (Line(
      points={{180,28},{180,49.875},{180.3,49.875},{180.3,71.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_2.inlet, TT724.inlet) annotation (Line(
      points={{220,28},{220,41},{219.6,41},{219.6,54}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_2.outlet, EX721.incold) annotation (Line(
      points={{260,28},{260,49.875},{260.3,49.875},{260.3,71.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_3.inlet, TT734.inlet) annotation (Line(
      points={{300,28},{300,50},{299.6,50},{299.6,54}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_3.outlet, EX731.incold) annotation (Line(
      points={{340,28},{340,49.375},{340.3,49.375},{340.3,70.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC02.inlet, roundPipe1DFV35.inlet) annotation (Line(
      points={{380,210},{380,200},{300,200},{300,190}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC02.outlet, roundPipe1DFV39.outlet) annotation (Line(
      points={{380,230},{380,240},{340,240},{340,230}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC02_theta.y, FCVC02.opening)
    annotation (Line(points={{398,220},{388,220}}, color={0,0,127}));
  connect(FCVC01.inlet, roundPipe1DFV33.inlet) annotation (Line(
      points={{220,210},{220,200},{230,200}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01.outlet, roundPipe1DFV31.inlet) annotation (Line(
      points={{220,230},{220,240},{210,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{240,260},{234,
          260},{234,220},{228,220}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-480,-300},{480,300}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end BaseHeatingSystem;
