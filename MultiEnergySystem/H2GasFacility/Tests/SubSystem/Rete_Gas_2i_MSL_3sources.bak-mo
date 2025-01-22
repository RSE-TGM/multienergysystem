within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_MSL_3sources
  extends Rete_Gas_2i_MSL_2sources(
                                   break connect(sds8.port_b, GRM_7.ports[1]),
    system(
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial),
    Immissione_1(T(displayUnit="K")),
    s3(T_start(displayUnit="K"), nNodes=10),
    m_flow_H2(offset=0.000001),
    m_flow_H1(offset=0.000001),
    GRM_7(nPorts=1));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={145,82})));
  Modelica.Fluid.Sources.MassFlowSource_T Immissione_3(
    use_m_flow_in=true,
    redeclare package Medium = Medium,
    m_flow=-0.098685,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={186,104})));
  Modelica.Blocks.Sources.Ramp m_flow_H4(
    duration=60,
    height=0.09889,
    offset=0.000001,
    startTime=61200)                                                                                        annotation (
    Placement(visible = true, transformation(origin={119.5,130},   extent={{-3.5,-4},
            {3.5,4}},                                                                               rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H6(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=75600)                                                                                        annotation (
    Placement(visible = true, transformation(origin={120.5,146},   extent={{-4.5,-4},
            {4.5,4}},                                                                               rotation=0)));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{142,132},{154,144}})));
  Modelica.Fluid.Pipes.DynamicPipe raccordo2(
    redeclare package Medium = Medium,
    length=10,
    diameter=Data.PipelineData_2i.sds8.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds8.h,
    p_a_start=Data.PipelineData_2i.sds8.pin_start,
    p_b_start=Data.PipelineData_2i.sds8.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds8.m_flow_start,
    nNodes=nV,
    modelStructure=modelStruct) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={145,101})));
  Modelica.Fluid.Pipes.DynamicPipe raccordo1(
    redeclare package Medium = Medium,
    length=10,
    diameter=Data.PipelineData_2i.sds8.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds8.h,
    p_a_start=Data.PipelineData_2i.sds8.pin_start,
    p_b_start=Data.PipelineData_2i.sds8.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds8.m_flow_start,
    nNodes=nV,
    modelStructure=modelStruct) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={175,81})));
equation
  connect(teeJunctionIdeal5.port_1, sds8.port_b) annotation (Line(points={{145,
          77},{144,77},{144,70},{134,70},{134,82},{124,82},{124,79},{123,79}},
        color={0,127,255}));
  connect(m_flow_H6.y,add2. u1) annotation (Line(points={{125.45,146},{134,146},
          {134,141.6},{140.8,141.6}},
                               color={0,0,127}));
  connect(m_flow_H4.y,add2. u2) annotation (Line(points={{123.35,130},{134,130},
          {134,134.4},{140.8,134.4}},
                               color={0,0,127}));
  connect(add2.y, Immissione_3.m_flow_in) annotation (Line(points={{154.6,138},
          {190,138},{190,109}}, color={0,0,127}));
  connect(raccordo2.port_a, teeJunctionIdeal5.port_2)
    annotation (Line(points={{145,95},{145,87}}, color={0,127,255}));
  connect(raccordo2.port_b, GRM_7.ports[1]) annotation (Line(points={{145,107},
          {145,112},{114,112},{114,87},{124,87}}, color={0,127,255}));
  connect(teeJunctionIdeal5.port_3, raccordo1.port_b)
    annotation (Line(points={{150,82},{152,81},{169,81}}, color={0,127,255}));
  connect(raccordo1.port_a, Immissione_3.ports[1])
    annotation (Line(points={{181,81},{186,81},{186,99}}, color={0,127,255}));
  annotation (experiment(
      StopTime=90000,
      Interval=1,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_MSL_3sources;
