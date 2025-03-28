﻿within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model HPSystem
  "S300 & S600 interacting together for centralized configuration"
  extends Modelica.Icons.Example;
  parameter Integer n = 3 "Number of volumes in each pipe";

  final parameter Types.Pressure pin_start_S3_tank = pout_User_start_S3_pump;
  final parameter Types.Pressure pout_start_S3_tank = pin_start_S3_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S3 = 1.75e5;
  parameter Types.Pressure pout_Source_start_S3 = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S3 = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S3 = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S3 = 1.69e5;
  parameter Types.Pressure pout_User_start_S3 = 2.5e5;
  parameter Types.Temperature Tin_User_start_S3 = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S3 = 80 + 273.15;

  // Heat Pump
  parameter Types.Pressure pin_Source_start_S3_hp = 1.79e5;
  parameter Types.Pressure pout_Source_start_S3_hp = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S3_hp = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S3_hp = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S3_hp = 1.79e5;
  parameter Types.Pressure pout_User_start_S3_hp = 2.5e5;
  parameter Types.Temperature Tin_User_start_S3_hp = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S3_hp = 80 + 273.15;

  // Water Pump P301
  parameter Types.Pressure pin_User_start_S3_pump = pin_User_start_S3;
  parameter Types.Pressure pout_User_start_S3_pump = pin_User_start_S3_pump + 1.22e5;

  // Water Pump P302
  parameter Types.Pressure pin_Source_start_S3_pump = 1.79e5;
  parameter Types.Pressure pout_Source_start_S3_pump = pin_Source_start_S3_pump + 0.88e5;

  // General Pipeline Data
  parameter Types.Length Di_S3 = 51e-3;
  parameter Types.Length t_S3 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S3 = q_m3h_S3_Source*990/3600;
  parameter Real q_m3h_S3_Source = 7;
  parameter Types.MassFlowRate m_flow_User_S3 = q_m3h_S3_User*990/3600;
  parameter Real q_m3h_S3_User = 2.23;

  // Pipe length
  parameter Types.Length L_S3_PL1 = 3;
  parameter Types.Length L_S3_PL2 = 3;
  parameter Types.Length L_S3_PL3 = 3;
  parameter Types.Length L_S3_PL4 = 3;
  parameter Types.Length L_S3_PL5 = 3;
  parameter Types.Length L_S3_PL6 = 3;
  parameter Types.Length L_S3_PL7 = 3;
  parameter Types.Length L_S3_PL8 = 3;
  parameter Types.Length L_S3_PL9 = 3;
  parameter Types.Length L_S3_PL10 = 3;

  final parameter Types.Pressure pin_start_S6_tank = pout_User_start_S6_pump;
  final parameter Types.Pressure pout_start_S6_tank = pin_start_S6_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S6 = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6 = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S6 = 14 + 273.15;
  parameter Types.Temperature Tout_Source_start_S6 = 7 + 273.15;

  parameter Types.Pressure pin_User_start_S6 = 2.67e5;
  parameter Types.Pressure pout_User_start_S6 = 3e5;
  parameter Types.Temperature Tin_User_start_S6 = 40 + 273.15;
  parameter Types.Temperature Tout_User_start_S6 = 45 + 273.15;

  // Heat Pump
  parameter Types.Pressure pin_Source_start_S6_hp = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6_hp = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S6_hp = 14 + 273.15;
  parameter Types.Temperature Tout_Source_start_S6_hp = 7 + 273.15;

  parameter Types.Pressure pin_User_start_S6_hp = 1.79e5;
  parameter Types.Pressure pout_User_start_S6_hp = 2.5e5;
  parameter Types.Temperature Tin_User_start_S6_hp = 40 + 273.15;
  parameter Types.Temperature Tout_User_start_S6_hp = 45 + 273.15;

  // Cooling System Side
  parameter Types.Pressure pin_cool_start_S6_HX = 2.8e5;
  parameter Types.Pressure pout_cool_start_S6_HX = 2e5;
  parameter Types.Temperature Tin_cool_start_S6_HX = 17 + 273.15;
  parameter Types.Temperature Tout_cool_start_S6_HX = 15 + 273.15;
  parameter Types.MassFlowRate m_flow_cool_S6 = 4.166666667;

  // Water Pump P601
  parameter Types.Pressure pin_User_start_S6_pump = pin_User_start_S6;
  parameter Types.Pressure pout_User_start_S6_pump = pin_User_start_S6_pump + 1.22e5;

  // Water Pump P602
  parameter Types.Pressure pin_Source_start_S6_pump = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6_pump = pin_Source_start_S6_pump + 0.88e5;

  // General Pipeline Data
  parameter Types.Length Di_S6 = 51e-3;
  parameter Types.Length t_S6 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S6 = 1.369047619;
  parameter Types.MassFlowRate m_flow_User_S6 = 2.444444444;

  // Pipe length
  parameter Types.Length L_S6_PL1 = 3;
  parameter Types.Length L_S6_PL2 = 3;
  parameter Types.Length L_S6_PL3 = 3;
  parameter Types.Length L_S6_PL4 = 3;
  parameter Types.Length L_S6_PL5 = 3;
  parameter Types.Length L_S6_PL6 = 3;
  parameter Types.Length L_S6_PL7 = 3;
  parameter Types.Length L_S6_PL8 = 3;
  parameter Types.Length L_S6_PL9 = 3;
  parameter Types.Length L_S6_PL10 = 3;

  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter Types.Length L_S4_PL1 = 0.82;
  parameter Types.Length L_S4_PL2 = 0.47;
  parameter Types.Length L_S4_PL3 = 1.3;
  parameter Types.Length L_S4_PL4 = 1.3;
  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;

  parameter Types.MassFlowRate m_flow_S4 = 1.2;
  parameter Boolean FV605_state = false;
  parameter Boolean FV606_state = false;

  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics
    HP601(
    Tin_hot_start=Tin_User_start_S6_hp,
    Tin_cold_start=Tin_Source_start_S6_hp,
    Tout_cold_start=Tout_Source_start_S6_hp,
    Tout_hot_set=Tout_User_start_S6_hp,
    m_flow_hot_start=m_flow_User_S6,
    m_flow_cold_start=m_flow_Source_S6,
    k_hot=8000,
    k_cold=8000) "Heat pump of system 600"
          annotation (Placement(transformation(extent={{181,-5},{215,29}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP601_UserOut(
    L=L_S6_PL6,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6 - 0.04e5,
    pout_start=pin_User_start_S6 - 0.05e5,
    Tin_start=Tout_User_start_S6,
    Tout_start=Tout_User_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,41})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P601(
      Tin_start(displayUnit="K") = Pump.P601.Tin_start,
      Tout_start=Pump.P601.Tout_start,
      a=Pump.P601.a,
      b=Pump.P601.b,
      m_flow_start=m_flow_User_S6,
      dpnom=Pump.P601.dpnom,
      etaelec=Pump.P601.etaelec,
      etamech=Pump.P601.etamech,
      etanom=Pump.P601.etanom,
      hin_start=Pump.P601.hin_start,
      m_flow_nom=Pump.P601.m_flow_nom,
      omeganom=Pump.P601.omeganom,
      pin_start(displayUnit="Pa") = 1.8400803e5,
      pout_start(displayUnit="Pa") = 1.9920743e5,
      qnom_inm3h=Pump.P601.qnom_inm3h,
      rhonom(displayUnit="kg/m3") = Pump.P601.rhonom,
      headmax=Pump.P601.headnommax,
      headmin=Pump.P601.headnommin,
      qnom_inm3h_min=Pump.P601.qnommin_inm3h,
      qnom_inm3h_max=Pump.P601.qnommax_inm3h,
    use_in_omega=true) "Pump of System 600"
                          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={210.5,135.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={210.5,126.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_P301_D301(
    L=L_S6_PL4,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pout_User_start_S6_pump,
    pout_start=pout_User_start_S6_pump - 0.01e5,
    Tin_start=Tout_User_start_S6,
    Tout_start=Tout_User_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,104})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_rCD_H(
    L=L_S6_PL1,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pout_User_start_S6_pump - 0.21e5,
    pout_start=pout_User_start_S6_pump - 0.22e5,
    Tin_start=Tout_User_start_S6,
    Tout_start=Tout_User_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,155})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT601 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={185.5,115.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT601(T_start=Tin_User_start_S6, p_start=pin_User_start_S6)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={185.5,106.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT601
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={186,64})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP601_UserIn(
    L=L_S6_PL7,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6 - 0.02e5,
    pout_start=pin_User_start_S6 - 0.03e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={188,41})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP301Sensors_C(
    L=L_S6_PL5,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6 - 0.01e5,
    pout_start=pin_User_start_S6 - 0.02e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={188,86})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_rCD_C(L=
        L_S6_PL2,
      m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6,
    pout_start=pin_User_start_S6 - 0.01e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={188,155})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P602(
      Tin_start(displayUnit="K") = Pump.P602.Tin_start,
      Tout_start=Pump.P602.Tout_start,
      a=Pump.P602.a,
      b=Pump.P602.b,
      m_flow_start=m_flow_Source_S6,
      dpnom=Pump.P602.dpnom,
      etaelec=Pump.P602.etaelec,
      etamech=Pump.P602.etamech,
      etanom=Pump.P602.etanom,
      hin_start=Pump.P602.hin_start,
      m_flow_nom=Pump.P602.m_flow_nom,
      omeganom=Pump.P602.omeganom,
      pin_start(displayUnit="Pa") = 1.8400803e5,
      pout_start(displayUnit="Pa") = 1.9920743e5,
    headnom=Pump.P602.headnom,
      qnom_inm3h=Pump.P602.qnom_inm3h,
      rhonom(displayUnit="kg/m3") = Pump.P602.rhonom,
      headmax=Pump.P602.headnommax,
      headmin=Pump.P602.headnommin,
      qnom_inm3h_min=Pump.P602.qnommin_inm3h,
      qnom_inm3h_max=Pump.P602.qnommax_inm3h,
    use_in_omega=true)
      "Pump of System 600" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT603 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={210.5,-48.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT604(T_start=Tin_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={210.5,-54.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_H(
    L=L_S6_PL9,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pout_Source_start_S6_pump - 0.1e5,
    pout_start=pout_Source_start_S6_pump,
    Tin_start=Tin_Source_start_S6,
    Tout_start=Tin_Source_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,-107})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT603(T_start=Tout_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={185.5,-55.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT602(T_start=
        Tout_Source_start_S6_hp)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=270,
        origin={186,-65})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP601_SourceOut(
    L=L_S6_PL8,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pout_Source_start_S6_pump + 0.2e5,
    pout_start=pout_Source_start_S6_pump + 0.1e5,
    Tin_start=Tout_Source_start_S6,
    Tout_start=Tout_Source_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={188,-30})));
  Sources.SinkPressure sinkPressure(p0=pout_cool_start_S6_HX,     T0=
        Tout_cool_start_S6_HX)
    annotation (Placement(transformation(extent={{183,-230},{163,-210}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=pin_cool_start_S6_HX,
    T0=Tin_cool_start_S6_HX,
    m_flow0=m_flow_cool_S6)
    annotation (Placement(transformation(extent={{233,-230},{213,-210}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_C(
    L=L_S6_PL10,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pout_Source_start_S6_pump + 0.1e5,
    pout_start=pout_Source_start_S6_pump,
    Tin_start=Tout_Source_start_S6,
    Tout_start=Tout_Source_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={188,-107})));
  inner System system
    annotation (Placement(transformation(extent={{241,239},{261,259}})));
  Modelica.Blocks.Sources.Ramp P601_omega(
    offset=2*3.141592654*30,
    height=-2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{244,56},{223,76}})));
  Modelica.Blocks.Sources.Ramp P602_omega(
    offset=2*3.141592654*35,
    height=2*3.141592654*5,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{246,-84},{225,-64}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E601(
    Di_cold=BPHE.E601.Di_cold,
    Di_hot=BPHE.E601.Di_hot,
    L_cold=BPHE.E601.L_cold,
    L_hot=BPHE.E601.L_hot,
    MWall=BPHE.E601.MWall,
    Stot_cold=BPHE.E601.Stot_cold,
    Stot_hot=BPHE.E601.Stot_hot,
    Tin_start_cold=BPHE.E601.Tin_start_cold,
    Tin_start_hot=Tin_cool_start_S6_HX,
    Tout_start_cold=BPHE.E601.Tout_start_cold,
    Tout_start_hot=Tout_cool_start_S6_HX,
    cpm_cold=BPHE.E601.cpm_cold,
    cpm_hot=BPHE.E601.cpm_hot,
    t_cold=BPHE.E601.t_cold,
    t_hot=BPHE.E601.t_hot,
    gamma_nom_cold=BPHE.E601.gamma_nom_cold,
    gamma_nom_hot=BPHE.E601.gamma_nom_hot,
    h_cold=BPHE.E601.h_cold,
    h_hot=BPHE.E601.h_hot,
    k_cold=BPHE.E601.k_cold,
    k_hot=BPHE.E601.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E601.lambdam_cold,
    lambdam_hot=BPHE.E601.lambdam_hot,
    m_flow_start_cold=BPHE.E601.m_flow_start_cold,
    m_flow_start_hot=BPHE.E601.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E601.nPipes_cold,
    nPipes_hot=BPHE.E601.nPipes_hot,
    nPlates=BPHE.E601.nPlates,
    pin_start_cold=BPHE.E601.pin_start_cold,
    pin_start_hot=BPHE.E601.pin_start_hot,
    pout_start_cold=BPHE.E601.pout_start_cold,
    pout_start_hot=BPHE.E601.pout_start_hot,
    rho_nom_cold=(BPHE.E601.rhoin_nom_cold + BPHE.E601.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E601.rhoin_nom_hot + BPHE.E601.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E601.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E601.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E601.u_nom_cold,
    u_nom_hot=BPHE.E601.u_nom_hot)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={198,-137.5},
                                                                extent={{8.5,14},
            {-8.5,-14}},                                                                         rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV601(
    Kv=Valve.TCV601.Kv,
    dp_nom(displayUnit="Pa") = Valve.TCV601.dp_nom,
    Tin_start(displayUnit="K") = Tout_cool_start_S6_HX,
    pin_start=pout_cool_start_S6_HX)
                             "Temperature control valve in System 300"
                             annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={188,-165})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_C1(
    L=L_S6_PL10,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pout_cool_start_S6_HX + 0.1e5,
    pout_start=pout_cool_start_S6_HX,
    Tin_start=Tout_cool_start_S6_HX,
    Tout_start=Tout_cool_start_S6_HX,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={188,-190})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_C2(
    L=L_S6_PL10,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pin_cool_start_S6_HX,
    pout_start=pin_cool_start_S6_HX - 0.05e5,
    Tin_start=Tin_cool_start_S6_HX,
    Tout_start=Tin_cool_start_S6_HX,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={208,-190})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT606(T_start=Tout_cool_start_S6_HX, p_start=pout_cool_start_S6_HX)
          "Temperature Sensor at the outlet of HX601 - cooling side"
    annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={185.5,-153.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT605(T_start=Tin_cool_start_S6_HX, p_start=pin_cool_start_S6_HX - 0.05e5)
          "Temperature Sensor at the inlet of HX601 - cooling side" annotation (
     Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=-90,
        origin={210.5,-153.5})));
  Modelica.Blocks.Sources.Ramp TCV601_theta(
    offset=1,
    height=0,
    duration=0,
    startTime=0)
    annotation (Placement(transformation(extent={{147,-175},{168,-155}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_H1(
    L=L_S6_PL9,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pout_Source_start_S6_pump - 0.1e5,
    pout_start=pout_Source_start_S6_pump,
    Tin_start=Tin_Source_start_S6,
    Tout_start=Tin_Source_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={208,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics
    HP301(
    Tin_hot_start=Tin_User_start_S3_hp,
    Tin_cold_start=Tin_Source_start_S3_hp,
    Tout_cold_start=Tout_Source_start_S3_hp,
    Tout_hot_set=Tout_User_start_S3_hp,
    m_flow_hot_start=m_flow_User_S3,
    m_flow_cold_start=m_flow_Source_S3,
    k_hot=8000,
    k_cold=8000)
          annotation (Placement(transformation(extent={{-191,-51},{-157,-17}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserOut(
    L=L_S3_PL6,
    t=t_S3,
    m_flow_start=m_flow_User_S3,
    pin_start=pin_User_start_S3 - 0.04e5,
    pout_start=pin_User_start_S3 - 0.05e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-164,1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P301(
    Tin_start(displayUnit="K") = Pump.P301.Tin_start,
    Tout_start=Pump.P301.Tout_start,
    a=Pump.P301.a,
    b=Pump.P301.b,
    m_flow_start=m_flow_User_S3,
    dpnom=Pump.P301.dpnom,
    etaelec=Pump.P301.etaelec,
    etamech=Pump.P301.etamech,
    etanom=Pump.P301.etanom,
    hin_start=Pump.P301.hin_start,
    m_flow_nom=Pump.P301.m_flow_nom,
    omeganom=Pump.P301.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    qnom_inm3h=Pump.P301.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P301.rhonom,
    headmax=Pump.P301.headnommax,
    headmin=Pump.P301.headnommin,
    qnom_inm3h_min=Pump.P301.qnommin_inm3h,
    qnom_inm3h_max=Pump.P301.qnommax_inm3h,
    use_in_omega=true)
     "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-164,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D301(
    H=2,
    T_start=Tout_User_start_S3,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
         annotation (Placement(transformation(extent={{-137,61},{-107,109}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-161.5,136.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-161.5,127.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_P301_D301(
    L=L_S3_PL4,
    t=t_S3,
    m_flow_start=m_flow_User_S3,
    pin_start=pout_User_start_S3_pump,
    pout_start=pout_User_start_S3_pump - 0.01e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-164,55})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_D301out(
    L=L_S3_PL3,
    t=t_S3,
    m_flow_start=m_flow_User_S3,
    pin_start=pout_User_start_S3_pump - 0.2e5,
    pout_start=pout_User_start_S3_pump - 0.21e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-164,109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S300_rCD_H(
    L=L_S3_PL1,
    t=t_S3,
    m_flow_start=m_flow_User_S3,
    pin_start=pout_User_start_S3_pump - 0.21e5,
    pout_start=pout_User_start_S3_pump - 0.22e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-164,156})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-186.5,75.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT301(T_start=Tin_User_start_S3, p_start=pin_User_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-186.5,66.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT301
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-186,24})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserIn(
    L=L_S3_PL7,
    t=t_S3,
    m_flow_start=m_flow_User_S3,
    pin_start=pin_User_start_S3 - 0.02e5,
    pout_start=pin_User_start_S3 - 0.03e5,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-184,1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301Sensors_C(
    L=L_S3_PL5,
    t=t_S3,
    m_flow_start=m_flow_User_S3,
    pin_start=pin_User_start_S3 - 0.01e5,
    pout_start=pin_User_start_S3 - 0.02e5,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-184,46})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S300_rCD_C(
    L=L_S3_PL2,
    m_flow_start=m_flow_User_S3,
    pin_start=pin_User_start_S3,
    pout_start=pin_User_start_S3 - 0.01e5,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    n=n)                           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-184,156})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P302(
    Tin_start(displayUnit="K") = Pump.P302.Tin_start,
    Tout_start=Pump.P302.Tout_start,
    a=Pump.P302.a,
    b=Pump.P302.b,
    m_flow_start=m_flow_Source_S3,
    dpnom=Pump.P302.dpnom,
    etaelec=Pump.P302.etaelec,
    etamech=Pump.P302.etamech,
    etanom=Pump.P302.etanom,
    hin_start=Pump.P302.hin_start,
    m_flow_nom=Pump.P302.m_flow_nom,
    omeganom=Pump.P302.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    qnom_inm3h=Pump.P302.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P302.rhonom,
    headmax=Pump.P302.headnommax,
    headmin=Pump.P302.headnommin,
    qnom_inm3h_min=Pump.P302.qnommin_inm3h,
    qnom_inm3h_max=Pump.P302.qnommax_inm3h,
    use_in_omega=true)                        "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-164,-85})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT303 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-161.5,-58.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT304 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-161.5,-67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S300_H(
    L=L_S3_PL9,
    t=t_S3,
    m_flow_start=m_flow_Source_S3,
    pin_start=pout_Source_start_S3_pump - 0.1e5,
    pout_start=pout_Source_start_S3_pump,
    Tin_start=Tin_Source_start_S3,
    Tout_start=Tin_Source_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-164,-125})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT303 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-186.5,-89.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT302
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-186,-103})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_SourceOut(
    L=L_S3_PL8,
    t=t_S3,
    m_flow_start=m_flow_Source_S3,
    pin_start=pout_Source_start_S3_pump + 0.2e5,
    pout_start=pout_Source_start_S3_pump + 0.1e5,
    Tin_start=Tout_Source_start_S3,
    Tout_start=Tout_Source_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-184,-69})));
  Sources.SourcePressure sourcePressure1(p0=pin_User_start_S3, T0=
        Tin_User_start_S3)
    annotation (Placement(transformation(extent={{-214,175},{-194,195}})));
  Sources.SinkMassFlow sink1(
    use_in_m_flow=false,
    pin_start=pout_start_S3_tank,
    p0=pout_start_S3_tank,
    T0=Tout_User_start_S3,
    m_flow0=m_flow_User_S3)
    annotation (Placement(transformation(extent={{-154,175},{-134,195}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S300_C(
    L=L_S3_PL10,
    t=t_S3,
    m_flow_start=m_flow_Source_S3,
    pin_start=pout_Source_start_S3_pump + 0.1e5,
    pout_start=pout_Source_start_S3_pump,
    Tin_start=Tout_Source_start_S3,
    Tout_start=Tout_Source_start_S3,
    Di=Di_S3,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-184,-125})));
  Modelica.Blocks.Sources.Ramp omega_P301(
    offset=2*3.141592654*40,
    height=-2*3.141592654*5,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-128,16},{-149,36}})));
  Modelica.Blocks.Sources.Ramp omega_P302(
    offset=2*3.141592654*30,
    height=2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-127,-99},{-148,-79}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D302(
    H=1,
    T_start(displayUnit="K") = 45 + 273.15,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
    annotation (Placement(transformation(extent={{-100,-182},{-72,-126}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV605(Kv=Valve.FCV401.Kv) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={110,-74})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV606(Kv=Valve.FCV401.Kv) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={140,-90})));
  Modelica.Blocks.Sources.BooleanConstant FV605_OnOff(k=FV605_state)
    annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Modelica.Blocks.Sources.BooleanConstant FV606_OnOff(k=FV606_state)
    annotation (Placement(transformation(extent={{110,-130},{130,-110}})));
  Sources.SourcePressure sourceEB(p0(displayUnit="Pa") = 1.77e5, T0(displayUnit=
         "K") = 30 + 273.15)
    annotation (Placement(transformation(extent={{54,-100},{74,-80}})));
  Sources.SinkPressure sinkEB(p0(displayUnit="Pa") = 1.84e5, T0(displayUnit="K")=
         30 + 273.15)
    annotation (Placement(transformation(extent={{50,-84},{30,-64}})));
  Modelica.Blocks.Interaction.Show.RealValue TT301_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-206,39},{-254,92}})));
  Modelica.Blocks.Interaction.Show.RealValue TT302_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-128,105},{-80,158}})));
  Modelica.Blocks.Interaction.Show.RealValue TT303_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-208,-101},{-256,-48}})));
  Modelica.Blocks.Interaction.Show.RealValue TT304_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-136,-93},{-88,-40}})));
  Modelica.Blocks.Interaction.Show.RealValue TT602_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{232,103},{280,156}})));
  Modelica.Blocks.Interaction.Show.RealValue TT601_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{162,95},{114,148}})));
  Modelica.Blocks.Interaction.Show.RealValue TT604_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{232,-67},{280,-14}})));
  Modelica.Blocks.Interaction.Show.RealValue TT603_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{168,-63},{120,-10}})));
  Modelica.Blocks.Interaction.Show.RealValue TT605_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{230,-175},{278,-122}})));
  Modelica.Blocks.Interaction.Show.RealValue TT606_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{132,-179},{84,-126}})));
equation
  connect(PT601.inlet,TT601. inlet) annotation (Line(
      points={{187.7,115.5},{187.7,106.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outhot, S6_PL_HP601_UserOut.inlet) annotation (Line(
      points={{208.2,22.2},{208.2,23.6},{208,23.6},{208,31}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserOut.outlet,P601. inlet) annotation (Line(
      points={{208,51},{208,62}},
      color={140,56,54},
      thickness=0.5));
  connect(P601.outlet, S6_PL_P301_D301.inlet) annotation (Line(
      points={{208,78},{208,94}},
      color={140,56,54},
      thickness=0.5));
  connect(TT602.inlet,PT602. inlet) annotation (Line(
      points={{208.3,126.5},{208.3,135.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT602.inlet, S6_PL_S600_rCD_H.inlet) annotation (Line(
      points={{208.3,135.5},{208.3,140.25},{208,140.25},{208,145}},
      color={140,56,54},
      thickness=0.5));
  connect(P602.inlet, S6_PL_S600_S600_H.outlet) annotation (Line(
      points={{208,-78},{208,-97}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outcold, S6_PL_HP601_SourceOut.inlet) annotation (Line(
      points={{187.8,1.8},{187.8,-17.6},{188,-17.6},{188,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_SourceOut.outlet,TT603. inlet) annotation (Line(
      points={{188,-40},{188,-50.25},{187.7,-50.25},{187.7,-55.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_rCD_C.outlet,PT601. inlet) annotation (Line(
      points={{188,145},{188,115.5},{187.7,115.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT601.inlet, S6_PL_HP301Sensors_C.inlet) annotation (Line(
      points={{187.7,106.5},{187.7,101.25},{188,101.25},{188,96}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP301Sensors_C.outlet,FT601. inlet) annotation (Line(
      points={{188,76},{188,67}},
      color={140,56,54},
      thickness=0.5));
  connect(FT601.outlet, S6_PL_HP601_UserIn.inlet) annotation (Line(
      points={{188,61},{188,51}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserIn.outlet,HP601. inhot) annotation (Line(
      points={{188,31},{188,23.6},{187.8,23.6},{187.8,22.2}},
      color={140,56,54},
      thickness=0.5));
  connect(P601_omega.y,P601. in_omega)
    annotation (Line(points={{221.95,66},{213,66}},
                                                  color={0,0,127}));
  connect(S6_PL_S600_S600_C.outlet, E601.incold) annotation (Line(
      points={{188,-117},{188,-128.75},{188.2,-128.75},{188.2,-133.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H.inlet, E601.outcold) annotation (Line(
      points={{208,-117},{208,-128.75},{207.8,-128.75},{207.8,-133.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.outlet, E601.inhot) annotation (Line(
      points={{208,-180},{208,-141.75},{207.8,-141.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C1.inlet, TCV601.inlet) annotation (Line(
      points={{188,-180},{188,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, E601.outhot) annotation (Line(
      points={{188,-160},{188,-150.875},{188.2,-150.875},{188.2,-141.75}},
      color={140,56,54},
      thickness=0.5));

  connect(TT602.inlet, S6_PL_P301_D301.outlet) annotation (Line(
      points={{208.3,126.5},{208.3,120.25},{208,120.25},{208,114}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, TT606.inlet) annotation (Line(
      points={{188,-160},{188,-156.75},{187.7,-156.75},{187.7,-153.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.outlet, TT605.inlet) annotation (Line(
      points={{208,-180},{208,-166.75},{208.3,-166.75},{208.3,-153.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, S6_PL_S600_S600_C1.outlet) annotation (Line(
      points={{183,-220},{188,-220},{188,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601_theta.y, TCV601.opening)
    annotation (Line(points={{169.05,-165},{184,-165}}, color={0,0,127}));
  connect(TT604.inlet, P602.outlet) annotation (Line(
      points={{208.3,-54.5},{208.3,-58.25},{208,-58.25},{208,-62}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet,TT604. inlet) annotation (Line(
      points={{208.3,-48.5},{208.3,-54.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet, S6_PL_S600_S600_H1.inlet) annotation (Line(
      points={{208.3,-48.5},{208.3,-44.25},{208,-44.25},{208,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H1.outlet, HP601.incold) annotation (Line(
      points={{208,-20},{208,-15.1},{208.2,-15.1},{208.2,1.8}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.inlet, sourceMassFlow.outlet) annotation (Line(
      points={{208,-200},{208,-220},{213,-220}},
      color={140,56,54},
      thickness=0.5));
  connect(P602_omega.y, P602.in_omega)
    annotation (Line(points={{223.95,-74},{213,-74}},
                                                    color={0,0,127}));
  connect(TT603.inlet, FT602.inlet) annotation (Line(
      points={{187.7,-55.5},{187.7,-58.75},{188,-58.75},{188,-62}},
      color={140,56,54},
      thickness=0.5));
  connect(PT301.inlet,TT301. inlet) annotation (Line(
      points={{-184.3,75.5},{-184.3,66.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outhot,S3_PL_HP301_UserOut. inlet) annotation (Line(
      points={{-163.8,-23.8},{-163.8,-16.4},{-164,-16.4},{-164,-9}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserOut.outlet,P301. inlet) annotation (Line(
      points={{-164,11},{-164,22}},
      color={140,56,54},
      thickness=0.5));
  connect(P301.outlet,S3_PL_P301_D301. inlet) annotation (Line(
      points={{-164,38},{-164,45}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_P301_D301.outlet,D301. inlet) annotation (Line(
      points={{-164,65},{-164,73},{-137,73}},
      color={140,56,54},
      thickness=0.5));
  connect(D301.outlet,S3_PL_D301out. inlet) annotation (Line(
      points={{-137,97},{-164,97},{-164,99}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_D301out.outlet,TT302. inlet) annotation (Line(
      points={{-164,119},{-164,123.25},{-163.7,123.25},{-163.7,127.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT302.inlet,PT302. inlet) annotation (Line(
      points={{-163.7,127.5},{-163.7,136.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT302.inlet,S3_PL_S300_rCD_H. inlet) annotation (Line(
      points={{-163.7,136.5},{-163.7,141.25},{-164,141.25},{-164,146}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.incold,PT303. inlet) annotation (Line(
      points={{-163.8,-44.2},{-163.8,-51.35},{-163.7,-51.35},{-163.7,-58.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT303.inlet,TT304. inlet) annotation (Line(
      points={{-163.7,-58.5},{-163.7,-67.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT304.inlet,P302. outlet) annotation (Line(
      points={{-163.7,-67.5},{-163.7,-72.25},{-164,-72.25},{-164,-77}},
      color={140,56,54},
      thickness=0.5));
  connect(P302.inlet,S3_PL_S600_S300_H. outlet) annotation (Line(
      points={{-164,-93},{-164,-115}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.outlet,TT303. inlet) annotation (Line(
      points={{-184,-100},{-184,-96.25},{-184.3,-96.25},{-184.3,-89.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sink1.inlet, S3_PL_S300_rCD_H.outlet) annotation (Line(
      points={{-154,185},{-164,185},{-164,166}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outcold,S3_PL_HP301_SourceOut. inlet) annotation (Line(
      points={{-184.2,-44.2},{-184.2,-51.6},{-184,-51.6},{-184,-59}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_SourceOut.outlet,TT303. inlet) annotation (Line(
      points={{-184,-79},{-184,-84.25},{-184.3,-84.25},{-184.3,-89.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.inlet,S3_PL_S600_S300_C. inlet) annotation (Line(
      points={{-184,-106},{-184,-115}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure1.outlet, S3_PL_S300_rCD_C.inlet) annotation (Line(
      points={{-194,185},{-184,185},{-184,166}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S300_rCD_C.outlet,PT301. inlet) annotation (Line(
      points={{-184,146},{-184,75.5},{-184.3,75.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.inlet,S3_PL_HP301Sensors_C. inlet) annotation (Line(
      points={{-184.3,66.5},{-184.3,61.25},{-184,61.25},{-184,56}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301Sensors_C.outlet,FT301. inlet) annotation (Line(
      points={{-184,36},{-184,27}},
      color={140,56,54},
      thickness=0.5));
  connect(FT301.outlet,S3_PL_HP301_UserIn. inlet) annotation (Line(
      points={{-184,21},{-184,11}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserIn.outlet,HP301. inhot) annotation (Line(
      points={{-184,-9},{-184,-16.4},{-184.2,-16.4},{-184.2,-23.8}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P301.y,P301. in_omega)
    annotation (Line(points={{-150.05,26},{-159,26}},
                                                  color={0,0,127}));
  connect(omega_P302.y,P302. in_omega)
    annotation (Line(points={{-149.05,-89},{-159,-89}},
                                                      color={0,0,127}));
  connect(FT602.outlet, S6_PL_S600_S600_C.inlet) annotation (Line(
      points={{188,-68},{188,-97}},
      color={140,56,54},
      thickness=0.5));
  connect(FV605.inlet, S6_PL_S600_S600_C.inlet) annotation (Line(
      points={{120,-74},{188,-74},{188,-97}},
      color={140,56,54},
      thickness=0.5));
  connect(FV606.outlet, S6_PL_S600_S600_H.outlet) annotation (Line(
      points={{150,-90},{208,-90},{208,-97}},
      color={140,56,54},
      thickness=0.5));
  connect(FV605_OnOff.y, FV605.u) annotation (Line(points={{101,-30},{110,-30},{
          110,-70.8}}, color={255,0,255}));
  connect(FV606_OnOff.y, FV606.u) annotation (Line(points={{131,-120},{140,-120},
          {140,-93.2}}, color={255,0,255}));
  connect(sourceEB.outlet, FV606.inlet) annotation (Line(
      points={{74,-90},{130,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(FV605.outlet, sinkEB.inlet) annotation (Line(
      points={{100,-74},{50,-74}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S300_H.inlet, S6_PL_S600_rCD_H.outlet) annotation (Line(
      points={{-164,-135},{-164,-208},{-2,-208},{-2,238},{208,238},{208,165}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S300_C.outlet, S6_PL_S600_rCD_C.inlet) annotation (Line(
      points={{-184,-135},{-184,-220},{16,-220},{16,220},{188,220},{188,165},{188,
          165}},
      color={140,56,54},
      thickness=0.5));
  connect(D302.inlet, S6_PL_S600_rCD_C.inlet) annotation (Line(
      points={{-100,-168},{-184,-168},{-184,-220},{16,-220},{16,220},{188,220},{
          188,165}},
      color={140,56,54},
      thickness=0.5));
  connect(D302.outlet, S6_PL_S600_rCD_H.outlet) annotation (Line(
      points={{-100,-140},{-132,-140},{-132,-142},{-164,-142},{-164,-208},{-2,-208},
          {-2,238},{208,238},{208,165}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.T, TT301_.numberPort) annotation (Line(points={{-193.65,66.5},{-198.062,
          66.5},{-198.062,65.5},{-202.4,65.5}}, color={0,0,127}));
  connect(TT302.T, TT302_.numberPort) annotation (Line(points={{-154.35,127.5},{
          -144,127.5},{-144,131.5},{-131.6,131.5}}, color={0,0,127}));
  connect(TT303.T, TT303_.numberPort) annotation (Line(points={{-193.65,-89.5},{
          -198,-89.5},{-198,-74.5},{-204.4,-74.5}}, color={0,0,127}));
  connect(TT304_.numberPort, TT304.T) annotation (Line(points={{-139.6,-66.5},{-139.6,
          -67.5},{-154.35,-67.5}}, color={0,0,127}));
  connect(TT606.T, TT606_.numberPort) annotation (Line(points={{178.35,-153.5},{
          135.6,-153.5},{135.6,-152.5}}, color={0,0,127}));
  connect(TT605.T, TT605_.numberPort) annotation (Line(points={{217.65,-153.5},{
          220,-153.5},{220,-148.5},{226.4,-148.5}}, color={0,0,127}));
  connect(TT604.T, TT604_.numberPort) annotation (Line(points={{217.65,-54.5},{220,
          -54.5},{220,-40.5},{228.4,-40.5}}, color={0,0,127}));
  connect(TT603.T, TT603_.numberPort) annotation (Line(points={{178.35,-55.5},{178,
          -55.5},{178,-36.5},{171.6,-36.5}}, color={0,0,127}));
  connect(TT602.T, TT602_.numberPort) annotation (Line(points={{217.65,126.5},{222,
          126.5},{222,129.5},{228.4,129.5}}, color={0,0,127}));
  connect(TT601.T, TT601_.numberPort) annotation (Line(points={{178.35,106.5},{174,
          106.5},{174,121.5},{165.6,121.5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(
        extent={{-260,-260},{260,260}}),
                     graphics={
        Line(
          points={{225,-189},{225,-159}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{228,-160},{258,-190}},
          textColor={28,108,200},
          textString="17°C"),
        Line(
          points={{251,-90},{251,-60}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{254,-61},{284,-91}},
          textColor={28,108,200},
          textString="14°C"),
        Line(
          points={{228,89},{228,119}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{231,118},{261,88}},
          textColor={28,108,200},
          textString="45°C"),
        Line(
          points={{177,-173},{177,-203}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{145,-175},{175,-205}},
          textColor={28,108,200},
          textString="15°C"),
        Line(
          points={{173,-42},{173,-72}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{141,-44},{171,-74}},
          textColor={28,108,200},
          textString="7°C"),
        Line(
          points={{172,115},{172,85}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{140,113},{170,83}},
          textColor={28,108,200},
          textString="41°C"),
        Line(
          points={{-124,-107},{-124,-77}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-121,-78},{-91,-108}},
          textColor={28,108,200},
          textString="45°C"),
        Line(
          points={{-197,-81},{-197,-111}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-229,-83},{-199,-113}},
          textColor={28,108,200},
          textString="41°C")}),
    experiment(
      StopTime=300,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end HPSystem;
