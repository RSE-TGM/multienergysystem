within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4H2;
model Rete2i_2sources
  extends Rete2i_nosources        (
    constantFrictionFactor=false,
    FrictionFactor=0.003,
    sds7(pin_start=467300));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=Data.PipelineData_2i.sds16.L,
    H=Data.PipelineData_2i.sds16.h,
    cm=Data.PipelineData_2i.sds16.cm,
    rhom=Data.PipelineData_2i.sds16.rhom,
    lambdam=Data.PipelineData_2i.sds16.lambdam,
    m_flow_start=Data.PipelineData_2i.sds16.m_flow_start,
    pin_start=Data.PipelineData_2i.sds16.pin_start,
    pout_start=Data.PipelineData_2i.sds16.pout_start,
    kappa=Data.PipelineData_2i.sds16.kappa,
    k=Data.PipelineData_2i.sds16.k,
    redeclare model Gas = Medium,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds16.Di,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-188,218})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
    L=Data.PipelineData_2i.sds17.L,
    H=Data.PipelineData_2i.sds17.h,
    cm=Data.PipelineData_2i.sds17.cm,
    rhom=Data.PipelineData_2i.sds17.rhom,
    lambdam=Data.PipelineData_2i.sds17.lambdam,
    m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
    pin_start=Data.PipelineData_2i.sds17.pin_start,
    pout_start=Data.PipelineData_2i.sds17.pout_start,
    n=11,
    kappa=Data.PipelineData_2i.sds17.kappa,
    k=Data.PipelineData_2i.sds17.k,
    redeclare model Gas = Medium,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds17.Di,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-246,218})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-300,220},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=60,
    height=0.09889,
    offset=0,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-399,224},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-405,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-346,240},{-326,260}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
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
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-146,-58})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-96,-26},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=60,
    height=0.09889,
    offset=0,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-51,52},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-51,88},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{8,60},{28,80}})));
equation
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-394,268},{-358,268},{
          -358,256},{-348,256}},  color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-388,224},{-360,224},{
          -360,244},{-348,244}},  color={0,0,127}));
  connect(add1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-325,250},{
          -300,250},{-300,238},{-304,238},{-304,225},{-306,225}},
                                             color={0,0,127}));
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-40,88},{-4,88},{-4,76},
          {6,76}},      color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-40,52},{-4,52},{-4,64},
          {6,64}},      color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{29,70},{60,
          70},{60,12},{-56,12},{-56,-31},{-90,-31}},             color={0,0,127}));
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-156,-58},{-156,-60},{-198,-60},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.inlet, Immissione_1.outlet) annotation (Line(
      points={{-136,-58},{-136,-60},{-116,-60},{-116,-26},{-106,-26}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet, sds17.inlet) annotation (Line(
      points={{-290,220},{-288,218},{-256,218}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.outlet, sds16.inlet) annotation (Line(
      points={{-236,218},{-198,218}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.outlet, sds11.outlet) annotation (Line(
      points={{-178,218},{-176,216},{-121,216},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=90000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete2i_2sources;