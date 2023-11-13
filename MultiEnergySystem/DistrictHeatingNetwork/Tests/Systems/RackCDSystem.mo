within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model RackCDSystem
  parameter Types.Length t = 1.5e-3;
  parameter Types.Length Di = 51e-3;
  parameter Types.Length L_v = 1;
  parameter Types.Length L_RL2L3 = 4.53;
  parameter Types.Length L_RL3L4 = 3.02;
  parameter Types.Length L_RL4L5 = 2.5;
  parameter Types.Length L_RL5L6 = 2.5;
  parameter Types.Length L_RL6L7 = 3;
  parameter Types.Pressure pin_start = 1.69e5;
  parameter Types.Pressure pout_start = 3e5;
  parameter Types.Temperature T_start = 25 + 273.15;
  parameter Types.MassFlowRate m_flow_start = 4.04;

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FV933(
    Kv=11.5,
    dp_nom=50000,
    Tin_start=T_start,
    pin_start=pin_start)       annotation (Placement(visible=true,
        transformation(
        origin={100,0},
        extent={{-5,5},{5,-5}},
        rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe1(
    L=1,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{-7.5,7.5},{7.5,-7.5}},
        rotation=180,
        origin={77,15})));
  Modelica.Blocks.Sources.Ramp theta_sp(
    height=-0.2*0,
    duration=100,
    offset=1,
    startTime=100)
    annotation (Placement(transformation(extent={{120,-5},{110,5}})));
  inner System system(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState)
    annotation (Placement(transformation(extent={{-120.5,80},{-100.5,100}})));
  Sources.SourcePressure sourcePressure(p0=pin_start, T0=T_start)
    annotation (Placement(transformation(extent={{-88,-20.5},{-77,-9.5}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe2(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{-7.5,7.5},{7.5,-7.5}},
        rotation=180,
        origin={42.5,15})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe4(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={52,-15})));
  Sources.SinkMassFlow P901(
    pin_start=pin_start,
    p0=pin_start,
    T0=T_start,
    m_flow0=Pump.P901.m_flow_nom + 0.1)
    annotation (Placement(transformation(extent={{-77.5,8},{-91.5,22}})));
  Sources.SourceMassFlow GB_Hot(
    p0=pin_start,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=Pump.P101.m_flow_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90.5,-48})));
  Sources.SourceMassFlow ElectricBoiler(
    p0=pin_start,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=Pump.P901.m_flow_nom - Pump.P101.m_flow_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={65,-48})));
  Sources.SinkMassFlow GB_Cold(
    pin_start=pin_start,
    p0=pin_start,
    T0=T_start,
    m_flow0=Pump.P101.m_flow_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={75,-68.5})));
  Sources.SinkMassFlow EB_Cold(
    pin_start=pin_start,
    p0=pin_start,
    T0=T_start,
    m_flow0=Pump.P901.m_flow_nom - Pump.P101.m_flow_nom) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-68})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe3(
    L=0.8,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1) "Pipe connecting the outlet of pump P901 and FCV901" annotation (
      Placement(transformation(
        extent={{7.5,7.5},{-7.5,-7.5}},
        rotation=180,
        origin={87.5,-15})));
equation
  connect(FV933.outlet, pipe1.inlet) annotation (Line(
      points={{100,5},{100,15},{84.5,15}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe1.outlet, pipe2.inlet) annotation (Line(
      points={{69.5,15},{59.75,15},{59.75,15},{50,15}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe3.outlet, FV933.inlet) annotation (Line(
      points={{95,-15},{100,-15},{100,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe3.inlet, pipe4.outlet) annotation (Line(
      points={{80,-15},{69.75,-15},{69.75,-15},{59.5,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe2.outlet, P901.inlet) annotation (Line(
      points={{35,15},{-21.25,15},{-21.25,15},{-77.5,15}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe4.inlet, sourcePressure.outlet) annotation (Line(
      points={{44.5,-15},{-77,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(GB_Hot.outlet, pipe1.inlet) annotation (Line(
      points={{90.5,-38},{90.5,15},{84.5,15}},
      color={140,56,54},
      thickness=0.5));
  connect(ElectricBoiler.outlet, pipe2.inlet) annotation (Line(
      points={{65,-38},{64.5,-38},{64.5,15},{50,15}},
      color={140,56,54},
      thickness=0.5));
  connect(theta_sp.y, FV933.opening) annotation (Line(points={{109.5,0},{106.75,
          0},{106.75,-2.77556e-16},{104,-2.77556e-16}}, color={0,0,127}));
  connect(GB_Cold.inlet, pipe4.outlet) annotation (Line(
      points={{75,-58.5},{75,-15},{59.5,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(EB_Cold.inlet, sourcePressure.outlet) annotation (Line(
      points={{40,-58},{40,-15},{-77,-15}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(extent={{-120,-100},{120,100}}, grid={0.5,0.5})),
    experiment(
      StopTime=500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RackCDSystem;
