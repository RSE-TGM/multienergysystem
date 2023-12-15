within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerPumpingSystem
  "Test model using the gas boiler and without cooling system"
  extends BaseHeatingSystem(FV933_state=false);

  // System S100

  parameter Types.Pressure pin_start_S1 = 1.695e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 17 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 17 + 273.15;

  parameter Types.Length L_S1 = 10;
  parameter Types.Length L_S1_PL1 = 0.4;
  parameter Types.Length L_S1_PL2 = 0.8;
  parameter Types.Length L_S1_PL3 = 1.5;
  parameter Types.Length L_S1_PL4 = 0.7;
  parameter Types.Length L_S1_rCD_cold = 3.5;
  parameter Types.Length L_S1_rCD_hot = 3.5;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;

  parameter Types.MassFlowRate m_flow_S1 = m_flow_total;
  parameter Real q_m3h_S1 = 9;


  parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];

  parameter Real FCV101theta[:,:] = [0, 1];

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
    headnom=Pump.P101.headnom,
    headmax=Pump.P101.headnommax,
    headmin=Pump.P101.headnommin,
    qnom_inm3h_min=Pump.P101.qnommin_inm3h,
    qnom_inm3h_max=Pump.P101.qnommax_inm3h)
                     annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-238,-165})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV101(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    rho_nom=Valve.FCV101.rho_nom,
    q_m3h_nom=Valve.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1,
    q_m3h_start=Pump.P101.qnom_inm3h)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-238,-130})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(
    L=L_S1_PL3,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-238,-220})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(
    L=L_S1_PL2,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-274,-222})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(
    L=L_S1_PL3,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-238,-96})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Tout_start=Tout_start_S1,
    HH=55.5e6,
    Tout_ref=290.15)   annotation (Placement(visible=true, transformation(
        origin={-255,-291},
        extent={{-35,-35},{35,35}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT102(T_start=Tout_start_S1, p_start=pout_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-236,-62})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-236,-74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-276,-120})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT101(T_start=Tin_start_S1, p_start=pin_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-276,-84})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=
        Tin_start_S1, p_start=pin_start_S1)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-277,-185})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(
    L=L_S1_PL1,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-274,-150})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
    L=L_S1_rCD_hot,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-238,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
    L=L_S1_rCD_cold,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-274,-30})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
    annotation (Placement(transformation(extent={{-200,-140},{-220,-120}})));
  Sources.PumpInput P101_input(omega=P101omega, q_m3h=P101qm3h)
    annotation (Placement(transformation(extent={{-200,-181},{-220,-160}})));
  Modelica.Blocks.Interaction.Show.RealValue TT102_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-218,-89},{-170,-36}})));
  Modelica.Blocks.Interaction.Show.RealValue TT101_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-294,-113},{-342,-60}})));
equation
  connect(P101.inlet,PL3_S101. outlet) annotation (Line(
      points={{-238,-174.6},{-238,-210}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet,P101. outlet) annotation (Line(
      points={{-238,-140},{-238,-155.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT102.inlet,PT102. inlet) annotation (Line(
      points={{-238.4,-62},{-238.4,-74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S101.inlet,FCV101. outlet) annotation (Line(
      points={{-238,-106},{-238,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet,PL4_S101. outlet) annotation (Line(
      points={{-238.4,-74},{-238.4,-83},{-238,-83},{-238,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet,PL2_S101. inlet) annotation (Line(
      points={{-274.2,-189.2},{-274.2,-191.6},{-274,-191.6},{-274,-212}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.outlet,FT101. inlet) annotation (Line(
      points={{-274,-160},{-274,-167.4},{-274.2,-167.4},{-274.2,-180.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.inlet,PT101. inlet) annotation (Line(
      points={{-274,-140},{-274,-120},{-273.6,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet,TT101. inlet) annotation (Line(
      points={{-273.6,-120},{-273.6,-84}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (Line(
      points={{-238,-40},{-238,-62},{-238.4,-62}},
      color={140,56,54},
      thickness=0.5));
  connect(TT101.inlet, PL_S100_rCD_cold.outlet) annotation (Line(
      points={{-273.6,-84},{-273.6,-79},{-274,-79},{-274,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
      Line(
      points={{-274,-20},{-274,5.25},{-326.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S101.outlet, GB101.inlet) annotation (Line(
      points={{-274,-232},{-274,-244},{-265.5,-244},{-265.5,-263}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S101.inlet, GB101.outlet) annotation (Line(
      points={{-238,-230},{-238,-244},{-244.5,-244},{-244.5,-263}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{-221,-130},{-230,-130}}, color={0,0,127}));

  connect(TT102.T, TT102_.numberPort) annotation (Line(points={{-228.2,-62},{
          -224.9,-62},{-224.9,-62.5},{-221.6,-62.5}}, color={0,0,127}));
  connect(TT101.T, TT101_.numberPort) annotation (Line(points={{-283.8,-84},{
          -286.1,-84},{-286.1,-86.5},{-290.4,-86.5}}, color={0,0,127}));
  connect(PL_S100_rCD_hot.outlet, FV933.inlet) annotation (Line(
      points={{-238,-20},{-238,44.75},{-218,44.75},{-218,30}},
      color={140,56,54},
      thickness=0.5));
end GasBoilerPumpingSystem;
