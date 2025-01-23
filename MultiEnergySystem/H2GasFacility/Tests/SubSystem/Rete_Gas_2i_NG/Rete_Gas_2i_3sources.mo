within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_3sources
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends Rete_Gas_2i_2sources(FrictionFactor = 0.02);
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
    redeclare model Medium = Medium,
    p0=Data.PipelineData_2i.sds8.pout_start,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    m_flow0=0.1,
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={478,196},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=60,
    height=0.09889*0.5,
    offset=1e-4,
    startTime=61200)                                                                                        annotation (
    Placement(visible = true, transformation(origin={373,216},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=60,
    height=-0.09889*0.5,
    offset=0,
    startTime=75600)                                                                                        annotation (
    Placement(visible = true, transformation(origin={367,260},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{426,232},{446,252}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
    L=100,
    H=0,
    m_flow_start=0.0001,
    pin_start=Data.PipelineData_2i.sds8.pout_start,
    pout_start=Data.PipelineData_2i.sds8.pout_start,
    redeclare model Gas = Medium,
    redeclare model Medium = Medium,
    X_start=X_start,
    Di=0.1325,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=nV)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={320,188})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening2(
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
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={350,188})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure2(
    redeclare model Medium = Medium,
    p0=600000,
    T0=288.15,
    X0=X_start,
    R=0)                             annotation (Placement(transformation(extent={{388,178},{368,198}})));
  Modelica.Blocks.Sources.Ramp opening3(
    offset=0,
    duration=60,
    height=0.2,
    startTime=61200) annotation (Placement(visible=true, transformation(
        origin={331,160},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(m_flow_H6.y,add2. u1) annotation (Line(points={{378,260},{414,260},{
          414,248},{424,248}}, color={0,0,127}));
  connect(add2.y,Immissione_3. in_m_flow0) annotation (Line(points={{447,242},{
          456,242},{456,201},{472,201}}, color={0,0,127}));
  connect(raccordo1.outlet, sds8.outlet) annotation (Line(
      points={{310,188},{276,188},{276,186},{242,186}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H4.y, add2.u2) annotation (Line(points={{384,216},{398,216},{398,220},{410,220},{410,236},{424,236}}, color={0,0,127}));
  connect(valveLinearOpening2.outlet, raccordo1.inlet) annotation (Line(
      points={{344,188},{330,188}},
      color={182,109,49},
      thickness=0.5));
  connect(sourcePressure2.outlet, valveLinearOpening2.inlet) annotation (Line(
      points={{368,188},{356,188}},
      color={182,109,49},
      thickness=0.5));
  connect(opening3.y, valveLinearOpening2.opening) annotation (Line(points={{342,160},{350,160},{350,183.2}}, color={0,0,127}));
  annotation (experiment(
      StopTime=86400,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>The third injection source is introduced. This is the complete model. </p>
</html>"));
end Rete_Gas_2i_3sources;
