within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystem
  "Main components of System 100 - Gas Boiler of the RSE's distric heating network"
  extends Modelica.Icons.Example;

  parameter Integer n = 3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";

  parameter Real Kv_P101 = Valve.FCV101.Kv;
  // Temperatures and pressures

  parameter Types.Pressure pin_start_S1 = 1.695e5 - 0.09273e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;

  // Pipe Data

  parameter Types.Length L_S1_PL1 = 0.4;
  parameter Types.Length h_S1_PL1 = 0;
  parameter Types.Length L_S1_PL2 = 0.8;
  parameter Types.Length h_S1_PL2 = 0;
  parameter Types.Length L_S1_PL3 = 1.5;
  parameter Types.Length h_S1_PL3 = 0;
  parameter Types.Length L_S1_PL4 = 0.7;
  parameter Types.Length h_S1_PL4 = 0;

  parameter Types.Length L_TT101_FT101 = 0.7;
  parameter Types.Length h_TT101_FT101 = 0;
  parameter Types.Length L_FT101_GB101 = 1.25 + 0.7;
  parameter Types.Length h_FT101_GB101 = -0.7;
  parameter Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter Types.Length h_GB101_P101 = 0.7 + 0.95;
  parameter Types.Length L_P101_FCV101 = 1;
  parameter Types.Length h_P101_FCV101 = 1;

  parameter Types.Length L_S1_rCD_cold = 0.66+0.25+0.54+0.5+1.3+1+3+4+0.5+0.2+0.3 "12.25";
  parameter Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
  parameter Types.Length L_S1_rCD_hot = 1 + 3 + 3.2 + 1.1 + 1.2 + 0.5 + 0.25 + 0.6;
  parameter Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6;

  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;


  parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
  final parameter Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;

  parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*30; 300, 2*3.141592654*30];
  parameter Real FCV101theta[:,:] = [0, 1];

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P101(
    Tin_start(displayUnit="K") = Pump.P101.Tin_start,
    Tout_start(displayUnit="K") = Pump.P101.Tout_start,
    a = Pump.P101.a, b = Pump.P101.b,
    m_flow_start=m_flow_S1,
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
    qnom_inm3h_max=Pump.P101.qnommax_inm3h,
    use_in_omega=true)
                     annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={18,-17})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV101(
    Kv=Kv_P101,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    q_m3h_nom=Valve.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1,
    q_m3h_start=q_m3h_S1)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,42})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_GB101_P101(
    L=L_GB101_P101,
    h=h_GB101_P101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_FT101_GB101(
    L=L_FT101_GB101,
    h=h_FT101_GB101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,-52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    HH=55.5e6)         annotation (Placement(visible=true, transformation(
        origin={0,-116},
        extent={{-46,-46},{46,46}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT102(T_start=Tout_start_S1, p_start=pout_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={20,100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={20,88})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,32})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT101(T_start=Tin_start_S1, p_start=pin_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,44})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=
        Tin_start_S1)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-21,-27})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_TT101_FT101(
    L=L_TT101_FT101,
    h=h_TT101_FT101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,10})));
  Sources.SourcePressure source(p0=pin_start_S1, T0=Tin_start_S1)
    annotation (Placement(transformation(extent={{-52,138},{-32,158}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=m_flow_S1*0.8*0,
    duration=1500,
    offset=m_flow_S1,
    startTime=1000)
    annotation (Placement(transformation(extent={{80,150},{60,170}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    pin_start=pout_start_S1,
    p0=pout_start_S1,
    T0=Tout_start_S1,
    m_flow0=m_flow_S1)
    annotation (Placement(transformation(extent={{22,138},{42,158}})));
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
        origin={-18,120})));
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
        origin={18,120})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
    annotation (Placement(transformation(extent={{58,32},{38,52}})));
  Modelica.Blocks.Sources.TimeTable P101_omega(table=P101omega)
    annotation (Placement(transformation(extent={{58,-32},{38,-12}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_P101_FCV101(
    L=L_P101_FCV101,
    h=h_P101_FCV101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,10})));
equation
  connect(P101.inlet, PL_S100_GB101_P101.outlet) annotation (Line(
      points={{18,-26.6},{18,-40}},
      color={140,56,54},
      thickness=0.5));

  connect(TT102.inlet, PT102.inlet) annotation (Line(
      points={{17.6,100},{17.6,88}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_GB101_P101.inlet, GB101.outlet) annotation (Line(
      points={{18,-60},{18,-70.2},{13.8,-70.2},{13.8,-79.2}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101.inlet, PL_S100_FT101_GB101.outlet) annotation (Line(
      points={{-13.8,-79.2},{-18,-79.2},{-18,-62}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet, PL_S100_FT101_GB101.inlet) annotation (Line(
      points={{-18.2,-31.2},{-18.2,-33.6},{-18,-33.6},{-18,-42}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.outlet, FT101.inlet) annotation (Line(
      points={{-18,0},{-18,-15.4},{-18.2,-15.4},{-18.2,-22.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.inlet, PT101.inlet) annotation (Line(
      points={{-18,20},{-18,32},{-17.6,32}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet, TT101.inlet) annotation (Line(
      points={{-17.6,32},{-17.6,44}},
      color={140,56,54},
      thickness=0.5));
  connect(ramp.y, sink.in_m_flow) annotation (Line(points={{59,160},{26,160},{26,
          153}},          color={0,0,127}));
  connect(source.outlet, PL_S100_rCD_cold.inlet) annotation (Line(
      points={{-32,148},{-18,148},{-18,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_cold.outlet, TT101.inlet) annotation (Line(
      points={{-18,110},{-18,44},{-17.6,44}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, PL_S100_rCD_hot.outlet) annotation (Line(
      points={{22,148},{18,148},{18,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (Line(
      points={{18,110},{18,106},{17.6,106},{17.6,100}},
      color={140,56,54},
      thickness=0.5));
  connect(P101_omega.y, P101.in_omega) annotation (Line(points={{37,-22},{30.5,-22},
          {30.5,-21.8},{24,-21.8}}, color={0,0,127}));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{37,42},{26,42}}, color={0,0,127}));
  connect(FCV101.inlet, PL_S100_P101_FCV101.outlet) annotation (Line(
      points={{18,32},{18,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.inlet, P101.outlet) annotation (Line(
      points={{18,0},{18,-7.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet, FCV101.outlet) annotation (Line(
      points={{17.6,88},{18,88},{18,52}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=400,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystem;
