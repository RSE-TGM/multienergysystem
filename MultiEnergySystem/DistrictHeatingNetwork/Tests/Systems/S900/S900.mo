within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900
  extends Modelica.Icons.Example;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby
    DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

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
  parameter Types.Length L_rCD_H7 = 15;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;

  parameter Types.Length t_rCD = 2e-3;

  parameter Real P901omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
  parameter Real FCV901theta[:,:] = [0, 1];

  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P901(
    redeclare model Medium = Medium,
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
    headnom=Pump.P901.headnom,
    headmax=Pump.P901.headnommax,
    headmin=Pump.P901.headnommin,
    m_flow_nom=Pump.P901.m_flow_nom,
    omeganom=Pump.P901.omeganom,
    qnom_inm3h=Pump.P901.qnom_inm3h,
    qnom_inm3h_min=Pump.P901.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    qnom_inm3h_max=Pump.P901.qnommax_inm3h,
    use_in_omega=true)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(                 extent={{-10,10},{
            10,-10}},                                                                          rotation=90,
        origin={0,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901(redeclare model Medium = Medium) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-2,32})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-2,39.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT902(redeclare
      model Medium =                                                                                             Medium, T_start=Tout_start_S9, p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"   annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-1.75,47.25})));
  inner System system(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState)
    annotation (Placement(transformation(extent={{139.5,140},{159.5,160}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL4_S901(
    redeclare model Medium = Medium,
    L=L_S9_PL3,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pout_start_S9,
    pout_start=pout_start_S9,
    Tin_start=Tout_start_S9,
    Tout_start=Tout_start_S9,
    Di=Di_S9,
    n=5)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(redeclare model Medium = Medium, T_start=Tin_start_S9, p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-117.75,41.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-118,31.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL2_S901(
    redeclare model Medium = Medium,
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
        origin={-116,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV901(
    redeclare model Medium = Medium,
    Kv=Valve.FCV901.Kv,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage,
    dp_nom(displayUnit="Pa") = Valve.FCV901.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,-20})));
  Sources.SourcePressure sourcePressure1(redeclare model Medium = Medium, p0=pin_start_S9, T0=Tin_start_S9)  annotation (Placement(transformation(extent={{-141,54.5},{-130.5,65}})));
  Sources.SourcePressure sourceP(redeclare model Medium = Medium, p0=pin_start_S9, T0=Tin_start_S9) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-92})));
  Sources.SinkMassFlow sink_(redeclare model Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-116,-80})));
  Sources.SinkPressure sinkP(
    redeclare model Medium = Medium,
    use_in_p0=false,
    p0=pout_start_S9,
    T0=Tout_start_S9,
    R=1) annotation (Placement(transformation(extent={{14,66},{26,54}})));
  Modelica.Blocks.Sources.TimeTable P901_omega(table=P901omega)  annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
  Modelica.Blocks.Sources.TimeTable FCV901_theta(table=FCV901theta) annotation (Placement(transformation(extent={{40,-30},{20,-10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV rackCD_Hot_S200_S900(
    redeclare model Medium = Medium,
    L=L_rCD_H7,
    h=0,
    t=t_rCD,
    pin_start=pin_start_S9,
    Tin_start=Tout_start_S9,
    Tout_start=Tout_start_S9,
    Di=Di,
    nPipes=1,
    n=5)
    "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-9.625,9.625},{9.625,-9.625}},
        rotation=90,
        origin={0.375,-69.625})));
equation
  connect(FT901.outlet, PT902.inlet) annotation (Line(
      points={{0,35},{0,39.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet, TT902.inlet) annotation (Line(
      points={{0,39.5},{0,47.25},{0.15,47.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.inlet,PL4_S901. outlet) annotation (Line(
      points={{-2.22045e-16,29},{-2.22045e-16,21.5},{6.66134e-16,21.5},{6.66134e-16,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet, PT901.inlet) annotation (Line(
      points={{-116,-20},{-116,31.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet, TT901.inlet) annotation (Line(
      points={{-116,31.5},{-116,36.375},{-115.85,36.375},{-115.85,41.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure1.outlet, TT901.inlet) annotation (Line(
      points={{-130.5,59.75},{-115.85,59.75},{-115.85,41.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet, PL4_S901.inlet) annotation (Line(
      points={{6.66134e-16,-10},{6.66134e-16,-5},{-6.66134e-16,-5},{-6.66134e-16,0}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet, FCV901.inlet) annotation (Line(
      points={{0,-38},{0,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, sink_.inlet)
    annotation (Line(
      points={{-116,-40},{-116,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, sinkP.inlet) annotation (Line(
      points={{0.15,47.25},{0,47.25},{0,60},{14,60}},
      color={140,56,54},
      thickness=0.5));
  connect(P901_omega.y, P901.in_omega)
    annotation (Line(points={{19,-50},{5,-50}},   color={0,0,127}));
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{19,-20},{8,-20}},   color={0,0,127}));
  connect(rackCD_Hot_S200_S900.outlet, P901.inlet) annotation (Line(
      points={{0.375,-60},{0,-60},{0,-54}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S200_S900.inlet, sourceP.outlet) annotation (Line(
      points={{0.375,-79.25},{0.375,-86.125},{4.44089e-16,-86.125},{4.44089e-16,-86}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(extent={{-160,-160},{160,160}})),
    experiment(
      StopTime=700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900;
