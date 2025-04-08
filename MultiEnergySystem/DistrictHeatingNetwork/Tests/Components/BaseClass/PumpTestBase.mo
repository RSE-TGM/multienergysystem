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
        origin={-22,50},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start) annotation (
    Placement(visible = true, transformation(origin={-80,-10},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin={-90,112},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp omega(duration = 10, height = 0, offset = Pump.P101.omeganom, startTime = 10) annotation (
    Placement(visible = true, transformation(origin={-40,70},    extent={{-6,-6},{6,6}},          rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20, height = 0, offset = 1, startTime = 30) annotation (
    Placement(visible = true, transformation(origin={-6,80},    extent={{-6,-6},{6,6}},          rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve cvalve(Kv = 33.25192916, dp_nom = 20000) annotation (
    Placement(visible = true, transformation(origin={10,60},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink_50Hz(
    T0=358.15,
    m_flow0=4,
    p0(displayUnit="Pa") = 4e5,
    pin_start(displayUnit="Pa") = 4e5,
    use_in_m_flow=true) annotation (Placement(visible=true, transformation(
        origin={56,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_set_50Hz(
    duration=20,
    height=5.5,
    offset=0.5,
    startTime=30) annotation (Placement(visible=true, transformation(
        origin={66,76},
        extent={{6,-6},{-6,6}},
        rotation=0)));
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
        origin={-22,-10},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    cvalve_40Hz(Kv=33.25192916, dp_nom=20000) annotation (Placement(visible=
          true, transformation(
        origin={20,0},
        extent={{-8,-8},{8,8}},
        rotation=0)));
  Sources.SinkMassFlow sink_40Hz(
    T0=358.15,
    m_flow0=4,
    p0(displayUnit="Pa") = 4e5,
    pin_start(displayUnit="Pa") = 4e5,
    use_in_m_flow=true) annotation (Placement(visible=true, transformation(
        origin={56,0},
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
        origin={-22,-70},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    cvalve_30Hz(Kv=33.25192916, dp_nom=20000) annotation (Placement(visible=
          true, transformation(
        origin={30,-60},
        extent={{-8,-8},{8,8}},
        rotation=0)));
  Sources.SinkMassFlow sink_30Hz(
    T0=358.15,
    m_flow0=4,
    p0(displayUnit="Pa") = 4e5,
    pin_start(displayUnit="Pa") = 4e5,
    use_in_m_flow=true) annotation (Placement(visible=true, transformation(
        origin={56,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_set_40Hz(
    duration=20,
    height=5.5,
    offset=0.5,
    startTime=30) annotation (Placement(visible=true, transformation(
        origin={66,16},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_set_30Hz(
    duration=20,
    height=5.5,
    offset=0.5,
    startTime=30) annotation (Placement(visible=true, transformation(
        origin={66,-44},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp omega_40Hz(
    duration=10,
    height=0,
    offset=Pump.P101.omeganom*4/5,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-40,10},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp omega_30Hz(
    duration=10,
    height=0,
    offset=Pump.P101.omeganom*3/5,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-40,-50},
        extent={{-6,-6},{6,6}},
        rotation=0)));
equation
  connect(omega.y, pump_50Hz.in_omega) annotation (Line(points={{-33.4,70},{-29.2,70},{-29.2,59}},
                           color={0,0,127}));
  connect(m_flow_set_50Hz.y, sink_50Hz.in_m_flow)
    annotation (Line(points={{59.4,76},{50,76},{50,65}}, color={0,0,127}));
  connect(theta.y, cvalve.opening) annotation (
    Line(points={{0.6,80},{10,80},{10,66.4}},     color = {0, 0, 127}));
  connect(cvalve_40Hz.outlet, sink_40Hz.inlet) annotation (Line(
      points={{28,0},{46,0}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP.outlet, pump_40Hz.inlet) annotation (Line(
      points={{-70,-10},{-36.4,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP.outlet, pump_50Hz.inlet) annotation (Line(
      points={{-70,-10},{-60,-10},{-60,50},{-36.4,50}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve.outlet, sink_50Hz.inlet)
    annotation (Line(
      points={{18,60},{46,60}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve_40Hz.inlet, pump_40Hz.outlet) annotation (Line(
      points={{12,0},{6,0},{6,-10},{-7.6,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(theta.y, cvalve_40Hz.opening)
    annotation (Line(points={{0.6,80},{30,80},{30,12},{20,12},{20,6.4}},
                                                         color={0,0,127}));
  connect(cvalve_30Hz.inlet, pump_30Hz.outlet) annotation (Line(
      points={{22,-60},{6,-60},{6,-70},{-7.6,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve.inlet, pump_50Hz.outlet) annotation (Line(
      points={{2,60},{-2,60},{-2,50},{-7.6,50}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve_30Hz.outlet, sink_30Hz.inlet) annotation (Line(
      points={{38,-60},{46,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_set_40Hz.y, sink_40Hz.in_m_flow)
    annotation (Line(points={{59.4,16},{50,16},{50,5}},color={0,0,127}));
  connect(sink_30Hz.in_m_flow, m_flow_set_30Hz.y)
    annotation (Line(points={{50,-55},{50,-44},{59.4,-44}},
                                                          color={0,0,127}));
  connect(omega_40Hz.y, pump_40Hz.in_omega)
    annotation (Line(points={{-33.4,10},{-29.2,10},{-29.2,-1}},
                                                           color={0,0,127}));
  connect(omega_30Hz.y, pump_30Hz.in_omega) annotation (Line(points={{-33.4,-50},{-29.2,-50},{-29.2,
          -61}},                  color={0,0,127}));
  connect(theta.y, cvalve_30Hz.opening)
    annotation (Line(points={{0.6,80},{30,80},{30,-53.6}},color={0,0,127}));
  connect(pump_30Hz.inlet, pump_40Hz.inlet) annotation (Line(
      points={{-36.4,-70},{-60,-70},{-60,-10},{-36.4,-10}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end PumpTestBase;
