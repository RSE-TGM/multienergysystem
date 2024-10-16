within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_w2sources
  extends Rete_Gas_2i_nosources(s1(n=10), s2(n=8),constantFrictionFactor = false,
    REMI(R=0),
    sds1(pin_start=490000),
    sds8(n=25),
    sds7(n=20),
    sds6(n=15));

  // extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=194.511,
     redeclare model Medium =
                     Medium,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-178,228})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
    L=1077.595,
     redeclare model Medium =
                     Medium,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=5)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-236,228})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-290,230},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=60,
    height=0.09125,
    offset=0,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-395,250},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
    redeclare model Medium = Medium,
    L=100.058,
    X_start=X_start,
    Di=1.325,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-156,-60})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-112,-60},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=60,
    height=0.09125,
    offset=0,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-63,40},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=60,
    height=-0.09125,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-63,76},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-4,48},{16,68}})));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=360,
    height=-0.09125,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-401,294},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-342,266},{-322,286}})));
equation
  connect(sds17.inlet,sds16. outlet) annotation (Line(
      points={{-226,228},{-188,228}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet,sds17. outlet) annotation (Line(
      points={{-280,230},{-278,228},{-246,228}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-168,228},{-121,228},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.inlet, s2.inlet) annotation (Line(
      points={{-166,-60},{-198,-60},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.outlet, Immissione_1.outlet) annotation (Line(
      points={{-146,-60},{-122,-60}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H3.y, add.u1) annotation (Line(points={{-52,76},{-16,76},{-16,
          64},{-6,64}}, color={0,0,127}));
  connect(m_flow_H2.y, add.u2) annotation (Line(points={{-52,40},{-16,40},{-16,
          52},{-6,52}}, color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{17,58},{42,
          58},{42,18},{-80,18},{-80,-82},{-106,-82},{-106,-65}}, color={0,0,127}));
  connect(m_flow_H5.y, add1.u1) annotation (Line(points={{-390,294},{-354,294},
          {-354,282},{-344,282}}, color={0,0,127}));
  connect(m_flow_H1.y, add1.u2) annotation (Line(points={{-384,250},{-356,250},
          {-356,270},{-344,270}}, color={0,0,127}));
  connect(add1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-321,276},
          {-312,276},{-312,235},{-296,235}}, color={0,0,127}));
  annotation (experiment(
      StopTime=100,
      Interval=10,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_w2sources;
