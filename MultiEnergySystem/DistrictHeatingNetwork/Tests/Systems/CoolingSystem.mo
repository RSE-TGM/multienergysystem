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
        origin={-150,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-171,-33.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-81,-32.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={9,-32.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={99,-33.5})));
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
        origin={-60,30})));
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
        origin={30,30})));
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
        origin={120,30})));
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
        origin={-190,0})));
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
        origin={-150,60})));
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
        origin={-100,0})));
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
        origin={-60,60})));
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
        origin={-10,0})));
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
        origin={30,60})));
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
        origin={80,0})));
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
        origin={120,60})));
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
        origin={-190,-160})));
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
        origin={-100,-160})));
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
        origin={-10,-159})));
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
        origin={80,-159})));
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
        origin={-150,-190})));
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
        origin={-60,-190})));
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
        origin={31,-190})));
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
        origin={-150,-100})));
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
        origin={-60,-99})));
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
        origin={30,-100})));
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
        origin={120,-100})));
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
        origin={-130,-130})));
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
        origin={-30,-130})));
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
        origin={60,-130})));
  Modelica.Blocks.Sources.RealExpression PR01_m_flow(y=q_m3h)
    annotation (Placement(transformation(extent={{187,-26},{167,-6}})));
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
        origin={170,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV701(
      Kv=Valve.TCV701.Kv,
      dp_nom=Valve.TCV701.dp_nom,
      rho_nom=Valve.TCV701.rho_nom,
      Tin_start=Valve.TCV701.Tin_start,
      pin_start=Valve.TCV701.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-190,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV711(
      Kv=Valve.TCV711.Kv,
      dp_nom=Valve.TCV711.dp_nom,
      rho_nom=Valve.TCV711.rho_nom,
      Tin_start=Valve.TCV711.Tin_start,
      pin_start=Valve.TCV711.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-100,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV721(
      Kv=Valve.TCV721.Kv,
      dp_nom=Valve.TCV721.dp_nom,
      rho_nom=Valve.TCV721.rho_nom,
      Tin_start=Valve.TCV721.Tin_start,
      pin_start=Valve.TCV721.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-10,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV731(
      Kv=Valve.TCV731.Kv,
      dp_nom=Valve.TCV731.dp_nom,
      rho_nom=Valve.TCV731.rho_nom,
      Tin_start=Valve.TCV731.Tin_start,
      pin_start=Valve.TCV731.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={80,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer
    powerTransfer
    annotation (Placement(transformation(extent={{200,-75},{180,-55}})));
  Modelica.Blocks.Sources.RealExpression CoolingPower(y=Pchiller)
    annotation (Placement(transformation(extent={{157,-40},{173,-24}})));
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
        origin={190,-130})));
  Sources.SourcePressure VER901(p0=250000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={145,-101})));
  Modelica.Blocks.Sources.Ramp CoolingP(
    height=Pchillervar,
    duration=100,
    offset=Pchiller,
    startTime=200)
    annotation (Placement(transformation(extent={{230,-35},{210,-15}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{-115,20},{-135,40}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{-25,20},{-45,40}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{65,20},{45,40}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{156,20},{136,40}})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{-224,-110},{-204,-90}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-192,-64})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-152,-65})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{-135,-110},{-115,-90}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{-45,-110},{-25,-90}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{44,-110},{64,-90}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{160,-170},{180,-150}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-63,-63})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={27,-61})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={117,-61})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-102,-63})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-12,-62})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={78,-60})));
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
        origin={-150,0})));
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
        origin={-60,0})));
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
        origin={30,0})));
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
        origin={120,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX701 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-152,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX711 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-62,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX721 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={28,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX731 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={118,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT701(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-152,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT711(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-62,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT721(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={28,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT731(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={118,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT701 "Pressure sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-152,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT711 "Pressure sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-62,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT721 "Pressure sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={28,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT731 "Pressure sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={118,100})));
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
        origin={-60,120})));
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
        origin={-60,150})));
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
        origin={-60,180})));
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
        origin={-150,120})));
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
        origin={-150,150})));
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
        origin={-150,180})));
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
        origin={30,120})));
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
        origin={30,150})));
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
        origin={30,180})));
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
        origin={120,120})));
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
        origin={120,150})));
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
        origin={120,180})));
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
        origin={-190,30})));
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
        origin={-100,30})));
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
        origin={-10,30})));
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
        origin={80,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT702(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-192,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-192,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT712(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-102,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-102,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT722(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-12,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-12,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT732(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,60})));
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
        origin={-190,80})));
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
        origin={-190,110})));
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
        origin={-100,80})));
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
        origin={-100,110})));
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
        origin={-10,80})));
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
        origin={-10,110})));
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
        origin={80,80})));
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
        origin={80,110})));
equation
  connect(PL711_SourceIn.outlet, EX711.inhot) annotation (Line(
      points={{-100,-10},{-101.3,-10},{-101.3,-23.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceIn.outlet, EX721.inhot) annotation (Line(
      points={{-10,-10},{-11.3,-10},{-11.3,-23.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceIn.outlet, EX731.inhot) annotation (Line(
      points={{80,-10},{78.7,-10},{78.7,-24.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FCV701_FT701.inlet, FCV701.outlet) annotation (Line(
      points={{-150,50},{-150,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet, FCV711.outlet) annotation (Line(
      points={{-60,50},{-60,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet, FCV721.outlet) annotation (Line(
      points={{30,50},{30,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet, FCV731.outlet) annotation (Line(
      points={{120,50},{120,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut.outlet, PL701_ColdSide_HotOut_PL711.inlet)
    annotation (Line(
      points={{-190,-170},{-190,-190},{-160,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut_PL711.outlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-140,-190},{-100,-190},{-100,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_HotOut_PL721.inlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-70,-190},{-100,-190},{-100,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut.outlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{-10,-169},{-10,-190},{-50,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.inlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{21,-190},{-50,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{41,-190},{80,-190},{80,-169}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, PL701_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-150.7,-42.25},{-150.7,-67},{-150,-67},{-150,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, PL711_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-60.7,-41.25},{-60.7,-77.125},{-60,-77.125},{-60,-89}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, PL721_ColdSide_ColdIn.outlet) annotation (Line(
      points={{29.3,-41.25},{29.3,-78.125},{30,-78.125},{30,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, PL731_ColdSide_ColdIn.outlet) annotation (Line(
      points={{119.3,-42.25},{119.3,-78.625},{120,-78.625},{120,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_ColdIn_PL711.outlet, PL701_ColdSide_ColdIn.inlet)
    annotation (Line(
      points={{-140,-130},{-150,-130},{-150,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn.inlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-60,-109},{-60,-130},{-120,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn_PL721.outlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-40,-130},{-120,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn.inlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{30,-110},{30,-130},{-20,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL731.outlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{50,-130},{-20,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_ColdSide_ColdIn.inlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{120,-110},{120,-130},{70,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{170,-110.4},{170,-130},{70,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, TCV701.inlet) annotation (Line(
      points={{-191.3,-42.25},{-190,-42.25},{-190,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL701_ColdSide_HotOut.inlet) annotation (Line(
      points={{-190,-110},{-190,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TCV711.inlet) annotation (Line(
      points={{-101.3,-41.25},{-100,-41.25},{-100,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL711_ColdSide_HotOut.inlet) annotation (Line(
      points={{-100,-110},{-100,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TCV721.inlet) annotation (Line(
      points={{-11.3,-41.25},{-10,-41.25},{-10,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL721_ColdSide_HotOut.inlet) annotation (Line(
      points={{-10,-110},{-10,-149}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TCV731.inlet) annotation (Line(
      points={{78.7,-42.25},{78.7,-42},{80,-42},{80,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, PL731_ColdSide_HotOut.inlet) annotation (Line(
      points={{80,-110},{80,-149}},
      color={140,56,54},
      thickness=0.5));
  connect(powerTransfer.outlet, PR01.inlet) annotation (Line(
      points={{180,-65},{170,-65},{170,-89.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.inlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{180,-130},{70,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet, powerTransfer.inlet) annotation (Line(
      points={{200,-130},{210,-130},{210,-65},{200,-65}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.outlet, PL721_ColdSide_ColdIn_PL731.inlet) annotation (Line(
      points={{145,-111},{145,-130},{70,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01_m_flow.y, PR01.in_q_m3hr) annotation (Line(points={{166,-16},{
          146,-16},{146,-83},{159,-83},{159,-94.8},{164.02,-94.8}},
                                                           color={0,0,127}));
  connect(CoolingP.y, powerTransfer.Ptransfer)
    annotation (Line(points={{209,-25},{190,-25},{190,-57}},
                                                         color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{-46,30},{-48,30},{-48,29},{-49,29},{-49,30},{-52,
          30}},                                 color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{135,30},{128,30}}, color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{44,30},{38,30}}, color={0,0,127}));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-203,-100},{-198,-100}},
                                                     color={0,0,127}));
  connect(EX701.incold, TT703.inlet) annotation (Line(
      points={{-150.7,-42.25},{-150.7,-63},{-149.6,-63},{-149.6,-65}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening, TCV711_theta.y)
    annotation (Line(points={{-108,-100},{-114,-100}},
                                                   color={0,0,127}));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{-191.3,-42.25},{-189.6,-42.25},{-189.6,-64}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceIn.outlet, EX701.inhot) annotation (Line(
      points={{-190,-10},{-191.3,-10},{-191.3,-24.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.opening, TCV721_theta.y)
    annotation (Line(points={{-18,-100},{-24,-100}},
                                                 color={0,0,127}));
  connect(PL721_ColdSide_HotOut_PL731.outlet, powerTransfer.inlet) annotation (
      Line(
      points={{41,-190},{210,-190},{210,-65},{200,-65}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.opening, TCV731_theta.y)
    annotation (Line(points={{72,-100},{65,-100}}, color={0,0,127}));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{181,-160},{
          190,-160},{190,-138}},
                            color={0,0,127}));
  connect(EX711.incold, TT713.inlet) annotation (Line(
      points={{-60.7,-41.25},{-60.7,-52.125},{-60.6,-52.125},{-60.6,-63}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, TT723.inlet) annotation (Line(
      points={{29.3,-41.25},{29.3,-51.125},{29.4,-51.125},{29.4,-61}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, TT733.inlet) annotation (Line(
      points={{119.3,-42.25},{119.3,-51.625},{119.4,-51.625},{119.4,-61}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{-101.3,-41.25},{-100,-41.25},{-99.6,-63}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{-11.3,-41.25},{-10,-41.25},{-9.6,-62}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{78.7,-42.25},{78.7,-42},{80,-42},{80.4,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{-150,20},{-150,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet, EX701.outhot) annotation (Line(
      points={{-150,-10},{-150,-24.75},{-150.7,-24.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{-136,30},{-142,30}}, color={0,0,127}));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{-60,20},{-60,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet, EX711.outhot) annotation (Line(
      points={{-60,-10},{-60,-13.375},{-60.7,-13.375},{-60.7,-23.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721. outlet) annotation (Line(
      points={{30,20},{30,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet, EX721.outhot) annotation (Line(
      points={{30,-10},{30,-13.875},{29.3,-13.875},{29.3,-23.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{120,20},{120,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet, EX731.outhot) annotation (Line(
      points={{120,-10},{120,-13.875},{119.3,-13.875},{119.3,-24.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet, PL701_FCV701_FT701.outlet) annotation (Line(
      points={{-150,77},{-150,70}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet, PL711_FCV711_FT711.outlet) annotation (Line(
      points={{-60,77},{-60,70}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet, PL721_FCV721_FT721.outlet) annotation (Line(
      points={{30,77},{30,70}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet, PL731_FCV731_FT731.outlet) annotation (Line(
      points={{120,77},{120,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_III.inlet, PL731_FT731_rackL6L7_II.outlet)
    annotation (Line(
      points={{120,170},{120,160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_II.inlet, PL731_FT731_rackL6L7_I.outlet)
    annotation (Line(
      points={{120,140},{120,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7_I.inlet, PT731.inlet) annotation (Line(
      points={{120,110},{120,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet, TT731.inlet) annotation (Line(
      points={{120,100},{120,90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet, FT731.outlet) annotation (Line(
      points={{120,90},{120,83}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_III.inlet, PL721_FT721_rackL4L5_II.outlet)
    annotation (Line(
      points={{30,170},{30,160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_II.inlet, PL721_FT721_rackL4L5_I.outlet)
    annotation (Line(
      points={{30,140},{30,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5_I.inlet, PT721.inlet) annotation (Line(
      points={{30,110},{30,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet, TT721.inlet) annotation (Line(
      points={{30,100},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT721.inlet, FT721.outlet) annotation (Line(
      points={{30,90},{30,83}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_III.inlet, PL711_FT711_rackL3L4_II.outlet)
    annotation (Line(
      points={{-60,170},{-60,160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_II.inlet, PL711_FT711_rackL3L4_I.outlet)
    annotation (Line(
      points={{-60,140},{-60,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4_I.inlet, PT711.inlet) annotation (Line(
      points={{-60,110},{-60,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet, TT711.inlet) annotation (Line(
      points={{-60,100},{-60,90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT711.inlet, FT711.outlet) annotation (Line(
      points={{-60,90},{-60,83}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3_III.inlet, PL701_FT701_rackL2L3_II.outlet)
    annotation (Line(
      points={{-150,170},{-150,160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3_II.inlet, PL701_FT701_rackL2L3_I.outlet)
    annotation (Line(
      points={{-150,140},{-150,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3_I.inlet, PT701.inlet) annotation (Line(
      points={{-150,110},{-150,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, TT701.inlet) annotation (Line(
      points={{-150,100},{-150,90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet, FT701.outlet) annotation (Line(
      points={{-150,90},{-150,83}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet, PL731_SourceIn.inlet) annotation (Line(
      points={{80,20},{80,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet, PL721_SourceIn.inlet) annotation (Line(
      points={{-10,20},{-10,15},{-10,15},{-10,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet, PL701_SourceIn.inlet) annotation (Line(
      points={{-190,20},{-190,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet, PL711_SourceIn.inlet) annotation (Line(
      points={{-100,20},{-100,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_rackL6L7_hot_II.inlet, PL731_TT732_rackL6L7_hot_I.outlet)
    annotation (Line(
      points={{80,90},{80,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_rackL4L5_hot_II.inlet, PL721_TT722_rackL4L5_hot_I.outlet)
    annotation (Line(
      points={{-10,90},{-10,95},{-10,95},{-10,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_rackL3L4_hot_II.inlet, PL711_TT712_rackL3L4_hot_I.outlet)
    annotation (Line(
      points={{-100,90},{-100,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_rackL2L3_hot_II.inlet, PL701_TT702_rackL2L3_hot_I.outlet)
    annotation (Line(
      points={{-190,90},{-190,100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet, TT702.inlet) annotation (Line(
      points={{-190,40},{-190,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet, PT702.inlet) annotation (Line(
      points={{-190,50},{-190,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT702.inlet, PL701_TT702_rackL2L3_hot_II.outlet) annotation (Line(
      points={{-190,60},{-190,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet, TT712.inlet) annotation (Line(
      points={{-100,40},{-100,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet, PT712.inlet) annotation (Line(
      points={{-100,50},{-100,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet, PL711_TT712_rackL3L4_hot_II.outlet) annotation (Line(
      points={{-100,60},{-100,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet, TT722.inlet) annotation (Line(
      points={{-10,40},{-10,45},{-10,45},{-10,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet, PT722.inlet) annotation (Line(
      points={{-10,50},{-10,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet, PL721_TT722_rackL4L5_hot_II.outlet) annotation (Line(
      points={{-10,60},{-10,65},{-10,65},{-10,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet, TT732.inlet) annotation (Line(
      points={{80,40},{80,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet, PT732.inlet) annotation (Line(
      points={{80,50},{80,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet, PL731_TT732_rackL6L7_hot_II.outlet) annotation (Line(
      points={{80,60},{80,70}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-260,-220},{260,220}}, grid={1,1})),
      experiment(
      StopTime=1200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CoolingSystem;
