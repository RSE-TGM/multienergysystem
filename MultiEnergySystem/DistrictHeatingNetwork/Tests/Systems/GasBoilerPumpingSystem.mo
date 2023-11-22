within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerPumpingSystem
  "Test model using the gas boiler and without cooling system"
  extends BaseHeatingSystem(FV933_theta(height=-1,
      duration=100,
      startTime=350), omega_P901(offset=2*3.141592654*36.5));

  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P101(
    Tin_start(displayUnit="K") = Pump.P101.Tin_start,
    Tout_start(displayUnit="K") = Pump.P101.Tout_start,
    a=Pump.P101.a,
    b=Pump.P101.b,
    m_flow_start=m_flow_total,
    dpnom=Pump.P101.dpnom,
    etaelec=Pump.P101.etaelec,
    etamech=Pump.P101.etamech,
    etanom=Pump.P101.etanom,
    hin_start=Pump.P101.hin_start,
    m_flow_nom=Pump.P101.m_flow_nom,
    omeganom=Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = Pump.P101.pin_start,
    pout_start(displayUnit="Pa") = Pump.P101.pout_start,
    qnom_inm3h=Pump.P101.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P101.rhonom,
    headmax=Pump.P101.headnommax,
    headmin=Pump.P101.headnommin,
    qnom_inm3h_min=Pump.P101.qnommin_inm3h,
    qnom_inm3h_max=Pump.P101.qnommax_inm3h,
    use_in_omega=true)
                     annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-138,-153})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV101(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-138,-116})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(
    L=L_S1_PL3,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_S1,
    pout_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-138,-192})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(
    L=L_S1_PL2,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pin_start_S1,
    pout_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-174,-194})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(
    L=L_S1_PL3,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_S1,
    pout_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-138,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=288.15,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Tout_start=288.15,
    HH=55.5e6,
    Tout_ref=290.15)   annotation (Placement(visible=true, transformation(
        origin={-156,-258},
        extent={{-46,-46},{46,46}},
        rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT102(T_start=Tout_start_S1, p_start=pout_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-136,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-136,-52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-176,-52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT101(T_start=Tin_start_S1, p_start=pin_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-176,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-177,-163})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(
    L=L_S1_PL1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pin_start_S1,
    pout_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-174,-134})));
  Modelica.Blocks.Sources.Ramp FCV101_theta(
    height=-0.2*0,
    duration=1500,
    offset=1,
    startTime=3000)
    annotation (Placement(transformation(extent={{-96,-126},{-116,-106}})));
  Modelica.Blocks.Sources.Ramp omega_P101(
    offset=2*3.141592654*50,
    height=-2*3.141592654*10,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-96,-168},{-117,-148}})));
equation
  connect(P101.inlet,PL3_S101. outlet) annotation (Line(
      points={{-138,-162.6},{-138,-182}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet,P101. outlet) annotation (Line(
      points={{-138,-126},{-138,-143.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT102.inlet,PT102. inlet) annotation (Line(
      points={{-138.4,-40},{-138.4,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S101.inlet,GB101. outlet) annotation (Line(
      points={{-138,-202},{-138,-216.2},{-137.6,-216.2},{-137.6,-230.4}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101.inlet,PL2_S101. outlet) annotation (Line(
      points={{-174.4,-230.4},{-174,-230.4},{-174,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S101.inlet,FCV101. outlet) annotation (Line(
      points={{-138,-90},{-138,-106}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet,PL4_S101. outlet) annotation (Line(
      points={{-138.4,-52},{-138.4,-61},{-138,-61},{-138,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet,PL2_S101. inlet) annotation (Line(
      points={{-174.2,-167.2},{-174.2,-175.6},{-174,-175.6},{-174,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.outlet,FT101. inlet) annotation (Line(
      points={{-174,-144},{-174,-151.4},{-174.2,-151.4},{-174.2,-158.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.inlet,PT101. inlet) annotation (Line(
      points={{-174,-124},{-174,-52},{-173.6,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet,TT101. inlet) annotation (Line(
      points={{-173.6,-52},{-173.6,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{-117,-116},{-130,-116}}, color={0,0,127}));
  connect(TT102.inlet, FV933.inlet) annotation (Line(
      points={{-138.4,-40},{-138.4,20},{-120,20},{-120,5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT101.inlet, rackCD_Cold_S400_S100.outlet) annotation (Line(
      points={{-173.6,-40},{-174,-40},{-174,-19.75},{-228.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P101.y, P101.in_omega) annotation (Line(points={{-118.05,-158},
          {-125.025,-158},{-125.025,-157.8},{-132,-157.8}}, color={0,0,127}));
end GasBoilerPumpingSystem;
