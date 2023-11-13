within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model Pump901System
  parameter Types.Length t = 1.5e-3;
  parameter Types.Length Di = 51e-3;
  parameter Types.Length L_v = 1;
  parameter Types.Length L_RL2L3 = 4.53;
  parameter Types.Length L_RL3L4 = 3.02;
  parameter Types.Length L_RL4L5 = 2.5;
  parameter Types.Length L_RL5L6 = 2.5;
  parameter Types.Length L_RL6L7 = 3;
  parameter Types.Pressure pin_start = 1.69e5;
  parameter Types.Pressure pout_start = 3e5;
  parameter Types.Temperature T_start = 25 + 273.15;
  parameter Types.MassFlowRate m_flow_start = 4.04;

  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump pump(
    Tin_start=Pump.P901.Tin_start,
    Tout_start=Pump.P901.Tout_start,
    hin_start=Pump.P901.hin_start,
    pin_start=Pump.P901.pin_start,
    pout_start=Pump.P901.pout_start,
    a=Pump.P901.a,
    b=Pump.P901.b,
    dpnom=Pump.P901.dpnom,
    etaelec=Pump.P901.etaelec,
    etamech=Pump.P901.etamech,
    etanom=Pump.P901.etanom,
    headmax=Pump.P901.headnommax,
    headmin=Pump.P901.headnommin,
    m_flow_nom=Pump.P901.m_flow_nom,
    omeganom=Pump.P901.omeganom,
    qnom_inm3h=Pump.P901.qnom_inm3h,
    qnom_inm3h_min=Pump.P901.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    qnom_inm3h_max=Pump.P901.qnommax_inm3h,
    use_m_flow=true)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(                 extent={{-62.5,-57.5},
            {-37.5,-32.5}},                                                                    rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    valve(
    Kv=11.5,
    dp_nom=150000,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Square,
    Tin_start=T_start,
    pin_start=pout_start)      annotation (Placement(visible=true,
        transformation(
        origin={-20,-5},
        extent={{-5,5},{5,-5}},
        rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,12.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(T_start=T_start, p_start=pout_start)
          "Temperature sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-21.75,27.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackCD_P901(
    L=L_v,
    h=L_v,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    hin_start=105209.47,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di)
    "Pipe connecting the rack C/D and the inlet of circulation pump P901"
    annotation (Placement(transformation(
        extent={{-7.5,7.5},{7.5,-7.5}},
        rotation=-90,
        origin={-85,-27.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_P901_FCV901(
    L=L_v,
    h=L_v,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{-7.5,7.5},{7.5,-7.5}},
        rotation=90,
        origin={-20,-27.5})));
  Modelica.Blocks.Sources.Ramp theta_sp(
    height=-0.2*0,
    duration=100,
    offset=1,
    startTime=100)
    annotation (Placement(transformation(extent={{0,-10},{-10,0}})));
  Modelica.Blocks.Sources.Ramp m_flow_Pump(
    height=-1.25,
    duration=100,
    offset=4.04,
    startTime=100)
    annotation (Placement(transformation(extent={{-40,-30},{-50,-20}})));
  inner System system(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState)
    annotation (Placement(transformation(extent={{-120.5,80},{-100.5,100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL4L5_hot(
    L=L_RL4L5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L4L5" annotation (Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={42.5,55})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL5L6_hot(
    L=L_RL5L6,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L5L6" annotation (Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={67.5,55})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL6L7_hot(
    L=L_RL6L7,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L6L7" annotation (Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={92.5,55})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL4L5_cold(
    L=L_RL4L5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L4L5" annotation (Placement(transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=180,
        origin={42.5,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL5L6_cold(
    L=L_RL5L6,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L5L6" annotation (Placement(transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=180,
        origin={67.5,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL6L7_cold(
    L=L_RL6L7,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L6L7" annotation (Placement(transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=180,
        origin={92.5,80})));
  Sources.SourcePressure sourcePressure(p0=pin_start, T0=T_start)
    annotation (Placement(transformation(extent={{-103,-5.5},{-92.5,5}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ClosedLoopInitializer
    CLInit(
    p_start=pin_start,
    T_start=T_start,
    m_flow_start=m_flow_start) annotation (Placement(transformation(
        extent={{4.5,-4.5},{-4.5,4.5}},
        rotation=90,
        origin={-85,38.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL2L3_hot(
    L=L_RL2L3,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L2L3" annotation (Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={-7.5,55})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL3L4_hot(
    L=L_RL3L4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L3L4" annotation (Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={17.5,55})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL2L3_cold(
    L=L_RL2L3,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L2L3" annotation (Placement(transformation(
        extent={{7.5,-7.5},{-7.5,7.5}},
        rotation=180,
        origin={-7.5,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe_rackL3L4_cold(
    L=L_RL3L4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pin_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe located in rack L2L3" annotation (Placement(transformation(
        extent={{7.5,-7.5},{-7.5,7.5}},
        rotation=180,
        origin={17.5,80})));
equation
  connect(pipe_P901_FCV901.outlet, valve.inlet) annotation (Line(
      points={{-20,-20},{-20,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(valve.outlet, FT901.inlet) annotation (Line(
      points={{-20,0},{-20,9.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.outlet, PT902.inlet) annotation (Line(
      points={{-20,15.5},{-20,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet, TT902.inlet) annotation (Line(
      points={{-20,20},{-20,27.75},{-19.85,27.75}},
      color={140,56,54},
      thickness=0.5));
  connect(theta_sp.y, valve.opening)
    annotation (Line(points={{-10.5,-5},{-16,-5}},color={0,0,127}));
  connect(pipe_rackL4L5_hot.outlet, pipe_rackL5L6_hot.inlet) annotation (Line(
      points={{50,55},{60,55}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL5L6_hot.outlet, pipe_rackL6L7_hot.inlet) annotation (Line(
      points={{75,55},{85,55}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL5L6_cold.outlet, pipe_rackL4L5_cold.inlet) annotation (Line(
      points={{60,80},{50,80}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL6L7_cold.outlet, pipe_rackL5L6_cold.inlet) annotation (Line(
      points={{85,80},{75,80}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL6L7_hot.outlet, pipe_rackL6L7_cold.inlet) annotation (Line(
      points={{100,55},{105.5,55},{105.5,80},{100,80}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure.outlet, pipe_rackCD_P901.inlet) annotation (Line(
      points={{-92.5,-0.25},{-85,-0.25},{-85,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(pump.inlet, pipe_rackCD_P901.outlet) annotation (Line(
      points={{-60,-45},{-85,-45},{-85,-35}},
      color={140,56,54},
      thickness=0.5));
  connect(pump.outlet, pipe_P901_FCV901.inlet) annotation (Line(
      points={{-40,-45},{-20,-45},{-20,-35}},
      color={140,56,54},
      thickness=0.5));
  connect(CLInit.outlet, pipe_rackCD_P901.inlet) annotation (Line(
      points={{-85,34},{-85,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_Pump.y, pump.in_m_flow) annotation (Line(points={{-50.5,-25},{-55,
          -25},{-55,-39.25}}, color={0,0,127}));
  connect(pipe_rackL2L3_hot.inlet, TT902.inlet) annotation (Line(
      points={{-15,55},{-19.85,55},{-19.85,27.75}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL4L5_hot.inlet, pipe_rackL3L4_hot.outlet) annotation (Line(
      points={{35,55},{25,55}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL3L4_hot.inlet, pipe_rackL2L3_hot.outlet) annotation (Line(
      points={{10,55},{-8.88178e-16,55}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL3L4_cold.inlet, pipe_rackL2L3_cold.outlet) annotation (Line(
      points={{10,80},{0,80}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL2L3_cold.inlet, CLInit.inlet) annotation (Line(
      points={{-15,80},{-84.91,80},{-84.91,43}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe_rackL3L4_cold.outlet, pipe_rackL4L5_cold.outlet) annotation (
      Line(
      points={{25,80},{35,80}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(extent={{-120,-100},{120,100}}, grid={0.5,0.5})),
    experiment(
      StopTime=500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Pump901System;
