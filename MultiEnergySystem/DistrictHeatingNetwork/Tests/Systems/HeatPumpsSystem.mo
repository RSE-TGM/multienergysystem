within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model HeatPumpsSystem
  "S300 & S600 interacting together for centralized configuration"

  parameter Integer n = 3 "Number of volumes in each pipe";

  final parameter Types.Pressure pin_start_S3_tank = pout_User_start_S3_pump;
  final parameter Types.Pressure pout_start_S3_tank = pin_start_S3_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S3 = 1.79e5;
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
  parameter Types.MassFlowRate m_flow_Source_S3 = 2.444444444;
  parameter Types.MassFlowRate m_flow_User_S3 = 0.47;

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
          annotation (Placement(transformation(extent={{61,-7},{95,27}})));
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
        origin={88,45})));
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
        origin={88,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={90.5,139.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={90.5,130.5})));
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
        origin={88,108})));
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
        origin={88,159})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT601 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={65.5,119.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT601(T_start=Tin_User_start_S6, p_start=pin_User_start_S6)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={65.5,110.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT601
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={66,68})));
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
        origin={68,45})));
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
        origin={68,90})));
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
        origin={68,159})));
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
        origin={88,-60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT603 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={90.5,-38.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT604(T_start=Tin_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={90.5,-44.5})));
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
        origin={88,-85})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT603(T_start=Tout_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={65.5,-45.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT602(T_start=
        Tout_Source_start_S6_hp)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=270,
        origin={66,-55})));
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
        origin={68,-20})));
  Sources.SinkPressure sinkPressure(p0=pout_cool_start_S6_HX,     T0=
        Tout_cool_start_S6_HX)
    annotation (Placement(transformation(extent={{63,-200},{43,-180}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=pin_cool_start_S6_HX,
    T0=Tin_cool_start_S6_HX,
    m_flow0=m_flow_cool_S6)
    annotation (Placement(transformation(extent={{113,-200},{93,-180}})));
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
        origin={68,-85})));
  inner System system
    annotation (Placement(transformation(extent={{181,179},{201,199}})));
  Modelica.Blocks.Sources.Ramp P601_omega(
    offset=2*3.141592654*30,
    height=-2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{124,60},{103,80}})));
  Modelica.Blocks.Sources.Ramp P602_omega(
    offset=2*3.141592654*50,
    height=2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{126,-74},{105,-54}})));
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
    hin_start_cold=BPHE.E601.hin_start_cold,
    hin_start_hot=BPHE.E601.hin_start_hot,
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
    Placement(visible = true, transformation(origin={78,-107.5},extent={{8.5,14},
            {-8.5,-14}},                                                                         rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV601(
    Kv=Valve.TCV601.Kv,
    dp_nom(displayUnit="Pa") = Valve.TCV601.dp_nom,
    Tin_start(displayUnit="K") = Tout_cool_start_S6_HX,
    pin_start=pout_cool_start_S6_HX)
                             "Temperature control valve in System 300"
                             annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={68,-135})));
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
        origin={68,-160})));
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
        origin={88,-160})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT606(T_start=Tout_cool_start_S6_HX, p_start=pout_cool_start_S6_HX)
          "Temperature Sensor at the outlet of HX601 - cooling side"
    annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={65.5,-123.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT605(T_start=Tin_cool_start_S6_HX, p_start=pin_cool_start_S6_HX - 0.05e5)
          "Temperature Sensor at the inlet of HX601 - cooling side" annotation (
     Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=-90,
        origin={90.5,-123.5})));
  Modelica.Blocks.Sources.Ramp TCV601_theta(
    offset=1,
    height=0,
    duration=0,
    startTime=0)
    annotation (Placement(transformation(extent={{27,-145},{48,-125}})));
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
        origin={88,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ClosedLoopInitializer
    closedLoopInitializer(
    p_start=250000,
    T_start(displayUnit="K") = 7 + 273.15,
    m_flow_start=1.369047619) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=-90,
        origin={68,-66})));
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
          annotation (Placement(transformation(extent={{-119,-51},{-85,-17}})));
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
        origin={-92,1})));
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
        origin={-92,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D301(
    H=2,
    T_start=Tout_User_start_S3,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
         annotation (Placement(transformation(extent={{-65,61},{-35,109}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-89.5,136.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-89.5,127.5})));
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
        origin={-92,55})));
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
        origin={-92,109})));
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
        origin={-92,156})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-114.5,75.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT301(T_start=Tin_User_start_S3, p_start=pin_User_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-114.5,66.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT301
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-114,24})));
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
        origin={-112,1})));
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
        origin={-112,46})));
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
        origin={-112,156})));
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
        origin={-92,-85})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT303 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-89.5,-58.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT304 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-89.5,-67.5})));
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
        origin={-92,-125})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT303 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-114.5,-89.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT302
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-114,-103})));
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
        origin={-112,-69})));
  Sources.SourcePressure sourcePressure1(p0=pin_User_start_S3, T0=
        Tin_User_start_S3)
    annotation (Placement(transformation(extent={{-142,175},{-122,195}})));
  Sources.SinkMassFlow sink1(
    use_in_m_flow=false,
    pin_start=pout_start_S3_tank,
    p0=pout_start_S3_tank,
    T0=Tout_User_start_S3,
    m_flow0=m_flow_User_S3)
    annotation (Placement(transformation(extent={{-82,175},{-62,195}})));
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
        origin={-112,-125})));
  Modelica.Blocks.Sources.Ramp omega_P301(
    offset=2*3.141592654*40,
    height=-2*3.141592654*5,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-56,16},{-77,36}})));
  Modelica.Blocks.Sources.Ramp omega_P302(
    offset=2*3.141592654*30,
    height=2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-55,-99},{-76,-79}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D302(
    H=1,
    T_start(displayUnit="K") = 45 + 273.15,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
    annotation (Placement(transformation(extent={{-48,-171},{-18,-123}})));
equation
  connect(PT601.inlet,TT601. inlet) annotation (Line(
      points={{67.7,119.5},{67.7,110.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outhot, S6_PL_HP601_UserOut.inlet) annotation (Line(
      points={{88.2,20.2},{88.2,27.6},{88,27.6},{88,35}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserOut.outlet,P601. inlet) annotation (Line(
      points={{88,55},{88,66}},
      color={140,56,54},
      thickness=0.5));
  connect(P601.outlet, S6_PL_P301_D301.inlet) annotation (Line(
      points={{88,82},{88,98}},
      color={140,56,54},
      thickness=0.5));
  connect(TT602.inlet,PT602. inlet) annotation (Line(
      points={{88.3,130.5},{88.3,139.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT602.inlet, S6_PL_S600_rCD_H.inlet) annotation (Line(
      points={{88.3,139.5},{88.3,144.25},{88,144.25},{88,149}},
      color={140,56,54},
      thickness=0.5));
  connect(P602.inlet, S6_PL_S600_S600_H.outlet) annotation (Line(
      points={{88,-68},{88,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outcold, S6_PL_HP601_SourceOut.inlet) annotation (Line(
      points={{67.8,-0.2},{67.8,-7.6},{68,-7.6},{68,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_SourceOut.outlet,TT603. inlet) annotation (Line(
      points={{68,-30},{68,-40.25},{67.7,-40.25},{67.7,-45.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_rCD_C.outlet,PT601. inlet) annotation (Line(
      points={{68,149},{68,119.5},{67.7,119.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT601.inlet, S6_PL_HP301Sensors_C.inlet) annotation (Line(
      points={{67.7,110.5},{67.7,105.25},{68,105.25},{68,100}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP301Sensors_C.outlet,FT601. inlet) annotation (Line(
      points={{68,80},{68,71}},
      color={140,56,54},
      thickness=0.5));
  connect(FT601.outlet, S6_PL_HP601_UserIn.inlet) annotation (Line(
      points={{68,65},{68,55}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserIn.outlet,HP601. inhot) annotation (Line(
      points={{68,35},{68,27.6},{67.8,27.6},{67.8,20.2}},
      color={140,56,54},
      thickness=0.5));
  connect(P601_omega.y,P601. in_omega)
    annotation (Line(points={{101.95,70},{93,70}},color={0,0,127}));
  connect(S6_PL_S600_S600_C.outlet, E601.incold) annotation (Line(
      points={{68,-95},{68,-98.75},{68.2,-98.75},{68.2,-103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H.inlet, E601.outcold) annotation (Line(
      points={{88,-95},{88,-98.75},{87.8,-98.75},{87.8,-103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.outlet, E601.inhot) annotation (Line(
      points={{88,-150},{88,-111.75},{87.8,-111.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C1.inlet, TCV601.inlet) annotation (Line(
      points={{68,-150},{68,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, E601.outhot) annotation (Line(
      points={{68,-130},{68,-120.875},{68.2,-120.875},{68.2,-111.75}},
      color={140,56,54},
      thickness=0.5));

  connect(TT602.inlet, S6_PL_P301_D301.outlet) annotation (Line(
      points={{88.3,130.5},{88.3,124.25},{88,124.25},{88,118}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, TT606.inlet) annotation (Line(
      points={{68,-130},{68,-126.75},{67.7,-126.75},{67.7,-123.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.outlet, TT605.inlet) annotation (Line(
      points={{88,-150},{88,-136.75},{88.3,-136.75},{88.3,-123.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, S6_PL_S600_S600_C1.outlet) annotation (Line(
      points={{63,-190},{68,-190},{68,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601_theta.y, TCV601.opening)
    annotation (Line(points={{49.05,-135},{64,-135}},   color={0,0,127}));
  connect(TT604.inlet, P602.outlet) annotation (Line(
      points={{88.3,-44.5},{88.3,-48.25},{88,-48.25},{88,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet,TT604. inlet) annotation (Line(
      points={{88.3,-38.5},{88.3,-44.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet, S6_PL_S600_S600_H1.inlet) annotation (Line(
      points={{88.3,-38.5},{88.3,-34.25},{88,-34.25},{88,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H1.outlet, HP601.incold) annotation (Line(
      points={{88,-10},{88,-5.1},{88.2,-5.1},{88.2,-0.2}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.inlet, sourceMassFlow.outlet) annotation (Line(
      points={{88,-170},{88,-190},{93,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(closedLoopInitializer.outlet, S6_PL_S600_S600_C.inlet) annotation (
      Line(
      points={{68,-69},{68,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(P602_omega.y, P602.in_omega)
    annotation (Line(points={{103.95,-64},{93,-64}},color={0,0,127}));
  connect(FT602.outlet, closedLoopInitializer.inlet) annotation (Line(
      points={{68,-58},{68,-60.5},{67.94,-60.5},{67.94,-63}},
      color={140,56,54},
      thickness=0.5));
  connect(TT603.inlet, FT602.inlet) annotation (Line(
      points={{67.7,-45.5},{67.7,-48.75},{68,-48.75},{68,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PT301.inlet,TT301. inlet) annotation (Line(
      points={{-112.3,75.5},{-112.3,66.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outhot,S3_PL_HP301_UserOut. inlet) annotation (Line(
      points={{-91.8,-23.8},{-91.8,-16.4},{-92,-16.4},{-92,-9}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserOut.outlet,P301. inlet) annotation (Line(
      points={{-92,11},{-92,22}},
      color={140,56,54},
      thickness=0.5));
  connect(P301.outlet,S3_PL_P301_D301. inlet) annotation (Line(
      points={{-92,38},{-92,45}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_P301_D301.outlet,D301. inlet) annotation (Line(
      points={{-92,65},{-92,76},{-65,76}},
      color={140,56,54},
      thickness=0.5));
  connect(D301.outlet,S3_PL_D301out. inlet) annotation (Line(
      points={{-65,94},{-92,94},{-92,99}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_D301out.outlet,TT302. inlet) annotation (Line(
      points={{-92,119},{-92,123.25},{-91.7,123.25},{-91.7,127.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT302.inlet,PT302. inlet) annotation (Line(
      points={{-91.7,127.5},{-91.7,136.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT302.inlet,S3_PL_S300_rCD_H. inlet) annotation (Line(
      points={{-91.7,136.5},{-91.7,141.25},{-92,141.25},{-92,146}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.incold,PT303. inlet) annotation (Line(
      points={{-91.8,-44.2},{-91.8,-51.35},{-91.7,-51.35},{-91.7,-58.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT303.inlet,TT304. inlet) annotation (Line(
      points={{-91.7,-58.5},{-91.7,-67.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT304.inlet,P302. outlet) annotation (Line(
      points={{-91.7,-67.5},{-91.7,-72.25},{-92,-72.25},{-92,-77}},
      color={140,56,54},
      thickness=0.5));
  connect(P302.inlet,S3_PL_S600_S300_H. outlet) annotation (Line(
      points={{-92,-93},{-92,-115}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.outlet,TT303. inlet) annotation (Line(
      points={{-112,-100},{-112,-96.25},{-112.3,-96.25},{-112.3,-89.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sink1.inlet, S3_PL_S300_rCD_H.outlet) annotation (Line(
      points={{-82,185},{-92,185},{-92,166}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outcold,S3_PL_HP301_SourceOut. inlet) annotation (Line(
      points={{-112.2,-44.2},{-112.2,-51.6},{-112,-51.6},{-112,-59}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_SourceOut.outlet,TT303. inlet) annotation (Line(
      points={{-112,-79},{-112,-84.25},{-112.3,-84.25},{-112.3,-89.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.inlet,S3_PL_S600_S300_C. inlet) annotation (Line(
      points={{-112,-106},{-112,-115}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure1.outlet, S3_PL_S300_rCD_C.inlet) annotation (Line(
      points={{-122,185},{-112,185},{-112,166}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S300_rCD_C.outlet,PT301. inlet) annotation (Line(
      points={{-112,146},{-112,75.5},{-112.3,75.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.inlet,S3_PL_HP301Sensors_C. inlet) annotation (Line(
      points={{-112.3,66.5},{-112.3,61.25},{-112,61.25},{-112,56}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301Sensors_C.outlet,FT301. inlet) annotation (Line(
      points={{-112,36},{-112,27}},
      color={140,56,54},
      thickness=0.5));
  connect(FT301.outlet,S3_PL_HP301_UserIn. inlet) annotation (Line(
      points={{-112,21},{-112,11}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserIn.outlet,HP301. inhot) annotation (Line(
      points={{-112,-9},{-112,-16.4},{-112.2,-16.4},{-112.2,-23.8}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P301.y,P301. in_omega)
    annotation (Line(points={{-78.05,26},{-87,26}},
                                                  color={0,0,127}));
  connect(omega_P302.y,P302. in_omega)
    annotation (Line(points={{-77.05,-89},{-87,-89}}, color={0,0,127}));
  connect(S6_PL_S600_rCD_H.outlet, D302.outlet) annotation (Line(
      points={{88,169},{88,189},{-1,189},{-1,-119},{-64,-119},{-64,-138},{-48,
          -138}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_rCD_C.inlet, D302.inlet) annotation (Line(
      points={{68,169},{68,177},{8,177},{8,-179},{-62,-179},{-62,-156},{-48,
          -156}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S300_H.inlet, D302.outlet) annotation (Line(
      points={{-92,-135},{-92,-138},{-48,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S300_C.outlet, D302.inlet) annotation (Line(
      points={{-112,-135},{-113,-135},{-113,-155},{-62,-155},{-62,-156},{-48,
          -156}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(
        extent={{-200,-200},{200,200}}, grid={1,1}),
                     graphics={
        Line(
          points={{105,-159},{105,-129}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{108,-130},{138,-160}},
          textColor={28,108,200},
          textString="17°C"),
        Line(
          points={{131,-80},{131,-50}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{134,-51},{164,-81}},
          textColor={28,108,200},
          textString="14°C"),
        Line(
          points={{108,93},{108,123}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{111,122},{141,92}},
          textColor={28,108,200},
          textString="45°C"),
        Line(
          points={{57,-143},{57,-173}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{25,-145},{55,-175}},
          textColor={28,108,200},
          textString="15°C"),
        Line(
          points={{53,-32},{53,-62}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{21,-34},{51,-64}},
          textColor={28,108,200},
          textString="7°C"),
        Line(
          points={{52,119},{52,89}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{20,117},{50,87}},
          textColor={28,108,200},
          textString="41°C"),
        Line(
          points={{-52,-107},{-52,-77}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-49,-78},{-19,-108}},
          textColor={28,108,200},
          textString="45°C"),
        Line(
          points={{-125,-81},{-125,-111}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-157,-83},{-127,-113}},
          textColor={28,108,200},
          textString="41°C")}));
end HeatPumpsSystem;
