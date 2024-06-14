within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseII_MSL
  "PaperCaseII implemented using the Modelica Standard Library"
  replaceable package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4 constrainedby
    Modelica.Media.Interfaces.PartialMedium;

   parameter Types.MassFraction X_start[1]= Medium.X_default;

  Modelica.Fluid.Pipes.DynamicPipe pipe1(
    redeclare package Medium = Medium,
    length=50,
    diameter=0.16,
    roughness=1e-08,
    p_a_start=7500,
    p_b_start=6608,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.266667,
    nNodes=3)              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,49})));
  Modelica.Fluid.Pipes.DynamicPipe pipe2(
    redeclare package Medium = Medium,
    length=500,
    diameter=0.16,
    roughness=1e-08,
    p_a_start=6608,
    p_b_start=4668,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.124954,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,19})));
  Modelica.Fluid.Pipes.DynamicPipe pipe3(
    redeclare package Medium = Medium,
    length=500,
    diameter=0.11,
    roughness=1e-08,
    p_a_start=6608,
    p_b_start=4694,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.045847,
    nNodes=3)
    annotation (Placement(transformation(extent={{3,27},{15,39}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe4(
    redeclare package Medium = Medium,
    length=500,
    diameter=0.11,
    roughness=1e-08,
    p_a_start=6608,
    p_b_start=4694,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.052255,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-46,33})));
  Modelica.Fluid.Pipes.DynamicPipe pipe5(
    redeclare package Medium = Medium,
    length=600,
    diameter=0.11,
    roughness=1e-08,
    p_a_start=4756.87,
    p_b_start=3840,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.027762,
    nNodes=3)
    annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe6(
    redeclare package Medium = Medium,
    length=600,
    diameter=0.11,
    roughness=1e-08,
    p_a_start=4668,
    p_b_start=3930,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.02609,
    nNodes=3)
    annotation (Placement(transformation(extent={{7,-6},{19,6}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe7(
    redeclare package Medium = Medium,
    length=500,
    diameter=0.11,
    roughness=1e-08,
    p_a_start=4668,
    p_b_start=3739,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.032768,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,-27})));
  Modelica.Fluid.Pipes.DynamicPipe pipe8(
    redeclare package Medium = Medium,
    length=600,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=4145,
    p_b_start=3840,
    T_start=Pipe.pipe8.Tin_start,
    X_start=X_start,
    m_flow_start=0.006977,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-66,10})));
  Modelica.Fluid.Pipes.DynamicPipe pipe9(
    redeclare package Medium = Medium,
    length=600,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=4694,
    p_b_start=3930,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.011125,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={27,12})));
  Modelica.Fluid.Pipes.DynamicPipe pipe10(
    redeclare package Medium = Medium,
    length=780,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=3840,
    p_b_start=3739,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.00335,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-66,-33})));
  Modelica.Fluid.Pipes.DynamicPipe pipe11(
    redeclare package Medium = Medium,
    length=780,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=3930,
    p_b_start=3739,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.004715,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={27,-40})));
  Modelica.Fluid.Pipes.DynamicPipe pipe12(
    redeclare package Medium = Medium,
    length=200,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=3930,
    p_b_start=2815,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.023889,
    nNodes=3)
    annotation (Placement(transformation(extent={{42,-6},{54,6}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe13(
    redeclare package Medium = Medium,
    length=200,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=2815,
    p_b_start=2424,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.014444,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={83,0})));
  Modelica.Fluid.Pipes.DynamicPipe pipe14(
    redeclare package Medium = Medium,
    length=200,
    diameter=0.08,
    roughness=1e-08,
    p_a_start=2414,
    p_b_start=2342,
    T_start=287.15,
    X_start=X_start,
    m_flow_start=0.006111,
    nNodes=3)
    annotation (Placement(transformation(extent={{107,-6},{119,6}})));
  Modelica.Fluid.Sources.MassFlowSource_T User5(redeclare package Medium = Medium,
    m_flow=-0.045278,
    T=288.15,
    X=X_start,
    nPorts=1)
    annotation (Placement(transformation(extent={{-88,28},{-78,38}})));
  Modelica.Fluid.Sources.MassFlowSource_T User4(redeclare package Medium = Medium,
    m_flow=-0.034722,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={27,48})));
  Modelica.Fluid.Sources.FixedBoundary SourceP1(
    redeclare package Medium = Medium,
    p=7500,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,68})));
  inner Modelica.Fluid.System system(
    T_ambient=288.15,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start=0.03,
    use_eps_Re=false)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package
      Medium =                                                                          Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-66,33})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package
      Medium =                                                                          Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={27,33})));
  Modelica.Fluid.Sources.MassFlowSource_T User2(
    redeclare package Medium = Medium,
    m_flow=-0.043611,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-27,48})));
  Modelica.Fluid.Sources.MassFlowSource_T User6(
    redeclare package Medium = Medium,
    m_flow=-0.031389,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-85,-9})));
  Modelica.Fluid.Sources.MassFlowSource_T User3(
    redeclare package Medium = Medium,
    m_flow=-0.038333,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-26,-8})));
  Modelica.Fluid.Sources.MassFlowSource_T User7(
    redeclare package Medium = Medium,
    m_flow=-0.008611,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={45,-22})));
  Modelica.Fluid.Sources.MassFlowSource_T User8(
    redeclare package Medium = Medium,
    m_flow=-0.040833,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={4,-67})));
  Modelica.Fluid.Sources.MassFlowSource_T User9(
    redeclare package Medium = Medium,
    m_flow=-0.009444,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={65,-16})));
  Modelica.Fluid.Sources.MassFlowSource_T User10(
    redeclare package Medium = Medium,
    m_flow=-0.008304,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={97,-15})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-66,-9})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-10,-8})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={4,-50})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal6(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={65,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal7(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={97,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal8(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={27,-22})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal9(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-27,33})));
  Modelica.Fluid.Sources.MassFlowSource_T User11(
    redeclare package Medium = Medium,
    m_flow=-0.006111,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={128,-15})));
equation
  connect(pipe8.port_a, pipe5.port_a)
    annotation (Line(points={{-66,4},{-66,0},{-52,0}}, color={0,127,255}));
  connect(pipe5.port_b, pipe2.port_b) annotation (Line(points={{-40,0},{-10,0},
          {-10,13}},            color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a)
    annotation (Line(points={{-10,43},{-10,33},{3,33}},
                                                    color={0,127,255}));
  connect(pipe2.port_a, pipe3.port_a)
    annotation (Line(points={{-10,25},{-10,33},{3,33}},
                                                    color={0,127,255}));
  connect(SourceP1.ports[1], pipe1.port_a) annotation (Line(points={{-10,62},{-10,
          55}},
        color={0,127,255}));
  connect(teeJunctionIdeal4.port_3, pipe8.port_b) annotation (Line(points={{-66,28},
          {-66,16}},                       color={0,127,255}));
  connect(teeJunctionIdeal4.port_1, pipe4.port_b)
    annotation (Line(points={{-61,33},{-52,33}},          color={0,127,255}));
  connect(teeJunctionIdeal4.port_2, User5.ports[1])
    annotation (Line(points={{-71,33},{-78,33}},          color={0,127,255}));
  connect(pipe3.port_b, teeJunctionIdeal5.port_3)
    annotation (Line(points={{15,33},{22,33}},         color={0,127,255}));
  connect(pipe9.port_b, teeJunctionIdeal5.port_1)
    annotation (Line(points={{27,18},{27,28}},         color={0,127,255}));
  connect(teeJunctionIdeal5.port_2, User4.ports[1]) annotation (Line(points={{27,38},
          {27,43}},                        color={0,127,255}));
  connect(teeJunctionIdeal1.port_2, pipe8.port_a)
    annotation (Line(points={{-66,-4},{-66,4}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_1, pipe10.port_a)
    annotation (Line(points={{-66,-14},{-66,-27}}, color={0,127,255}));
  connect(User6.ports[1], teeJunctionIdeal1.port_3)
    annotation (Line(points={{-80,-9},{-71,-9}},          color={0,127,255}));
  connect(teeJunctionIdeal2.port_2, pipe2.port_b)
    annotation (Line(points={{-10,-3},{-10,13}}, color={0,127,255}));
  connect(pipe6.port_a, teeJunctionIdeal2.port_2)
    annotation (Line(points={{7,0},{-10,0},{-10,-3}}, color={0,127,255}));
  connect(teeJunctionIdeal2.port_1, pipe7.port_a)
    annotation (Line(points={{-10,-13},{-10,-21}}, color={0,127,255}));
  connect(User3.ports[1], teeJunctionIdeal2.port_3) annotation (Line(points={{-21,-8},
          {-15,-8}},                                 color={0,127,255}));
  connect(pipe10.port_b, teeJunctionIdeal3.port_2) annotation (Line(points={{-66,-39},
          {-66,-50},{-1,-50}},       color={0,127,255}));
  connect(pipe7.port_b, teeJunctionIdeal3.port_2) annotation (Line(points={{-10,-33},
          {-10,-50},{-1,-50}},                           color={0,127,255}));
  connect(teeJunctionIdeal3.port_1, pipe11.port_b)
    annotation (Line(points={{9,-50},{27,-50},{27,-46}},  color={0,127,255}));
  connect(User8.ports[1], teeJunctionIdeal3.port_3)
    annotation (Line(points={{4,-62},{4,-55}},   color={0,127,255}));
  connect(teeJunctionIdeal6.port_2, pipe12.port_b)
    annotation (Line(points={{60,0},{54,0}}, color={0,127,255}));
  connect(teeJunctionIdeal6.port_1, pipe13.port_b)
    annotation (Line(points={{70,0},{77,0}}, color={0,127,255}));
  connect(User9.ports[1], teeJunctionIdeal6.port_3)
    annotation (Line(points={{65,-11},{65,-5}}, color={0,127,255}));
  connect(pipe13.port_a, teeJunctionIdeal7.port_2)
    annotation (Line(points={{89,0},{92,0}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_1, pipe14.port_a)
    annotation (Line(points={{102,0},{107,0}}, color={0,127,255}));
  connect(User10.ports[1], teeJunctionIdeal7.port_3)
    annotation (Line(points={{97,-10},{97,-5}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_2, pipe11.port_a)
    annotation (Line(points={{27,-27},{27,-34}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_3, User7.ports[1])
    annotation (Line(points={{32,-22},{40,-22}},          color={0,127,255}));
  connect(pipe6.port_b, teeJunctionIdeal8.port_1)
    annotation (Line(points={{19,0},{27,0},{27,-17}},color={0,127,255}));
  connect(pipe9.port_a, teeJunctionIdeal8.port_1)
    annotation (Line(points={{27,6},{27,-17}},color={0,127,255}));
  connect(pipe12.port_a, teeJunctionIdeal8.port_1)
    annotation (Line(points={{42,0},{27,0},{27,-17}},color={0,127,255}));
  connect(User2.ports[1], teeJunctionIdeal9.port_3) annotation (Line(points={{-27,43},
          {-27,38}},                       color={0,127,255}));
  connect(pipe4.port_a, teeJunctionIdeal9.port_1)
    annotation (Line(points={{-40,33},{-32,33}}, color={0,127,255}));
  connect(teeJunctionIdeal9.port_2, pipe3.port_a)
    annotation (Line(points={{-22,33},{3,33}}, color={0,127,255}));
  connect(pipe14.port_b, User11.ports[1])
    annotation (Line(points={{119,0},{128,0},{128,-10}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, grid={1,1})),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end PaperCaseII_MSL;
