within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_source3 "immissione 3"
  extends H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG.Rete_Gas_2i_pipes_users(
  constantFrictionFactor = false,
  massFractionDynamicBalance = false,
  valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5))),
  X_start = {1, 0});
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
    redeclare model Medium = Medium,
    p0=Data.PipelineData_2i.sds8.pout_start,
    G=1e-8,
    T0=288.15,
    X0={0,1},
    m_flow0=0.1,
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={460,206},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=300,
    height=25/3600,
    offset=1e-3,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={355,226},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=300,
    height=-25/3600,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={349,270},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{408,242},{428,262}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
    L=100,
    H=0,
    m_flow_start=1e-3,
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
        origin={302,198})));
equation
  connect(m_flow_H6.y,add2. u1) annotation (Line(points={{360,270},{396,270},{
          396,258},{406,258}}, color={0,0,127}));
  connect(add2.y,Immissione_3. in_m_flow0) annotation (Line(points={{429,252},{
          438,252},{438,211},{454,211}}, color={0,0,127}));
  connect(raccordo1.outlet, sds8.outlet) annotation (Line(
      points={{292,198},{260,198},{260,186},{242,186}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H4.y,add2. u2) annotation (Line(points={{366,226},{380,226},{
          380,230},{392,230},{392,246},{406,246}},                                                                     color={0,0,127}));
  connect(Immissione_3.outlet,raccordo1. inlet) annotation (Line(
      points={{470,206},{480,206},{480,190},{326,190},{326,198},{312,198}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=28000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_source3;
