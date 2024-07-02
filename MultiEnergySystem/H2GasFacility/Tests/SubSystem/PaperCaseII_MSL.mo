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
        origin={-33,49})));
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
        origin={-33,19})));
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
    annotation (Placement(transformation(extent={{-23,27},{-11,39}})));
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
        origin={-60,33})));
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
    annotation (Placement(transformation(extent={{-66,-6},{-54,6}})));
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
    annotation (Placement(transformation(extent={{-23,-6},{-11,6}})));
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
        origin={-33,-34})));
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
        origin={-76,10})));
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
        origin={0,12})));
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
        origin={-76,-33})));
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
        origin={0,-40})));
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
    annotation (Placement(transformation(extent={{14,-6},{26,6}})));
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
        origin={55,0})));
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
    annotation (Placement(transformation(extent={{84,-6},{96,6}})));
  Modelica.Fluid.Sources.MassFlowSource_T User5(redeclare package Medium = Medium,
    m_flow=-0.045278,
    T=288.15,
    X=X_start,
    nPorts=1)
    annotation (Placement(transformation(extent={{-98,28},{-88,38}})));
  Modelica.Fluid.Sources.MassFlowSource_T User4(redeclare package Medium = Medium,
    m_flow=-0.034722,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={0,48})));
  Modelica.Fluid.Sources.FixedBoundary SourceP1(
    redeclare package Medium = Medium,
    p=75000,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-33,68})));
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
        origin={-76,33})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package
      Medium =                                                                          Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={0,33})));
  Modelica.Fluid.Sources.MassFlowSource_T User2(
    redeclare package Medium = Medium,
    m_flow=-0.043611,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-57,54})));
  Modelica.Fluid.Sources.MassFlowSource_T User6(
    redeclare package Medium = Medium,
    m_flow=-0.031389,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-95,-9})));
  Modelica.Fluid.Sources.MassFlowSource_T User3(
    redeclare package Medium = Medium,
    m_flow=-0.038333,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-49,-13})));
  Modelica.Fluid.Sources.MassFlowSource_T User7(
    redeclare package Medium = Medium,
    m_flow=-0.008611,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={13,-22})));
  Modelica.Fluid.Sources.MassFlowSource_T User8(
    redeclare package Medium = Medium,
    m_flow=-0.040833,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-19,-67})));
  Modelica.Fluid.Sources.MassFlowSource_T User9(
    redeclare package Medium = Medium,
    m_flow=-0.009444,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={37,-15})));
  Modelica.Fluid.Sources.MassFlowSource_T User10(
    redeclare package Medium = Medium,
    m_flow=-0.008304,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={71,-15})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-76,-9})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-33,-13})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-19,-50})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal6(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={37,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal7(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={71,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal8(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={0,-22})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal9(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-46,33})));
  Modelica.Fluid.Sources.MassFlowSource_T User11(
    redeclare package Medium = Medium,
    m_flow=-0.006111,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={100,-15})));
equation
  connect(pipe8.port_a, pipe5.port_a)
    annotation (Line(points={{-76,4},{-76,0},{-66,0}}, color={0,127,255}));
  connect(pipe5.port_b, pipe2.port_b) annotation (Line(points={{-54,0},{-33,0},
          {-33,13}},            color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a)
    annotation (Line(points={{-33,43},{-33,33},{-23,33}},
                                                    color={0,127,255}));
  connect(pipe2.port_a, pipe3.port_a)
    annotation (Line(points={{-33,25},{-33,33},{-23,33}},
                                                    color={0,127,255}));
  connect(SourceP1.ports[1], pipe1.port_a) annotation (Line(points={{-33,62},{
          -33,55}},
        color={0,127,255}));
  connect(teeJunctionIdeal4.port_3, pipe8.port_b) annotation (Line(points={{-76,28},
          {-76,16}},                       color={0,127,255}));
  connect(teeJunctionIdeal4.port_1, pipe4.port_b)
    annotation (Line(points={{-71,33},{-66,33}},          color={0,127,255}));
  connect(teeJunctionIdeal4.port_2, User5.ports[1])
    annotation (Line(points={{-81,33},{-88,33}},          color={0,127,255}));
  connect(pipe3.port_b, teeJunctionIdeal5.port_3)
    annotation (Line(points={{-11,33},{-5,33}},        color={0,127,255}));
  connect(pipe9.port_b, teeJunctionIdeal5.port_1)
    annotation (Line(points={{0,18},{0,28}},           color={0,127,255}));
  connect(teeJunctionIdeal5.port_2, User4.ports[1]) annotation (Line(points={{0,38},{
          0,43}},                          color={0,127,255}));
  connect(teeJunctionIdeal1.port_2, pipe8.port_a)
    annotation (Line(points={{-76,-4},{-76,4}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_1, pipe10.port_a)
    annotation (Line(points={{-76,-14},{-76,-27}}, color={0,127,255}));
  connect(User6.ports[1], teeJunctionIdeal1.port_3)
    annotation (Line(points={{-90,-9},{-81,-9}},          color={0,127,255}));
  connect(teeJunctionIdeal2.port_2, pipe2.port_b)
    annotation (Line(points={{-33,-8},{-33,13}}, color={0,127,255}));
  connect(teeJunctionIdeal2.port_1, pipe7.port_a)
    annotation (Line(points={{-33,-18},{-33,-28}}, color={0,127,255}));
  connect(User3.ports[1], teeJunctionIdeal2.port_3) annotation (Line(points={{-44,-13},
          {-38,-13}},                                color={0,127,255}));
  connect(pipe10.port_b, teeJunctionIdeal3.port_2) annotation (Line(points={{-76,-39},
          {-76,-50},{-24,-50}},      color={0,127,255}));
  connect(pipe7.port_b, teeJunctionIdeal3.port_2) annotation (Line(points={{-33,-40},
          {-33,-50},{-24,-50}},                          color={0,127,255}));
  connect(teeJunctionIdeal3.port_1, pipe11.port_b)
    annotation (Line(points={{-14,-50},{0,-50},{0,-46}},  color={0,127,255}));
  connect(User8.ports[1], teeJunctionIdeal3.port_3)
    annotation (Line(points={{-19,-62},{-19,-55}},
                                                 color={0,127,255}));
  connect(teeJunctionIdeal6.port_2, pipe12.port_b)
    annotation (Line(points={{32,0},{26,0}}, color={0,127,255}));
  connect(teeJunctionIdeal6.port_1, pipe13.port_b)
    annotation (Line(points={{42,0},{49,0}}, color={0,127,255}));
  connect(User9.ports[1], teeJunctionIdeal6.port_3)
    annotation (Line(points={{37,-10},{37,-5}}, color={0,127,255}));
  connect(pipe13.port_a, teeJunctionIdeal7.port_2)
    annotation (Line(points={{61,0},{66,0}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_1, pipe14.port_a)
    annotation (Line(points={{76,0},{84,0}},   color={0,127,255}));
  connect(User10.ports[1], teeJunctionIdeal7.port_3)
    annotation (Line(points={{71,-10},{71,-5}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_2, pipe11.port_a)
    annotation (Line(points={{0,-27},{0,-34}},   color={0,127,255}));
  connect(teeJunctionIdeal8.port_3, User7.ports[1])
    annotation (Line(points={{5,-22},{8,-22}},            color={0,127,255}));
  connect(pipe6.port_b, teeJunctionIdeal8.port_1)
    annotation (Line(points={{-11,0},{0,0},{0,-17}}, color={0,127,255}));
  connect(pipe9.port_a, teeJunctionIdeal8.port_1)
    annotation (Line(points={{0,6},{0,-17}},  color={0,127,255}));
  connect(pipe12.port_a, teeJunctionIdeal8.port_1)
    annotation (Line(points={{14,0},{0,0},{0,-17}},  color={0,127,255}));
  connect(User2.ports[1], teeJunctionIdeal9.port_3) annotation (Line(points={{-52,54},
          {-46,54},{-46,38}},              color={0,127,255}));
  connect(pipe4.port_a, teeJunctionIdeal9.port_1)
    annotation (Line(points={{-54,33},{-51,33}}, color={0,127,255}));
  connect(teeJunctionIdeal9.port_2, pipe3.port_a)
    annotation (Line(points={{-41,33},{-23,33}},
                                               color={0,127,255}));
  connect(pipe14.port_b, User11.ports[1])
    annotation (Line(points={{96,0},{100,0},{100,-10}},  color={0,127,255}));
  connect(pipe6.port_a, pipe2.port_b)
    annotation (Line(points={{-23,0},{-33,0},{-33,13}}, color={0,127,255}));
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
