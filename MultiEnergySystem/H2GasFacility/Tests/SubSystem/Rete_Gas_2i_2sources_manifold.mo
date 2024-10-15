within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_2sources_manifold
  extends Rete_Gas_2i_nosources_ok              (constantFrictionFactor = false, FrictionFactor = 0.005,
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
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction3
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-198,16})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction1
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-184,-60})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction2
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={108,-26})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction4
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={132,-84})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction5
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-98,138})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction6
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-128,184})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction7
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-120,230})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Junction junction8
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,212})));
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
  connect(junction3.fluidPortInlet, s1.outlet) annotation (Line(
      points={{-188,16},{-188,20},{-182,20},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(junction3.fluidPortOutlet1, sds1.inlet) annotation (Line(
      points={{-198,26},{-198,36}},
      color={182,109,49},
      thickness=0.5));
  connect(junction3.fluidPortOutlet, s2.inlet) annotation (Line(
      points={{-198,6},{-198,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(junction1.fluidPortOutlet1, s4.inlet) annotation (Line(
      points={{-194,-60},{-192,-60},{-192,-68},{-200,-68},{-200,-72}},
      color={182,109,49},
      thickness=0.5));
  connect(junction1.fluidPortInlet, s2.outlet) annotation (Line(
      points={{-184,-50},{-184,-44},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(junction1.fluidPortOutlet, s3.inlet) annotation (Line(
      points={{-174,-60},{-172,-58},{-156,-58}},
      color={182,109,49},
      thickness=0.5));
  connect(junction2.fluidPortOutlet1, s31.inlet) annotation (Line(
      points={{108,-36},{108,-68},{110,-68},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(junction2.fluidPortInlet, s18.outlet) annotation (Line(
      points={{98,-26},{88,-26},{88,-6},{78,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(junction2.fluidPortOutlet, s19.inlet) annotation (Line(
      points={{108,-16},{108,-8},{146,-8},{146,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(junction4.fluidPortOutlet, s21.inlet) annotation (Line(
      points={{142,-84},{144,-82},{162,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(junction4.fluidPortOutlet1, s22.inlet) annotation (Line(
      points={{122,-84},{122,-92},{146,-92}},
      color={182,109,49},
      thickness=0.5));
  connect(junction4.fluidPortInlet, s20.outlet) annotation (Line(
      points={{132,-74},{146,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(junction5.fluidPortInlet, sds6.outlet) annotation (Line(
      points={{-108,138},{-108,140},{-116,140},{-116,130},{-122,130}},
      color={182,109,49},
      thickness=0.5));
  connect(junction5.fluidPortOutlet, sds9.inlet) annotation (Line(
      points={{-98,148},{-96,152},{-122,152}},
      color={182,109,49},
      thickness=0.5));
  connect(junction5.fluidPortOutlet1, sds7.inlet) annotation (Line(
      points={{-98,128},{-100,128},{-100,120},{144,120},{144,140},{152,140}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.inlet, junction6.fluidPortOutlet1) annotation (Line(
      points={{-121,192},{-120,192},{-120,184},{-118,184}},
      color={182,109,49},
      thickness=0.5));
  connect(junction6.fluidPortInlet, sds9.outlet) annotation (Line(
      points={{-128,174},{-128,172},{-122,172}},
      color={182,109,49},
      thickness=0.5));
  connect(junction6.fluidPortOutlet, sds10.inlet) annotation (Line(
      points={{-138,184},{-144,184},{-144,176}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.outlet, junction7.fluidPortInlet) annotation (Line(
      points={{-121,210},{-120,212},{-120,220}},
      color={182,109,49},
      thickness=0.5));
  connect(junction7.fluidPortOutlet, sds16.inlet) annotation (Line(
      points={{-130,230},{-168,230},{-168,218},{-178,218}},
      color={182,109,49},
      thickness=0.5));
  connect(junction7.fluidPortOutlet1, sds12.inlet) annotation (Line(
      points={{-110,230},{-28,230},{-28,202},{-18,202}},
      color={182,109,49},
      thickness=0.5));
  connect(junction8.fluidPortInlet, sds13.outlet) annotation (Line(
      points={{40,212},{34,212},{34,202}},
      color={182,109,49},
      thickness=0.5));
  connect(junction8.fluidPortOutlet, sds15.inlet) annotation (Line(
      points={{50,222},{46,222},{46,232}},
      color={182,109,49},
      thickness=0.5));
  connect(junction8.fluidPortOutlet1, sds14.inlet) annotation (Line(
      points={{50,202},{52,202},{52,208},{60,208},{60,216}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Rete_Gas_2i_2sources_manifold;
