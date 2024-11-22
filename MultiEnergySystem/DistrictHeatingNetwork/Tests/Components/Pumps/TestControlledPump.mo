within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestControlledPump
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump pump1(
    Tin_start=Pump.PR01.Tin_start,
    Tout_start=Pump.PR01.Tout_start,
    hin_start=Pump.PR01.hin_start,
    pin_start=Pump.PR01.pin_start,
    pout_start=Pump.PR01.pout_start,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    dpnom=Pump.PR01.dpnom,
    etaelec=Pump.PR01.etaelec,
    etamech=Pump.PR01.etamech,
    etanom=Pump.PR01.etanom,
    headnom=Pump.PR01.headnom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    m_flow_nom=Pump.PR01.m_flow_nom,
    omeganom=Pump.PR01.omeganom,
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    control_m_flow=false)                                                                                                                                                                                                      annotation (
    Placement(visible = true, transformation(origin={2,0},    extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Sources.SinkPressure sinkPressure(
    p0=360000,
    T0=288.15,
    R=1e-4)
    annotation (Placement(transformation(extent={{32,-60},{52,-40}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=120000,
    T0=288.15,
    m_flow0=8.88,
    G=1e-3)
    annotation (Placement(transformation(extent={{18,14},{38,34}})));
  Modelica.Blocks.Sources.Ramp deltaPressure(
    offset=0.2e5,
    duration=10,
    height=-0.1e5,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-30,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.SinkMassFlow sinkMassFlow(T0=293.15, m_flow0=5) annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  Sources.SourcePressure sourcePressure(p0=200000, T0=288.15) annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump pump2(
    Tin_start=Pump.PR01.Tin_start,
    Tout_start=Pump.PR01.Tout_start,
    hin_start=Pump.PR01.hin_start,
    pin_start=Pump.PR01.pin_start,
    pout_start=Pump.PR01.pout_start,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    dpnom=Pump.PR01.dpnom,
    etaelec=Pump.PR01.etaelec,
    etamech=Pump.PR01.etamech,
    etanom=Pump.PR01.etanom,
    headnom=Pump.PR01.headnom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    m_flow_nom=Pump.PR01.m_flow_nom,
    omeganom=Pump.PR01.omeganom,
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    control_m_flow=true)                                                                                                                                                                                                       annotation (
    Placement(visible = true, transformation(origin={2,-50},  extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp deltaMassFlowRate(
    offset=5,
    duration=10,
    height=-2,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-46,-30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation

  connect(deltaPressure.y, pump1.in_m_flow) annotation (Line(points={{-19,30},{-5.2,30},{-5.2,8.28}}, color={0,0,127}));
  connect(sourcePressure.outlet, pump1.inlet) annotation (Line(
      points={{-26,0},{-12.4,0}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkMassFlow.inlet, pump1.outlet) annotation (Line(
      points={{32,0},{16.4,0}},
      color={140,56,54},
      thickness=0.5));
  connect(deltaMassFlowRate.y, pump2.in_m_flow) annotation (Line(points={{-35,-30},{-20,-30},{-20,-28},{-5.2,-28},{-5.2,-41.72}}, color={0,0,127}));
  connect(pump2.inlet, pump1.inlet) annotation (Line(
      points={{-12.4,-50},{-22,-50},{-22,0},{-12.4,0}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, pump2.outlet) annotation (Line(
      points={{32,-50},{16.4,-50}},
      color={140,56,54},
      thickness=0.5));
annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestControlledPump;
