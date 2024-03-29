within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400 "Main components of System 400 - Electric Boiler"
  extends Modelica.Icons.Example;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;
  parameter Types.Length L_PT401_EB401 = 0.5+0.4+0.2;
  parameter Types.Length h_PT401_EB401 = -0.1;
  parameter Types.Length L_EB401_P401 = 0.3+1+1+0.4;
  parameter Types.Length h_EB401_P401 = -1;
  parameter Types.Length L_P401_FCV401 = 0.2+0.4+0.6;
  parameter Types.Length h_P401_FCV401 = 0.2;

  parameter Real q_m3h_S4 = 5;
  final parameter Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;
  parameter Real P401omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
  parameter Real FCV401theta[:,:] = [0, 1];


  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    redeclare model Medium = Medium,
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
        origin={-1,-107},
        extent={{-41,-41},{41,41}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    redeclare model Medium = Medium,
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
    headnom=Pump.P401.headnom,
    qnom_inm3h=Pump.P401.qnom_inm3h,                                                                                                                                                                                                        rhonom(displayUnit = "kg/m3") = Pump.P401.rhonom,
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={14,-5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV401(
    redeclare model Medium = Medium,
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={14,64})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_EB401_P401(
    redeclare model Medium = Medium,
    L=L_EB401_P401,
    h=h_EB401_P401,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4) "Pipe connecting outlet of electric boiler and pump P401"
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={14,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_PT401_EB101(
    redeclare model Medium = Medium,
    L=L_PT401_EB401,
    h=h_PT401_EB401,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4) "Pipe connecting pressure sensor PT401 and inlet of electric boiler"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-16,-24})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_P401_FCV401(
    redeclare model Medium = Medium,
    L=L_P401_FCV401,
    h=h_P401_FCV401,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={14,34})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={16,104})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={16,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-18,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-18,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(redeclare model Medium = Medium, T_start=Tin_start_S4, p_start=pin_start_S4)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-19,17})));
  Sources.SourcePressure source(redeclare model Medium = Medium, p0=pin_start_S4, T0=Tin_start_S4)
    annotation (Placement(transformation(extent={{-50,130},{-30,110}})));
  Modelica.Blocks.Sources.TimeTable EB401_ToutSP(table=[0,80 + 273.15; 100,80 + 273.15])
    annotation (Placement(transformation(extent={{-84,-116},{-64,-96}})));
  Modelica.Blocks.Sources.BooleanTable EB401_Status(table={1e6}, startValue=true) "Input to decide whether or nor the electric boiler is working"
    annotation (Placement(transformation(extent={{-84,-148},{-64,-128}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta) annotation (Placement(transformation(extent={{82,56},{62,76}})));
  Modelica.Blocks.Sources.TimeTable P401_omega(table=P401omega)  annotation (Placement(transformation(extent={{80,-20},{60,0}})));
  Sources.SinkPressure sinkP(
    redeclare model Medium = Medium,
    use_in_p0=false,
    p0=pout_start_S4,
    T0=Tout_start_S4,
    R=0) annotation (Placement(transformation(extent={{20,130},{40,110}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=2,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{52,56},{32,76}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    k=1,
    T=2,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{52,-20},{32,0}})));
equation
  connect(P401.inlet, PL_S400_EB401_P401.outlet) annotation (Line(
      points={{14,-14.6},{14,-32}},
      color={140,56,54},
      thickness=0.5));

  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{13.6,104},{14,104},{14,98},{13.6,98},{13.6,90}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-15.6,40},{-15.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet, PL_S400_EB401_P401.inlet) annotation (Line(
      points={{11.3,-74.2},{10,-74.2},{10,-52},{14,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, TT401.inlet) annotation (Line(
      points={{-30,120},{-15.6,120},{-15.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401_ToutSP.y, EB401.Tout_ref)
    annotation (Line(points={{-63,-106},{-46.35,-106},{-46.35,-107},{-29.7,-107}},
                                                       color={0,0,127}));
  connect(EB401_Status.y, EB401.heat_on) annotation (Line(points={{-63,-138},{-48,-138},{-48,-127.5},{-29.7,-127.5}},                   color={255,0,255}));
  connect(FCV401.inlet, PL_S400_P401_FCV401.outlet) annotation (Line(
      points={{14,54},{14,44}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_P401_FCV401.inlet, P401.outlet) annotation (Line(
      points={{14,24},{14,4.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB101.inlet, FT401.outlet) annotation (Line(
      points={{-16,-14},{-16,-0.6},{-16.2,-0.6},{-16.2,12.8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.inlet, PT401.inlet) annotation (Line(
      points={{-16.2,21.2},{-16.2,30.6},{-15.6,30.6},{-15.6,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB101.outlet, EB401.inlet) annotation (Line(
      points={{-16,-34},{-16,-62},{-13.3,-62},{-13.3,-74.2}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP.inlet, TT402.inlet) annotation (Line(
      points={{20,120},{14,120},{14,104},{13.6,104}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet, FCV401.outlet) annotation (Line(
      points={{13.6,90},{14,90},{14,74}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401_theta.y, firstOrder.u) annotation (Line(points={{61,66},{54,66}}, color={0,0,127}));
  connect(firstOrder.y, FCV401.opening) annotation (Line(points={{31,66},{28,66},{28,64},{22,64}}, color={0,0,127}));
  connect(P401_omega.y, firstOrder1.u) annotation (Line(points={{59,-10},{54,-10}}, color={0,0,127}));
  connect(firstOrder1.y, P401.in_omega) annotation (Line(points={{31,-10},{25.5,-10},{25.5,-9.8},{20,-9.8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=6000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400;
