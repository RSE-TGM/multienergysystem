within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystem
  "Main components of System 100 - Gas Boiler"
  extends Modelica.Icons.Example;

  parameter Types.Pressure pin_start_S1 = 1.695e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;

  parameter Types.Length L_S1_PL1 = 0.4;
  parameter Types.Length L_S1_PL2 = 0.8;
  parameter Types.Length L_S1_PL3 = 1.5;
  parameter Types.Length L_S1_PL4 = 0.7;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;

  parameter Types.MassFlowRate m_flow_total = 1.75;


  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P101(
    Tin_start(displayUnit="K") = Pump.P101.Tin_start,
    Tout_start(displayUnit="K") = Pump.P101.Tout_start,
    a = Pump.P101.a, b = Pump.P101.b,
    m_flow_start=m_flow_total,
    dpnom = Pump.P101.dpnom,
    etaelec = Pump.P101.etaelec,
    etamech = Pump.P101.etamech,
    etanom = Pump.P101.etanom,
    hin_start = Pump.P101.hin_start,
    m_flow_nom = Pump.P101.m_flow_nom,
    omeganom = Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = Pump.P101.pin_start,
    pout_start(displayUnit="Pa") = Pump.P101.pout_start,
    qnom_inm3h=Pump.P101.qnom_inm3h,                                                                                                                                                                                                        rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom,
    headmax=Pump.P101.headnommax,
    headmin=Pump.P101.headnommin,
    qnom_inm3h_min=Pump.P101.qnommin_inm3h,
    qnom_inm3h_max=Pump.P101.qnommax_inm3h)
                     annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={18,-7})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV101(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(
    L=L_S1_PL3,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_S1,
    pout_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(
    L=L_S1_PL2,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pin_start_S1,
    pout_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,-48})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(
    L=L_S1_PL3,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_S1,
    pout_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,66})));
  Modelica.Blocks.Sources.RealExpression FCV101_theta(y=1)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=333.15,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    HH=55.5e6)         annotation (Placement(visible=true, transformation(
        origin={0,-112},
        extent={{-46,-46},{46,46}},
        rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT102(T_start=Tout_start_S1, p_start=pout_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={20,106})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={20,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT101(T_start=Tin_start_S1, p_start=pin_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,106})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-21,-17})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(
    L=L_S1_PL1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pin_start_S1,
    pout_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,12})));
  Sources.SourcePressure source(p0=pin_start_S1, T0=Tin_start_S1)
    annotation (Placement(transformation(extent={{-52,118},{-32,138}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=m_flow_total*0.8,
    duration=1500,
    offset=m_flow_total,
    startTime=1000)
    annotation (Placement(transformation(extent={{80,130},{60,150}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    pin_start=pout_start_S1,
    p0=pout_start_S1,
    T0=Tout_start_S1,
    m_flow0=m_flow_total)
    annotation (Placement(transformation(extent={{22,118},{42,138}})));
  Modelica.Blocks.Sources.Ramp FCV101_theta_(
    height=-0.2,
    duration=1500,
    offset=1,
    startTime=3000)
    annotation (Placement(transformation(extent={{60,20},{40,40}})));
equation
  connect(P101.inlet, PL3_S101.outlet) annotation (Line(
      points={{18,-16.6},{18,-36}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet, P101.outlet) annotation (Line(
      points={{18,20},{18,2.6}},
      color={140,56,54},
      thickness=0.5));

  connect(TT102.inlet, PT102.inlet) annotation (Line(
      points={{17.6,106},{17.6,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S101.inlet, GB101.outlet) annotation (Line(
      points={{18,-56},{18,-70.2},{18.4,-70.2},{18.4,-84.4}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101.inlet, PL2_S101.outlet) annotation (Line(
      points={{-18.4,-84.4},{-18,-84.4},{-18,-58}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S101.inlet, FCV101.outlet) annotation (Line(
      points={{18,56},{18,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet, PL4_S101.outlet) annotation (Line(
      points={{17.6,94},{17.6,85},{18,85},{18,76}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet, PL2_S101.inlet) annotation (Line(
      points={{-18.2,-21.2},{-18.2,-29.6},{-18,-29.6},{-18,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.outlet, FT101.inlet) annotation (Line(
      points={{-18,2},{-18,-5.4},{-18.2,-5.4},{-18.2,-12.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.inlet, PT101.inlet) annotation (Line(
      points={{-18,22},{-18,94},{-17.6,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet, TT101.inlet) annotation (Line(
      points={{-17.6,94},{-17.6,106}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, TT101.inlet) annotation (Line(
      points={{-32,128},{-17.6,128},{-17.6,106}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, TT102.inlet) annotation (Line(
      points={{22,128},{17.6,128},{17.6,106}},
      color={140,56,54},
      thickness=0.5));
  connect(ramp.y, sink.in_m_flow) annotation (Line(points={{59,140},{26,140},{26,
          133},{26,133}}, color={0,0,127}));
  connect(FCV101_theta_.y, FCV101.opening)
    annotation (Line(points={{39,30},{26,30}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=6000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystem;
