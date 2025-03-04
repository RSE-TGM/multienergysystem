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
        origin={-10,44})));
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
        origin={-10,13})));
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
    annotation (Placement(transformation(extent={{-4,22},{8,34}})));
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
        origin={-29,28})));
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
    annotation (Placement(transformation(extent={{-35,-6},{-23,6}})));
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
        origin={-10,-12})));
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
        origin={18,13})));
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
        origin={18,-12})));
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
    annotation (Placement(transformation(extent={{-2,-32},{10,-20}})));
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
        origin={-29,-26})));
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
    annotation (Placement(transformation(extent={{26,-32},{38,-20}})));
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
    annotation (Placement(transformation(extent={{57,-32},{69,-20}})));
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
        origin={75,-48})));
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
        origin={50,18})));
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
    annotation (Placement(transformation(extent={{-67,23},{-57,33}})));
  Modelica.Fluid.Sources.MassFlowSource_T User4(redeclare package Medium = Medium,
    m_flow=-0.045489,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={18,42})));
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
        origin={50,35})));
  Modelica.Fluid.Sources.MassFlowSource_T User14(redeclare package Medium = Medium,
    m_flow=-0.008900,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={64,-10})));
  Modelica.Fluid.Sources.MassFlowSource_T User13(redeclare package Medium = Medium,
    m_flow=-0.006922,
    T=288.15,
    nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={75,-65})));
  Modelica.Fluid.Sources.MassFlowSource_T User12(redeclare package Medium = Medium,
    m_flow=-0.014833,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={88,-35})));
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
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={50,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-3,3},{3,-3}},
        rotation=180,
        origin={-10,-54})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=270,
        origin={75,-35})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-3,3},{3,-3}},
        rotation=0,
        origin={47,-26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={-49,28})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={18,28})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal6(redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=270,
        origin={-49,-26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal7(redeclare package Medium = Medium)
                                                                                               annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=0,
        origin={18,-26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal8(redeclare package Medium = Medium)
                                                                                               annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=180,
        origin={-10,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal9(redeclare package Medium = Medium)
                                                                                               annotation (Placement(
        transformation(
        extent={{-3,3},{3,-3}},
        rotation=90,
        origin={-10,-26})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal10(redeclare package
                                                                                Medium = Medium)
                                                                                               annotation (Placement(
        transformation(
        extent={{-3,3},{3,-3}},
        rotation=180,
        origin={-49,0})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal11(redeclare package
                                                                                Medium = Medium)
                                                                                               annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=270,
        origin={-10,28})));
equation
  connect(pipe21.port_a, SourceP2.ports[1])
    annotation (Line(points={{-74,0},{-82,0}}, color={0,127,255}));
  connect(pipe18.port_b, User15.ports[1])
    annotation (Line(points={{50,24},{50,30}}, color={0,127,255}));
  connect(User13.ports[1], pipe16.port_b) annotation (Line(points={{75,-60},{75,-54}},
                                   color={0,127,255}));
  connect(User17.ports[1], pipe20.port_b) annotation (Line(points={{-36,-54},{-31,-54}},
                               color={0,127,255}));
  connect(SourceP1.ports[1], pipe1.port_a) annotation (Line(points={{-10,56},{-10,50}},
        color={0,127,255}));
  connect(teeJunctionIdeal.port_2, pipe18.port_a) annotation (Line(points={{50,3},{50,12}},
                                       color={0,127,255}));
  connect(teeJunctionIdeal.port_3, pipe17.port_b)
    annotation (Line(points={{47,2.22045e-16},{43,2.22045e-16},{43,0},{40,0}},
                                                    color={0,127,255}));
  connect(teeJunctionIdeal2.port_2, pipe16.port_a) annotation (Line(points={{75,-38},{75,-42}},
                                            color={0,127,255}));
  connect(teeJunctionIdeal2.port_1, pipe15.port_b)
    annotation (Line(points={{75,-32},{75,-26},{69,-26}}, color={0,127,255}));
  connect(teeJunctionIdeal3.port_1, pipe14.port_b) annotation (Line(points={{44,-26},{38,-26}},
                                            color={0,127,255}));
  connect(teeJunctionIdeal3.port_2, pipe15.port_a) annotation (Line(points={{50,-26},{57,-26}},
                                            color={0,127,255}));
  connect(teeJunctionIdeal4.port_3, pipe8.port_b) annotation (Line(points={{-49,25},{-49,18}},
                                           color={0,127,255}));
  connect(teeJunctionIdeal4.port_1, pipe4.port_b)
    annotation (Line(points={{-46,28},{-35,28}},          color={0,127,255}));
  connect(teeJunctionIdeal4.port_2, User5.ports[1])
    annotation (Line(points={{-52,28},{-57,28}},          color={0,127,255}));
  connect(pipe3.port_b, teeJunctionIdeal5.port_3)
    annotation (Line(points={{8,28},{15,28}},          color={0,127,255}));
  connect(pipe9.port_b, teeJunctionIdeal5.port_1)
    annotation (Line(points={{18,19},{18,25}},         color={0,127,255}));
  connect(teeJunctionIdeal5.port_2, User4.ports[1]) annotation (Line(points={{18,31},{18,37}},
                                           color={0,127,255}));
  connect(teeJunctionIdeal6.port_1, pipe10.port_b) annotation (Line(points={{-49,-23},{-49,-19}},
                                         color={0,127,255}));
  connect(teeJunctionIdeal6.port_2, User10.ports[1]) annotation (Line(points={{-49,-29},{-49,-36}}, color={0,127,255}));
  connect(User14.ports[1], teeJunctionIdeal.port_1) annotation (Line(points={{59,-10},{50,-10},{50,-3}},              color={0,127,255}));
  connect(teeJunctionIdeal3.port_3, User11.ports[1]) annotation (Line(points={{47,-29},{47,-34}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_3, pipe19.port_b) annotation (Line(points={{-10,-51},{-10,-46}}, color={0,127,255}));
  connect(User16.ports[1], teeJunctionIdeal1.port_1) annotation (Line(points={{-8.88178e-16,-54},{-7,-54}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_2, pipe20.port_a) annotation (Line(points={{-13,-54},{-19,-54}}, color={0,127,255}));
  connect(pipe14.port_a, teeJunctionIdeal7.port_2) annotation (Line(points={{26,-26},{21,-26}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_3, pipe11.port_b) annotation (Line(points={{18,-23},{18,-18}}, color={0,127,255}));
  connect(pipe12.port_b, teeJunctionIdeal7.port_1) annotation (Line(points={{10,-26},{15,-26}}, color={0,127,255}));
  connect(pipe6.port_b, pipe11.port_a) annotation (Line(points={{8,0},{18,0},{18,-6}}, color={0,127,255}));
  connect(pipe9.port_a, pipe11.port_a) annotation (Line(points={{18,7},{18,-6}}, color={0,127,255}));
  connect(pipe17.port_a, pipe11.port_a) annotation (Line(points={{28,0},{18,0},{18,-6}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_3, pipe2.port_b) annotation (Line(points={{-10,3},{-10,7}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_1, pipe5.port_b) annotation (Line(points={{-13,4.16334e-16},{-16.5,4.16334e-16},{-16.5,0},{-23,0}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_2, pipe6.port_a) annotation (Line(points={{-7,-3.05311e-16},{-5.5,-3.05311e-16},{-5.5,0},{-4,0}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_2, pipe7.port_a) annotation (Line(points={{-7,0},{-6,0},{-6,-2},{-10,-2},{-10,-6}}, color={0,127,255}));
  connect(teeJunctionIdeal9.port_2, pipe7.port_b) annotation (Line(points={{-10,-23},{-10,-18}}, color={0,127,255}));
  connect(teeJunctionIdeal9.port_3, pipe12.port_a) annotation (Line(points={{-7,-26},{-2,-26}}, color={0,127,255}));
  connect(teeJunctionIdeal9.port_1, pipe19.port_a) annotation (Line(points={{-10,-29},{-10,-31.5},{-10,-31.5},{-10,-34}}, color={0,127,255}));
  connect(pipe13.port_a, pipe19.port_a) annotation (Line(points={{-23,-26},{-16,-26},{-16,-31},{-10,-31},{-10,-34}}, color={0,127,255}));
  connect(teeJunctionIdeal10.port_2, pipe21.port_b) annotation (Line(points={{-52,3.05311e-16},{-57,3.05311e-16},{-57,0},{-62,0}}, color={0,127,255}));
  connect(teeJunctionIdeal10.port_3, pipe8.port_a) annotation (Line(points={{-49,3},{-49,6}}, color={0,127,255}));
  connect(teeJunctionIdeal10.port_1, pipe5.port_a) annotation (Line(points={{-46,-4.16334e-16},{-39,-4.16334e-16},{-39,0},{-35,0}}, color={0,127,255}));
  connect(pipe10.port_a, pipe5.port_a) annotation (Line(points={{-49,-7},{-49,-5},{-43,-5},{-43,-4.16334e-16},{-39,-4.16334e-16},{-39,0},{-35,0}}, color={0,127,255}));
  connect(teeJunctionIdeal11.port_2, pipe1.port_b) annotation (Line(points={{-10,31},{-10,38}}, color={0,127,255}));
  connect(teeJunctionIdeal11.port_3, pipe4.port_a) annotation (Line(points={{-13,28},{-23,28}}, color={0,127,255}));
  connect(teeJunctionIdeal11.port_1, pipe2.port_a) annotation (Line(points={{-10,25},{-10,22},{-10,22},{-10,19}}, color={0,127,255}));
  connect(pipe3.port_a, pipe2.port_a) annotation (Line(points={{-4,28},{-6,28},{-6,22},{-10,22},{-10,19}}, color={0,127,255}));
  connect(teeJunctionIdeal6.port_3, pipe13.port_b) annotation (Line(points={{-46,-26},{-35,-26}}, color={0,127,255}));
  connect(teeJunctionIdeal2.port_3, User12.ports[1]) annotation (Line(points={{78,-35},{83,-35}}, color={0,127,255}));
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
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>Used to simulate the S.S. of the network with MSL.</p>
</html>"));
end PaperCaseI_MSL;
