within MultiEnergySystem.CaseStudies.GasNetwork_2iRG;
model Rete_Gas_2i_1sources "immissione 1"
  extends CaseStudies.GasNetwork_2iRG.Rete_Gas_2i_pipes_users;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
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
        origin={-136,-52})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    m_flow0=0.0001,
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-86,-20},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    offset=0.001*0,
    duration=60,
    height=0.09889,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-23,32},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-23,68},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{36,40},{56,60}})));
equation
  connect(add.y,Immissione_1. in_m_flow0) annotation (Line(points={{57,50},{70,
          50},{70,16},{-42,16},{-42,0},{-70,0},{-70,-25},{-80,-25}},
                                                                 color={0,0,127}));
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-146,-52},{-198,-52},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.inlet,Immissione_1. outlet) annotation (Line(
      points={{-126,-52},{-114,-52},{-114,-50},{-110,-50},{-110,-20},{-96,-20}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-12,68},{24,68},{24,56},
          {34,56}},     color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-12,32},{24,32},{24,44},
          {34,44}},     color={0,0,127}));
  annotation (experiment(
      StopTime=28000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_1sources;
