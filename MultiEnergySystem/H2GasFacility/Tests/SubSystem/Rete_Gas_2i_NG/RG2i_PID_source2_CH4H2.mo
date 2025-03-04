within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_PID_source2_CH4H2
  extends RG2i_PID_controller(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start = {1, 0},
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    valveLinearOpening(m_flow_nom=0.413, A_v=1.8*0.413/(sqrt(40.18*(60 - 4.93)*
          1e5))),
    const(k=5*10^5));

    parameter Types.MassFraction X_inj[nX] = {0, 1};
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
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-190,220})));
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
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-248,220})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    X0=X_inj,
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-302,220},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    offset=0.0001,
    height=25/3600,
    duration=300,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-409,232},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    height=-25/3600,
    duration=300,
    startTime=18000,
    offset=0)                                                                                               annotation (
    Placement(visible = true, transformation(origin={-407,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-348,240},{-328,260}})));
equation
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-398,232},{-350,232},{
          -350,244}},             color={0,0,127}));
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-327,250},{
          -302,250},{-302,238},{-306,238},{-306,225},{-308,225}},
                                             color={0,0,127}));
  connect(sds17.inlet,Immissione_2. outlet) annotation (Line(
      points={{-258,220},{-292,220}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.outlet,sds16. inlet) annotation (Line(
      points={{-238,220},{-200,220}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.outlet, sds11.outlet) annotation (Line(
      points={{-180,220},{-120,220},{-120,210},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H5.y, add1.u1) annotation (Line(points={{-396,268},{-386,268},{
          -386,270},{-372,270},{-372,256},{-350,256}}, color={0,0,127}));
  annotation (experiment(
      StopTime=28800,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_PID_source2_CH4H2;
