within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_2sources_ok
  extends Rete_Gas_2i_nosources_ok              (constantFrictionFactor = false, FrictionFactor = 0.003,
    s16(
      m_flow_start=0.26601,
      pin_start=461800,
      pout_start=461800,
      n=3),
    s9(
      H=-1,
      m_flow_start=0.26601,
      pin_start=467600,
      pout_start=467100,
       n=1),
    sds8(
      pin_start=464900,
      pout_start=437100,
         n=135),
    sds7(
      pin_start=467300,
      pout_start=464900,
      n=21),
    sds6(
      m_flow_start=0.14706,
      pin_start=487000,
      pout_start=467300,
         n=81),
    sds1(
      m_flow_start=0.14706,
      pin_start=491600,
      pout_start=488800,
      n=31),
    sds3(
      m_flow_start=0.14706,
      pin_start=488700,
      pout_start=488100,
         n=7),
    sds4(
      m_flow_start=0.14706,
      pin_start=488100,
      pout_start=487000,
         n=5),
    sds12(
      m_flow_start=0.02711,
      pin_start=467100,
      pout_start=466900,
          n=9),
    sds15(
      pin_start=466700,
      pout_start=466600,
          n=11),
    s2(
      H=-42,
      m_flow_start=0.26601,
      pin_start=491600,
      pout_start=482100,
      n=33),
    s4(
      H=-42,
      m_flow_start=0.26601,
      pin_start=482100,
      pout_start=468800,
       n=17),
    s11(
      H=-31,
      m_flow_start=0.26601,
      pin_start=467100,
      pout_start=465600,
        n=5),
    s14(
      H=-15,
      m_flow_start=0.26601,
      pin_start=463600,
      pout_start=461800,
        n=7),
    s36_Stadio(
      pin_start=459100,
      pout_start=459100,
               n=13),
    s19(
      H=-18,
      m_flow_start=0.23194,
      pin_start=459100,
      pout_start=457200,
        n=5),
    s18(
      H=-1,
      m_flow_start=0.26601,
      pin_start=461800,
      pout_start=459100,
        n=9),
    sds13(
      m_flow_start=0.02711,
      pin_start=466900,
      pout_start=466700),
    sds11(
      m_flow_start=0.02711,
      pin_start=467200,
      pout_start=467100),
    sds9(
      m_flow_start=0.04837,
      pin_start=467300,
      pout_start=467200),
    sds2(
      m_flow_start=0.14706,
      pin_start=488800,
      pout_start=488700),
    s20(
      H=14,
      m_flow_start=0.23194,
      pin_start=457200,
      pout_start=457100),
    s12(
      H=11,
      m_flow_start=0.26601,
      pin_start=465600,
      pout_start=463600),
    s8(
      H=-11,
      m_flow_start=0.26601,
      pin_start=468800,
      pout_start=467600),
    s1(pin_start=493000, pout_start=491600),
    sds10(pin_start=467200, pout_start=467200),
    sds14(pin_start=466700, pout_start=466700),
    s31(pin_start=459100, pout_start=459100),
    s21(pin_start=457100, pout_start=456900),
    s22(
      H=-3,
      pin_start=457100,
      pout_start=457100),
    s24(
      H=2,
      pin_start=457100,
      pout_start=457000),
    s26(pin_start=457000, pout_start=456700),
    s28(pin_start=456700, pout_start=455000),
    s30(pin_start=455000, pout_start=454700));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=194.511,
    pin_start=467100,
    pout_start=467100,
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
    pin_start=467100,
    pout_start=467100,
    n=11,
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
    pin_start=482100,
    pout_start=482100,
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
equation
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-394,268},{-358,268},{
          -358,256},{-348,256}},  color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-388,224},{-360,224},{
          -360,244},{-348,244}},  color={0,0,127}));
  connect(add1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-325,250},{
          -300,250},{-300,238},{-304,238},{-304,225},{-306,225}},
                                             color={0,0,127}));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-178,218},{-176,216},{-121,216},{-121,210}},
      color={182,109,49},
      thickness=0.5));
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
  connect(s3.inlet, s2.outlet) annotation (Line(
      points={{-156,-58},{-156,-60},{-198,-60},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Rete_Gas_2i_2sources_ok;
