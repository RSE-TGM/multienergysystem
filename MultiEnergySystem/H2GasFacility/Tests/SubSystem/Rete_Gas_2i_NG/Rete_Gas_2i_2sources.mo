within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_2sources
  extends Rete_Gas_2i_pipes_users;
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    offset=0.001,
    duration=60,
    height=0.09889,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-29,50},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-29,86},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{30,58},{50,78}})));
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
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-146,-56})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    m_flow0=0.0001,
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-96,-24},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    n=nV,
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
        rotation=180,
        origin={-166,218})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
    n=nV,
    L=Data.PipelineData_2i.sds17.L,
    H=Data.PipelineData_2i.sds17.h,
    cm=Data.PipelineData_2i.sds17.cm,
    rhom=Data.PipelineData_2i.sds17.rhom,
    lambdam=Data.PipelineData_2i.sds17.lambdam,
    m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
    pin_start=Data.PipelineData_2i.sds17.pin_start,
    pout_start=Data.PipelineData_2i.sds17.pout_start,
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
        rotation=180,
        origin={-224,218})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-278,220},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    offset=0.00001,
    duration=60,
    height=0.09889,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-377,224},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-383,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-324,240},{-304,260}})));
equation
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-18,86},{18,86},{18,74},
          {28,74}},     color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-18,50},{18,50},{18,62},
          {28,62}},     color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{51,68},{60,
          68},{60,12},{-52,12},{-52,-4},{-80,-4},{-80,-29},{-90,-29}},
                                                                 color={0,0,127}));
  connect(s3.inlet, s2.outlet) annotation (Line(
      points={{-156,-56},{-198,-56},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.outlet,Immissione_1. outlet) annotation (Line(
      points={{-136,-56},{-136,-58},{-116,-58},{-116,-24},{-106,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-372,268},{-336,268},
          {-336,256},{-326,256}}, color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-366,224},{-338,224},
          {-338,244},{-326,244}}, color={0,0,127}));
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-303,250},
          {-278,250},{-278,238},{-282,238},{-282,225},{-284,225}},
                                             color={0,0,127}));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-156,218},{-152,216},{-121,216},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.inlet,sds16. outlet) annotation (Line(
      points={{-214,218},{-176,218}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet,sds17. outlet) annotation (Line(
      points={{-268,220},{-266,218},{-234,218}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=54000, __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>The 2 injedction sources are introduced in the model.</p>
</html>"));
end Rete_Gas_2i_2sources;
