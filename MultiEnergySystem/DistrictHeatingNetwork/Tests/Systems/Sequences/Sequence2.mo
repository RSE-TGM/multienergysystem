within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
partial model Sequence2
  extends Sequence1(hctype = Choices.Pipe.HCtypes.Downstream);

  // EX701
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter Types.Pressure EX701_pin_hot = 2.5e5;
  parameter Types.Pressure EX701_pout_hot = 2.4e5;
  parameter Types.Pressure FCV701_pout = 2e5;
  parameter Types.Temperature EX701_Tin_hot = 17 + 273.15;
  parameter Types.Temperature EX701_Tout_hot = 15 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter Types.MassFlowRate m_flow_EX701_cold = EX701_q_m3h_cold*1000/3600;
  parameter Types.Pressure EX701_pin_cold = 2.2e5;
  parameter Types.Pressure EX701_pout_cold = 2e5;
  parameter Types.Temperature EX701_Tin_cold = 7 + 273.15;
  parameter Types.Temperature EX701_Tout_cold = 14 + 273.15;

  // EX711
  parameter Real EX711_q_m3h_hot = 2.5;
  parameter Types.Pressure EX711_pin_hot = 2e5;
  parameter Types.Pressure EX711_pout_hot = 1.99e5;
  parameter Types.Pressure FCV711_pout = 1.98e5;
  parameter Types.Temperature EX711_Tin_hot = 17 + 273.15;
  parameter Types.Temperature EX711_Tout_hot = 15 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter Types.MassFlowRate m_flow_EX711_cold = EX711_q_m3h_cold*1000/3600;
  parameter Types.Pressure EX711_pin_cold = 2.2e5;
  parameter Types.Pressure EX711_pout_cold = 2e5;
  parameter Types.Temperature EX711_Tin_cold = 7 + 273.15;
  parameter Types.Temperature EX711_Tout_cold = 14 + 273.15;

  // EX721
  parameter Real EX721_q_m3h_hot = 2.5;
  parameter Types.Pressure EX721_pin_hot = 2e5;
  parameter Types.Pressure EX721_pout_hot = 1.99e5;
  parameter Types.Pressure FCV721_pout = 1.98e5;
  parameter Types.Temperature EX721_Tin_hot = 17 + 273.15;
  parameter Types.Temperature EX721_Tout_hot = 15 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter Types.MassFlowRate m_flow_EX721_cold = EX721_q_m3h_cold*1000/3600;
  parameter Types.Pressure EX721_pin_cold = 2.2e5;
  parameter Types.Pressure EX721_pout_cold = 2e5;
  parameter Types.Temperature EX721_Tin_cold = 7 + 273.15;
  parameter Types.Temperature EX721_Tout_cold = 14 + 273.15;

  // EX731
  parameter Real EX731_q_m3h_hot = 2.5;
  parameter Types.Pressure EX731_pin_hot = 2e5;
  parameter Types.Pressure EX731_pout_hot = 1.99e5;
  parameter Types.Pressure FCV731_pout = 1.98e5;
  parameter Types.Temperature EX731_Tin_hot = 17 + 273.15;
  parameter Types.Temperature EX731_Tout_hot = 15 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  parameter Types.MassFlowRate m_flow_EX731_cold = 0.5*1000/3600;
  parameter Types.Pressure EX731_pin_cold = 2.2e5;
  parameter Types.Pressure EX731_pout_cold = 2e5;
  parameter Types.Temperature EX731_Tin_cold = 7 + 273.15;
  parameter Types.Temperature EX731_Tout_cold = 14 + 273.15;



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


  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV701.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = EX701_Tout_hot,
    pin_start=EX701_pout_hot,
    q_m3h_start=EX701_q_m3h_cold)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={140,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(
    hctype_hot=hctype,
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    hctype_cold=hctype,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
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
        origin={119,-135.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={140,-42})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{179,-80},{159,-60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    pin_start=EX701_pout_hot,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={140,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        EX701_Tout_hot,    p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={142,-24})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT701(T_start=EX701_Tout_hot,    p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={142,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT701 "Pressure sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={142,6})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={140,22})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={100,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT702(T_start=EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={98,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={98,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype)
                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={100,22})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(
    hctype_hot=hctype,
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    hctype_cold=hctype,
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
        origin={421,-138.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV711.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV711.dp_nom,
    Tin_start(displayUnit="K") = EX711_Tout_hot,
    pin_start=EX711_pout_hot,
    q_m3h_start=EX711_q_m3h_hot)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={440,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FCV711_FT711(
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
    t=t_S700,
    pin_start=FCV711_pout,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype)
                  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={440,-40})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{479,-80},{459,-60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_SourceOut_FCV711(
    L=L_HX711_SourceOut_FCV711,
    h=h_HX711_SourceOut_FCV711,
    t=t_S700,
    pin_start=EX711_pout_hot,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={440,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={442,-22})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={442,-6})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT711 "Pressure sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={442,8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_FT711_rackL3L4(
    L=L_FT711_rackL3L4,
    h=h_FT711_rackL3L4,
    t=t_S700,
    pin_start=FCV711_pout,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={440,24})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_TT712_SourceIn(
    L=L_HX711_TT712_SourceIn,
    h=h_HX711_TT712_SourceIn,
    t=t_S700,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={400,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT712(T_start=EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={398,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={398,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_rackL3L4_TT712(
    L=L_rackL3L4_TT712,
    h=h_rackL3L4_TT712,
    t=t_S700,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={400,24})));
equation
  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{140,-52},{140,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{140,-80},{140,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{140,-112},{140,-126.75},{139.3,-126.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y,FCV701. opening)
    annotation (Line(points={{158,-70},{148,-70}}, color={0,0,127}));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{140,-27},{140,-32}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.inlet,PT701. inlet) annotation (Line(
      points={{140,12},{140,6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{100,-62},{100,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{100,-40},{100,-2.22045e-16}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{100,-82},{98.7,-82},{98.7,-126.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.outlet,PT702. inlet) annotation (Line(
      points={{100,12},{100,-2.22045e-16}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
      Line(
      points={{100,32},{100,60},{60,60},{60,205},{60,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet)
    annotation (Line(
      points={{140,32},{140,80},{80,80},{80,265},{90,265}},
      color={140,56,54},
      thickness=0.5));

  connect(PL711_FCV711_FT711.inlet,FCV711. outlet) annotation (Line(
      points={{440,-50},{440,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{440,-80},{440,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet,EX711. outhot) annotation (Line(
      points={{440,-110},{440,-113.375},{441.3,-113.375},{441.3,-129.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet,PL711_FCV711_FT711. outlet) annotation (Line(
      points={{440,-25},{440,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.inlet,PT711. inlet) annotation (Line(
      points={{440,14},{440,8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet,TT712. inlet) annotation (Line(
      points={{400,-60},{400,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{400,-40},{400,-2.22045e-16}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet,PL711_rackL3L4_TT712. outlet) annotation (Line(
      points={{400,-2.22045e-16},{400,14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet,EX711. inhot) annotation (Line(
      points={{400,-80},{400.7,-80},{400.7,-129.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.opening, FCV711_theta.y)
    annotation (Line(points={{448,-70},{458,-70}}, color={0,0,127}));
  connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
      Line(
      points={{400,34},{400,100},{160,100},{160,205},{180,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet)
    annotation (Line(
      points={{440,34},{440,120},{180,120},{180,265},{110,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, TT701.inlet) annotation (Line(
      points={{140,6},{140,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet, FT701.outlet) annotation (Line(
      points={{140,-8},{140,-21}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet, TT711.inlet) annotation (Line(
      points={{440,8},{440,-6}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet, TT711.inlet) annotation (Line(
      points={{440,-19},{440,-6}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(StopTime=1000, __Dymola_Algorithm="Dassl"));
end Sequence2;
