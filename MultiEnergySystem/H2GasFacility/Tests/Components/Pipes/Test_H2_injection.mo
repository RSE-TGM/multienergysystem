within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test_H2_injection
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2;
  parameter Types.MassFraction Xref[:] = {0.9, 0.1} "Nominal mass fraction";
  parameter Types.MassFraction Xref_2[:] = {1, 0};
  parameter Types.MassFraction X_start[:] = {1, 0};
  parameter Integer n = 3 "Number of volumes in Flow1DFV";


  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    p0=150000,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-80,-4},{-60,16}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sinkMassFlow(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    pin_start=Pipe.pipe1.pin_start,
    p0=150000,
    T0=288.15,
    X0=X_start,
    m_flow0=-Pipe.pipe1.m_flow_start)
    annotation (Placement(transformation(extent={{70,-16},{90,4}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip pipe1(
    L=Pipe.pipe1.L,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    redeclare model Gas =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    constantFrictionFactor=false,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    rho_nom=Pipe.pipe1.rho_nom,
    n=n,
    k=Pipe.pipe1.k)
    annotation (Placement(transformation(extent={{-34,-4},{-14,16}})));

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip pipe3(
    L=Pipe.pipe1.L,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    redeclare model Gas =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    constantFrictionFactor=false,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    rho_nom=Pipe.pipe1.rho_nom,
    n=n,
    k=Pipe.pipe1.k)
    annotation (Placement(transformation(extent={{28,-16},{48,4}})));

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip pipe2(
    L=Pipe.pipe1.L,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    redeclare model Gas =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    constantFrictionFactor=false,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    rho_nom=Pipe.pipe1.rho_nom,
    n=n,
    k=Pipe.pipe1.k)
    annotation (Placement(transformation(extent={{34,16},{54,36}})));

  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sinkMassFlow1(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    pin_start=Pipe.pipe1.pin_start,
    p0=150000,
    T0=288.15,
    X0=X_start,
    m_flow0=-Pipe.pipe1.m_flow_start)
    annotation (Placement(transformation(extent={{72,16},{92,36}})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow1(
    p0=Pipe.pipe1.pin_start,
    T0=Pipe.pipe1.Tin_start,
    redeclare model Medium = Medium,
    X0=X_start,
    m_flow0=Pipe.pipe1.m_flow_start,
    G=0,
    use_in_m_flow0=true,
    use_in_T0=false,
    use_in_X0=true)
    annotation (Placement(transformation(extent={{-62,-82},{-42,-62}})));
  Modelica.Blocks.Sources.RealExpression realExpression[2](y=if time < 50 then
        X_start else Xref)
    annotation (Placement(transformation(extent={{-84,-44},{-64,-24}})));
  Modelica.Blocks.Sources.Ramp m_flow_in1(
    duration=0,
    height=0.01,
    offset=Pipe.pipe1.m_flow_start,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-90,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(sourcePressure.outlet, pipe1.inlet) annotation (Line(
      points={{-60,6},{-34,6}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe3.outlet, sinkMassFlow.inlet) annotation (Line(
      points={{48,-6},{70,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe1.outlet, pipe3.inlet) annotation (Line(
      points={{-14,6},{2,6},{2,-6},{28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe2.inlet, pipe3.inlet) annotation (Line(
      points={{34,26},{18,26},{18,6},{2,6},{2,-6},{28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe2.outlet, sinkMassFlow1.inlet) annotation (Line(
      points={{54,26},{72,26}},
      color={182,109,49},
      thickness=0.5));
  connect(realExpression.y,sourceMassFlow1. in_X0)
    annotation (Line(points={{-63,-34},{-46,-34},{-46,-67}}, color={0,0,127}));
  connect(m_flow_in1.y,sourceMassFlow1. in_m_flow0)
    annotation (Line(points={{-79,-60},{-66,-60},{-66,-67},{-58,-67}},
                                                             color={0,0,127}));
  connect(sourceMassFlow1.outlet, pipe3.inlet) annotation (Line(
      points={{-42,-72},{-2,-72},{-2,6},{2,6},{2,-6},{28,-6}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end Test_H2_injection;
