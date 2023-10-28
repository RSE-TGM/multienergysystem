within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model UsersPipelineSystem
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
        origin={-100,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-121,-48.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-41,-47.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={39,-47.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={119,-48.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 5000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-21,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 5000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={59,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 5000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={139,-8})));
  Sources.SinkMassFlow sinkCold_701(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={-140,-101},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_701(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={-100,-98},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_1(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={-60,-101},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_1(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={-20,-98},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_2(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={20,-101},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_2(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={60,-98},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_3(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={100,-101},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_3(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={140,-98},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers(y=1)
    annotation (Placement(transformation(extent={{231,-18},{211,2}})));
  Sources.SourceMassFlow sourceHot(
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_total) annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={-214,50})));
  Sources.SinkPressure sinkHot(p0=200000, T0=(60 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-210,90})));
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
        origin={-140,30})));
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
        origin={-120,50})));
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
        origin={-100,70})));
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
        origin={-60,30})));
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
        origin={-20,70})));
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
        origin={-40,50})));
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
        origin={-160,90})));
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
        origin={-80,90})));
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
        origin={20,30})));
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
        origin={60,70})));
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
        origin={0,90})));
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
        origin={40,50})));
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
        origin={100,30})));
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
        origin={140,70})));
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
        origin={80,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall=
        system.T_amb, n=n)                                                                                              annotation (
    Placement(visible = true, transformation(origin={-40,110},  extent = {{-10, 10}, {10, -10}}, rotation=180)));
equation
  connect(FCV701.inlet, EX701.outhot) annotation (Line(
      points={{-100,-18},{-100,-39.75},{-100.7,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet, EX711.outhot) annotation (Line(
      points={{-21,-18},{-21,-28.375},{-20.7,-28.375},{-20.7,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet, EX721.outhot) annotation (Line(
      points={{59,-18},{59,-28.875},{59.3,-28.875},{59.3,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet, EX731.outhot) annotation (Line(
      points={{139,-18},{139,-28.875},{139.3,-28.875},{139.3,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_701.outlet, EX701.incold) annotation (Line(
      points={{-100,-88},{-100,-57.25},{-100.7,-57.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_701.inlet, EX701.outcold) annotation (Line(
      points={{-140,-88},{-140,-57.25},{-141.3,-57.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_1.inlet, EX711.outcold) annotation (Line(
      points={{-60,-88},{-60,-56},{-61.3,-56},{-61.3,-56.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, sourceCold_1.outlet) annotation (Line(
      points={{-20.7,-56.25},{-21,-56.25},{-21,-56},{-20,-56},{-20,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_2.inlet, EX721.outcold) annotation (Line(
      points={{20,-88},{20,-56},{19,-56},{19,-56.25},{18.7,-56.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_2.outlet, EX721.incold) annotation (Line(
      points={{60,-88},{60,-56},{59.3,-56},{59.3,-56.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers.y, FCV731.opening)
    annotation (Line(points={{210,-8},{147,-8}}, color={0,0,127}));
  connect(FCV721.opening, FCV731.opening) annotation (Line(points={{67,-8},{79,-8},
          {79,12},{189,12},{189,-8},{147,-8}},      color={0,0,127}));
  connect(FCV711.opening, FCV731.opening) annotation (Line(points={{-13,-8},{-1,
          -8},{-1,12},{189,12},{189,-8},{147,-8}},
                                               color={0,0,127}));
  connect(FCV701.opening, FCV731.opening) annotation (Line(points={{-92,-8},{-81,
          -8},{-81,12},{189,12},{189,-8},{147,-8}},
                                              color={0,0,127}));
  connect(sinkCold_3.inlet, EX731.outcold) annotation (Line(
      points={{100,-88},{100,-57.25},{98.7,-57.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, sourceCold_3.outlet) annotation (Line(
      points={{139.3,-57.25},{139.3,-56},{140,-56},{140,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.outlet,roundPipe1DFV20. inlet) annotation (Line(
      points={{-100,80},{-100,90},{-150,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV21.outlet,roundPipe1DFV20. inlet) annotation (Line(
      points={{-90,90},{-150,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.outlet,roundPipe1DFV21. inlet) annotation (Line(
      points={{-20,80},{-20,90},{-70,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV31.outlet,roundPipe1DFV21. inlet) annotation (Line(
      points={{-10,90},{-70,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.outlet,roundPipe1DFV31. inlet) annotation (Line(
      points={{70,90},{10,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.outlet,roundPipe1DFV31. inlet) annotation (Line(
      points={{60,80},{60,90},{10,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.inlet,roundPipe1DFV39. outlet) annotation (Line(
      points={{90,90},{140,90},{140,80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.outlet, EX701.inhot) annotation (Line(
      points={{-140,20},{-140,-61.875},{-141.3,-61.875},{-141.3,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.outlet, EX711.inhot) annotation (Line(
      points={{-60,20},{-60,-38.75},{-61.3,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.outlet, EX721.inhot) annotation (Line(
      points={{20,20},{20,-38.75},{18.7,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV35.outlet, EX731.inhot) annotation (Line(
      points={{100,20},{100,-39.75},{98.7,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.inlet,roundPipe1DFV11. inlet) annotation (Line(
      points={{-140,40},{-140,50},{-130,50}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV11.outlet,roundPipe1DFV19. inlet) annotation (Line(
      points={{-110,50},{-50,50}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.inlet,roundPipe1DFV19. inlet) annotation (Line(
      points={{-60,40},{-60,50},{-50,50}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV19.outlet,roundPipe1DFV33. inlet) annotation (Line(
      points={{-30,50},{30,50}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.inlet,roundPipe1DFV33. inlet) annotation (Line(
      points={{20,40},{20,50},{30,50}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV33.outlet,roundPipe1DFV35. inlet) annotation (Line(
      points={{50,50},{100,50},{100,40}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.inlet, FCV701.outlet) annotation (Line(
      points={{-100,60},{-100,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.inlet, FCV711.outlet) annotation (Line(
      points={{-20,60},{-20,2},{-21,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.inlet, FCV721.outlet) annotation (Line(
      points={{60,60},{60,2},{59,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV39.inlet, FCV731.outlet) annotation (Line(
      points={{140,60},{140,2},{139,2}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{-201,50},{-130,50}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-200,90},{-170,90}},
      color={140,56,54},
      thickness=0.5));
  connect(wall_FixedT.MultiPort, roundPipe1DFV20.wall) annotation (Line(points={
          {-40,110},{-40,104},{-160,104},{-160,95.1}}, color={255,238,44}));
  connect(wall_FixedT.MultiPort, roundPipe1DFV21.wall) annotation (Line(points={
          {-40,110},{-40,104},{-80,104},{-80,95.1}}, color={255,238,44}));
  connect(wall_FixedT.MultiPort, roundPipe1DFV31.wall) annotation (Line(points={
          {-40,110},{-40,105},{0,105},{0,95.1},{0,95.1}}, color={255,238,44}));
  connect(wall_FixedT.MultiPort, roundPipe1DFV40.wall) annotation (Line(points={
          {-40,110},{-40,104},{80,104},{80,95.1}}, color={255,238,44}));
  annotation (
    Diagram(coordinateSystem(extent={{-260,-120},{260,120}}, grid={1,1})), Icon(
        coordinateSystem(grid={0.5,0.5})));
end UsersPipelineSystem;
