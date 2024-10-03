within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_2sources_manifold
  extends Rete_Gas_2i_nosources_pipe_orientation(constantFrictionFactor = false, FrictionFactor = 0.005,
    sds7(n=10),
    sds8(n=20),
    sds15(n=10),
    sds1(n=10),
    sds6(n=15),
    break connect(s2.inlet, s1.outlet),
    break connect(sds1.inlet, s1.outlet),
    break connect(sds6.outlet, sds7.inlet),
    break connect(sds9.inlet, sds6.outlet),
    break connect(sds10.inlet, sds9.outlet),
    break connect(sds11.inlet, sds9.outlet),
    break connect(sds11.outlet, sds12.inlet),
    break connect(sds13.outlet, sds14.inlet),
    break connect(sds15.inlet, sds14.inlet),
    break connect(s4.inlet, s2.outlet),
    break connect(s19.inlet, s18.outlet),
    break connect(s18.outlet, s31.inlet),
    break connect(s22.inlet, s21.inlet),
    break connect(s20.outlet, s21.inlet));
    extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=194.511,
    redeclare model Medium = Medium,
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
        origin={-188,218})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
    L=1077.595,
    n=3,
    redeclare model Medium = Medium,
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
    height=0.09125,
    offset=0,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-399,224},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=360,
    height=-0.09125,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-405,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-346,240},{-326,260}})));
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
    height=0.09125,
    offset=0,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-51,52},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=60,
    height=-0.09125,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-51,88},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{8,60},{28,80}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O manifold2I1O
    annotation (Placement(transformation(extent={{-214,0},{-194,20}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-94,136})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O2
    annotation (Placement(transformation(extent={{-98,174},{-78,194}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-132,226})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={36,220})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-186,-60})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={114,-16})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I1O
    manifold2I1O7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={180,-46})));
equation
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-394,268},{-358,268},{
          -358,256},{-348,256}},  color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-388,224},{-360,224},{
          -360,244},{-348,244}},  color={0,0,127}));
  connect(add1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-325,250},{
          -300,250},{-300,238},{-304,238},{-304,225},{-306,225}},
                                             color={0,0,127}));
  connect(sds17.inlet, sds16.outlet) annotation (Line(
      points={{-236,218},{-198,218}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet, sds17.outlet) annotation (Line(
      points={{-290,220},{-288,218},{-256,218}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.outlet,Immissione_1. outlet) annotation (Line(
      points={{-136,-58},{-136,-60},{-116,-60},{-116,-26},{-106,-26}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-40,88},{-4,88},{-4,76},
          {6,76}},      color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-40,52},{-4,52},{-4,64},
          {6,64}},      color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{29,70},{36,70},
          {36,12},{-80,12},{-80,-31},{-90,-31}},                 color={0,0,127}));
  connect(manifold2I1O.outlet, s1.outlet) annotation (Line(
      points={{-196,10},{-196,12},{-192,12},{-192,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O.inlet1, sds1.inlet) annotation (Line(
      points={{-212,14},{-212,28},{-198,28},{-198,36}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O.inlet2, s2.inlet) annotation (Line(
      points={{-212,6},{-212,-12},{-198,-12},{-198,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(sds6.outlet, manifold2I1O1.outlet) annotation (Line(
      points={{-122,130},{-120,128},{-94,128}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O1.inlet2, sds9.inlet) annotation (Line(
      points={{-98,144},{-112,144},{-112,152},{-122,152}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O1.inlet1, sds7.inlet) annotation (Line(
      points={{-90,144},{140,144},{140,140},{152,140}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.inlet, manifold2I1O2.inlet2) annotation (Line(
      points={{-144,176},{-144,180},{-96,180}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O2.outlet, sds9.outlet) annotation (Line(
      points={{-80,184},{-72,184},{-72,172},{-122,172}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.inlet, manifold2I1O2.inlet1) annotation (Line(
      points={{-121,192},{-120,188},{-96,188}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O3.outlet, sds11.outlet) annotation (Line(
      points={{-132,218},{-132,210},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.inlet, manifold2I1O3.inlet2) annotation (Line(
      points={{-178,218},{-152,218},{-152,244},{-136,244},{-136,234}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O3.inlet1, sds12.inlet) annotation (Line(
      points={{-128,234},{-128,244},{-28,244},{-28,202},{-18,202}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O4.outlet, sds13.outlet) annotation (Line(
      points={{28,220},{28,208},{34,208},{34,202}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O4.inlet2, sds15.inlet) annotation (Line(
      points={{44,224},{46,224},{46,232}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O4.inlet1, sds14.inlet) annotation (Line(
      points={{44,216},{60,216}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O5.outlet, s2.outlet) annotation (Line(
      points={{-186,-52},{-192,-52},{-192,-44},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.inlet, manifold2I1O5.inlet1) annotation (Line(
      points={{-200,-72},{-200,-68},{-190,-68}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O5.inlet2, s3.inlet) annotation (Line(
      points={{-182,-68},{-184,-68},{-184,-80},{-164,-80},{-164,-58},{-156,-58}},

      color={182,109,49},
      thickness=0.5));
  connect(s18.outlet, manifold2I1O6.outlet) annotation (Line(
      points={{78,-6},{92,-6},{92,-16},{106,-16}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O6.inlet1, s31.inlet) annotation (Line(
      points={{122,-20},{122,-68},{110,-68},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O6.inlet2, s19.inlet) annotation (Line(
      points={{122,-12},{146,-12},{146,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I1O7.outlet, s20.outlet) annotation (Line(
      points={{180,-38},{180,-28},{158,-28},{158,-82},{146,-82},{146,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.inlet, manifold2I1O7.inlet2) annotation (Line(
      points={{146,-92},{146,-88},{128,-88},{128,-120},{192,-120},{192,-64},{
          184,-64},{184,-54}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.inlet, manifold2I1O7.inlet1) annotation (Line(
      points={{162,-82},{160,-82},{160,-64},{176,-64},{176,-54}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Rete_Gas_2i_2sources_manifold;
