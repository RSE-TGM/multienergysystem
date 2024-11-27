within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4;
model Rete_Gas_2i_3sources_controlled
  extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources_controlled
                                         (break connect(GRM_7.inlet, sds8.outlet));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
    redeclare model Medium = Medium,
    p0=437100,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={460,196},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=60,
    height=0.09889,
    offset=0,
    startTime=61200)                                                                                        annotation (
    Placement(visible = true, transformation(origin={355,216},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=75600)                                                                                        annotation (
    Placement(visible = true, transformation(origin={349,260},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{408,232},{428,252}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
    L=100,
    H=0,
    redeclare model Gas = Medium,
    redeclare model Medium = Medium,
    X_start=X_start,
    Di=0.1325,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=nV)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={394,152})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo2(
    L=100,
    H=0,
    redeclare model Gas = Medium,
    redeclare model Medium = Medium,
    X_start=X_start,
    Di=0.1325,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=nV)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={282,222})));
equation
  connect(m_flow_H6.y,add2. u1) annotation (Line(points={{360,260},{396,260},{
          396,248},{406,248}}, color={0,0,127}));
  connect(m_flow_H4.y,add2. u2) annotation (Line(points={{366,216},{394,216},{
          394,236},{406,236}}, color={0,0,127}));
  connect(add2.y,Immissione_3. in_m_flow0) annotation (Line(points={{429,242},{
          438,242},{438,201},{454,201}}, color={0,0,127}));
  connect(raccordo1.outlet,Immissione_3. outlet) annotation (Line(
      points={{404,152},{484,152},{484,196},{470,196}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo1.inlet, sds8.outlet) annotation (Line(
      points={{384,152},{264,152},{264,196},{242,196},{242,186}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.outlet, GRM_7.inlet) annotation (Line(
      points={{282,232},{282,272},{242,272},{242,236}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.inlet, sds8.outlet) annotation (Line(
      points={{282,212},{282,192},{264,192},{264,196},{242,196},{242,186}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=90000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_3sources_controlled;
