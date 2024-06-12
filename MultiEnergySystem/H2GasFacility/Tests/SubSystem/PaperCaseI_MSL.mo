within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_MSL
  "PaperCaseI implemented using the Modelica Standard Library"
  replaceable package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4 constrainedby Modelica.Media.Interfaces.PartialMedium;

  Modelica.Fluid.Pipes.DynamicPipe pipe1(
    redeclare package Medium = Medium,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.kappa,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=3)              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,42})));
  Modelica.Fluid.Pipes.DynamicPipe pipe2(
    redeclare package Medium = Medium,
    length=Pipe.pipe2.L,
    diameter=Pipe.pipe2.Di,
    roughness=Pipe.pipe2.kappa,
    p_a_start=Pipe.pipe2.pin_start,
    p_b_start=Pipe.pipe2.pout_start,
    m_flow_start=Pipe.pipe2.m_flow_start,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,12})));
  Modelica.Fluid.Pipes.DynamicPipe pipe3(
    redeclare package Medium = Medium,
    length=Pipe.pipe3.L,
    diameter=Pipe.pipe3.Di,
    roughness=Pipe.pipe3.kappa,
    p_a_start=Pipe.pipe3.pin_start,
    p_b_start=Pipe.pipe3.pout_start,
    T_start=Pipe.pipe3.Tin_start,
    m_flow_start=Pipe.pipe3.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-4,20},{8,32}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe4(
    redeclare package Medium = Medium,
    length=Pipe.pipe4.L,
    diameter=Pipe.pipe4.Di,
    roughness=Pipe.pipe4.kappa,
    p_a_start=Pipe.pipe4.pin_start,
    p_b_start=Pipe.pipe4.pout_start,
    T_start=Pipe.pipe4.Tin_start,
    m_flow_start=Pipe.pipe4.m_flow_start,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-26,26})));
  Modelica.Fluid.Pipes.DynamicPipe pipe5(
    redeclare package Medium = Medium,
    length=Pipe.pipe5.L,
    diameter=Pipe.pipe5.Di,
    roughness=Pipe.pipe5.kappa,
    p_a_start=Pipe.pipe5.pin_start,
    p_b_start=Pipe.pipe5.pout_start,
    T_start=Pipe.pipe5.Tin_start,
    m_flow_start=Pipe.pipe5.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-32,-6},{-20,6}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe6(
    redeclare package Medium = Medium,
    length=Pipe.pipe6.L,
    diameter=Pipe.pipe6.Di,
    roughness=Pipe.pipe6.kappa,
    p_a_start=Pipe.pipe6.pin_start,
    p_b_start=Pipe.pipe6.pout_start,
    T_start=Pipe.pipe6.Tin_start,
    m_flow_start=Pipe.pipe6.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-4,-6},{8,6}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe7(
    redeclare package Medium = Medium,
    length=Pipe.pipe7.L,
    diameter=Pipe.pipe7.Di,
    roughness=Pipe.pipe7.kappa,
    p_a_start=Pipe.pipe7.pin_start,
    p_b_start=Pipe.pipe7.pout_start,
    T_start=Pipe.pipe7.Tin_start,
    m_flow_start=Pipe.pipe7.m_flow_start,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,-13})));
  Modelica.Fluid.Pipes.DynamicPipe pipe8(
    redeclare package Medium = Medium,
    length=Pipe.pipe8.L,
    diameter=Pipe.pipe8.Di,
    roughness=Pipe.pipe8.kappa,
    p_a_start=Pipe.pipe8.pin_start,
    p_b_start=Pipe.pipe8.pout_start,
    T_start=Pipe.pipe8.Tin_start,
    m_flow_start=Pipe.pipe8.m_flow_start,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-49,12})));
  Modelica.Fluid.Pipes.DynamicPipe pipe9(
    redeclare package Medium = Medium,
    length=Pipe.pipe9.L,
    diameter=Pipe.pipe9.Di,
    roughness=Pipe.pipe9.kappa,
    p_a_start=Pipe.pipe9.pin_start,
    p_b_start=Pipe.pipe9.pout_start,
    T_start=Pipe.pipe9.Tin_start,
    m_flow_start=Pipe.pipe9.m_flow_start,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={18,12})));
  Modelica.Fluid.Pipes.DynamicPipe pipe10(
    redeclare package Medium = Medium,
    length=Pipe.pipe10.L,
    diameter=Pipe.pipe10.Di,
    roughness=Pipe.pipe10.kappa,
    p_a_start=Pipe.pipe10.pin_start,
    p_b_start=Pipe.pipe10.pout_start,
    T_start=Pipe.pipe10.Tin_start,
    m_flow_start=Pipe.pipe10.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-49,-13})));
  Modelica.Fluid.Pipes.DynamicPipe pipe11(
    redeclare package Medium = Medium,
    length=Pipe.pipe11.L,
    diameter=Pipe.pipe11.Di,
    roughness=Pipe.pipe11.kappa,
    p_a_start=Pipe.pipe11.pin_start,
    p_b_start=Pipe.pipe11.pout_start,
    T_start=Pipe.pipe11.Tin_start,
    m_flow_start=Pipe.pipe11.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={18,-13})));
  Modelica.Fluid.Pipes.DynamicPipe pipe12(
    redeclare package Medium = Medium,
    length=Pipe.pipe12.L,
    diameter=Pipe.pipe12.Di,
    roughness=Pipe.pipe12.kappa,
    p_a_start=Pipe.pipe12.pin_start,
    p_b_start=Pipe.pipe12.pout_start,
    T_start=Pipe.pipe12.Tin_start,
    m_flow_start=Pipe.pipe12.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-4,-32},{8,-20}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe13(
    redeclare package Medium = Medium,
    length=Pipe.pipe13.L,
    diameter=Pipe.pipe13.Di,
    roughness=Pipe.pipe13.kappa,
    p_a_start=Pipe.pipe13.pin_start,
    p_b_start=Pipe.pipe13.pout_start,
    T_start=Pipe.pipe13.Tin_start,
    m_flow_start=Pipe.pipe13.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-28,-26})));
  Modelica.Fluid.Pipes.DynamicPipe pipe14(
    redeclare package Medium = Medium,
    length=Pipe.pipe14.L,
    diameter=Pipe.pipe14.Di,
    roughness=Pipe.pipe14.kappa,
    p_a_start=Pipe.pipe14.pin_start,
    p_b_start=Pipe.pipe14.pout_start,
    T_start=Pipe.pipe14.Tin_start,
    m_flow_start=Pipe.pipe14.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{24,-32},{36,-20}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe15(
    redeclare package Medium = Medium,
    length=Pipe.pipe15.L,
    diameter=Pipe.pipe15.Di,
    roughness=Pipe.pipe15.kappa,
    p_a_start=Pipe.pipe15.pin_start,
    p_b_start=Pipe.pipe15.pout_start,
    T_start=Pipe.pipe15.Tin_start,
    m_flow_start=Pipe.pipe15.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{60,-32},{72,-20}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe16(
    redeclare package Medium = Medium,
    length=Pipe.pipe16.L,
    diameter=Pipe.pipe16.Di,
    roughness=Pipe.pipe16.kappa,
    p_a_start=Pipe.pipe16.pin_start,
    p_b_start=Pipe.pipe16.pout_start,
    T_start=Pipe.pipe16.Tin_start,
    m_flow_start=Pipe.pipe16.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={78,-48})));
  Modelica.Fluid.Pipes.DynamicPipe pipe17(
    redeclare package Medium = Medium,
    length=Pipe.pipe17.L,
    diameter=Pipe.pipe17.Di,
    roughness=Pipe.pipe17.kappa,
    p_a_start=Pipe.pipe17.pin_start,
    p_b_start=Pipe.pipe17.pout_start,
    T_start=Pipe.pipe17.Tin_start,
    m_flow_start=Pipe.pipe17.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{28,-6},{40,6}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe18(
    redeclare package Medium = Medium,
    length=Pipe.pipe18.L,
    diameter=Pipe.pipe18.Di,
    roughness=Pipe.pipe18.kappa,
    p_a_start=Pipe.pipe18.pin_start,
    p_b_start=Pipe.pipe18.pout_start,
    T_start=Pipe.pipe18.Tin_start,
    m_flow_start=Pipe.pipe18.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={51,18})));
  Modelica.Fluid.Pipes.DynamicPipe pipe19(
    redeclare package Medium = Medium,
    length=Pipe.pipe19.L,
    diameter=Pipe.pipe19.Di,
    roughness=Pipe.pipe19.kappa,
    p_a_start=Pipe.pipe19.pin_start,
    p_b_start=Pipe.pipe19.pout_start,
    T_start=Pipe.pipe19.Tin_start,
    m_flow_start=Pipe.pipe19.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,-40})));
  Modelica.Fluid.Pipes.DynamicPipe pipe20(
    redeclare package Medium = Medium,
    length=Pipe.pipe20.L,
    diameter=Pipe.pipe20.Di,
    roughness=Pipe.pipe20.kappa,
    p_a_start=Pipe.pipe20.pin_start,
    p_b_start=Pipe.pipe20.pout_start,
    T_start=Pipe.pipe20.Tin_start,
    m_flow_start=Pipe.pipe20.m_flow_start,
    nNodes=3)                              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-25,-54})));
  Modelica.Fluid.Pipes.DynamicPipe pipe21(
    redeclare package Medium = Medium,
    length=Pipe.pipe21.L,
    diameter=Pipe.pipe21.Di,
    roughness=Pipe.pipe21.kappa,
    p_a_start=Pipe.pipe21.pin_start,
    p_b_start=Pipe.pipe21.pout_start,
    T_start=Pipe.pipe21.Tin_start,
    m_flow_start=Pipe.pipe21.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-74,-6},{-62,6}})));
  Modelica.Fluid.Sources.MassFlowSource_T User5(redeclare package Medium = Medium,
    m_flow=-0.035600,
    T=288.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-67,21},{-57,31}})));
  Modelica.Fluid.Sources.MassFlowSource_T User4(redeclare package Medium = Medium,
    m_flow=-0.045489,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={18,40})));
  Modelica.Fluid.Sources.FixedBoundary SourceP1(
    redeclare package Medium = Medium,
    p=150000,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,62})));
  Modelica.Fluid.Sources.FixedBoundary SourceP2(
    redeclare package Medium = Medium,
    p=150000,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-88,0})));
  Modelica.Fluid.Sources.MassFlowSource_T User10(redeclare package Medium = Medium,
    m_flow=-0.041533,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-49,-41})));
  Modelica.Fluid.Sources.MassFlowSource_T User15(redeclare package Medium = Medium,
    m_flow=-0.017800,
    T=288.15,
    nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={51,35})));
  Modelica.Fluid.Sources.MassFlowSource_T User14(redeclare package Medium = Medium,
    m_flow=-0.008900,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={65,-10})));
  Modelica.Fluid.Sources.MassFlowSource_T User13(redeclare package Medium = Medium,
    m_flow=-0.006922,
    T=288.15,
    nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,-65})));
  Modelica.Fluid.Sources.MassFlowSource_T User12(redeclare package Medium = Medium,
    m_flow=-0.014833,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={93,-34})));
  Modelica.Fluid.Sources.MassFlowSource_T User11(redeclare package Medium = Medium,
    m_flow=-0.009889,
    T=288.15,
    nPorts=1) annotation (
      Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=270,
        origin={47,-39})));
  Modelica.Fluid.Sources.MassFlowSource_T User16(redeclare package Medium = Medium,
    m_flow=-0.012856,
    T=288.15,
    nPorts=1)  annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={5,-54})));
  Modelica.Fluid.Sources.MassFlowSource_T User17(redeclare package Medium = Medium,
    m_flow=-0.010878,
    T=288.15,
    nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-41,-54})));
  inner Modelica.Fluid.System system(
    T_ambient=288.15,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    m_flow_start=0.03,
    use_eps_Re=false)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={51,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=180,
        origin={-10,-54})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={78,-34})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=0,
        origin={47,-26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-49,26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={18,26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal6(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-49,-26})));
equation
  connect(pipe10.port_a, pipe5.port_a)
    annotation (Line(points={{-49,-7},{-49,0},{-32,0}}, color={0,127,255}));
  connect(pipe8.port_a, pipe5.port_a)
    annotation (Line(points={{-49,6},{-49,0},{-32,0}}, color={0,127,255}));
  connect(pipe21.port_b, pipe5.port_a)
    annotation (Line(points={{-62,0},{-32,0}}, color={0,127,255}));
  connect(pipe7.port_a, pipe2.port_b) annotation (Line(points={{-10,-7},{-10,6}},
                            color={0,127,255}));
  connect(pipe6.port_a, pipe2.port_b) annotation (Line(points={{-4,0},{-10,0},{-10,6}},
                             color={0,127,255}));
  connect(pipe5.port_b, pipe2.port_b) annotation (Line(points={{-20,0},{-10,0},{-10,6}},
                                color={0,127,255}));
  connect(pipe12.port_a, pipe19.port_a) annotation (Line(points={{-4,-26},{-10,-26},{-10,-34}},
                                               color={0,127,255}));
  connect(pipe13.port_a, pipe19.port_a) annotation (Line(points={{-22,-26},{-10,-26},{-10,-34}},
                                               color={0,127,255}));
  connect(pipe7.port_b, pipe19.port_a) annotation (Line(points={{-10,-19},{-10,-34}},
                                                color={0,127,255}));
  connect(pipe12.port_b, pipe14.port_a)
    annotation (Line(points={{8,-26},{24,-26}},  color={0,127,255}));
  connect(pipe11.port_b, pipe14.port_a)
    annotation (Line(points={{18,-19},{18,-26},{24,-26}}, color={0,127,255}));
  connect(pipe6.port_b, pipe17.port_a)
    annotation (Line(points={{8,0},{28,0}},  color={0,127,255}));
  connect(pipe9.port_a, pipe17.port_a)
    annotation (Line(points={{18,6},{18,0},{28,0}}, color={0,127,255}));
  connect(pipe11.port_a, pipe17.port_a)
    annotation (Line(points={{18,-7},{18,0},{28,0}}, color={0,127,255}));
  connect(pipe4.port_a, pipe3.port_a)
    annotation (Line(points={{-20,26},{-4,26}},color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a)
    annotation (Line(points={{-10,36},{-10,26},{-4,26}},
                                                    color={0,127,255}));
  connect(pipe2.port_a, pipe3.port_a)
    annotation (Line(points={{-10,18},{-10,26},{-4,26}},
                                                    color={0,127,255}));
  connect(pipe21.port_a, SourceP2.ports[1])
    annotation (Line(points={{-74,0},{-82,0}}, color={0,127,255}));
  connect(pipe18.port_b, User15.ports[1])
    annotation (Line(points={{51,24},{51,30}}, color={0,127,255}));
  connect(User13.ports[1], pipe16.port_b) annotation (Line(points={{78,-60},{78,-54}},
                                   color={0,127,255}));
  connect(User17.ports[1], pipe20.port_b) annotation (Line(points={{-36,-54},{-31,-54}},
                               color={0,127,255}));
  connect(pipe6.port_a, pipe7.port_a) annotation (Line(points={{-4,0},{-10,0},{-10,-7}},
                                            color={0,127,255}));
  connect(SourceP1.ports[1], pipe1.port_a) annotation (Line(points={{-10,56},{-10,48}},
        color={0,127,255}));
  connect(teeJunctionIdeal.port_2, pipe18.port_a) annotation (Line(points={{51,5},{51,12}},
                                       color={0,127,255}));
  connect(teeJunctionIdeal.port_3, pipe17.port_b)
    annotation (Line(points={{46,0},{40,0}},        color={0,127,255}));
  connect(teeJunctionIdeal2.port_2, pipe16.port_a) annotation (Line(points={{78,-39},{78,-42}},
                                            color={0,127,255}));
  connect(teeJunctionIdeal2.port_1, pipe15.port_b)
    annotation (Line(points={{78,-29},{78,-26},{72,-26}}, color={0,127,255}));
  connect(teeJunctionIdeal2.port_3, User12.ports[1])
    annotation (Line(points={{83,-34},{88,-34}},          color={0,127,255}));
  connect(teeJunctionIdeal3.port_1, pipe14.port_b) annotation (Line(points={{42,-26},{36,-26}},
                                            color={0,127,255}));
  connect(teeJunctionIdeal3.port_2, pipe15.port_a) annotation (Line(points={{52,-26},{60,-26}},
                                            color={0,127,255}));
  connect(teeJunctionIdeal4.port_3, pipe8.port_b) annotation (Line(points={{-49,21},{-49,18}},
                                           color={0,127,255}));
  connect(teeJunctionIdeal4.port_1, pipe4.port_b)
    annotation (Line(points={{-44,26},{-32,26}},          color={0,127,255}));
  connect(teeJunctionIdeal4.port_2, User5.ports[1])
    annotation (Line(points={{-54,26},{-57,26}},          color={0,127,255}));
  connect(pipe3.port_b, teeJunctionIdeal5.port_3)
    annotation (Line(points={{8,26},{13,26}},          color={0,127,255}));
  connect(pipe9.port_b, teeJunctionIdeal5.port_1)
    annotation (Line(points={{18,18},{18,21}},         color={0,127,255}));
  connect(teeJunctionIdeal5.port_2, User4.ports[1]) annotation (Line(points={{18,31},{18,35}},
                                           color={0,127,255}));
  connect(teeJunctionIdeal6.port_1, pipe10.port_b) annotation (Line(points={{-49,-21},{-49,-19}},
                                         color={0,127,255}));
  connect(teeJunctionIdeal6.port_3, pipe13.port_b) annotation (Line(points={{-44,-26},{-34,-26}},
                                                   color={0,127,255}));
  connect(teeJunctionIdeal6.port_2, User10.ports[1]) annotation (Line(points={{-49,-31},{-49,-36}}, color={0,127,255}));
  connect(User14.ports[1], teeJunctionIdeal.port_1) annotation (Line(points={{60,-10},{51,-10},{51,-5}},              color={0,127,255}));
  connect(teeJunctionIdeal3.port_3, User11.ports[1]) annotation (Line(points={{47,-31},{47,-34}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_3, pipe19.port_b) annotation (Line(points={{-10,-49},{-10,-46}}, color={0,127,255}));
  connect(User16.ports[1], teeJunctionIdeal1.port_1) annotation (Line(points={{-8.88178e-16,-54},{-5,-54}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_2, pipe20.port_a) annotation (Line(points={{-15,-54},{-19,-54}}, color={0,127,255}));
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
end PaperCaseI_MSL;
