within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_PID_source2
  extends RG2i_PI_controller(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start={1,0},
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    p_ref(height=0*10^5, startTime=8000));

    parameter Types.MassFraction X_inj[nX] = {1, 0};
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
    height=0*25/3600,
    duration=300,
    offset=0*0.001,
    startTime=0*3600)                                                                                       annotation (
    Placement(visible = true, transformation(origin={-409,232},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    height=0*(-25/3600),
    duration=300,
    startTime=26*18000,
    offset=0)                                                                                               annotation (
    Placement(visible = true, transformation(origin={-407,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-348,240},{-328,260}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17e16(
    n=6,
    L=Data.PipelineData_2i.sds17.L + Data.PipelineData_2i.sds16.L,
    H=Data.PipelineData_2i.sds17.h + Data.PipelineData_2i.sds16.h,
    cm=Data.PipelineData_2i.sds17.cm,
    rhom=Data.PipelineData_2i.sds17.rhom,
    lambdam=Data.PipelineData_2i.sds17.lambdam,
    m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
    pin_start=Data.PipelineData_2i.sds17.pin_start,
    pout_start=Data.PipelineData_2i.sds16.pout_start,
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
        origin={-214,220})));
equation
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-327,250},{
          -302,250},{-302,238},{-306,238},{-306,225},{-308,225}},
                                             color={0,0,127}));
  connect(m_flow_H5.y, add1.u1) annotation (Line(points={{-396,268},{-386,268},{
          -386,270},{-372,270},{-372,256},{-350,256}}, color={0,0,127}));
  connect(m_flow_H1.y, add1.u2) annotation (Line(points={{-398,232},{-388,232},
          {-388,230},{-350,230},{-350,244}}, color={0,0,127}));
  connect(Immissione_2.outlet, sds17e16.inlet) annotation (Line(
      points={{-292,220},{-224,220}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17e16.outlet, sds13.inlet) annotation (Line(
      points={{-204,220},{-54,220},{-54,202},{14,202}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end RG2i_PID_source2;
