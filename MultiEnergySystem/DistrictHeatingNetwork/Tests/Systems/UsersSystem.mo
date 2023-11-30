within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model UsersSystem
  "Users Systems and some pipelines connected on the heating side"

  parameter Integer n = 3 "Number of volumes";
  parameter Types.MassFlowRate m_flow_Cool = 8.88;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Downstream "Location of pressure state";

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
  parameter Types.MassFlowRate m_flow_Users_total = 3.75;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;

  parameter Real q_m3h(unit = "m3/h") = 8*3600/1000;

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
        origin={-120,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-141,-73.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-51,-72.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={39,-72.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={129,-73.5})));
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
        origin={-30,-10})));
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
        origin={60,-10})));
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
        origin={150,-10})));
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
        origin={-120,20})));
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
        origin={-30,20})));
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
        origin={60,20})));
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
        origin={150,20})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{-85,-20},{-105,0}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{5,-20},{-15,0}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{95,-20},{75,0}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{186,-20},{166,0}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-162,-104})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-122,-105})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-33,-103})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={57,-101})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=T_start_UserIn, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={147,-101})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-72,-103})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={18,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=T_start_UserOut, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={108,-100})));
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
        origin={-120,-40})));
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
        origin={-30,-40})));
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
        origin={60,-40})));
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
        origin={150,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX701 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-122,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX711 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-32,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX721 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        T_start_SourceOut, p_start=pout_start_Source)
    "Flow sensor at the outlet outlet of EX731 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={148,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT701(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-122,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT711(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-32,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT721(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT731(T_start=T_start_SourceOut, p_start=pout_start_Source)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={148,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT701 "Pressure sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-122,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT711 "Pressure sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-32,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT721 "Pressure sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT731 "Pressure sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={148,60})));
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
        origin={-30,84})));
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
        origin={-120,84})));
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
        origin={60,84})));
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
        origin={150,84})));
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
        origin={-160,-10})));
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
        origin={-70,-10})));
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
        origin={20,-10})));
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
        origin={110,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT702(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-162,42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-162,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT712(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-72,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-72,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT722(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={18,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={18,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT732(T_start=T_start_SourceIn, p_start=pin_start_Source)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={108,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={108,20})));
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
        origin={-160,84})));
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
        origin={-70,84})));
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
        origin={20,84})));
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
        origin={110,84})));
  Sources.SourceMassFlow sourceHot(
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_Users_total)
                          annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={-159,180})));
  Sources.SinkPressure sinkHot(p0=200000, T0=(60 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={149,183})));
  Sources.SourceMassFlow sourceCold(
    p0=280000,
    T0(displayUnit="K") = 8 + 273.15,
    m_flow0=m_flow_Cool)  annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={189,-162})));
  Sources.SinkPressure sinkCold(p0=150000, T0=(15 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-201,-165})));
equation
  connect(PL701_FCV701_FT701.inlet, FCV701.outlet) annotation (Line(
      points={{-120,10},{-120,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet, FCV711.outlet) annotation (Line(
      points={{-30,10},{-30,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet, FCV721.outlet) annotation (Line(
      points={{60,10},{60,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet, FCV731.outlet) annotation (Line(
      points={{150,10},{150,0}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{-16,-10},{-18,-10},{-18,-11},{-19,-11},{-19,-10},
          {-22,-10}},                           color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{165,-10},{158,-10}},
                                                 color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{74,-10},{68,-10}},
                                               color={0,0,127}));
  connect(EX701.incold, TT703.inlet) annotation (Line(
      points={{-120.7,-82.25},{-120.7,-103},{-119.6,-103},{-119.6,-105}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{-161.3,-82.25},{-159.6,-82.25},{-159.6,-104}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, TT713.inlet) annotation (Line(
      points={{-30.7,-81.25},{-30.7,-92.125},{-30.6,-92.125},{-30.6,-103}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, TT723.inlet) annotation (Line(
      points={{59.3,-81.25},{59.3,-91.125},{59.4,-91.125},{59.4,-101}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, TT733.inlet) annotation (Line(
      points={{149.3,-82.25},{149.3,-91.625},{149.4,-91.625},{149.4,-101}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{-71.3,-81.25},{-70,-81.25},{-69.6,-103}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{18.7,-81.25},{20,-81.25},{20.4,-102}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{108.7,-82.25},{108.7,-82},{110,-82},{110.4,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{-120,-20},{-120,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet, EX701.outhot) annotation (Line(
      points={{-120,-50},{-120,-64.75},{-120.7,-64.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{-106,-10},{-112,-10}},
                                                   color={0,0,127}));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{-30,-20},{-30,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet, EX711.outhot) annotation (Line(
      points={{-30,-50},{-30,-53.375},{-30.7,-53.375},{-30.7,-63.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721. outlet) annotation (Line(
      points={{60,-20},{60,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet, EX721.outhot) annotation (Line(
      points={{60,-50},{60,-53.875},{59.3,-53.875},{59.3,-63.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{150,-20},{150,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet, EX731.outhot) annotation (Line(
      points={{150,-50},{150,-53.875},{149.3,-53.875},{149.3,-64.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet, PL701_FCV701_FT701.outlet) annotation (Line(
      points={{-120,37},{-120,30}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet, PL711_FCV711_FT711.outlet) annotation (Line(
      points={{-30,37},{-30,30}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet, PL721_FCV721_FT721.outlet) annotation (Line(
      points={{60,37},{60,30}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet, PL731_FCV731_FT731.outlet) annotation (Line(
      points={{150,37},{150,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.inlet, PT731.inlet) annotation (Line(
      points={{150,74},{150,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet, TT731.inlet) annotation (Line(
      points={{150,60},{150,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet, FT731.outlet) annotation (Line(
      points={{150,50},{150,43}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.inlet, PT721.inlet) annotation (Line(
      points={{60,74},{60,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet, TT721.inlet) annotation (Line(
      points={{60,60},{60,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT721.inlet, FT721.outlet) annotation (Line(
      points={{60,50},{60,43}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet, PT711.inlet) annotation (Line(
      points={{-30,74},{-30,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet, TT711.inlet) annotation (Line(
      points={{-30,60},{-30,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT711.inlet, FT711.outlet) annotation (Line(
      points={{-30,50},{-30,43}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.inlet, PT701.inlet) annotation (Line(
      points={{-120,74},{-120,60}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, TT701.inlet) annotation (Line(
      points={{-120,60},{-120,50}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet, FT701.outlet) annotation (Line(
      points={{-120,50},{-120,43}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet, TT702.inlet) annotation (Line(
      points={{-160,0},{-160,42}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet, PT702.inlet) annotation (Line(
      points={{-160,42},{-160,52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet, TT712.inlet) annotation (Line(
      points={{-70,0},{-70,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet, PT712.inlet) annotation (Line(
      points={{-70,10},{-70,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet, PL711_rackL3L4_TT712.outlet) annotation (Line(
      points={{-70,20},{-70,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet, TT722.inlet) annotation (Line(
      points={{20,0},{20,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet, PT722.inlet) annotation (Line(
      points={{20,10},{20,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet, PL721_rackL4L5_TT722.outlet) annotation (Line(
      points={{20,20},{20,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet, TT732.inlet) annotation (Line(
      points={{110,0},{110,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet, PT732.inlet) annotation (Line(
      points={{110,10},{110,20}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold.outlet, TT733.inlet) annotation (Line(
      points={{176,-162},{150,-162},{150,-96},{149.4,-96},{149.4,-101}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet, EX701.inhot) annotation (Line(
      points={{-160,-20},{-161.3,-20},{-161.3,-64.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet, EX711.inhot) annotation (Line(
      points={{-70,-20},{-71.3,-20},{-71.3,-63.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet, EX721.inhot) annotation (Line(
      points={{20,-20},{18.7,-20},{18.7,-63.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet, EX731.inhot) annotation (Line(
      points={{110,-20},{110,-50},{108.7,-50},{108.7,-64.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.outlet, PT702.inlet) annotation (Line(
      points={{-160,74},{-160,52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.outlet, PT732.inlet) annotation (Line(
      points={{110,74},{110,20}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, PL701_rackL2L3_TT702.inlet) annotation (Line(
      points={{-159,167},{-160,167},{-160,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_rackL3L4_TT712.inlet, PL701_rackL2L3_TT702.inlet) annotation (
      Line(
      points={{-70,94},{-70,108},{-160,108},{-160,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_rackL4L5_TT722.inlet, PL701_rackL2L3_TT702.inlet) annotation (
      Line(
      points={{20,94},{20,126},{-160,126},{-160,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, PL701_rackL2L3_TT702.inlet) annotation (
      Line(
      points={{110,94},{110,146},{-160,146},{-160,94}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, PL731_FT731_rackL6L7.outlet) annotation (Line(
      points={{149,173},{149,133.5},{150,133.5},{150,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, PL731_FT731_rackL6L7.outlet) annotation (
     Line(
      points={{60,94},{60,114},{150,114},{150,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, PL731_FT731_rackL6L7.outlet) annotation (
     Line(
      points={{-30,94},{-30,132},{150,132},{150,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, PL731_FT731_rackL6L7.outlet) annotation (
     Line(
      points={{-120,94},{-120,156},{149,156},{149,133.5},{150,133.5},{150,94}},
      color={140,56,54},
      thickness=0.5));

  connect(sinkCold.inlet, TT704.inlet) annotation (Line(
      points={{-191,-165},{-159.6,-165},{-159.6,-104}},
      color={140,56,54},
      thickness=0.5));
  connect(TT714.inlet, TT704.inlet) annotation (Line(
      points={{-69.6,-103},{-69.6,-114},{-159.6,-114},{-159.6,-104}},
      color={140,56,54},
      thickness=0.5));
  connect(TT724.inlet, TT704.inlet) annotation (Line(
      points={{20.4,-102},{20,-102},{20,-126},{-159.6,-126},{-159.6,-104}},
      color={140,56,54},
      thickness=0.5));
  connect(TT734.inlet, TT704.inlet) annotation (Line(
      points={{110.4,-100},{110.4,-138},{-159.6,-138},{-159.6,-104}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723.inlet, TT733.inlet) annotation (Line(
      points={{59.4,-101},{59.4,-116},{150,-116},{150,-96},{149.4,-96},{149.4,
          -101}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet, TT733.inlet) annotation (Line(
      points={{-30.6,-103},{-30.6,-130},{150,-130},{150,-98},{149.4,-98},{149.4,
          -101}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet, TT733.inlet) annotation (Line(
      points={{-119.6,-105},{-119.6,-146},{150,-146},{150,-96},{149.4,-96},{
          149.4,-101}},
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
