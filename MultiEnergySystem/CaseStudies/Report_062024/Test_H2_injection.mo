within MultiEnergySystem.CaseStudies.Report_062024;
model Test_H2_injection
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2 constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter H2GasFacility.Types.MassFraction X_start[nX]={0.9,0.04,0.04,0.005,
      0.01,0.005,0.0};
  parameter H2GasFacility.Types.MassFraction X_start_H2[nX]={0.8,0.04,0.04,
      0.005,0.01,0.005,0.1};
  parameter H2GasFacility.Types.MassFraction X_net[nX]={0.9,0.04,0.04,0.005,
      0.01,0.005,0.0};
  parameter Integer n = 10 "Number of volumes in Flow1DFV";
  parameter Boolean massFractionDynamicBalance = true;
  //parameter Types.Length kappa = 0.045e-3;

  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    redeclare model Medium =
        Medium,
    p0=150000,
    T0=288.15,
    X0=X_net,
    use_in_p0=true)
    annotation (Placement(transformation(extent={{-80,-4},{-60,16}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sinkMassFlow3(
    redeclare model Medium = Medium,
    pin_start=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    p0=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    T0=H2GasFacility.Data.PipelineData.pipe1.Tin_start,
    X0=X_net,
    m_flow0=H2GasFacility.Data.PipelineData.pipe1.m_flow_start,
    G=0) annotation (Placement(transformation(extent={{70,-16},{90,4}})));

  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sinkMassFlow2(
    redeclare model Medium =
        Medium,
    pin_start=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    p0=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    T0=H2GasFacility.Data.PipelineData.pipe1.Tin_start,
    X0=X_net,
    m_flow0=H2GasFacility.Data.PipelineData.pipe1.m_flow_start,
    G=0)
    annotation (Placement(transformation(extent={{72,16},{92,36}})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow1(
    p0=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    T0=H2GasFacility.Data.PipelineData.pipe1.Tin_start,
    redeclare model Medium = Medium,
    X0=X_net,
    m_flow0=H2GasFacility.Data.PipelineData.pipe1.m_flow_start,
    G=0,
    use_in_m_flow0=true,
    use_in_T0=false,
    use_in_X0=true)
    annotation (Placement(transformation(extent={{-62,-82},{-42,-62}})));
  Modelica.Blocks.Sources.RealExpression realExpression[7](y=if time < 100
         then X_start_H2 else X_start_H2)
    annotation (Placement(transformation(extent={{-84,-44},{-64,-24}})));
  Modelica.Blocks.Sources.Ramp m_flow_in1(
    duration=0,
    height=0.01,
    offset=0,
    startTime=250) annotation (Placement(visible=true, transformation(
        origin={-90,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  inner System system(T_amb=288.15)
    annotation (Placement(transformation(extent={{-90,74},{-70,94}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(
    redeclare model Gas = Medium,
    L=H2GasFacility.Data.PipelineData.pipe1.L,
    m_flow_start=H2GasFacility.Data.PipelineData.pipe1.m_flow_start,
    pin_start=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    pout_start=H2GasFacility.Data.PipelineData.pipe1.pout_start,
    hin_start=H2GasFacility.Data.PipelineData.pipe1.hin_start,
    Tin_start=H2GasFacility.Data.PipelineData.pipe1.Tin_start,
    Tout_start=H2GasFacility.Data.PipelineData.pipe1.Tout_start,
    X_start=X_net,
    Di=H2GasFacility.Data.PipelineData.pipe1.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,
    momentum=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure,
    rho_nom=H2GasFacility.Data.PipelineData.pipe1.rho_nom,
    n=n,
    kappa=H2GasFacility.Data.PipelineData.pipe1.kappa,
    k=H2GasFacility.Data.PipelineData.pipe1.k)
    annotation (Placement(transformation(extent={{-36,-2},{-16,18}})));

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(
    redeclare model Gas =
        Medium,
    L=H2GasFacility.Data.PipelineData.pipe1.L,
    m_flow_start=H2GasFacility.Data.PipelineData.pipe1.m_flow_start,
    pin_start=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    pout_start=H2GasFacility.Data.PipelineData.pipe1.pout_start,
    hin_start=H2GasFacility.Data.PipelineData.pipe1.hin_start,
    Tin_start=H2GasFacility.Data.PipelineData.pipe1.Tin_start,
    Tout_start=H2GasFacility.Data.PipelineData.pipe1.Tout_start,
    X_start=X_net,
    Di=H2GasFacility.Data.PipelineData.pipe1.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,
    momentum=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure,
    rho_nom=H2GasFacility.Data.PipelineData.pipe1.rho_nom,
    n=n,
    kappa=H2GasFacility.Data.PipelineData.pipe1.kappa,
    k=H2GasFacility.Data.PipelineData.pipe1.k)
    annotation (Placement(transformation(extent={{24,14},{44,34}})));

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(
    redeclare model Gas =
        Medium,
    L=H2GasFacility.Data.PipelineData.pipe1.L,
    m_flow_start=H2GasFacility.Data.PipelineData.pipe1.m_flow_start,
    pin_start=H2GasFacility.Data.PipelineData.pipe1.pin_start,
    pout_start=H2GasFacility.Data.PipelineData.pipe1.pout_start,
    hin_start=H2GasFacility.Data.PipelineData.pipe1.hin_start,
    Tin_start=H2GasFacility.Data.PipelineData.pipe1.Tin_start,
    Tout_start=H2GasFacility.Data.PipelineData.pipe1.Tout_start,
    X_start=X_net,
    Di=H2GasFacility.Data.PipelineData.pipe1.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,
    momentum=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure,
    rho_nom=H2GasFacility.Data.PipelineData.pipe1.rho_nom,
    n=n,
    kappa=H2GasFacility.Data.PipelineData.pipe1.kappa,
    k=H2GasFacility.Data.PipelineData.pipe1.k)
    annotation (Placement(transformation(extent={{24,-16},{44,4}})));

  Modelica.Blocks.Sources.Ramp pin(
    duration=0,
    height=0.1e5*0,
    offset=1.5e5,
    startTime=50) annotation (Placement(visible=true, transformation(
        origin={-90,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(realExpression.y,sourceMassFlow1. in_X0)
    annotation (Line(points={{-63,-34},{-46,-34},{-46,-67}}, color={0,0,127}));
  connect(m_flow_in1.y,sourceMassFlow1. in_m_flow0)
    annotation (Line(points={{-79,-60},{-66,-60},{-66,-67},{-58,-67}},
                                                             color={0,0,127}));
  connect(sourcePressure.outlet, pipe1.inlet) annotation (Line(
      points={{-60,6},{-44,6},{-44,8},{-36,8}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe2.outlet,sinkMassFlow2. inlet) annotation (Line(
      points={{44,24},{64,24},{64,26},{72,26}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe3.outlet, sinkMassFlow3.inlet) annotation (Line(
      points={{44,-6},{70,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(pin.y, sourcePressure.in_p0)
    annotation (Line(points={{-79,30},{-74,30},{-74,14.4}}, color={0,0,127}));
  connect(pipe1.outlet, pipe2.inlet) annotation (Line(
      points={{-16,8},{16,8},{16,24},{24,24}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe3.inlet, pipe2.inlet) annotation (Line(
      points={{24,-6},{12,-6},{12,8},{16,8},{16,24},{24,24}},
      color={182,109,49},
      thickness=0.5));
  connect(sourceMassFlow1.outlet, pipe2.inlet) annotation (Line(
      points={{-42,-72},{4,-72},{4,8},{16,8},{16,24},{24,24}},
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
    experiment(
      StopTime=500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Test_H2_injection;
