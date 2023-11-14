within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model UsersPipelineOLSystem
  "Users Systems and some pipelines connected on the heating side"

  parameter Integer n = 3 "Number of volumes";

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

  parameter Types.Pressure pin_start_S1 = 1.85e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter Types.Length L_S1 = 10;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;
  parameter Types.Length L_S9 = 10;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_total = 1.6;

  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Temperature Tin_start_Users = 80 + 273.15;
  parameter Types.Temperature Tout_start_Users = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
  parameter Types.Length L_Users = 10;
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
    annotation (Placement(transformation(extent={{230,20},{210,40}})));
  Sources.SourceMassFlow sourceHot(
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_total) annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={-214,90})));
  Sources.SinkPressure sinkHot(p0=200000, T0=(60 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-210,130})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV7(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-140,70})));
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
        origin={-120,90})));
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
        origin={-100,110})));
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
        origin={-60,70})));
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
        origin={-20,110})));
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
        origin={-40,90})));
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
        origin={-160,130})));
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
        origin={-80,130})));
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
        origin={20,70})));
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
        origin={60,110})));
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
        origin={0,130})));
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
        origin={40,90})));
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
        origin={100,70})));
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
        origin={140,110})));
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
        origin={80,130})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall=
        system.T_amb, n=n)                                                                                              annotation (
    Placement(visible = true, transformation(origin={-40,150},  extent = {{-10, 10}, {10, -10}}, rotation=180)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV1(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-140,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV2(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV3(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV4(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV5(
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
        origin={-100,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV6(
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
        origin={-20,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV8(
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
        origin={60,-140})));
  Sources.SourceMassFlow sourceMassFlow(
    use_in_m_flow=true,
    p0=BPHE.E701.pin_start_cold,
    T0=BPHE.E701.Tin_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold*4)
    annotation (Placement(transformation(extent={{180,-90},{160,-70}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV9(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-100,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV10(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-20,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV14(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={60,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV15(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={140,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV16(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-80,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV17(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={0,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV22(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={80,-80})));
  Sources.SinkPressure sinkHot1(p0=BPHE.E701.pout_start_cold, T0=BPHE.E701.Tout_start_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={170,-140})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers1(y=if time < 50
         then BPHE.E701.m_flow_start_cold*4 else BPHE.E701.m_flow_start_cold*6)
    annotation (Placement(transformation(extent={{230,-70},{210,-50}})));
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
    annotation (Line(points={{209,30},{148,30}}, color={0,0,127}));
  connect(FCV721.opening, FCV731.opening) annotation (Line(points={{68,30},{80,
          30},{80,50},{190,50},{190,30},{148,30}},  color={0,0,127}));
  connect(FCV711.opening, FCV731.opening) annotation (Line(points={{-12,30},{0,
          30},{0,50},{190,50},{190,30},{148,30}},
                                               color={0,0,127}));
  connect(FCV701.opening, FCV731.opening) annotation (Line(points={{-92,30},{
          -80,30},{-80,50},{190,50},{190,30},{148,30}},
                                              color={0,0,127}));
  connect(roundPipe1DFV12.outlet,roundPipe1DFV20. inlet) annotation (Line(
      points={{-100,120},{-100,130},{-150,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV21.outlet,roundPipe1DFV20. inlet) annotation (Line(
      points={{-90,130},{-150,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.outlet,roundPipe1DFV21. inlet) annotation (Line(
      points={{-20,120},{-20,130},{-70,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV31.outlet,roundPipe1DFV21. inlet) annotation (Line(
      points={{-10,130},{-70,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.outlet,roundPipe1DFV31. inlet) annotation (Line(
      points={{70,130},{10,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.outlet,roundPipe1DFV31. inlet) annotation (Line(
      points={{60,120},{60,130},{10,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.inlet,roundPipe1DFV39. outlet) annotation (Line(
      points={{90,130},{140,130},{140,120}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.outlet, EX701.inhot) annotation (Line(
      points={{-140,60},{-140,-21.875},{-141.3,-21.875},{-141.3,0.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.outlet, EX711.inhot) annotation (Line(
      points={{-60,60},{-60,1.25},{-61.3,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.outlet, EX721.inhot) annotation (Line(
      points={{20,60},{20,1.25},{18.7,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV35.outlet, EX731.inhot) annotation (Line(
      points={{100,60},{100,0.25},{98.7,0.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.inlet,roundPipe1DFV11. inlet) annotation (Line(
      points={{-140,80},{-140,90},{-130,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV11.outlet,roundPipe1DFV19. inlet) annotation (Line(
      points={{-110,90},{-50,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.inlet,roundPipe1DFV19. inlet) annotation (Line(
      points={{-60,80},{-60,90},{-50,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV19.outlet,roundPipe1DFV33. inlet) annotation (Line(
      points={{-30,90},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.inlet,roundPipe1DFV33. inlet) annotation (Line(
      points={{20,80},{20,90},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV33.outlet,roundPipe1DFV35. inlet) annotation (Line(
      points={{50,90},{100,90},{100,80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.inlet, FCV701.outlet) annotation (Line(
      points={{-100,100},{-100,40}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.inlet, FCV711.outlet) annotation (Line(
      points={{-20,100},{-20,40}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.inlet, FCV721.outlet) annotation (Line(
      points={{60,100},{60,40}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV39.inlet, FCV731.outlet) annotation (Line(
      points={{140,100},{140,40}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{-201,90},{-130,90}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-200,130},{-170,130}},
      color={140,56,54},
      thickness=0.5));
  connect(wall_FixedT.MultiPort, roundPipe1DFV20.wall) annotation (Line(points={{-40,150},
          {-40,144},{-160,144},{-160,134.3}},          color={255,238,44}));
  connect(wall_FixedT.MultiPort, roundPipe1DFV21.wall) annotation (Line(points={{-40,150},
          {-40,144},{-80,144},{-80,134.3}},          color={255,238,44}));
  connect(wall_FixedT.MultiPort, roundPipe1DFV31.wall) annotation (Line(points={{-40,150},
          {-40,145},{0,145},{0,134.3}},                   color={255,238,44}));
  connect(wall_FixedT.MultiPort, roundPipe1DFV40.wall) annotation (Line(points={{-40,150},
          {-40,144},{80,144},{80,134.3}},          color={255,238,44}));
  connect(EX701.outcold, roundPipe1DFV1.inlet) annotation (Line(
      points={{-141.3,-17.25},{-140,-17.25},{-140,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, roundPipe1DFV2.inlet) annotation (Line(
      points={{-61.3,-16.25},{-60,-16.25},{-60,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.outlet, roundPipe1DFV5.inlet) annotation (Line(
      points={{-140,-120},{-140,-140},{-110,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.outlet, roundPipe1DFV2.outlet) annotation (Line(
      points={{-90,-140},{-60,-140},{-60,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV6.inlet, roundPipe1DFV2.outlet) annotation (Line(
      points={{-30,-140},{-60,-140},{-60,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.outlet, roundPipe1DFV6.outlet) annotation (Line(
      points={{20,-120},{20,-140},{-10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV8.inlet, roundPipe1DFV6.outlet) annotation (Line(
      points={{50,-140},{-10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, roundPipe1DFV3.inlet) annotation (Line(
      points={{18.7,-16.25},{20,-16.25},{20,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, roundPipe1DFV4.inlet) annotation (Line(
      points={{98.7,-17.25},{98.7,-26},{100,-26},{100,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV8.outlet, roundPipe1DFV4.outlet) annotation (Line(
      points={{70,-140},{100,-140},{100,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, roundPipe1DFV9.outlet) annotation (Line(
      points={{-100.7,-17.25},{-100.7,-17},{-100,-17},{-100,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, roundPipe1DFV10.outlet) annotation (Line(
      points={{-20.7,-16.25},{-20.7,-28.125},{-20,-28.125},{-20,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, roundPipe1DFV14.outlet) annotation (Line(
      points={{59.3,-16.25},{59.3,-28.125},{60,-28.125},{60,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, roundPipe1DFV15.outlet) annotation (Line(
      points={{139.3,-17.25},{139.3,-28.625},{140,-28.625},{140,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV16.outlet, roundPipe1DFV9.inlet) annotation (Line(
      points={{-90,-80},{-100,-80},{-100,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV10.inlet, roundPipe1DFV16.inlet) annotation (Line(
      points={{-20,-60},{-20,-80},{-70,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV17.outlet, roundPipe1DFV16.inlet) annotation (Line(
      points={{-10,-80},{-70,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV14.inlet, roundPipe1DFV17.inlet) annotation (Line(
      points={{60,-60},{60,-80},{10,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV22.outlet, roundPipe1DFV17.inlet) annotation (Line(
      points={{70,-80},{10,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV15.inlet, roundPipe1DFV22.inlet) annotation (Line(
      points={{140,-60},{140,-80},{90,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceMassFlow.outlet, roundPipe1DFV22.inlet) annotation (Line(
      points={{160,-80},{90,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot1.inlet, roundPipe1DFV4.outlet) annotation (Line(
      points={{160,-140},{100,-140},{100,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers1.y, sourceMassFlow.in_m_flow)
    annotation (Line(points={{209,-60},{176,-60},{176,-75}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-260,-160},{260,160}}, grid={1,1})),
      experiment(
      StopTime=1000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end UsersPipelineOLSystem;
