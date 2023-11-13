within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model PumpingCirculationSystem

  extends Modelica.Icons.Example;

  parameter Types.Length t = 1.5e-3;
  parameter Types.Length Di = 51e-3;
  parameter Types.Length L_v = 1;
  parameter Types.Length L_RL2L3 = 4.53;
  parameter Types.Length L_RL3L4 = 3.02;
  parameter Types.Length L_RL4L5 = 2.5;
  parameter Types.Length L_RL5L6 = 2.5;
  parameter Types.Length L_RL6L7 = 3;
  parameter Types.MassFlowRate m_flow_S9 = 4.04;


  parameter Types.Pressure pin_start_S9 = 2.3e5;
  parameter Types.Pressure pout_start_S9 = 3.2e5;
  parameter Types.Temperature Tin_start_S9 = 80 + 273.15;
  parameter Types.Temperature Tout_start_S9 = 80 + 273.15;

  parameter Types.Length L_S9_PL1 = 0.82;
  parameter Types.Length L_S9_PL2 = 2.3;
  parameter Types.Length L_S9_PL3 = 1.5;
  parameter Types.Length L_S9_PL4 = 0.65;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;

  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P901(
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
    Placement(visible = true, transformation(                 extent={{-10,10},{
            10,-10}},                                                                          rotation=90,
        origin={-20,-48})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,46})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,53.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(T_start=Tout_start_S9, p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"       annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-21.75,61.25})));
  Modelica.Blocks.Sources.Ramp theta_sp(
    height=-0.15,
    duration=100,
    offset=1,
    startTime=500)
    annotation (Placement(transformation(extent={{12,-26},{0,-14}})));
  Modelica.Blocks.Sources.Ramp m_flow_Pump(
    height=-0.5e5,
    duration=100,
    offset=pout_start_S9,
    startTime=100)
    annotation (Placement(transformation(extent={{26,89.5},{16,99.5}})));
  inner System system(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState)
    annotation (Placement(transformation(extent={{-120.5,80},{-100.5,100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S901(
    L=L_S9_PL3,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pout_start_S9,
    pout_start=pout_start_S9,
    Tin_start=Tout_start_S9,
    Tout_start=Tout_start_S9,
    Di=Di_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-20,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(T_start=Tin_start_S9, p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-81.75,41.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-82,31.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S901(
    L=L_S9_PL2,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pin_start_S9,
    pout_start=pin_start_S9,
    Tin_start=Tin_start_S9,
    Tout_start=Tin_start_S9,
    Di=Di_S9) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV901(
    Kv=Valve.FCV901.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV901.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-20,-20})));
  Sources.SourcePressure sourcePressure1(p0=pin_start_S9, T0=Tin_start_S9)
    annotation (Placement(transformation(extent={{-105,54.5},{-94.5,65}})));
  Sources.SourcePressure sourcePumpP9(p0=pin_start_S9, T0=Tin_start_S9)
    annotation (Placement(transformation(
        extent={{-5.25,-5.25},{5.25,5.25}},
        rotation=90,
        origin={-19.75,-82.25})));
  Sources.SinkMassFlow sink annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-80})));
  Sources.SinkPressure sinkValve(
    use_in_p0=true,
    p0=pout_start_S9,
    T0=Tout_start_S9,
    R=1) annotation (Placement(transformation(extent={{-6,74},{6,86}})));
  Modelica.Blocks.Sources.Ramp theta_sp1(
    height=5*1000/3600,
    duration=100,
    offset=9*1000/3600,
    startTime=300)
    annotation (Placement(transformation(extent={{12,-58},{0,-46}})));
equation
  connect(FT901.outlet, PT902.inlet) annotation (Line(
      points={{-20,49},{-20,53.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet, TT902.inlet) annotation (Line(
      points={{-20,53.5},{-20,61.25},{-19.85,61.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.inlet,PL4_S901. outlet) annotation (Line(
      points={{-20,43},{-20,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet, PT901.inlet) annotation (Line(
      points={{-80,-20},{-80,31.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet, TT901.inlet) annotation (Line(
      points={{-80,31.5},{-80,36.375},{-79.85,36.375},{-79.85,41.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure1.outlet, TT901.inlet) annotation (Line(
      points={{-94.5,59.75},{-79.85,59.75},{-79.85,41.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet, PL4_S901.inlet) annotation (Line(
      points={{-20,-10},{-20,10}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet, FCV901.inlet) annotation (Line(
      points={{-20,-40},{-20,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(theta_sp.y, FCV901.opening)
    annotation (Line(points={{-0.6,-20},{-12,-20}}, color={0,0,127}));
  connect(P901.inlet, sourcePumpP9.outlet) annotation (Line(
      points={{-20,-56},{-20,-66.5},{-19.75,-66.5},{-19.75,-77}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, sink.inlet) annotation (Line(
      points={{-80,-40},{-80,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, sinkValve.inlet) annotation (Line(
      points={{-19.85,61.25},{-20,61.25},{-20,80},{-6,80}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_Pump.y, sinkValve.in_p0) annotation (Line(points={{15.5,94.5},{
          -2.4,94.5},{-2.4,85.04}}, color={0,0,127}));
  connect(P901.in_m_flow, theta_sp1.y)
    annotation (Line(points={{-15.4,-52},{-0.6,-52}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(extent={{-160,-160},{160,160}})),
    experiment(
      StopTime=700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PumpingCirculationSystem;
