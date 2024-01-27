within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model PumpTestBase "Base test model for pumps' tests"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    pump_50Hz(
    Tin_start=Pump.P101.Tin_start,
    Tout_start=Pump.P101.Tout_start,
    a=Pump.P101.a,
    b=Pump.P101.b,
    dpnom=Pump.P101.dpnom,
    etaelec=Pump.P101.etaelec,
    etamech=Pump.P101.etamech,
    etanom=Pump.P101.etanom,
    hin_start=Pump.P101.hin_start,
    m_flow_nom=Pump.P101.m_flow_nom,
    omeganom=Pump.P101.omeganom,
    pin_start=Pump.P101.pin_start,
    pout_start=Pump.P101.pout_start,
    qnom_inm3h=15.60340167,
    rhonom(displayUnit="kg/m3") = Pump.P101.rhonom,
    use_in_omega=true) annotation (Placement(visible=true, transformation(
        origin={-6,40},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start) annotation (
    Placement(visible = true, transformation(origin={-62,40},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={-90,90},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp omega(duration = 10, height = 0, offset = Pump.P101.omeganom, startTime = 10) annotation (
    Placement(visible = true, transformation(origin={-30,70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20, height = 0, offset = 1, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={10,80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve cvalve(Kv = 33.25192916, dp_nom = 20000) annotation (
    Placement(visible = true, transformation(origin={28,50},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink(T0 = 85 + 273.15, m_flow0 = 4, p0(displayUnit = "Pa") = 4e5, pin_start(displayUnit = "Pa") = 4e5, use_in_m_flow = true)  annotation (
    Placement(visible = true, transformation(origin={76,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 20, height = 5.5, offset = 0.5, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={90,80},    extent={{10,-10},
            {-10,10}},                                                                           rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    pump_40Hz(
    Tin_start=Pump.P101.Tin_start,
    Tout_start=Pump.P101.Tout_start,
    a=Pump.P101.a,
    b=Pump.P101.b,
    dpnom=Pump.P101.dpnom,
    etaelec=Pump.P101.etaelec,
    etamech=Pump.P101.etamech,
    etanom=Pump.P101.etanom,
    hin_start=Pump.P101.hin_start,
    m_flow_nom=Pump.P101.m_flow_nom,
    omeganom=Pump.P101.omeganom,
    pin_start=Pump.P101.pin_start,
    pout_start=Pump.P101.pout_start,
    qnom_inm3h=15.60340167,
    rhonom(displayUnit="kg/m3") = Pump.P101.rhonom,
    use_in_omega=true) annotation (Placement(visible=true, transformation(
        origin={0,-20},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    cvalve_40Hz(Kv=33.25192916, dp_nom=20000) annotation (Placement(visible=
          true, transformation(
        origin={40,-10},
        extent={{-8,-8},{8,8}},
        rotation=0)));
  Sources.SinkMassFlow sink_40Hz(
    T0=358.15,
    m_flow0=4,
    p0(displayUnit="Pa") = 4e5,
    pin_start(displayUnit="Pa") = 4e5,
    use_in_m_flow=true) annotation (Placement(visible=true, transformation(
        origin={76,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    pump_30Hz(
    Tin_start=Pump.P101.Tin_start,
    Tout_start=Pump.P101.Tout_start,
    a=Pump.P101.a,
    b=Pump.P101.b,
    dpnom=Pump.P101.dpnom,
    etaelec=Pump.P101.etaelec,
    etamech=Pump.P101.etamech,
    etanom=Pump.P101.etanom,
    hin_start=Pump.P101.hin_start,
    m_flow_nom=Pump.P101.m_flow_nom,
    omeganom=Pump.P101.omeganom,
    pin_start=Pump.P101.pin_start,
    pout_start=Pump.P101.pout_start,
    qnom_inm3h=15.60340167,
    rhonom(displayUnit="kg/m3") = Pump.P101.rhonom,
    use_in_omega=true) annotation (Placement(visible=true, transformation(
        origin={0,-80},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    cvalve_30Hz(Kv=33.25192916, dp_nom=20000) annotation (Placement(visible=
          true, transformation(
        origin={52,-70},
        extent={{-8,-8},{8,8}},
        rotation=0)));
  Sources.SinkMassFlow sink_30Hz(
    T0=358.15,
    m_flow0=4,
    p0(displayUnit="Pa") = 4e5,
    pin_start(displayUnit="Pa") = 4e5,
    use_in_m_flow=true) annotation (Placement(visible=true, transformation(
        origin={76,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_set_40Hz(
    duration=20,
    height=5.5,
    offset=0.5,
    startTime=30) annotation (Placement(visible=true, transformation(
        origin={90,10},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_set_30Hz(
    duration=20,
    height=5.5,
    offset=0.5,
    startTime=30) annotation (Placement(visible=true, transformation(
        origin={90,-50},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp omega_40Hz(
    duration=10,
    height=0,
    offset=Pump.P101.omeganom*4/5,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-70,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp omega_30Hz(
    duration=10,
    height=0,
    offset=Pump.P101.omeganom*3/5,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-70,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(omega.y, pump_50Hz.in_omega) annotation (Line(points={{-19,70},{-13.2,
          70},{-13.2,49}}, color={0,0,127}));
  connect(m_flow_set.y, sink.in_m_flow) annotation (
    Line(points={{79,80},{70,80},{70,55}},                  color = {0, 0, 127}));
  connect(theta.y, cvalve.opening) annotation (
    Line(points={{21,80},{28,80},{28,56.4}},      color = {0, 0, 127}));
  connect(cvalve_40Hz.outlet, sink_40Hz.inlet) annotation (Line(
      points={{48,-10},{66,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP.outlet, pump_40Hz.inlet) annotation (Line(
      points={{-52,40},{-40,40},{-40,-20},{-14.4,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP.outlet, pump_50Hz.inlet) annotation (Line(
      points={{-52,40},{-20.4,40}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve.outlet, sink.inlet) annotation (Line(
      points={{36,50},{66,50}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve_40Hz.inlet, pump_40Hz.outlet) annotation (Line(
      points={{32,-10},{24,-10},{24,-20},{14.4,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(theta.y, cvalve_40Hz.opening)
    annotation (Line(points={{21,80},{40,80},{40,-3.6}}, color={0,0,127}));
  connect(cvalve_30Hz.inlet, pump_30Hz.outlet) annotation (Line(
      points={{44,-70},{24,-70},{24,-80},{14.4,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve.inlet, pump_50Hz.outlet) annotation (Line(
      points={{20,50},{16,50},{16,40},{8.4,40}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve_30Hz.outlet, sink_30Hz.inlet) annotation (Line(
      points={{60,-70},{66,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_set_40Hz.y, sink_40Hz.in_m_flow)
    annotation (Line(points={{79,10},{70,10},{70,-5}}, color={0,0,127}));
  connect(sink_30Hz.in_m_flow, m_flow_set_30Hz.y)
    annotation (Line(points={{70,-65},{70,-50},{79,-50}}, color={0,0,127}));
  connect(omega_40Hz.y, pump_40Hz.in_omega)
    annotation (Line(points={{-59,0},{-7.2,0},{-7.2,-11}}, color={0,0,127}));
  connect(omega_30Hz.y, pump_30Hz.in_omega) annotation (Line(points={{-59,-60},
          {-7.2,-60},{-7.2,-71}}, color={0,0,127}));
  connect(theta.y, cvalve_30Hz.opening)
    annotation (Line(points={{21,80},{52,80},{52,-63.6}}, color={0,0,127}));
  connect(pump_30Hz.inlet, pump_40Hz.inlet) annotation (Line(
      points={{-14.4,-80},{-40,-80},{-40,-20},{-14.4,-20}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end PumpTestBase;
