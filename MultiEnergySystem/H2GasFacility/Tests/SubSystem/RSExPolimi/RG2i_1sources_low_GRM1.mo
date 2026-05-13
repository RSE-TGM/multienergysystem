within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model RG2i_1sources_low_GRM1 "immissione 1"
  extends RG2i_low_GRM1(
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    X_start={1,0},
    valveLinearOpening(A_v=5.5e-5),
    GRM_1(m_flow0=0.112338),
    GRM_2(m_flow0=0.119588),
    GRM_3(m_flow0=0.034069),
    sds7e8(n=11));

    // redeclare model Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.CH4H2Papay,
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
    n=nV,
    H=Data.PipelineData_2i.s3.h,
    cm=Data.PipelineData_2i.s3.cm,
    rhom=Data.PipelineData_2i.s3.rhom,
    lambdam=Data.PipelineData_2i.s3.lambdam,
    m_flow_start=Data.PipelineData_2i.s3.m_flow_start,
    pin_start=Data.PipelineData_2i.s3.pin_start,
    pout_start=Data.PipelineData_2i.s3.pout_start,
    kappa=Data.PipelineData_2i.s3.kappa,
    k=Data.PipelineData_2i.s3.k,
    redeclare model Gas = Medium,
    L=Data.PipelineData_2i.s3.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s3.Di,
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
    m_flow0=0*0.0001,
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-12,
    T0=288.15,
    X0={0,1},
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-86,-20},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    offset=0*1e-3,
    duration=10,
    height=0.0035*0,
    startTime=10000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-23,32},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=10,
    height=-0.0035*0,
    offset=0,
    startTime=25000)                                                                                        annotation (
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
      StopTime=50000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_1sources_low_GRM1;
