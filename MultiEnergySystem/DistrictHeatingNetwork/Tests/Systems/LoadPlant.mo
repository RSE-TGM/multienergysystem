within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model LoadPlant
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV701(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV701.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV701.dp_nom,
    Tin_start(displayUnit="K") = EX701_Tout_hot,
    pin_start=EX701_pout_hot,
    q_m3h_start=EX701_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-218,10})));

  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701(
    redeclare model Medium = Medium,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=9,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-239,-55.5})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL701_FCV701_FT701(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-218,38})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL701_SourceOut_FCV701(
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    pin_start=EX701_pout_hot,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-218,-22})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-216,56})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-216,72})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-216,86})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL701_TT702_SourceIn(
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-258,8})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT702(T_start=
        EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-260,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-260,80})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX711(
    redeclare model Medium = Medium,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={63,-58.5})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV711(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV711.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV711.dp_nom,
    Tin_start(displayUnit="K") = EX711_Tout_hot,
    pin_start=EX711_pout_hot,
    q_m3h_start=EX711_q_m3h_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={82,10})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL711_FCV711_FT711(
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
    t=t_S700,
    pin_start=FCV711_pout,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={82,40})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL711_SourceOut_FCV711(
    L=L_HX711_SourceOut_FCV711,
    h=h_HX711_SourceOut_FCV711,
    t=t_S700,
    pin_start=EX711_pout_hot,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={82,-20})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={84,58})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={84,74})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={84,88})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL711_TT712_SourceIn(
    L=L_HX711_TT712_SourceIn,
    h=h_HX711_TT712_SourceIn,
    t=t_S700,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={42,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT712(T_start=
        EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={40,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={40,80})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX721(
    redeclare model Medium = Medium,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={221,-58.5})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV721(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV721.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV721.dp_nom,
    Tin_start(displayUnit="K") = EX721_Tout_hot,
    pin_start=EX721_pout_hot,
    q_m3h_start=EX721_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={242,10})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL721_FCV721_FT721(
    L=L_FCV721_FT721,
    h=h_FCV721_FT721,
    t=t_S700,
    pin_start=FCV721_pout,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={242,38})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL721_SourceOut_FCV721(
    L=L_HX721_SourceOut_FCV721,
    h=h_HX721_SourceOut_FCV721,
    t=t_S700,
    pin_start=EX721_pout_hot,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={242,-20})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={244,58})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={244,74})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={244,88})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL721_TT722_SourceIn(
    L=L_HX721_TT722_SourceIn,
    h=h_HX721_TT722_SourceIn,
    t=t_S700,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={202,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT722(T_start=
        EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={200,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={200,80})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX731(
    redeclare model Medium = Medium,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-79,-57.5})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV731(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV731.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV731.dp_nom,
    Tin_start(displayUnit="K") = EX731_Tout_hot,
    pin_start=EX731_pout_hot,
    q_m3h_start=EX731_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-58,10})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL731_FCV731_FT731(
    L=L_FCV731_FT731,
    h=h_FCV731_FT731,
    t=t_S700,
    pin_start=FCV731_pout,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-58,36})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL731_SourceOut_FCV731(
    L=L_HX731_SourceOut_FCV731,
    h=h_HX731_SourceOut_FCV731,
    t=t_S700,
    pin_start=EX731_pout_hot,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-58,-20})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-56,54})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-56,70})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-56,84})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL731_TT732_SourceIn(
    L=L_HX731_TT732_SourceIn,
    h=h_HX731_TT732_SourceIn,
    t=t_S700,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-98,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT732(T_start=
        EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-100,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-100,80})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV731(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV731.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV731.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV731.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-98,-118})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT734(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-100.5,-91.5})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV721(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV721.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV721.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={201.5,-118})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT723(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={239,-93})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT724(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={200,-94})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV711(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV711.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV711.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV711.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={42,-118})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT713(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={79,-90})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT714(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={40,-90})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV701(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV701.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV701.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV701.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-258,-118})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT704(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-260,-91})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT703(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-222,-86})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT733(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-61,-92})));
  DistrictHeatingNetwork.Sources.SourcePressure VER901(
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={287,-159})));

  parameter Integer n = 2 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity;

  // EX701
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=15 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=
      EX701_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;

  // EX711
  parameter Real EX711_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=15 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=
      EX711_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15;

  // EX721
  parameter Real EX721_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=15 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=
      EX721_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=14 + 273.15;

  // EX731
  parameter Real EX731_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=15 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=0.5*1000/
      3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV731theta[:,:] = [0, 1; 100, 1];

  // Lengths of pipelines COLD SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX711_SourceOut_FCV711=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX721_SourceOut_FCV721=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX731_SourceOut_FCV731=0.6;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX711_SourceOut_FCV711=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX721_SourceOut_FCV721=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX731_SourceOut_FCV731=0;

//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=2.25;

  parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
  parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=0;

  parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT711_rackL3L4=1 + 0.7 + 5 + 9.2
       + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT711_rackL3L4=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT721_rackL4L5=1 + 2 + 5 + 9 +
      1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT721_rackL4L5=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT731_rackL6L7=1.2 + 4 + 0.25 +
      0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_FT731_rackL6L7=-0.25 - 0.5;

  // Lengths of pipelines HOT SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX711_TT712_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX721_TT722_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX731_TT732_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX711_TT712_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX721_TT722_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX731_TT732_SourceIn=1.5 + 1.0;

  parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL3L4_TT712=1 + 0.7 + 5 + 9.2
       + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL3L4_TT712=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL4L5_TT722=1 + 2 + 5 + 9 +
      1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL4L5_TT722=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL6L7_TT732=1.2 + 4 + 0.25 +
      0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_rackL6L7_TT732=-0.25 - 0.5;

  // Internal diameters & thickness
  parameter DistrictHeatingNetwork.Types.Length t_Source=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Source=32e-3;

  //1. Cooling System

  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Cool=0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Cool=0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_PR01=
      pout_start_Cool;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_PR01=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_Cool=16 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_Cool=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Cool=q_Cool*998/3600;
  parameter Real q_Cool(unit = "m3/h") = 32;
  parameter DistrictHeatingNetwork.Types.Length t_RR=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_RR=85e-3;
  parameter Real Kvalve = 90;
  parameter Real FCVR01theta[:,:] = [0, 0.5; 100, 0.5];
  //parameter Real PR01omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40; 300, 2*3.141592654*40; 400, 2*3.141592654*40];
  parameter Real PR01omega[:,:] = [0, 32.5; 100, 32.5];

  //2. Users System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users=3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users=2.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature T_start_UserIn=7 + 273.15;
  parameter Real q_Users_total(unit = "m3/h") = 20;
  parameter Real q_Users(unit = "m3/h") = q_Users_total/4;
  parameter DistrictHeatingNetwork.Types.Length t_Users=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Users=32e-3;
  parameter DistrictHeatingNetwork.Types.Length t_Rack=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Rack=51e-3;
  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];

   // Lengths of pipelines source side
  parameter DistrictHeatingNetwork.Types.Length L_VER901_FCVR01=1;
  parameter DistrictHeatingNetwork.Types.Length h_VER901_FCVR01=-0.8;
  parameter DistrictHeatingNetwork.Types.Length L_FCVR01_FTR03=2.95;
  parameter DistrictHeatingNetwork.Types.Length h_FCVR01_FTR03=2.35;
  parameter DistrictHeatingNetwork.Types.Length L_FTR03_PTR01=1.05;
  parameter DistrictHeatingNetwork.Types.Length h_FTR03_PTR01=0.25;
  parameter DistrictHeatingNetwork.Types.Length L_PTR01_FTR01=1.90;
  parameter DistrictHeatingNetwork.Types.Length h_PTR01_FTR01=-1.90;
  parameter DistrictHeatingNetwork.Types.Length L_FTR01_RR01=1.97;
  parameter DistrictHeatingNetwork.Types.Length h_FTR01_RR01=-0.72;
  parameter DistrictHeatingNetwork.Types.Length L_RR01_PR01=1.275;
  parameter DistrictHeatingNetwork.Types.Length h_RR01_PR01=0;
  parameter DistrictHeatingNetwork.Types.Length L_PR01_PTR02=2.8;
  parameter DistrictHeatingNetwork.Types.Length h_PR01_PTR02=1;
  parameter DistrictHeatingNetwork.Types.Length L_TTR02_VER901=0.43;
  parameter DistrictHeatingNetwork.Types.Length h_TTR02_VER901=0;

  parameter DistrictHeatingNetwork.Types.Length L_UsersIn_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersIn_EX721=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_cold=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_cold=0.50*1;

  parameter DistrictHeatingNetwork.Types.Length L_UsersOut_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersOut_EX721=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_hot=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_hot=0;

  parameter DistrictHeatingNetwork.Types.Length L_TT704_TCV701=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.65;

  parameter DistrictHeatingNetwork.Types.Length L_TCV701_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV701_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV711_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV711_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV721_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV721_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV731_rUsersOut=1 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_TCV731_rUsersOut=1;

  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT703=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT703=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT713=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT713=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT723=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT723=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT733=1.65 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT733=-1.65*0.1;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersIn=0.8 + 1.2 + 0.5 + 2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersIn=0.8 + 0.6;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersOut=2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersOut=0;

  parameter Real ToutcoolSP[:,:] = [0, 7; 50, 7; 60, 17; 100, 17];

  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h1 = 0;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h2 = 0;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h3 = 3;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h4 = 5;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure dpRR = 1e5;

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT712 = "TT712" "Matrix name in file";
  parameter String matrixTT722 = "TT722" "Matrix name in file";
  parameter String matrixTT732 = "TT732" "Matrix name in file";

  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT711 = "TT711" "Matrix name in file";
  parameter String matrixTT721 = "TT721" "Matrix name in file";
  parameter String matrixTT731 = "TT731" "Matrix name in file";

  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT713 = "TT713" "Matrix name in file";
  parameter String matrixTT723 = "TT723" "Matrix name in file";
  parameter String matrixTT733 = "TT733" "Matrix name in file";

  parameter String matrixTT704 = "TT704" "Matrix name in file";
  parameter String matrixTT714 = "TT714" "Matrix name in file";
  parameter String matrixTT724 = "TT724" "Matrix name in file";
  parameter String matrixTT734 = "TT734" "Matrix name in file";

  parameter String matrixFT701 = "FT701" "Matrix name in file";
  parameter String matrixFT711 = "FT711" "Matrix name in file";
  parameter String matrixFT721 = "FT721" "Matrix name in file";
  parameter String matrixFT731 = "FT731" "Matrix name in file";

  parameter String matrixPT701 = "PT701" "Matrix name in file";
  parameter String matrixPT711 = "PT711" "Matrix name in file";
  parameter String matrixPT721 = "PT721" "Matrix name in file";
  parameter String matrixPT731 = "PT731" "Matrix name in file";

  parameter String matrixPT702 = "PT702" "Matrix name in file";
  parameter String matrixPT712 = "PT712" "Matrix name in file";
  parameter String matrixPT722 = "PT722" "Matrix name in file";
  parameter String matrixPT732 = "PT732" "Matrix name in file";

  parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
  parameter String matrixthetaFCV711 = "theta_FCV711" "Matrix name in file";
  parameter String matrixthetaFCV721 = "theta_FCV721" "Matrix name in file";
  parameter String matrixthetaFCV731 = "theta_FCV731" "Matrix name in file";

  parameter String matrixthetaTCV701 = "theta_TCV701" "Matrix name in file";
  parameter String matrixthetaTCV711 = "theta_TCV711" "Matrix name in file";
  parameter String matrixthetaTCV721 = "theta_TCV721" "Matrix name in file";
  parameter String matrixthetaTCV731 = "theta_TCV731" "Matrix name in file";

  parameter String matrixthetaFCVR01 = "theta_FCVR01" "Matrix name in file";

  parameter String matrixfPR01 = "f_PR01" "Matrix name in file";

  parameter String matrixTTR02 = "TTR02" "Matrix name in file";

  parameter String matrixFTR01 = "FTR01" "Matrix name in file";
  parameter String matrixFTR03 = "FTR03" "Matrix name in file";

  parameter String timenoscale = "time" "Matrix name in file";

  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT701) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT711,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT721,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT731,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";

  final parameter Real TT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT702,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT712,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT722,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT732,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";

  final parameter Real TT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT703,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT713,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT723,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT733,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";

  final parameter Real TT_704[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_714[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT714,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_724[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT724,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_734[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT734,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";

  final parameter Real PT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT711,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT721,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT731,dim[1],dim[2])*1e5 "Matrix data";

  final parameter Real PT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT702,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT712,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT722,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT732,dim[1],dim[2])*1e5 "Matrix data";

  final parameter Real FT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT701,dim[1],dim[2])*990/3600 "Matrix data";
  final parameter Real FT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT711,dim[1],dim[2])*990/3600 "Matrix data";
  final parameter Real FT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT721,dim[1],dim[2])*990/3600 "Matrix data";
  final parameter Real FT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT731,dim[1],dim[2])*990/3600 "Matrix data";

  final parameter Real thetaFCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaTCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaFCVR01[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCVR01,dim[1],dim[2]) "Matrix data";

  final parameter Real fPR01[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixfPR01,dim[1],dim[2])*2*Modelica.Constants.pi*5/3 "Matrix data";
  final parameter Real TT_R02[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTTR02,dim[1],dim[2]) "Matrix data";

  final parameter Real FT_R01[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFTR01,dim[1],dim[2])*995/3600 "Matrix data";
  final parameter Real FT_R03[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFTR03,dim[1],dim[2])*995/3600 "Matrix data";

  final parameter Real FT_703[:,:] = (FT_701.*(TT_702 - TT_701)./(TT_704-TT_703));
  final parameter Real FT_713[:,:] = (FT_711.*(TT_712 - TT_711)./(TT_714-TT_713));
  final parameter Real FT_723[:,:] = (FT_721.*(TT_722 - TT_721)./(TT_724-TT_723));
  final parameter Real FT_733[:,:] = (FT_731.*(TT_732 - TT_731)./(TT_734-TT_733));

  Modelica.Blocks.Sources.TimeTable EX701_p(table=[t,PT_702])
    annotation (Placement(transformation(extent={{-312,140},{-292,160}})));
  Modelica.Blocks.Sources.TimeTable EX701_T(table=[t,TT_702])
    annotation (Placement(transformation(extent={{-312,180},{-292,200}})));
  inner System                        system
    annotation (Placement(transformation(extent={{298,280},{318,300}})));
  Modelica.Blocks.Sources.TimeTable EX711_p(table=[t,PT_712])
    annotation (Placement(transformation(extent={{-20,140},{0,160}})));
  Modelica.Blocks.Sources.TimeTable EX711_T(table=[t,TT_712])
    annotation (Placement(transformation(extent={{-20,180},{0,200}})));
  Modelica.Blocks.Sources.TimeTable EX721_p(table=[t,PT_722])
    annotation (Placement(transformation(extent={{140,138},{160,158}})));
  Modelica.Blocks.Sources.TimeTable EX721_T(table=[t,TT_722])
    annotation (Placement(transformation(extent={{140,174},{160,194}})));
  Modelica.Blocks.Sources.TimeTable EX731_p(table=[t,PT_732])
    annotation (Placement(transformation(extent={{-162,140},{-142,160}})));
  Modelica.Blocks.Sources.TimeTable EX731_T(table=[t,TT_732])
    annotation (Placement(transformation(extent={{-162,180},{-142,200}})));
  Modelica.Blocks.Sources.TimeTable EX731_mflow(table=[t,FT_731])
    annotation (Placement(transformation(extent={{-24,140},{-44,160}})));
  Modelica.Blocks.Sources.TimeTable EX711_mflow(table=[t,FT_711])
    annotation (Placement(transformation(extent={{126,138},{106,158}})));
  Modelica.Blocks.Sources.TimeTable EX721_mflow(table=[t,FT_721])
    annotation (Placement(transformation(extent={{290,138},{270,158}})));
  Modelica.Blocks.Sources.TimeTable EX701_mflow(table=[t,FT_701])
    annotation (Placement(transformation(extent={{-176,138},{-196,158}})));
  Sources.SourcePressure                        sourceP0(use_in_p0=true, use_in_T0=true)
    annotation (Placement(transformation(extent={{-296,98},{-276,118}})));
  Sources.SourcePressure                        sourceP1(use_in_p0=true, use_in_T0=true)
    annotation (Placement(transformation(extent={{4,98},{24,118}})));
  Sources.SourcePressure                        sourceP2(use_in_p0=true, use_in_T0=true)
    annotation (Placement(transformation(extent={{164,98},{184,118}})));
  Sources.SourcePressure                        sourceP3(use_in_p0=true, use_in_T0=true)
    annotation (Placement(transformation(extent={{-134,98},{-114,118}})));
  Sources.SinkMassFlow                        sinkMassFlowP3(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-52,98},{-32,118}})));
  Sources.SinkMassFlow                        sinkMassFlowP1(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{92,98},{112,118}})));
  Sources.SinkMassFlow                        sinkMassFlowP2(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{256,98},{276,118}})));
  Sources.SinkMassFlow                        sinkMassFlowP0(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-210,98},{-190,118}})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=[t,thetaTCV701])
    annotation (Placement(transformation(extent={{-300,-128},{-280,-108}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=[t,thetaTCV731])
    annotation (Placement(transformation(extent={{-140,-128},{-120,-108}})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=[t,thetaTCV711])
    annotation (Placement(transformation(extent={{1,-128},{21,-108}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=[t,thetaTCV721])
    annotation (Placement(transformation(extent={{161,-128},{181,-108}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=[t,thetaFCV701])
    annotation (Placement(transformation(extent={{-181,0},{-201,20}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=[t,thetaFCV731])
    annotation (Placement(transformation(extent={{-20,0},{-40,20}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=[t,thetaFCV711])
    annotation (Placement(transformation(extent={{121,0},{101,20}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=[t,thetaFCV721])
    annotation (Placement(transformation(extent={{282,0},{262,20}})));
  Sources.SinkMassFlow FT723(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15) annotation (Placement(transformation(extent={{184,-148},{164,-168}})));
  Modelica.Blocks.Sources.TimeTable FT723_(table=[t,FT_723])
    annotation (Placement(transformation(extent={{150,-200},{170,-180}})));
  Modelica.Blocks.Sources.TimeTable TT723_(table=[t,TT_723])
    annotation (Placement(transformation(extent={{254,-118},{274,-98}})));
  Sources.SinkMassFlow FT713(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15) annotation (Placement(transformation(extent={{22,-148},{2,-168}})));
  Modelica.Blocks.Sources.TimeTable FT713_(table=[t,FT_713])
    annotation (Placement(transformation(extent={{-20,-200},{0,-180}})));
  Sources.SourcePressure                        VER1(
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={101,-159})));
  Modelica.Blocks.Sources.TimeTable TT713_(table=[t,TT_713])
    annotation (Placement(transformation(extent={{136,-128},{116,-108}})));
  Sources.SourcePressure                        VER2(
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-37,-157})));
  Modelica.Blocks.Sources.TimeTable TT733_(table=[t,TT_733])
    annotation (Placement(transformation(extent={{-10,-128},{-30,-108}})));
  Sources.SourcePressure                        VER3(
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-199,-159})));
  Modelica.Blocks.Sources.TimeTable TT703_(table=[t,TT_703])
    annotation (Placement(transformation(extent={{-172,-130},{-192,-110}})));
  Sources.SinkMassFlow FT733(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15) annotation (Placement(transformation(extent={{-116,-148},{-136,-168}})));
  Modelica.Blocks.Sources.TimeTable FT733_(table=[t,FT_733])
    annotation (Placement(transformation(extent={{-158,-200},{-138,-180}})));
  Sources.SinkMassFlow FT703(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15) annotation (Placement(transformation(extent={{-276,-148},{-296,-168}})));
  Modelica.Blocks.Sources.TimeTable FT703_(table=[t,FT_703])
    annotation (Placement(transformation(extent={{-318,-200},{-298,-180}})));
equation
  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{-218,28},{-218,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{-218,0},{-218,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{-218,-32},{-218,-46.75},{-218.7,-46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{-218,53},{-218,48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{-258,18},{-258,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-258,40},{-258,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{-258,-2},{-259.3,-2},{-259.3,-46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet,FCV711. outlet) annotation (Line(
      points={{82,30},{82,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{82,0},{82,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet,EX711. outhot) annotation (Line(
      points={{82,-30},{82,-33.375},{83.3,-33.375},{83.3,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet,PL711_FCV711_FT711. outlet) annotation (Line(
      points={{82,55},{82,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet,TT712. inlet) annotation (Line(
      points={{42,20},{42,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{42,40},{42,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet,EX711. inhot) annotation (Line(
      points={{42,0},{42.7,0},{42.7,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{-218,86},{-218,72}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{-218,72},{-218,59}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{82,88},{82,74}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{82,61},{82,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet,FCV721. outlet) annotation (Line(
      points={{242,28},{242,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721.outlet) annotation (Line(
      points={{242,0},{242,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet,EX721.outhot) annotation (Line(
      points={{242,-30},{242,-39.875},{241.3,-39.875},{241.3,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet,PL721_FCV721_FT721. outlet) annotation (Line(
      points={{242,55},{242,48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet,TT722.inlet) annotation (Line(
      points={{202,20},{202,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{202,40},{202,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet,EX721. inhot) annotation (Line(
      points={{202,0},{202,-50},{200,-50},{200,-49.75},{200.7,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet,FCV731. outlet) annotation (Line(
      points={{-58,26},{-58,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{-58,0},{-58,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet,EX731. outhot) annotation (Line(
      points={{-58,-30},{-58,-37.875},{-58.7,-37.875},{-58.7,-48.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet,PL731_FCV731_FT731. outlet) annotation (Line(
      points={{-58,51},{-58,46}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet,TT732. inlet) annotation (Line(
      points={{-98,20},{-98,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{-98,40},{-98,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet,EX731. inhot) annotation (Line(
      points={{-98,0},{-98,-34},{-99.3,-34},{-99.3,-48.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{242,88},{242,74}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{242,61},{242,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{-58,84},{-58,70}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{-58,70},{-58,57}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold,TT734. inlet) annotation (Line(
      points={{-99.3,-66.25},{-99.3,-69.875},{-98.3,-69.875},{-98.3,-91.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,TT723. inlet) annotation (Line(
      points={{241.3,-67.25},{241.3,-83.125},{241.4,-83.125},{241.4,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TT724. inlet) annotation (Line(
      points={{200.7,-67.25},{202.4,-67.25},{202.4,-94}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,TT714. inlet) annotation (Line(
      points={{42.7,-67.25},{42.4,-67.25},{42.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet,EX711. incold) annotation (Line(
      points={{81.4,-90},{81.4,-69.625},{83.3,-69.625},{83.3,-67.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,TT704. inlet) annotation (Line(
      points={{-259.3,-64.25},{-257.6,-64.25},{-257.6,-91}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{-219.6,-86},{-219.6,-66.125},{-218.7,-66.125},{-218.7,-64.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,TT733. inlet) annotation (Line(
      points={{-58.7,-66.25},{-58.7,-70.125},{-58.6,-70.125},{-58.6,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_p.y, sourceP0.in_p0)
    annotation (Line(points={{-291,150},{-290,150},{-290,116.4}},
                                                          color={0,0,127}));
  connect(EX701_T.y, sourceP0.in_T0)
    annotation (Line(points={{-291,190},{-282,190},{-282,116.4}},
                                                          color={0,0,127}));
  connect(EX711_p.y, sourceP1.in_p0)
    annotation (Line(points={{1,150},{10,150},{10,116.4}},   color={0,0,127}));
  connect(EX711_T.y, sourceP1.in_T0)
    annotation (Line(points={{1,190},{18,190},{18,116.4}},   color={0,0,127}));
  connect(EX721_p.y, sourceP2.in_p0)
    annotation (Line(points={{161,148},{170,148},{170,116.4}},
                                                             color={0,0,127}));
  connect(EX721_T.y, sourceP2.in_T0)
    annotation (Line(points={{161,184},{178,184},{178,116.4}},
                                                             color={0,0,127}));
  connect(EX731_p.y, sourceP3.in_p0)
    annotation (Line(points={{-141,150},{-128,150},{-128,116.4}},
                                                             color={0,0,127}));
  connect(EX731_T.y, sourceP3.in_T0)
    annotation (Line(points={{-141,190},{-120,190},{-120,116.4}},
                                                             color={0,0,127}));
  connect(EX731_mflow.y, sinkMassFlowP3.in_m_flow)
    annotation (Line(points={{-45,150},{-48,150},{-48,113}},
                                                           color={0,0,127}));
  connect(EX711_mflow.y, sinkMassFlowP1.in_m_flow)
    annotation (Line(points={{105,148},{96,148},{96,113}}, color={0,0,127}));
  connect(EX721_mflow.y, sinkMassFlowP2.in_m_flow)
    annotation (Line(points={{269,148},{260,148},{260,113}},
                                                           color={0,0,127}));
  connect(EX701_mflow.y, sinkMassFlowP0.in_m_flow)
    annotation (Line(points={{-197,148},{-206,148},{-206,113}},
                                                           color={0,0,127}));
  connect(TCV731_theta.y, TCV731.opening)
    annotation (Line(points={{-119,-118},{-106,-118}},
                                                     color={0,0,127}));
  connect(TCV711_theta.y, TCV711.opening)
    annotation (Line(points={{22,-118},{34,-118}},   color={0,0,127}));
  connect(TCV721_theta.y, TCV721.opening)
    annotation (Line(points={{182,-118},{193.1,-118}}, color={0,0,127}));
  connect(FCV701.opening,FCV701_theta. y)
    annotation (Line(points={{-210,10},{-202,10}},   color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{100,10},{90,10}},      color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{261,10},{250,10}},     color={0,0,127}));
  connect(FCV731.opening, FCV731_theta.y)
    annotation (Line(points={{-50,10},{-41,10}},   color={0,0,127}));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-279,-118},{-266,-118}},
                                                     color={0,0,127}));
  connect(FT723_.y, FT723.in_m_flow)
    annotation (Line(points={{171,-190},{180,-190},{180,-163}}, color={0,0,127}));
  connect(sourceP0.outlet, PT702.inlet) annotation (Line(
      points={{-276,108},{-258,108},{-258,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, sinkMassFlowP0.inlet) annotation (Line(
      points={{-218,86},{-218,108},{-210,108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet, sourceP3.outlet) annotation (Line(
      points={{-98,80},{-98,108},{-114,108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet, sinkMassFlowP3.inlet) annotation (Line(
      points={{-58,84},{-58,108},{-52,108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet, sourceP1.outlet) annotation (Line(
      points={{42,80},{42,108},{24,108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet, sinkMassFlowP1.inlet) annotation (Line(
      points={{82,88},{82,108},{92,108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet, sourceP2.outlet) annotation (Line(
      points={{202,80},{202,108},{184,108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet, sinkMassFlowP2.inlet) annotation (Line(
      points={{242,88},{242,108},{256,108}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723_.y, VER901.in_T0) annotation (Line(points={{275,-108},{283,-108},{283,-150.6}},
                         color={0,0,127}));
  connect(FT723.inlet, TCV721.outlet) annotation (Line(
      points={{184,-158},{201.5,-158},{201.5,-128}},
      color={140,56,54},
      thickness=0.5));
  connect(FT713.inlet, TCV711.outlet) annotation (Line(
      points={{22,-158},{42,-158},{42,-128}},
      color={140,56,54},
      thickness=0.5));
  connect(FT713_.y, FT713.in_m_flow)
    annotation (Line(points={{1,-190},{18,-190},{18,-163}}, color={0,0,127}));
  connect(TT713_.y, VER1.in_T0)
    annotation (Line(points={{115,-118},{97,-118},{97,-150.6}},   color={0,0,127}));
  connect(TT733_.y, VER2.in_T0)
    annotation (Line(points={{-31,-118},{-41,-118},{-41,-148.6}}, color={0,0,127}));
  connect(TT703_.y, VER3.in_T0)
    annotation (Line(points={{-193,-120},{-203,-120},{-203,-150.6}}, color={0,0,127}));
  connect(FT733_.y, FT733.in_m_flow)
    annotation (Line(points={{-137,-190},{-120,-190},{-120,-163}}, color={0,0,127}));
  connect(FT733.inlet, TCV731.outlet) annotation (Line(
      points={{-116,-158},{-108,-158},{-108,-160},{-98,-160},{-98,-128}},
      color={140,56,54},
      thickness=0.5));
  connect(FT703_.y, FT703.in_m_flow)
    annotation (Line(points={{-297,-190},{-280,-190},{-280,-163}}, color={0,0,127}));
  connect(FT703.inlet, TCV701.outlet) annotation (Line(
      points={{-276,-158},{-258,-158},{-258,-128}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.inlet, TT704.inlet) annotation (Line(
      points={{-258,-108},{-258,-99.5},{-257.6,-99.5},{-257.6,-91}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet, VER3.outlet) annotation (Line(
      points={{-219.6,-86},{-220,-86},{-220,-159},{-209,-159}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet, TT734.inlet) annotation (Line(
      points={{-98,-108},{-98.3,-108},{-98.3,-91.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT733.inlet, VER2.outlet) annotation (Line(
      points={{-58.6,-92},{-58,-92},{-58,-157},{-47,-157}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.inlet, TT714.inlet) annotation (Line(
      points={{42,-108},{42,-99},{42.4,-99},{42.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(VER1.outlet, TT713.inlet) annotation (Line(
      points={{91,-159},{81.4,-159},{81.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.outlet, TT723.inlet) annotation (Line(
      points={{277,-159},{241.4,-159},{241.4,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.inlet, TT724.inlet) annotation (Line(
      points={{201.5,-108},{201.5,-100},{202.4,-100},{202.4,-94}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-320,-300},{320,300}})),
    experiment(StopTime=7800, __Dymola_Algorithm="Dassl"));
end LoadPlant;
