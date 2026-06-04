within MultiEnergySystem.CaseStudies.Report_062025;
model RG2i_source2
  extends Rete_Gas_2i_pipes_users;
  H2GasFacility.Components.Pipes.Round1DFV                   sds17e16(
    n=nV,
    L=Report_062025.PipelineData_2i.sds17.L + Report_062025.PipelineData_2i.sds16.L,

    H=Report_062025.PipelineData_2i.sds17.h + Report_062025.PipelineData_2i.sds16.h,

    cm=Report_062025.PipelineData_2i.sds17.cm,
    rhom=Report_062025.PipelineData_2i.sds17.rhom,
    lambdam=Report_062025.PipelineData_2i.sds17.lambdam,
    m_flow_start=Report_062025.PipelineData_2i.sds17.m_flow_start,
    pin_start=Report_062025.PipelineData_2i.sds17.pin_start,
    pout_start=Report_062025.PipelineData_2i.sds16.pout_start,
    kappa=Report_062025.PipelineData_2i.sds17.kappa,
    k=Report_062025.PipelineData_2i.sds17.k,
    redeclare model Gas = Medium,
    X_start=X_start,
    Di=Report_062025.PipelineData_2i.sds17.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-248,222})));
  H2GasFacility.Sources.SourceMassFlow                   Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true,
    use_in_X0=true)      annotation (Placement(visible=true, transformation(
        origin={-302,222},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=300,
    height=25/3600,
    offset=0,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-409,234},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=300,
    height=-25/3600,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-407,270},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-348,242},{-328,262}})));
  Modelica.Blocks.Sources.RealExpression realExpression[2](y=if (time > (3600)
         and time < (18000 + 300)) then {0,1} else {1,0})
    annotation (Placement(transformation(extent={{-326,268},{-306,288}})));
equation
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-396,270},{-360,270},
          {-360,258},{-350,258}}, color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-398,234},{-350,234},
          {-350,246}},            color={0,0,127}));
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-327,252},
          {-302,252},{-302,240},{-306,240},{-306,227},{-308,227}},
                                             color={0,0,127}));
  connect(sds17e16.inlet,Immissione_2. outlet) annotation (Line(
      points={{-258,222},{-292,222}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17e16.outlet, sds13.inlet) annotation (Line(
      points={{-238,222},{-202,222},{-202,218},{-164,218},{-164,220},{-54,220},
          {-54,202},{14,202}},
      color={182,109,49},
      thickness=0.5));
  connect(realExpression.y, Immissione_2.in_X0) annotation (Line(points={{-305,
          278},{-296,278},{-296,227}}, color={0,0,127}));
end RG2i_source2;
