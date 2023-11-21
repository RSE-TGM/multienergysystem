within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model WaterTankSystem "System of two tanks"
  extends Modelica.Icons.Example;
  parameter Types.Pressure pin_start_S2 = 1.79e5;
  parameter Types.Pressure pout_start_S2 = 2.5e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 60 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_S2 = 4.5;

  parameter Real theta(max = 1, min = 0) = 0;
  parameter Real thetavar(max = 1) = 0.1;
  // Pipe length
  parameter Types.Length L_S2_PL0 = 24.5;
  parameter Types.Length L_S2_PL1 = 1.7;
  parameter Types.Length L_S2_PL2 = 1.5;
  parameter Types.Length L_S2_PL3 = 2.5;
  parameter Types.Length L_S2_PL4 = 1.0;
  parameter Types.Length L_S2_PL5 = 2.8;
  parameter Types.Length L_S2_PL6 = 2.8;
  parameter Types.Length L_S2_PL7 = 2;
  parameter Types.Length L_S2_PL8 = 3;
  parameter Types.Length L_S2_PL9 = 21.5;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={-170,170},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D201(H=4, D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{0,-112},{-48,-36}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P201(
      Tin_start(displayUnit="K") = Pump.P201.Tin_start,
      Tout_start=Pump.P201.Tout_start,
      a=Pump.P201.a,
      b=Pump.P201.b,
    m_flow_start=m_flow_S2,
      dpnom=Pump.P201.dpnom,
      etaelec=Pump.P201.etaelec,
      etamech=Pump.P201.etamech,
      etanom=Pump.P201.etanom,
      hin_start=Pump.P201.hin_start,
      m_flow_nom=Pump.P201.m_flow_nom,
      omeganom=Pump.P201.omeganom,
      pin_start(displayUnit="Pa") = 1.8400803e5,
      pout_start(displayUnit="Pa") = 1.9920743e5,
    qnom_inm3h=Pump.P201.qnom_inm3h,
      rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    headmax=Pump.P201.headnommax,
    headmin=Pump.P201.headnommin,
    qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    qnom_inm3h_max=Pump.P201.qnommax_inm3h)
                       annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-34,29})));
  Modelica.Blocks.Sources.RealExpression P201_m_flow(y=0.15)
    annotation (Placement(transformation(extent={{-158,96},{-138,116}})));
  replaceable MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D202(
    H=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{75,-112},{27,-36}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-35.75,103.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-36,93.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S201(
    L=L_S2_PL1,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-34,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-72,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S201(
    L=L_S2_PL3,
    t=L_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-54,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S201(
    L=L_S2_PL2,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-34,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S201(
    L=L_S2_PL4,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-72,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL5_S201(
    L=L_S2_PL5,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-72,-60})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL8_S201(
    L=L_S2_PL8,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_tank,
    pout_start=pout_start_S2_tank - 0.01e5,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={90,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2_tank)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={92,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={92,78})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={93,65})));
  Sources.SourcePressure source(p0=pin_start_S2, T0=Tin_start_S2)
    annotation (Placement(transformation(extent={{-70,130},{-50,150}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    pin_start=pout_start_S2_tank,
    p0=pout_start_S2_tank,
    T0=Tout_start_S2,
    m_flow0=m_flow_S2)
    annotation (Placement(transformation(extent={{114,130},{134,150}})));
  Modelica.Blocks.Sources.Ramp FCV201_theta_(
    height=thetavar,
    duration=1500,
    offset=theta,
    startTime=2000)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=m_flow_S2*0.8*0,
    duration=1500,
    offset=m_flow_S2,
    startTime=1000)
    annotation (Placement(transformation(extent={{144,160},{124,180}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL9_S201(
    L=L_S2_PL9,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_tank,
    pout_start=pout_start_S2_tank - 0.01e5,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={90,120})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL7_S201(
    L=L_S2_PL7,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={50,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL6_S201(
    L=L_S2_PL6,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={52,-126})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL0_S201(
    L=L_S2_PL0,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-34,124})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-34,93.5},{-34,98.375},{-33.85,98.375},{-33.85,103.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.inlet,PT201. inlet) annotation (Line(
      points={{-34,82},{-34,93.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.outlet, P201.inlet) annotation (Line(
      points={{-34,62},{-34,38.6}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet, PL2_S201.inlet) annotation (Line(
      points={{-34,19.4},{-34,12}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.inlet,FCV201. outlet) annotation (Line(
      points={{-72,12},{-72,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.outlet,FCV201. inlet) annotation (Line(
      points={{-64,52},{-72,52},{-72,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.inlet, P201.inlet) annotation (Line(
      points={{-44,52},{-34,52},{-34,38.6}},
      color={140,56,54},
      thickness=0.5));

  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{89.6,90},{89.6,78}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FT201. outlet) annotation (Line(
      points={{89.6,78},{90,78},{90.2,69.2}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet,PL8_S201. outlet) annotation (Line(
      points={{90.2,60.8},{90.2,56.4},{90,56.4},{90,50}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.outlet,PL8_S201. inlet) annotation (Line(
      points={{75,-59.75},{90,-59.75},{90,30}},
      color={140,56,54},
      thickness=0.5));

  connect(FCV201_theta_.y, FCV201.opening)
    annotation (Line(points={{-99,30},{-80,30}},  color={0,0,127}));
  connect(ramp.y, sink.in_m_flow)
    annotation (Line(points={{123,170},{106,170},{106,145},{118,145}},
                                                             color={0,0,127}));
  connect(sink.inlet,PL9_S201. outlet) annotation (Line(
      points={{114,140},{90,140},{90,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL9_S201.inlet, TT202.inlet) annotation (Line(
      points={{90,110},{90,90},{89.6,90}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL7_S201. inlet) annotation (Line(
      points={{0,-59.75},{0,-60},{12,-60},{12,-20},{40,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL7_S201.outlet,PL8_S201. inlet) annotation (Line(
      points={{60,-20},{90,-20},{90,30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.outlet, PL5_S201.inlet) annotation (Line(
      points={{-72,-8},{-72,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S201.outlet, PL5_S201.inlet) annotation (Line(
      points={{-34,-8},{-34,-20},{-72,-20},{-72,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL5_S201.outlet, D201.inlet) annotation (Line(
      points={{-72,-70},{-72,-126},{10,-126},{10,-88.25},{0,-88.25}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.inlet, PL6_S201.outlet) annotation (Line(
      points={{75,-88.25},{86,-88.25},{86,-126},{62,-126}},
      color={140,56,54},
      thickness=0.5));
  connect(PL6_S201.inlet, D201.inlet) annotation (Line(
      points={{42,-126},{10,-126},{10,-88.25},{-1.77636e-15,-88.25}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, PL0_S201.inlet) annotation (Line(
      points={{-50,140},{-33.85,140},{-34,134}},
      color={140,56,54},
      thickness=0.5));
  connect(PL0_S201.outlet, TT201.inlet) annotation (Line(
      points={{-34,114},{-34,106.625},{-33.85,106.625},{-33.85,103.25}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-180},{180,180}})),
    experiment(
      StopTime=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end WaterTankSystem;
