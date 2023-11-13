within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model ElectricBoilerSystem
  "Main components of System 400 - Electric Boiler"
  extends Modelica.Icons.Example;

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

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=333.15,
    etanom=0.98,
    h=1.25,
    m_flow_nom=1,
    pin_start=300000,
    pout_start=290000) annotation (Placement(visible=true, transformation(
        origin={0,-106},
        extent={{-44,-44},{44,44}},
        rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    Tin_start(displayUnit="K") = Pump.P401.Tin_start,
    Tout_start(displayUnit="K") = Pump.P401.Tout_start,
    a = Pump.P401.a, b = Pump.P401.b,
    m_flow_start=m_flow_S4,
    dpnom = Pump.P401.dpnom,
    etaelec = Pump.P401.etaelec,
    etamech = Pump.P401.etamech,
    etanom = Pump.P401.etanom,
    hin_start = Pump.P401.hin_start,
    m_flow_nom = Pump.P401.m_flow_nom,
    omeganom = Pump.P401.omeganom,
    pin_start(displayUnit="Pa") = Pump.P401.pin_start,
    pout_start(displayUnit="Pa") = Pump.P401.pout_start,
    qnom_inm3h=Pump.P401.qnom_inm3h,                                                                                                                                                                                                        rhonom(displayUnit = "kg/m3") = Pump.P401.rhonom,
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h) annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={18,-7})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV401(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
    L=L_S4_PL3,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,-48})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
    L=L_S4_PL3,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,66})));
  Modelica.Blocks.Sources.RealExpression FCV101_theta(y=1)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={20,106})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={20,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,106})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-21,-17})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,12})));
  Sources.SourcePressure source(p0=pin_start_S4, T0=Tin_start_S4)
    annotation (Placement(transformation(extent={{-52,118},{-32,138}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=m_flow_S4*1.5,
    duration=1500,
    offset=m_flow_S4,
    startTime=1000)
    annotation (Placement(transformation(extent={{80,130},{60,150}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    pin_start=pout_start_S4,
    p0=pout_start_S4,
    T0=Tout_start_S4,
    m_flow0=m_flow_S4)
    annotation (Placement(transformation(extent={{22,118},{42,138}})));
  Modelica.Blocks.Sources.Ramp FCV101_theta_(
    height=-0.2,
    duration=1500,
    offset=1,
    startTime=3000)
    annotation (Placement(transformation(extent={{60,20},{40,40}})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{18,-16.6},{18,-36}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{18,20},{18,2.6}},
      color={140,56,54},
      thickness=0.5));

  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{17.6,106},{17.6,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{18,56},{18,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{17.6,94},{17.6,85},{18,85},{18,76}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-18.2,-21.2},{-18.2,-29.6},{-18,-29.6},{-18,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-18,2},{-18,-5.4},{-18.2,-5.4},{-18.2,-12.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-18,22},{-18,94},{-17.6,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-17.6,94},{-17.6,106}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet,TT401. inlet) annotation (Line(
      points={{-32,128},{-17.6,128},{-17.6,106}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet,TT402. inlet) annotation (Line(
      points={{22,128},{17.6,128},{17.6,106}},
      color={140,56,54},
      thickness=0.5));
  connect(ramp.y, sink.in_m_flow) annotation (Line(points={{59,140},{26,140},{26,
          133},{26,133}}, color={0,0,127}));
  connect(FCV101_theta_.y,FCV401. opening)
    annotation (Line(points={{39,30},{26,30}}, color={0,0,127}));
  connect(PL2_S401.outlet, EB401.inlet) annotation (Line(
      points={{-18,-58},{-18,-79.6},{-17.6,-79.6}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{17.6,-79.6},{17.6,-78},{18,-78},{18,-56}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=6000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ElectricBoilerSystem;
