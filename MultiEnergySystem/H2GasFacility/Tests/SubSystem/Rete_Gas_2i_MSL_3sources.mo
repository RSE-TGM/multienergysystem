within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_MSL_3sources
  extends Rete_Gas_2i_MSL_2sources(break connect(sds8.port_b, GRM_7.ports[1]),
      GRM_7(nPorts=1));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={145,82})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_8(
    use_m_flow_in=true,
    nPorts=1,
    redeclare package Medium = Medium,
    m_flow=-0.098685,
    T=288.15,
    X=X_start)                                               annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={158,90})));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=60,
    height=0.09889,
    offset=0,
    startTime=61200)                                                                                        annotation (
    Placement(visible = true, transformation(origin={119.5,130},   extent={{-3.5,-4},
            {3.5,4}},                                                                               rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=360,
    height=-0.09889,
    offset=0,
    startTime=75600)                                                                                        annotation (
    Placement(visible = true, transformation(origin={120.5,144},   extent={{-4.5,-4},
            {4.5,4}},                                                                               rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{142,132},{154,144}})));
equation
  connect(teeJunctionIdeal5.port_2, GRM_7.ports[1]) annotation (Line(points={{
          145,87},{145,102},{116,102},{116,84},{124,84},{124,87}}, color={0,127,
          255}));
  connect(teeJunctionIdeal5.port_1, sds8.port_b) annotation (Line(points={{145,
          77},{144,77},{144,70},{134,70},{134,82},{124,82},{124,79},{123,79}},
        color={0,127,255}));
  connect(GRM_8.ports[1], teeJunctionIdeal5.port_3) annotation (Line(points={{
          158,85},{158,86},{154,86},{154,82},{150,82}}, color={0,127,255}));
  connect(m_flow_H6.y,add2. u1) annotation (Line(points={{125.45,144},{134,144},
          {134,141.6},{140.8,141.6}},
                               color={0,0,127}));
  connect(m_flow_H4.y,add2. u2) annotation (Line(points={{123.35,130},{134,130},
          {134,134.4},{140.8,134.4}},
                               color={0,0,127}));
  connect(add2.y, GRM_8.m_flow_in) annotation (Line(points={{154.6,138},{162,
          138},{162,95}}, color={0,0,127}));
end Rete_Gas_2i_MSL_3sources;
