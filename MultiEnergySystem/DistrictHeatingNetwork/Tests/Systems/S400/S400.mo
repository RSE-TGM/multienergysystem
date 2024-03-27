within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400 "Main components of System 400 - Electric Boiler"
  extends Modelica.Icons.Example;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby
    DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;
  parameter Types.Length L_PT401_EB401 = 0.5+0.4;
  parameter Types.Length h_PT401_EB401 = 0;
  parameter Types.Length L_EB401_P401 = 0.3+1+1+0.4;
  parameter Types.Length h_EB401_P401 = -1;
  parameter Types.Length L_P401_FCV401 = 0.2+0.4+0.6;
  parameter Types.Length h_P401_FCV401 = 0.2;

  parameter Real q_m3h_S4 = 5;
  final parameter Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;
  parameter Real P401omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
  parameter Real FCV401theta[:,:] = [0, 1];


  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,190},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
        origin={0,-118},
        extent={{-52,-52},{52,52}},
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
        origin={20,-5})));
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
        origin={20,64})));
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
        origin={20,-42})));
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
        origin={-18,-24})));
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
        origin={20,34})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={22,122})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={22,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-20,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(redeclare model Medium = Medium, T_start=Tin_start_S4, p_start=pin_start_S4)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-21,17})));
  Sources.SourcePressure source(redeclare model Medium = Medium, p0=pin_start_S4, T0=Tin_start_S4)
    annotation (Placement(transformation(extent={{-52,130},{-32,110}})));
  Modelica.Blocks.Sources.TimeTable EB401_ToutSP(table=[0,80 + 273.15; 100,80 + 273.15])
    annotation (Placement(transformation(extent={{-90,-128},{-70,-108}})));
  Modelica.Blocks.Sources.BooleanTable EB101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the electric boiler is working"
    annotation (Placement(transformation(extent={{-90,-160},{-70,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta) annotation (Placement(transformation(extent={{60,54},{40,74}})));
  Modelica.Blocks.Sources.TimeTable P401_omega(table=P401omega)  annotation (Placement(transformation(extent={{60,-20},{40,0}})));
  Sources.SinkPressure sinkP(
    redeclare model Medium = Medium,
    use_in_p0=false,
    p0=pout_start_S4,
    T0=Tout_start_S4,
    R=1) annotation (Placement(transformation(extent={{26,150},{46,130}})));
equation
  connect(P401.inlet, PL_S400_EB401_P401.outlet) annotation (Line(
      points={{20,-14.6},{20,-32}},
      color={140,56,54},
      thickness=0.5));

  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{19.6,122},{22,122},{22,118},{19.6,118},{19.6,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-17.6,40},{-17.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet, PL_S400_EB401_P401.inlet) annotation (Line(
      points={{15.6,-76.4},{14,-76.4},{14,-52},{20,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, TT401.inlet) annotation (Line(
      points={{-32,120},{-17.6,120},{-17.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401_ToutSP.y, EB401.Tout_ref)
    annotation (Line(points={{-69,-118},{-36.4,-118}}, color={0,0,127}));
  connect(EB101_Status.y, EB401.heat_on) annotation (Line(points={{-69,-150},{-64,-150},{-64,-148},{-58,-148},{-58,-144},{-36.4,-144}}, color={255,0,255}));
  connect(FCV401.inlet, PL_S400_P401_FCV401.outlet) annotation (Line(
      points={{20,54},{20,44}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_P401_FCV401.inlet, P401.outlet) annotation (Line(
      points={{20,24},{20,4.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB101.inlet, FT401.outlet) annotation (Line(
      points={{-18,-14},{-18,-0.6},{-18.2,-0.6},{-18.2,12.8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.inlet, PT401.inlet) annotation (Line(
      points={{-18.2,21.2},{-18.2,30.6},{-17.6,30.6},{-17.6,40}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401_theta.y, FCV401.opening) annotation (Line(points={{39,64},{28,64}}, color={0,0,127}));
  connect(P401_omega.y, P401.in_omega) annotation (Line(points={{39,-10},{32.5,-10},{32.5,-9.8},{26,-9.8}},
                                                                                                          color={0,0,127}));
  connect(PL_S400_PT401_EB101.outlet, EB401.inlet) annotation (Line(
      points={{-18,-34},{-18,-60},{-15.6,-60},{-15.6,-76.4}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP.inlet, TT402.inlet) annotation (Line(
      points={{26,140},{20,140},{20,122},{19.6,122}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet, FCV401.outlet) annotation (Line(
      points={{19.6,110},{20,110},{20,74}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-200},{160,200}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=6000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400;
