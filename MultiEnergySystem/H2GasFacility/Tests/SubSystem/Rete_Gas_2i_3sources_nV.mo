within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_3sources_nV
  extends Rete_Gas_2i_2sources_nV(break connect(GRM_7.inlet, sds8.outlet));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
    redeclare model Medium = Medium,
    p0=437100,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={422,202},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=60,
    height=0.09125,
    offset=0,
    startTime=61200)                                                                                        annotation (
    Placement(visible = true, transformation(origin={317,222},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=360,
    height=-0.09125,
    offset=0,
    startTime=75600)                                                                                        annotation (
    Placement(visible = true, transformation(origin={311,266},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{370,238},{390,258}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
    L=100,
    H=0,
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
        origin={356,158})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo2(
    L=100,
    H=0,
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
        origin={272,220})));
equation
  connect(m_flow_H6.y,add2. u1) annotation (Line(points={{322,266},{358,266},{
          358,254},{368,254}}, color={0,0,127}));
  connect(m_flow_H4.y,add2. u2) annotation (Line(points={{328,222},{356,222},{
          356,242},{368,242}}, color={0,0,127}));
  connect(add2.y,Immissione_3. in_m_flow0) annotation (Line(points={{391,248},{
          400,248},{400,207},{416,207}}, color={0,0,127}));
  connect(raccordo1.outlet,Immissione_3. outlet) annotation (Line(
      points={{366,158},{446,158},{446,202},{432,202}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_7.inlet, raccordo2.outlet) annotation (Line(
      points={{242,236},{242,230},{272,230}},
      color={182,109,49},
      thickness=0.5));
  connect(sds8.outlet, raccordo2.inlet) annotation (Line(
      points={{242,186},{242,204},{272,204},{272,210}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo1.inlet, sds8.outlet) annotation (Line(
      points={{346,158},{264,158},{264,204},{242,204},{242,186}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_3sources_nV;
