within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_w3sources
  extends Rete_Gas_2i_w2sources(break connect(GRM_7.inlet, sds8.outlet));
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
    redeclare model Medium = Medium,
    p0=437100,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={404,234},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=60,
    height=0.09125,
    offset=0,
    startTime=61200)                                                                                        annotation (
    Placement(visible = true, transformation(origin={299,254},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=360,
    height=-0.09125,
    offset=0,
    startTime=75600)                                                                                        annotation (
    Placement(visible = true, transformation(origin={293,298},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{352,270},{372,290}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds5(
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
    n=2)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={274,206})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds18(
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
    n=2)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={338,190})));
equation
  connect(m_flow_H6.y, add2.u1) annotation (Line(points={{304,298},{340,298},{
          340,286},{350,286}}, color={0,0,127}));
  connect(m_flow_H4.y, add2.u2) annotation (Line(points={{310,254},{338,254},{
          338,274},{350,274}}, color={0,0,127}));
  connect(add2.y, Immissione_3.in_m_flow0) annotation (Line(points={{373,280},{
          382,280},{382,239},{398,239}}, color={0,0,127}));
  connect(sds5.inlet, sds8.outlet) annotation (Line(
      points={{274,196},{274,186},{242,186}},
      color={182,109,49},
      thickness=0.5));
  connect(sds5.outlet, GRM_7.inlet) annotation (Line(
      points={{274,216},{274,236},{242,236}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.inlet, sds8.outlet) annotation (Line(
      points={{328,190},{302,190},{302,188},{274,188},{274,186},{242,186}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.outlet, Immissione_3.outlet) annotation (Line(
      points={{348,190},{428,190},{428,234},{414,234}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=86000,
      Interval=10,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_w3sources;
