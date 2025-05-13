within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pumps;
model TestPumpP201
  "Testing PumpP201 of test facility using nominal information"
  extends MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass.PumpTestBase(
    m_flow_set_50Hz(height=8*0, offset=1),
    sink_50Hz(
      T0=Pump.P201.Tout_start,
      p0=Pump.P201.pout_start,
      m_flow0=Pump.P201.m_flow_nom,
      pin_start=Pump.P201.pout_start),
    pump_50Hz(
      Tin_start=Pump.P201.Tin_start,
      Tout_start=Pump.P201.Tout_start,
      hin_start=Pump.P201.hin_start,
      pin_start=Pump.P201.pin_start,
      pout_start=Pump.P201.pout_start,
      a=Pump.P201.a,
      b=Pump.P201.b,
      dpnom=Pump.P201.dpnom,
      etaelec=Pump.P201.etaelec,
      etamech=Pump.P201.etamech,
      etanom=Pump.P201.etanom,
      headmax=Pump.P201.headnommax,
      headmin=Pump.P201.headnommin,
      m_flow_nom=Pump.P201.m_flow_nom,
      omeganom=Pump.P201.omeganom,
      qnom_inm3h=Pump.P201.qnom_inm3h,
      qnom_inm3h_min=Pump.P201.qnommin_inm3h,
      rhonom=Pump.P201.rhonom,
      qnom_inm3h_max=Pump.P201.qnommax_inm3h),
    sourceP(
      p0=Pump.P201.pin_start,
      T0=Pump.P201.Tin_start,
      h0=Pump.P201.hin_start),
    cvalve(Kv=72.29759327),
    omega(offset=Pump.P201.omeganom),
    omega_40Hz(offset=Pump.P201.omeganom*4/5),
    pump_40Hz(
      Tin_start=Pump.P201.Tin_start,
      Tout_start=Pump.P201.Tout_start,
      hin_start=Pump.P201.hin_start,
      pin_start=Pump.P201.pin_start,
      pout_start=Pump.P201.pout_start,
      a=Pump.P201.a,
      b=Pump.P201.b,
      dpnom=Pump.P201.dpnom,
      etaelec=Pump.P201.etaelec,
      etamech=Pump.P201.etamech,
      etanom=Pump.P201.etanom,
      headmax=Pump.P201.headnommax,
      headmin=Pump.P201.headnommin,
      m_flow_nom=Pump.P201.m_flow_nom,
      omeganom=Pump.P201.omeganom,
      qnom_inm3h=Pump.P201.qnom_inm3h,
      qnom_inm3h_min=Pump.P201.qnommin_inm3h,
      rhonom=Pump.P201.rhonom,
      qnom_inm3h_max=Pump.P201.qnommax_inm3h),
    pump_30Hz(
      Tin_start=Pump.P201.Tin_start,
      Tout_start=Pump.P201.Tout_start,
      hin_start=Pump.P201.hin_start,
      pin_start=Pump.P201.pin_start,
      pout_start=Pump.P201.pout_start,
      a=Pump.P201.a,
      b=Pump.P201.b,
      dpnom=Pump.P201.dpnom,
      etaelec=Pump.P201.etaelec,
      etamech=Pump.P201.etamech,
      etanom=Pump.P201.etanom,
      headmax=Pump.P201.headnommax,
      headmin=Pump.P201.headnommin,
      m_flow_nom=Pump.P201.m_flow_nom,
      omeganom=Pump.P201.omeganom,
      qnom_inm3h=Pump.P201.qnom_inm3h,
      qnom_inm3h_min=Pump.P201.qnommin_inm3h,
      rhonom=Pump.P201.rhonom,
      qnom_inm3h_max=Pump.P201.qnommax_inm3h),
    omega_30Hz(offset=Pump.P201.omeganom*3/5),
    m_flow_set_40Hz(height=0, offset=2),
    m_flow_set_30Hz(height=0, offset=2));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    pump_30Hz1(
    Tin_start(displayUnit="K") = 80 + 273.15,
    Tout_start(displayUnit="K") = 80 + 273.15,
    pin_start(displayUnit="Pa") = 2e5,
    pout_start=Pump.P201.pout_start,
    a=Pump.P201.a,
    b=Pump.P201.b,
    dpnom=Pump.P201.dpnom,
    etaelec=Pump.P201.etaelec,
    etamech=Pump.P201.etamech,
    etanom=Pump.P201.etanom,
    headnom=Pump.P201.headnom,
    headmax=Pump.P201.headnommax,
    headmin=Pump.P201.headnommin,
    m_flow_nom=Pump.P201.m_flow_nom,
    omeganom=Pump.P201.omeganom,
    qnom_inm3h=Pump.P201.qnom_inm3h,
    qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    qnom_inm3h_max=Pump.P201.qnommax_inm3h,
    use_in_omega=true) annotation (Placement(visible=true, transformation(
        origin={-20,-132},
        extent={{-18,-18},{18,18}},
        rotation=0)));
  Sources.SourcePressure                                          sourceP1(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-5)                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={-78,-124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkPressure                        sinkPressure(
    p0(displayUnit="Pa") = 3e5,
    use_in_p0=false,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-5)                                                annotation (Placement(transformation(extent={{16,-142},{36,-122}})));
  Modelica.Blocks.Sources.Ramp omega_30Hz1(
    offset=2*Modelica.Constants.pi*50,
    duration=10,
    height=0,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-38,-106},
        extent={{-6,-6},{6,6}},
        rotation=0)));
equation

  connect(sourceP1.outlet, pump_30Hz1.inlet) annotation (Line(
      points={{-68,-124},{-52,-124},{-52,-132},{-34.4,-132}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, pump_30Hz1.outlet) annotation (Line(
      points={{16,-132},{6,-132},{6,-132},{-5.6,-132}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_30Hz1.y, pump_30Hz1.in_omega) annotation (Line(points={{-31.4,-106},{-27.2,-106},{-27.2,-123}}, color={0,0,127}));
annotation (
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16));
end TestPumpP201;
