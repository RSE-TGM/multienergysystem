within MultiEnergySystem.CaseStudies.Report_062025;
model RG2i_source1
  extends Rete_Gas_2i_pipes_users;
  H2GasFacility.Components.Pipes.Round1DFV                   s3(
    n=nV,
    H=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.h,
    cm=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.cm,
    rhom=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.rhom,
    lambdam=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.lambdam,
    m_flow_start=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.m_flow_start,
    pin_start=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.pin_start,
    pout_start=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.pout_start,
    kappa=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.kappa,
    k=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.k,
    redeclare model Gas = Medium,
    L=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.L,
    X_start=X_start,
    Di=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-92,-60})));
  H2GasFacility.Sources.SourceMassFlow                   Immissione_1(
    X0=X_start,
    m_flow0=0.0001,
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true,
    use_in_X0=true)      annotation (Placement(visible=true, transformation(
        origin={-2,24},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    offset=0.001*0,
    duration=300,
    height=25/3600,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-19,56},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=300,
    height=-25/3600,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-19,92},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{40,64},{60,84}})));
  Modelica.Blocks.Sources.RealExpression realExpression[2](y=if (time > (3600)
         and time < (18000 + 300)) then {0,1} else {1,0})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={36,8})));
equation
  connect(s3.inlet,Immissione_1. outlet) annotation (Line(
      points={{-82,-60},{-56,-60},{-56,8},{-36,8},{-36,24},{-12,24}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-8,92},{28,92},{28,80},
          {38,80}},     color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-8,56},{28,56},{28,68},
          {38,68}},     color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{61,74},{68,
          74},{68,19},{4,19}},                 color={0,0,127}));
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-102,-60},{-198,-60},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(realExpression.y, Immissione_1.in_X0)
    annotation (Line(points={{25,8},{-8,8},{-8,19}}, color={0,0,127}));
end RG2i_source1;
