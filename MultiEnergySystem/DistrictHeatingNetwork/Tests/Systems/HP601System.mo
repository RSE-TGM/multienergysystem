within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model HP601System
  extends Modelica.Icons.Example;
  parameter Integer n = 3 "Number of volumes in each pipe";

  final parameter Types.Pressure pin_start_S6_tank = pout_User_start_S6_pump;
  final parameter Types.Pressure pout_start_S6_tank = pin_start_S6_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S6 = 1.79e5+1.21e5;
  parameter Types.Pressure pout_Source_start_S6 = 2.5e5+1.21e5;
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
          annotation (Placement(transformation(extent={{-17,-7},{17,27}})));
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
        origin={10,45})));
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
        origin={10,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,139.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,130.5})));
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
        origin={10,108})));
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
        origin={10,159})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT601 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,119.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT601(T_start=Tin_User_start_S6, p_start=pin_User_start_S6)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,110.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT601
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-12,68})));
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
        origin={-10,45})));
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
        origin={-10,90})));
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
        origin={-10,159})));
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
        origin={10,-60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT603 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-38.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT604(T_start=Tin_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-44.5})));
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
        origin={10,-85})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT603(T_start=Tout_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,-45.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT602(T_start=
        Tout_Source_start_S6_hp)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=270,
        origin={-12,-55})));
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
        origin={-10,-20})));
  Sources.SinkPressure sinkPressure(p0=pout_cool_start_S6_HX,     T0=
        Tout_cool_start_S6_HX)
    annotation (Placement(transformation(extent={{-15,-200},{-35,-180}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=pin_cool_start_S6_HX,
    T0=Tin_cool_start_S6_HX,
    m_flow0=m_flow_cool_S6)
    annotation (Placement(transformation(extent={{35,-200},{15,-180}})));
  Sources.SourcePressure sourcePressure(p0=pin_User_start_S6, T0=
        Tin_User_start_S6)
    annotation (Placement(transformation(extent={{-40,178},{-20,198}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=false,
    pin_start=pout_start_S6_tank,
    p0=pout_start_S6_tank,
    T0=Tout_User_start_S6,
    m_flow0=m_flow_User_S6)
    annotation (Placement(transformation(extent={{20,178},{40,198}})));
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
        origin={-10,-85})));
  inner System system
    annotation (Placement(transformation(extent={{120,160},{140,180}})));
  Modelica.Blocks.Sources.Ramp P601_omega(
    offset=2*3.141592654*40,
    height=-2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{46,60},{25,80}})));
  Modelica.Blocks.Sources.Ramp P602_omega(
    offset=2*3.141592654*50,
    height=2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{48,-74},{27,-54}})));
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
    Placement(visible = true, transformation(origin={-8.5e-06,-107.5},
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
        origin={-10,-135})));
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
        origin={-10,-160})));
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
        origin={10,-160})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT606(T_start=Tout_cool_start_S6_HX, p_start=pout_cool_start_S6_HX)
          "Temperature Sensor at the outlet of HX601 - cooling side"
    annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,-123.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT605(T_start=Tin_cool_start_S6_HX, p_start=pin_cool_start_S6_HX - 0.05e5)
          "Temperature Sensor at the inlet of HX601 - cooling side" annotation (
     Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=-90,
        origin={12.5,-123.5})));
  Modelica.Blocks.Sources.Ramp TCV601_theta(
    offset=1,
    height=0,
    duration=0,
    startTime=0)
    annotation (Placement(transformation(extent={{-51,-145},{-30,-125}})));
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
        origin={10,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ClosedLoopInitializer
    closedLoopInitializer(
    p_start=250000,
    T_start(displayUnit="K") = 7 + 273.15,
    m_flow_start=1.369047619) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=-90,
        origin={-10,-66})));
equation
  connect(PT601.inlet,TT601. inlet) annotation (Line(
      points={{-10.3,119.5},{-10.3,110.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outhot, S6_PL_HP601_UserOut.inlet) annotation (Line(
      points={{10.2,20.2},{10.2,27.6},{10,27.6},{10,35}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserOut.outlet,P601. inlet) annotation (Line(
      points={{10,55},{10,66}},
      color={140,56,54},
      thickness=0.5));
  connect(P601.outlet, S6_PL_P301_D301.inlet) annotation (Line(
      points={{10,82},{10,98}},
      color={140,56,54},
      thickness=0.5));
  connect(TT602.inlet,PT602. inlet) annotation (Line(
      points={{10.3,130.5},{10.3,139.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT602.inlet, S6_PL_S600_rCD_H.inlet) annotation (Line(
      points={{10.3,139.5},{10.3,144.25},{10,144.25},{10,149}},
      color={140,56,54},
      thickness=0.5));
  connect(P602.inlet, S6_PL_S600_S600_H.outlet) annotation (Line(
      points={{10,-68},{10,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, S6_PL_S600_rCD_H.outlet) annotation (Line(
      points={{20,188},{10,188},{10,169}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outcold, S6_PL_HP601_SourceOut.inlet) annotation (Line(
      points={{-10.2,-0.2},{-10.2,-7.6},{-10,-7.6},{-10,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_SourceOut.outlet,TT603. inlet) annotation (Line(
      points={{-10,-30},{-10,-40.25},{-10.3,-40.25},{-10.3,-45.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure.outlet, S6_PL_S600_rCD_C.inlet) annotation (Line(
      points={{-20,188},{-10,188},{-10,169}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_rCD_C.outlet,PT601. inlet) annotation (Line(
      points={{-10,149},{-10,119.5},{-10.3,119.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT601.inlet, S6_PL_HP301Sensors_C.inlet) annotation (Line(
      points={{-10.3,110.5},{-10.3,105.25},{-10,105.25},{-10,100}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP301Sensors_C.outlet,FT601. inlet) annotation (Line(
      points={{-10,80},{-10,71}},
      color={140,56,54},
      thickness=0.5));
  connect(FT601.outlet, S6_PL_HP601_UserIn.inlet) annotation (Line(
      points={{-10,65},{-10,55}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserIn.outlet,HP601. inhot) annotation (Line(
      points={{-10,35},{-10,27.6},{-10.2,27.6},{-10.2,20.2}},
      color={140,56,54},
      thickness=0.5));
  connect(P601_omega.y,P601. in_omega)
    annotation (Line(points={{23.95,70},{15,70}}, color={0,0,127}));
  connect(S6_PL_S600_S600_C.outlet, E601.incold) annotation (Line(
      points={{-10,-95},{-10,-98.75},{-9.80001,-98.75},{-9.80001,-103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H.inlet, E601.outcold) annotation (Line(
      points={{10,-95},{10,-98.75},{9.79999,-98.75},{9.79999,-103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.outlet, E601.inhot) annotation (Line(
      points={{10,-150},{10,-111.75},{9.79999,-111.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C1.inlet, TCV601.inlet) annotation (Line(
      points={{-10,-150},{-10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, E601.outhot) annotation (Line(
      points={{-10,-130},{-10,-120.875},{-9.80001,-120.875},{-9.80001,-111.75}},
      color={140,56,54},
      thickness=0.5));

  connect(TT602.inlet, S6_PL_P301_D301.outlet) annotation (Line(
      points={{10.3,130.5},{10.3,124.25},{10,124.25},{10,118}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, TT606.inlet) annotation (Line(
      points={{-10,-130},{-10,-126.75},{-10.3,-126.75},{-10.3,-123.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.outlet, TT605.inlet) annotation (Line(
      points={{10,-150},{10,-136.75},{10.3,-136.75},{10.3,-123.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, S6_PL_S600_S600_C1.outlet) annotation (Line(
      points={{-15,-190},{-10,-190},{-10,-170}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601_theta.y, TCV601.opening)
    annotation (Line(points={{-28.95,-135},{-14,-135}}, color={0,0,127}));
  connect(TT604.inlet, P602.outlet) annotation (Line(
      points={{10.3,-44.5},{10.3,-48.25},{10,-48.25},{10,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet,TT604. inlet) annotation (Line(
      points={{10.3,-38.5},{10.3,-44.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet, S6_PL_S600_S600_H1.inlet) annotation (Line(
      points={{10.3,-38.5},{10.3,-34.25},{10,-34.25},{10,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H1.outlet, HP601.incold) annotation (Line(
      points={{10,-10},{10,-5.1},{10.2,-5.1},{10.2,-0.2}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C2.inlet, sourceMassFlow.outlet) annotation (Line(
      points={{10,-170},{10,-190},{15,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(closedLoopInitializer.outlet, S6_PL_S600_S600_C.inlet) annotation (
      Line(
      points={{-10,-69},{-10,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(P602_omega.y, P602.in_omega)
    annotation (Line(points={{25.95,-64},{15,-64}}, color={0,0,127}));
  connect(FT602.outlet, closedLoopInitializer.inlet) annotation (Line(
      points={{-10,-58},{-10,-60.5},{-10.06,-60.5},{-10.06,-63}},
      color={140,56,54},
      thickness=0.5));
  connect(TT603.inlet, FT602.inlet) annotation (Line(
      points={{-10.3,-45.5},{-10.3,-48.75},{-10,-48.75},{-10,-52}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(
        preserveAspectRatio=false,
        extent={{-140,-200},{140,200}},
        grid={1,1}), graphics={
        Line(
          points={{27,-159},{27,-129}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{30,-130},{60,-160}},
          textColor={28,108,200},
          textString="17°C"),
        Line(
          points={{53,-80},{53,-50}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{56,-51},{86,-81}},
          textColor={28,108,200},
          textString="14°C"),
        Line(
          points={{30,93},{30,123}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{33,122},{63,92}},
          textColor={28,108,200},
          textString="45°C"),
        Line(
          points={{-21,-143},{-21,-173}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-53,-145},{-23,-175}},
          textColor={28,108,200},
          textString="15°C"),
        Line(
          points={{-25,-32},{-25,-62}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-57,-34},{-27,-64}},
          textColor={28,108,200},
          textString="7°C"),
        Line(
          points={{-26,119},{-26,89}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-58,117},{-28,87}},
          textColor={28,108,200},
          textString="41°C")}));
end HP601System;
