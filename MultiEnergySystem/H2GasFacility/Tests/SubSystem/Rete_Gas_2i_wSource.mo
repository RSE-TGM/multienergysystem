within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_wSource
  extends Rete_Gas_2i_nosources;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=194.511,
     redeclare model
      Medium =       Medium,
    H=0,
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
     redeclare model
      Medium =       Medium,
    H=0,
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
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-290,230},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=50,
    height=0.1,
    offset=0,
    startTime=100)                                                                                          annotation (
    Placement(visible = true, transformation(origin={-321,248},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
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
        origin={-156,-64})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-96,-46},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=50,
    height=0.1,
    offset=0,
    startTime=100)                                                                                          annotation (
    Placement(visible = true, transformation(origin={-81,-18},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
equation
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-168,228},{-121,228},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.inlet,sds16. outlet) annotation (Line(
      points={{-226,228},{-188,228}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet,sds17. outlet) annotation (Line(
      points={{-280,230},{-278,228},{-246,228}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-310,
          248},{-310,242},{-296,242},{-296,235}},
                                             color={0,0,127}));
  connect(s3.outlet,Immissione_1. outlet) annotation (Line(
      points={{-146,-64},{-120,-64},{-120,-46},{-106,-46}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_1.in_m_flow0,m_flow_H2. y) annotation (Line(points={{-90,-51},
          {-92,-51},{-92,-64},{-64,-64},{-64,-18},{-70,-18}},   color={0,0,127}));
  connect(s3.inlet, s2.inlet) annotation (Line(
      points={{-166,-64},{-198,-64},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
end Rete_Gas_2i_wSource;
