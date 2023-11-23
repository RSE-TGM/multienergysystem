within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model HP601System

  parameter Integer n = 3 "Number of volumes in each pipe";

  final parameter Types.Pressure pin_start_S6_tank = pout_User_start_S6_pump;
  final parameter Types.Pressure pout_start_S6_tank = pin_start_S6_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S6 = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6 = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S6 = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S6 = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S6 = 1.69e5;
  parameter Types.Pressure pout_User_start_S6 = 2.5e5;
  parameter Types.Temperature Tin_User_start_S6 = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S6 = 80 + 273.15;

  // Heat Pump
  parameter Types.Pressure pin_Source_start_S6_hp = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6_hp = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S6_hp = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S6_hp = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S6_hp = 1.79e5;
  parameter Types.Pressure pout_User_start_S6_hp = 2.5e5;
  parameter Types.Temperature Tin_User_start_S6_hp = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S6_hp = 80 + 273.15;

  // Water Pump P301
  parameter Types.Pressure pin_User_start_S6_pump = pin_User_start_S6;
  parameter Types.Pressure pout_User_start_S6_pump = pin_User_start_S6_pump + 1.22e5;

  // Water Pump P302
  parameter Types.Pressure pin_Source_start_S6_pump = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6_pump = pin_Source_start_S6_pump + 0.88e5;

  // General Pipeline Data
  parameter Types.Length Di_S6 = 51e-3;
  parameter Types.Length t_S6 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S6 = 2.444444444;
  parameter Types.MassFlowRate m_flow_User_S6 = 0.47;

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
    HP301(
    Tin_hot_start=Tin_User_start_S6_hp,
    Tin_cold_start=Tin_Source_start_S6_hp,
    Tout_cold_start=Tout_Source_start_S6_hp,
    Tout_hot_set=Tout_User_start_S6_hp,
    m_flow_hot_start=m_flow_User_S6,
    m_flow_cold_start=m_flow_Source_S6,
    k_hot=8000,
    k_cold=8000)
          annotation (Placement(transformation(extent={{-17,-7},{17,27}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserOut(
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
    P301(
      Tin_start(displayUnit="K") = Pump.P301.Tin_start,
      Tout_start=Pump.P301.Tout_start,
      a=Pump.P301.a,
      b=Pump.P301.b,
      m_flow_start=m_flow_User_S6,
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
        origin={10,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,139.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,130.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_P301_D301(
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
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_rCD_H(
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
    PT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,119.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT301(T_start=Tin_User_start_S6, p_start=pin_User_start_S6)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,110.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT301
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-12,68})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserIn(
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
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301Sensors_C(
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
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_rCD_C(L=
        L_S6_PL2,
      m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6,
    pout_start=pin_User_start_S6 - 0.01e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n)                           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,159})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P302(
      Tin_start(displayUnit="K") = Pump.P302.Tin_start,
      Tout_start=Pump.P302.Tout_start,
      a=Pump.P302.a,
      b=Pump.P302.b,
    m_flow_start=m_flow_Source_S6,
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
        origin={10,-41})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT303 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-14.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT304 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-23.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S600_H(
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
        origin={10,-81})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT303 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,-45.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT302
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-12,-59})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_SourceOut(
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
        origin={-10,-25})));
  Sources.SinkPressure sinkPressure(p0=pout_Source_start_S6_pump, T0=
        Tout_Source_start_S6)
    annotation (Placement(transformation(extent={{20,-193},{0,-173}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=pin_Source_start_S6_pump,
    T0=Tin_Source_start_S6_hp,          m_flow0=m_flow_Source_S6)
    annotation (Placement(transformation(extent={{58,-176},{38,-156}})));
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
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S600_C(
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
        origin={-10,-81})));
  inner System system
    annotation (Placement(transformation(extent={{120,160},{140,180}})));
  Modelica.Blocks.Sources.Ramp omega_P301(
    offset=2*3.141592654*40,
    height=-2*3.141592654*5,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{46,60},{25,80}})));
  Modelica.Blocks.Sources.Ramp omega_P302(
    offset=2*3.141592654*50,
    height=2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{47,-55},{26,-35}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E601(
    Di_cold=BPHE.E601.Di_cold,
    Di_hot=BPHE.E601.Di_hot,
    L_cold=BPHE.E601.L_cold,
    L_hot=BPHE.E601.L_hot,
    MWall=BPHE.E601.MWall,
    Stot_cold=BPHE.E601.Stot_cold,
    Stot_hot=BPHE.E601.Stot_hot,
    Tin_start_cold=BPHE.E601.Tin_start_cold,
    Tin_start_hot=BPHE.E601.Tin_start_hot,
    Tout_start_cold=BPHE.E601.Tout_start_cold,
    Tout_start_hot=BPHE.E601.Tout_start_hot,
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
    Placement(visible = true, transformation(origin={-8.5e-06,-107.5},
                                                                extent={{8.5,14},
            {-8.5,-14}},                                                                         rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV901(
    Kv=Valve.FCV901.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV901.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-10,-135})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S600_C1(
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
        origin={-10,-160})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S600_C2(
    L=L_S6_PL10,
    t=t_S6,
    m_flow_start=m_flow_Source_S6,
    pin_start=pout_Source_start_S6_pump + 0.1e5,
    pout_start=pout_Source_start_S6_pump,
    Tin_start=Tout_Source_start_S6,
    Tout_start=Tout_Source_start_S6,
    Di=Di_S6,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-160})));
equation
  connect(PT301.inlet, TT301.inlet) annotation (Line(
      points={{-10.3,119.5},{-10.3,110.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outhot, S3_PL_HP301_UserOut.inlet) annotation (Line(
      points={{10.2,20.2},{10.2,27.6},{10,27.6},{10,35}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserOut.outlet, P301.inlet) annotation (Line(
      points={{10,55},{10,66}},
      color={140,56,54},
      thickness=0.5));
  connect(P301.outlet, S3_PL_P301_D301.inlet) annotation (Line(
      points={{10,82},{10,98}},
      color={140,56,54},
      thickness=0.5));
  connect(TT302.inlet, PT302.inlet) annotation (Line(
      points={{10.3,130.5},{10.3,139.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT302.inlet, S3_PL_S600_rCD_H.inlet) annotation (Line(
      points={{10.3,139.5},{10.3,144.25},{10,144.25},{10,149}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.incold, PT303.inlet) annotation (Line(
      points={{10.2,-0.2},{10.2,-7.35},{10.3,-7.35},{10.3,-14.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT303.inlet, TT304.inlet) annotation (Line(
      points={{10.3,-14.5},{10.3,-23.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT304.inlet, P302.outlet) annotation (Line(
      points={{10.3,-23.5},{10.3,-28.25},{10,-28.25},{10,-33}},
      color={140,56,54},
      thickness=0.5));
  connect(P302.inlet, S3_PL_S600_S600_H.outlet) annotation (Line(
      points={{10,-49},{10,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.outlet, TT303.inlet) annotation (Line(
      points={{-10,-56},{-10,-52.25},{-10.3,-52.25},{-10.3,-45.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, S3_PL_S600_rCD_H.outlet) annotation (Line(
      points={{20,188},{10,188},{10,169}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outcold, S3_PL_HP301_SourceOut.inlet) annotation (Line(
      points={{-10.2,-0.2},{-10.2,-7.6},{-10,-7.6},{-10,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_SourceOut.outlet, TT303.inlet) annotation (Line(
      points={{-10,-35},{-10,-40.25},{-10.3,-40.25},{-10.3,-45.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.inlet, S3_PL_S600_S600_C.inlet) annotation (Line(
      points={{-10,-62},{-10,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure.outlet, S3_PL_S600_rCD_C.inlet) annotation (Line(
      points={{-20,188},{-10,188},{-10,169}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_rCD_C.outlet, PT301.inlet) annotation (Line(
      points={{-10,149},{-10,119.5},{-10.3,119.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.inlet, S3_PL_HP301Sensors_C.inlet) annotation (Line(
      points={{-10.3,110.5},{-10.3,105.25},{-10,105.25},{-10,100}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301Sensors_C.outlet, FT301.inlet) annotation (Line(
      points={{-10,80},{-10,71}},
      color={140,56,54},
      thickness=0.5));
  connect(FT301.outlet, S3_PL_HP301_UserIn.inlet) annotation (Line(
      points={{-10,65},{-10,55}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserIn.outlet, HP301.inhot) annotation (Line(
      points={{-10,35},{-10,27.6},{-10.2,27.6},{-10.2,20.2}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P301.y, P301.in_omega)
    annotation (Line(points={{23.95,70},{15,70}}, color={0,0,127}));
  connect(omega_P302.y, P302.in_omega)
    annotation (Line(points={{24.95,-45},{15,-45}},   color={0,0,127}));
  connect(S3_PL_S600_S600_C.outlet, E601.incold) annotation (Line(
      points={{-10,-91},{-10,-98.75},{-9.80001,-98.75},{-9.80001,-103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S600_H.inlet, E601.outcold) annotation (Line(
      points={{10,-91},{10,-98.75},{9.79999,-98.75},{9.79999,-103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S600_C2.outlet, E601.inhot) annotation (Line(
      points={{10,-150},{10,-111.75},{9.79999,-111.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S600_C1.inlet, FCV901.inlet) annotation (Line(
      points={{-10,-150},{-10,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet, E601.outhot) annotation (Line(
      points={{-10,-130},{-10,-120.875},{-9.80001,-120.875},{-9.80001,-111.75}},

      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(
        preserveAspectRatio=false,
        extent={{-140,-200},{140,200}},
        grid={1,1})));
end HP601System;
