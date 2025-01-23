within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_2sources
  extends Rete_Gas_2i_1sources;
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
        origin={-166,220})));
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
        origin={-224,220})));
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
    offset=0.00001*0,
    duration=60,
    height=0.09889,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-385,232},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-383,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-324,240},{-304,260}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure1(
    redeclare model Medium = Medium,
    p0=600000,
    T0=288.15,
    X0=X_start,
    R=0)                             annotation (Placement(transformation(extent={{-288,190},{-268,210}})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening1(
    redeclare model Medium = Medium,
    dp_nom=150000,
    pin_start=600000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    minimumOpening=0.0001,
    m_flow_nom=0.001,
    A_v=1.53e-6,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-254,200})));
  Modelica.Blocks.Sources.Ramp opening(
    offset=0,
    duration=60,
    height=0.2,
    startTime=32400) annotation (Placement(visible=true, transformation(
        origin={-281,170},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-372,268},{-336,268},
          {-336,256},{-326,256}}, color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-374,232},{-326,232},{-326,244}},
                                  color={0,0,127}));
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-303,250},
          {-278,250},{-278,238},{-282,238},{-282,225},{-284,225}},
                                             color={0,0,127}));
  connect(valveLinearOpening1.inlet, sourcePressure1.outlet) annotation (Line(
      points={{-260,200},{-268,200}},
      color={182,109,49},
      thickness=0.5));
  connect(opening.y, valveLinearOpening1.opening) annotation (Line(points={{-270,170},{-254,170},{-254,195.2}}, color={0,0,127}));
  connect(sds16.outlet, sds12.inlet) annotation (Line(
      points={{-156,220},{-148,220},{-148,218},{-32,218},{-32,202},{-18,202}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.outlet, sds16.inlet) annotation (Line(
      points={{-214,220},{-176,220}},
      color={182,109,49},
      thickness=0.5));
  connect(valveLinearOpening1.outlet, sds17.inlet) annotation (Line(
      points={{-248,200},{-240,200},{-240,220},{-234,220}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=54000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>The 2 injedction sources are introduced in the model.</p>
</html>"));
end Rete_Gas_2i_2sources;
