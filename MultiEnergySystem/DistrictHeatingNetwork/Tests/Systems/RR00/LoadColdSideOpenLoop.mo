within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model LoadColdSideOpenLoop

  extends Modelica.Icons.Example;

  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
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
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
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
        origin={-237,-31.5})));

  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-214,8})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-214,24})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-214,38})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT702(T_start=
        EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-258,-8})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-258,32})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX711(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
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
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
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
        origin={65,-34.5})));

  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={86,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT711(T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={86,26})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={86,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT712(T_start=
        EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={42,-8})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={42,32})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX721(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.8257757,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.8257757,
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
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
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
        origin={223,-34.5})));

  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={246,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={246,26})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={246,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT722(T_start=
        EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={202,-8})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={202,32})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX731(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
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
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
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
        origin={-77,-33.5})));

  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-54,6})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-54,22})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-54,36})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT732(T_start=
        EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-98,-8})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-98,32})));
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
        origin={-96,-136})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT734(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-98.5,-85.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT734_TCV731(
    L=L_TT734_TCV731,
    h=h_TT734_TCV731,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-96,-106})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT703(
    L=L_rUsersIn_TT703,
    h=h_rUsersIn_TT703,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-216,-106})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT723(
    L=L_rUsersIn_TT723,
    h=h_rUsersIn_TT723,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={244,-136})));
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
        origin={203.5,-136})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT723(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={241,-87})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT724(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={202,-88})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT724_TCV721(
    L=L_TT724_TCV721,
    h=h_TT724_TCV721,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={204,-106})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT713(
    L=L_rUsersIn_TT713,
    h=h_rUsersIn_TT713,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={84,-135})));
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
        origin={44,-136})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT713(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={81,-84})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT714(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={42,-84})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT714_TCV711(
    L=L_TT714_TCV711,
    h=h_TT714_TCV711,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={44,-106})));
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
        origin={-256,-136})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT704(T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-258,-85})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT704_TCV701(
    L=L_TT704_TCV701,
    h=h_TT704_TCV701,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-256,-106})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT703(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-220,-80})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT733(
    L=L_rUsersIn_TT733,
    h=h_rUsersIn_TT733,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-56,-136})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT733(T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-59,-86})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_cold(
    L=L_EX721_EX711_cold,
    h=h_EX721_EX711_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={132,-176})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_cold(
    L=L_EX701_EX731_cold,
    h=h_EX701_EX731_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={4,-176})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_cold(
    L=L_EX711_EX701_cold,
    h=h_EX711_EX701_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-156,-177})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV701_rackUsersOut(
    L=L_TCV701_rUsersOut,
    h=h_TCV701_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-256,-194})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV731_rackUsersOut(
    L=L_TCV731_rUsersOut,
    h=h_TCV731_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-96,-194})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_hot(
    L=L_EX711_EX701_hot,
    h=h_EX711_EX701_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-36,-216})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV711_rackUsersOut(
    L=L_TCV711_rUsersOut,
    h=h_TCV711_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={44,-194})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_hot(
    L=L_EX721_EX711_hot,
    h=h_EX721_EX711_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={124,-216})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_hot(
    L=L_EX701_EX731_hot,
    h=h_EX701_EX731_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-186,-216})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV721_rackUsersOut(
    L=L_TCV721_rUsersOut,
    h=h_TCV721_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={204,-195})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersIn_EX721(
    L=L_UsersIn_EX721,
    h=h_UsersIn_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={268,-176})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersOut_EX721(
    L=L_UsersOut_EX721,
    h=h_UsersOut_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=m_flow_Cool_approx[1, 1],
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={243,-216})));
  DistrictHeatingNetwork.Sources.SourcePressure VER901(
    use_in_p0=true,
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=1e-3)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={301,-177})));

  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;

  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";

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
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.4; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=1.8;//0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=1.8; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.45; //0.65;

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

  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTR01 = "PTR01" "Matrix name in file";
  parameter String matrixPTR02 = "PTR02" "Matrix name in file";

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

  parameter String matrixFT703 = "FT703" "Matrix name in file";
  parameter String matrixFT713 = "FT713" "Matrix name in file";
  parameter String matrixFT723 = "FT723" "Matrix name in file";
  parameter String matrixFT733 = "FT733" "Matrix name in file";

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


  final parameter Real m_flow_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT703,dim[1],dim[2])*rhocoldref/3600;
  final parameter Real m_flow_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT713,dim[1],dim[2])*rhocoldref/3600;
  final parameter Real m_flow_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT723,dim[1],dim[2])*rhocoldref/3600;
  final parameter Real m_flow_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT733,dim[1],dim[2])*rhocoldref/3600;

  Modelica.Blocks.Sources.TimeTable cold_m_flow_EX701(table=[t,m_flow_703]) annotation (Placement(transformation(extent={{-180,-260},{-200,-240}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow_EX711(table=[t,m_flow_713]) annotation (Placement(transformation(extent={{-180,-280},{-200,-260}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow_EX721(table=[t,m_flow_723]) annotation (Placement(transformation(extent={{-160,-260},{-140,-240}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow_EX731(table=[t,m_flow_733]) annotation (Placement(transformation(extent={{-160,-280},{-140,-260}})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=[t,thetaTCV701]) annotation (Placement(transformation(extent={{-298,-146},{-278,-126}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=[t,thetaTCV731]) annotation (Placement(transformation(extent={{-138,-146},{-118,-126}})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=[t,thetaTCV711]) annotation (Placement(transformation(extent={{3,-146},{23,-126}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=[t,thetaTCV721]) annotation (Placement(transformation(extent={{163,-146},{183,-126}})));
  Modelica.Blocks.Sources.TimeTable FTCool_mflow(table=[t,m_flow_Cool_approx]) annotation (Placement(transformation(extent={{262,-256},{282,-236}})));
  Modelica.Blocks.Sources.TimeTable TTcool_T(table=[t,TT_723]) annotation (Placement(transformation(extent={{260,-138},{280,-118}})));
  Modelica.Blocks.Sources.TimeTable PTcool_p(table=[t,PT_R02]) annotation (Placement(transformation(extent={{260,-106},{280,-86}})));
  Sources.SinkMassFlow sinkMassFlowP4(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15)
    annotation (Placement(transformation(extent={{294,-206},{314,-226}})));

  Utilities.ASHRAEIndex val_m_flow_703 annotation (Placement(transformation(extent={{-240,-230},{-260,-250}})));
  Utilities.ASHRAEIndex val_m_flow_713 annotation (Placement(transformation(extent={{-240,-290},{-260,-270}})));
  Utilities.ASHRAEIndex val_m_flow_723 annotation (Placement(transformation(extent={{-100,-230},{-80,-250}})));
  Utilities.ASHRAEIndex val_m_flow_733 annotation (Placement(transformation(extent={{-100,-290},{-80,-270}})));
  Modelica.Blocks.Sources.RealExpression m_flow_TCV701_sim(y=TCV701.m_flow) annotation (Placement(transformation(extent={{-208,-244},{-228,-224}})));
  Modelica.Blocks.Sources.RealExpression m_flow_TCV711_sim(y=TCV711.m_flow) annotation (Placement(transformation(extent={{-208,-296},{-228,-276}})));
  Modelica.Blocks.Sources.RealExpression m_flow_TCV721_sim(y=TCV721.m_flow) annotation (Placement(transformation(extent={{-130,-244},{-110,-224}})));
  Modelica.Blocks.Sources.RealExpression m_flow_TCV731_sim(y=TCV731.m_flow) annotation (Placement(transformation(extent={{-130,-296},{-110,-276}})));
  Utilities.ASHRAEIndex val_Tout_cold_TT734 annotation (Placement(transformation(extent={{-132,-90},{-152,-70}})));
  Utilities.ASHRAEIndex val_Tout_cold_TT704 annotation (Placement(transformation(extent={{-292,-92},{-312,-72}})));
  Utilities.ASHRAEIndex val_Tout_cold_TT714 annotation (Placement(transformation(extent={{6,-88},{-14,-68}})));
  Utilities.ASHRAEIndex val_Tout_cold_TT724 annotation (Placement(transformation(extent={{164,-92},{144,-72}})));
  Modelica.Blocks.Sources.TimeTable TT704_meas(table=[t,TT_704]) annotation (Placement(transformation(extent={{-260,-80},{-280,-60}})));
  Modelica.Blocks.Sources.TimeTable TT734_meas(table=[t,TT_734]) annotation (Placement(transformation(extent={{-102,-80},{-122,-60}})));
  Modelica.Blocks.Sources.TimeTable TT714_meas(table=[t,TT_714]) annotation (Placement(transformation(extent={{38,-74},{18,-54}})));
  Modelica.Blocks.Sources.TimeTable TT724_meas(table=[t,TT_724]) annotation (Placement(transformation(extent={{200,-78},{180,-58}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData,matrixTT701) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,timenoscale,dim[1],dim[2]) "Matrix data";

  final parameter Real PT_R01[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTR01, dim[1], dim[2]);
  final parameter Real PT_R02[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTR02, dim[1], dim[2]);

  final parameter Real TT_701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT701,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_711[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT711,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_721[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT721,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_731[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT731,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT702,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT712,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT722,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT732,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT703,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT713,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT723,dim[1],dim[2]) + (0.2)*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT733,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_704[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT704,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_714[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT714,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_724[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT724,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_734[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTT734,dim[1],dim[2]) "Matrix data";

  final parameter Real PT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT701,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT711,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT721,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT731,dim[1],dim[2]) "Matrix data";

  final parameter Real PT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT702,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT712,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT722,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixPT732,dim[1],dim[2]) "Matrix data";

  final parameter Real FT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT701,dim[1],dim[2])*rhohotref /3600 "Matrix data";
  final parameter Real FT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT711,dim[1],dim[2])*rhohotref /3600 "Matrix data";
  final parameter Real FT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT721,dim[1],dim[2])*rhohotref /3600 "Matrix data";
  final parameter Real FT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFT731,dim[1],dim[2])*rhohotref /3600 "Matrix data";

  final parameter Real thetaFCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaFCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaFCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaFCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaTCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaTCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaTCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaTCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaTCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaFCVR01[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixthetaFCVR01,dim[1],dim[2]) "Matrix data";

  final parameter Real fPR01[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixfPR01,dim[1],dim[2])*2*Modelica.Constants.pi*5/3 "Matrix data";
  final parameter Real TT_R02[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixTTR02,dim[1],dim[2]) "Matrix data";

  final parameter Real FT_R01[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFTR01,dim[1],dim[2])*rhocoldref/3600 "Matrix data";
  final parameter Real FT_R03[:,:] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData,matrixFTR03,dim[1],dim[2])*rhocoldref/3600 "Matrix data";

  final parameter Real m_flow_Cool_approx[dim[1], dim[2]] = m_flow_703 + m_flow_713 + m_flow_723 + m_flow_733;
  //final parameter Real m_flow_cool_approx[dim[1], dim[2]] = m_flow_Cool_approx*rhocoldref/3600;


  Modelica.Blocks.Sources.TimeTable EX701_T(table=[t,TT_702])
    annotation (Placement(transformation(extent={{-310,148},{-290,168}})));
  inner System                        system
    annotation (Placement(transformation(extent={{298,280},{318,300}})));
  Modelica.Blocks.Sources.TimeTable EX711_T(table=[t,TT_712])
    annotation (Placement(transformation(extent={{-18,148},{2,168}})));
  Modelica.Blocks.Sources.TimeTable EX721_T(table=[t,TT_722])
    annotation (Placement(transformation(extent={{142,142},{162,162}})));
  Modelica.Blocks.Sources.TimeTable EX731_T(table=[t,TT_732])
    annotation (Placement(transformation(extent={{-160,148},{-140,168}})));
  Modelica.Blocks.Sources.TimeTable EX731_mflow(table=[t,FT_731])
    annotation (Placement(transformation(extent={{-22,104},{-42,124}})));
  Modelica.Blocks.Sources.TimeTable EX711_mflow(table=[t,FT_711])
    annotation (Placement(transformation(extent={{128,102},{108,122}})));
  Modelica.Blocks.Sources.TimeTable EX721_mflow(table=[t,FT_721])
    annotation (Placement(transformation(extent={{292,102},{272,122}})));
  Modelica.Blocks.Sources.TimeTable EX701_mflow(table=[t,FT_701])
    annotation (Placement(transformation(extent={{-174,102},{-194,122}})));
  Sources.SourcePressure sourceP0(
    use_in_p0=false,                              use_in_T0=true,
    p0=PT_702[1, 1])
    annotation (Placement(transformation(extent={{-294,62},{-274,82}})));
  Sources.SourcePressure sourceP1(
    use_in_p0=false,                              use_in_T0=true,
    p0=PT_712[1, 1])
    annotation (Placement(transformation(extent={{6,62},{26,82}})));
  Sources.SourcePressure sourceP2(
    use_in_p0=false,                              use_in_T0=true,
    p0=PT_722[1, 1])
    annotation (Placement(transformation(extent={{166,62},{186,82}})));
  Sources.SourcePressure sourceP3(
    use_in_p0=false,                              use_in_T0=true,
    p0=PT_732[1, 1])
    annotation (Placement(transformation(extent={{-132,62},{-112,82}})));
  Sources.SinkMassFlow                        sinkMassFlowP3(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-50,62},{-30,82}})));
  Sources.SinkMassFlow                        sinkMassFlowP1(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{94,62},{114,82}})));
  Sources.SinkMassFlow                        sinkMassFlowP2(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{258,62},{278,82}})));
  Sources.SinkMassFlow                        sinkMassFlowP0(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-208,62},{-188,82}})));
equation
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-256,-8},{-256,32}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{44,-8},{44,32}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{-216,38},{-216,24}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{-216,24},{-216,11}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{84,40},{84,26}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{84,13},{84,26}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{204,-8},{204,32}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{-96,-8},{-96,32}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{244,40},{244,26}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{244,13},{244,26}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{-56,36},{-56,22}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{-56,22},{-56,9}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{-96,-96},{-96,-91},{-96.3,-91},{-96.3,-85.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{-96,-126},{-96,-116}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{44,-116},{44,-126}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.outlet,TT713. inlet) annotation (Line(
      points={{84,-125},{84,-104.5},{83.4,-104.5},{83.4,-84}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{-256,-116},{-256,-126}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT703.outlet,TT703. inlet) annotation (Line(
      points={{-216,-96},{-216,-88},{-217.6,-88},{-217.6,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet,TCV721. inlet) annotation (Line(
      points={{204,-116},{204,-121},{203.5,-121},{203.5,-126}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{122,-176},{84,-176},{84,-145}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.inlet,PL_rackUsersIn_TT723. inlet) annotation (
      Line(
      points={{142,-176},{244,-176},{244,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.inlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{14,-176},{84,-176},{84,-145}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-6,-176},{-56,-176},{-56,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-146,-177},{-56,-177},{-56,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.inlet,PL_rackUsersIn_TT703. inlet) annotation (
      Line(
      points={{-166,-177},{-216,-177},{-216,-116}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{-256,-146},{-256,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL_TCV731_rackUsersOut. inlet) annotation (Line(
      points={{-96,-146},{-96,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{44,-146},{44,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet,PL_TCV711_rackUsersOut. outlet) annotation (
      Line(
      points={{114,-216},{44,-216},{44,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{203.5,-146},{203.5,-156.5},{204,-156.5},{204,-185}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV721_rackUsersOut.outlet,PL_EX721_EX711_hot. outlet) annotation (
     Line(
      points={{204,-205},{204,-216},{134,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet,PL_TCV711_rackUsersOut. outlet) annotation (
     Line(
      points={{-26,-216},{44,-216},{44,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet,PL_TCV731_rackUsersOut. outlet) annotation (
      Line(
      points={{-46,-216},{-96,-216},{-96,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet,PL_TCV731_rackUsersOut. outlet) annotation (
     Line(
      points={{-176,-216},{-96,-216},{-96,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{-196,-216},{-256,-216},{-256,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet,PL_rackUsersIn_TT723. inlet) annotation (Line(
      points={{258,-176},{244,-176},{244,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet,PL_EX721_EX711_hot. outlet) annotation (Line(
      points={{233,-216},{134,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_T.y, sourceP0.in_T0)
    annotation (Line(points={{-289,158},{-280,158},{-280,80.4}},
                                                          color={0,0,127}));
  connect(EX711_T.y, sourceP1.in_T0)
    annotation (Line(points={{3,158},{20,158},{20,80.4}},    color={0,0,127}));
  connect(EX721_T.y, sourceP2.in_T0)
    annotation (Line(points={{163,152},{180,152},{180,80.4}},color={0,0,127}));
  connect(EX731_T.y, sourceP3.in_T0)
    annotation (Line(points={{-139,158},{-118,158},{-118,80.4}},
                                                             color={0,0,127}));
  connect(EX731_mflow.y, sinkMassFlowP3.in_m_flow)
    annotation (Line(points={{-43,114},{-46,114},{-46,77}},color={0,0,127}));
  connect(EX711_mflow.y, sinkMassFlowP1.in_m_flow)
    annotation (Line(points={{107,112},{98,112},{98,77}},  color={0,0,127}));
  connect(EX721_mflow.y, sinkMassFlowP2.in_m_flow)
    annotation (Line(points={{271,112},{262,112},{262,77}},color={0,0,127}));
  connect(EX701_mflow.y, sinkMassFlowP0.in_m_flow)
    annotation (Line(points={{-195,112},{-204,112},{-204,77}},
                                                           color={0,0,127}));
  connect(TCV731_theta.y, TCV731.opening)
    annotation (Line(points={{-117,-136},{-104,-136}},
                                                     color={0,0,127}));
  connect(TCV711_theta.y, TCV711.opening)
    annotation (Line(points={{24,-136},{36,-136}},   color={0,0,127}));
  connect(TCV721_theta.y, TCV721.opening)
    annotation (Line(points={{184,-136},{195.1,-136}}, color={0,0,127}));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-277,-136},{-264,-136}},
                                                     color={0,0,127}));
  connect(sinkMassFlowP4.inlet, PL_UsersOut_EX721.outlet) annotation (Line(
      points={{294,-216},{253,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(FTCool_mflow.y, sinkMassFlowP4.in_m_flow)
    annotation (Line(points={{283,-246},{298,-246},{298,-221}}, color={0,0,127}));
  connect(sourceP0.outlet, PT702.inlet) annotation (Line(
      points={{-274,72},{-256,72},{-256,32}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, sinkMassFlowP0.inlet) annotation (Line(
      points={{-216,38},{-216,72},{-208,72}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet, sourceP3.outlet) annotation (Line(
      points={{-96,32},{-96,72},{-112,72}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet, sinkMassFlowP3.inlet) annotation (Line(
      points={{-56,36},{-56,72},{-50,72}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet, sourceP1.outlet) annotation (Line(
      points={{44,32},{44,72},{26,72}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet, sinkMassFlowP1.inlet) annotation (Line(
      points={{84,40},{84,72},{94,72}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet, sourceP2.outlet) annotation (Line(
      points={{204,32},{204,72},{186,72}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet, sinkMassFlowP2.inlet) annotation (Line(
      points={{244,40},{244,72},{258,72}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.outlet, PL_UsersIn_EX721.inlet) annotation (Line(
      points={{291,-177},{289.5,-177},{289.5,-176},{278,-176}},
      color={140,56,54},
      thickness=0.5));
  connect(TTcool_T.y, VER901.in_T0) annotation (Line(points={{281,-128},{286,-128},{286,-126},{297,-126},{297,-168.6}},
                         color={0,0,127}));
  connect(EX701.inhot, TT702.inlet) annotation (Line(
      points={{-257.3,-22.75},{-257.3,-16},{-256,-16},{-256,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outhot, FT701.inlet) annotation (Line(
      points={{-216.7,-22.75},{-216,-22.75},{-216,5}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.inhot, TT732.inlet) annotation (Line(
      points={{-97.3,-24.75},{-97.3,-16},{-96,-16},{-96,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outhot, FT731.inlet) annotation (Line(
      points={{-56.7,-24.75},{-56,-24.75},{-56,3}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.inhot, TT712.inlet) annotation (Line(
      points={{44.7,-25.75},{44.7,-16.875},{44,-16.875},{44,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outhot, FT711.inlet) annotation (Line(
      points={{85.3,-25.75},{85.3,-9.375},{84,-9.375},{84,7}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.inhot, TT722.inlet) annotation (Line(
      points={{202.7,-25.75},{202.7,-16},{204,-16},{204,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outhot, FT721.inlet) annotation (Line(
      points={{243.3,-25.75},{243.3,-8},{244,-8},{244,7}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT733.outlet, TT733.inlet) annotation (Line(
      points={{-56,-126},{-56,-106},{-56.6,-106},{-56.6,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT723.outlet, TT723.inlet) annotation (Line(
      points={{244,-126},{244,-106.5},{243.4,-106.5},{243.4,-87}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723.inlet, EX721.incold) annotation (Line(
      points={{243.4,-87},{243.4,-65.125},{243.3,-65.125},{243.3,-43.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.inlet, TT724.inlet) annotation (Line(
      points={{204,-96},{204,-92},{204.4,-92},{204.4,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(TT724.inlet, EX721.outcold) annotation (Line(
      points={{204.4,-88},{204,-88},{204,-56},{202,-56},{202,-43.25},{202.7,-43.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.inlet, TT714.inlet) annotation (Line(
      points={{44,-96},{44,-90},{44.4,-90},{44.4,-84}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet, EX711.incold) annotation (Line(
      points={{83.4,-84},{83.4,-63.625},{85.3,-63.625},{85.3,-43.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT714.inlet, EX711.outcold) annotation (Line(
      points={{44.4,-84},{44.4,-63.625},{44.7,-63.625},{44.7,-43.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT733.inlet, EX731.incold) annotation (Line(
      points={{-56.6,-86},{-56.6,-64.125},{-56.7,-64.125},{-56.7,-42.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT734.inlet, EX731.outcold) annotation (Line(
      points={{-96.3,-85.5},{-96.3,-63.875},{-97.3,-63.875},{-97.3,-42.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet, EX701.incold) annotation (Line(
      points={{-217.6,-80},{-217.6,-60.125},{-216.7,-60.125},{-216.7,-40.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.inlet, TT704.inlet) annotation (Line(
      points={{-256,-96},{-256,-90.5},{-255.6,-90.5},{-255.6,-85}},
      color={140,56,54},
      thickness=0.5));
  connect(TT704.inlet, EX701.outcold) annotation (Line(
      points={{-255.6,-85},{-256,-85},{-256,-58},{-257.3,-58},{-257.3,-40.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PTcool_p.y, VER901.in_p0) annotation (Line(points={{281,-96},{305,-96},{305,-168.6}}, color={0,0,127}));
  connect(cold_m_flow_EX721.y, val_m_flow_723.u_meas) annotation (Line(points={{-139,-250},{-120,-250},{-120,-245},{-102,-245}}, color={0,0,127}));
  connect(cold_m_flow_EX731.y, val_m_flow_733.u_meas) annotation (Line(points={{-139,-270},{-120,-270},{-120,-275},{-102,-275}}, color={0,0,127}));
  connect(cold_m_flow_EX701.y, val_m_flow_703.u_meas) annotation (Line(points={{-201,-250},{-220,-250},{-220,-245},{-238,-245}}, color={0,0,127}));
  connect(cold_m_flow_EX711.y, val_m_flow_713.u_meas) annotation (Line(points={{-201,-270},{-220,-270},{-220,-275},{-238,-275}}, color={0,0,127}));
  connect(m_flow_TCV701_sim.y, val_m_flow_703.u_sim) annotation (Line(points={{-229,-234},{-229,-235},{-238,-235}}, color={0,0,127}));
  connect(val_m_flow_713.u_sim, m_flow_TCV711_sim.y) annotation (Line(points={{-238,-285},{-233.5,-285},{-233.5,-286},{-229,-286}}, color={0,0,127}));
  connect(m_flow_TCV721_sim.y, val_m_flow_723.u_sim) annotation (Line(points={{-109,-234},{-109,-235},{-102,-235}}, color={0,0,127}));
  connect(m_flow_TCV731_sim.y, val_m_flow_733.u_sim) annotation (Line(points={{-109,-286},{-105.5,-286},{-105.5,-285},{-102,-285}}, color={0,0,127}));
  connect(TT734.T, val_Tout_cold_TT734.u_sim) annotation (Line(points={{-105.65,-85.5},{-117.825,-85.5},{-117.825,-85},{-130,-85}}, color={0,0,127}));
  connect(TT704.T, val_Tout_cold_TT704.u_sim) annotation (Line(points={{-265.8,-85},{-265.8,-87},{-290,-87}}, color={0,0,127}));
  connect(TT714.T, val_Tout_cold_TT714.u_sim) annotation (Line(points={{34.2,-84},{21.1,-84},{21.1,-83},{8,-83}}, color={0,0,127}));
  connect(TT724.T, val_Tout_cold_TT724.u_sim) annotation (Line(points={{194.2,-88},{180.1,-88},{180.1,-87},{166,-87}}, color={0,0,127}));
  connect(TT704_meas.y, val_Tout_cold_TT704.u_meas) annotation (Line(points={{-281,-70},{-284,-70},{-284,-77},{-290,-77}}, color={0,0,127}));
  connect(TT734_meas.y, val_Tout_cold_TT734.u_meas) annotation (Line(points={{-123,-70},{-126,-70},{-126,-75},{-130,-75}}, color={0,0,127}));
  connect(TT714_meas.y, val_Tout_cold_TT714.u_meas) annotation (Line(points={{17,-64},{14,-64},{14,-73},{8,-73}}, color={0,0,127}));
  connect(TT724_meas.y, val_Tout_cold_TT724.u_meas) annotation (Line(points={{179,-68},{172,-68},{172,-77},{166,-77}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-320,-300},{320,300}})),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end LoadColdSideOpenLoop;
