within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_MSL_A
  "PaperCaseI implemented using the Modelica Standard Library"
  Modelica.Fluid.Pipes.DynamicPipe pipe1(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.kappa,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=3,
    useLumpedPressure=false)              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={0,44})));
  Modelica.Fluid.Pipes.DynamicPipe pipe2(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe2.L,
    diameter=Pipe.pipe2.Di,
    roughness=Pipe.pipe2.kappa,
    p_a_start=Pipe.pipe2.pin_start,
    p_b_start=Pipe.pipe2.pout_start,
    m_flow_start=Pipe.pipe2.m_flow_start,
    nNodes=3)                             annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={0,18})));
  Modelica.Fluid.Pipes.DynamicPipe pipe3(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe3.L,
    diameter=Pipe.pipe3.Di,
    roughness=Pipe.pipe3.kappa,
    p_a_start=Pipe.pipe3.pin_start,
    p_b_start=Pipe.pipe3.pout_start,
    T_start=Pipe.pipe3.Tin_start,
    m_flow_start=Pipe.pipe3.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{8,22},{20,34}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe4(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={-16,28})));
  Modelica.Fluid.Pipes.DynamicPipe pipe5(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe5.L,
    diameter=Pipe.pipe5.Di,
    roughness=Pipe.pipe5.kappa,
    p_a_start=Pipe.pipe5.pin_start,
    p_b_start=Pipe.pipe5.pout_start,
    T_start=Pipe.pipe5.Tin_start,
    m_flow_start=Pipe.pipe5.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-32,-4},{-20,8}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe6(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe6.L,
    diameter=Pipe.pipe6.Di,
    roughness=Pipe.pipe6.kappa,
    p_a_start=Pipe.pipe6.pin_start,
    p_b_start=Pipe.pipe6.pout_start,
    T_start=Pipe.pipe6.Tin_start,
    m_flow_start=Pipe.pipe6.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{12,-4},{24,8}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe7(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={0,-26})));
  Modelica.Fluid.Pipes.DynamicPipe pipe8(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={-42,14})));
  Modelica.Fluid.Pipes.DynamicPipe pipe9(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={28,14})));
  Modelica.Fluid.Pipes.DynamicPipe pipe10(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={-42,-20})));
  Modelica.Fluid.Pipes.DynamicPipe pipe11(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={28,-22})));
  Modelica.Fluid.Pipes.DynamicPipe pipe12(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe12.L,
    diameter=Pipe.pipe12.Di,
    roughness=Pipe.pipe12.kappa,
    p_a_start=Pipe.pipe12.pin_start,
    p_b_start=Pipe.pipe12.pout_start,
    T_start=Pipe.pipe12.Tin_start,
    m_flow_start=Pipe.pipe12.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{6,-42},{18,-30}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe13(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={-18,-36})));
  Modelica.Fluid.Pipes.DynamicPipe pipe14(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe14.L,
    diameter=Pipe.pipe14.Di,
    roughness=Pipe.pipe14.kappa,
    p_a_start=Pipe.pipe14.pin_start,
    p_b_start=Pipe.pipe14.pout_start,
    T_start=Pipe.pipe14.Tin_start,
    m_flow_start=Pipe.pipe14.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{34,-42},{46,-30}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe15(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe15.L,
    diameter=Pipe.pipe15.Di,
    roughness=Pipe.pipe15.kappa,
    p_a_start=Pipe.pipe15.pin_start,
    p_b_start=Pipe.pipe15.pout_start,
    T_start=Pipe.pipe15.Tin_start,
    m_flow_start=Pipe.pipe15.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{70,-42},{82,-30}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe16(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={88,-58})));
  Modelica.Fluid.Pipes.DynamicPipe pipe17(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe17.L,
    diameter=Pipe.pipe17.Di,
    roughness=Pipe.pipe17.kappa,
    p_a_start=Pipe.pipe17.pin_start,
    p_b_start=Pipe.pipe17.pout_start,
    T_start=Pipe.pipe17.Tin_start,
    m_flow_start=Pipe.pipe17.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{38,-4},{50,8}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe18(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={60,20})));
  Modelica.Fluid.Pipes.DynamicPipe pipe19(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={0,-50})));
  Modelica.Fluid.Pipes.DynamicPipe pipe20(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
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
        origin={-18,-66})));
  Modelica.Fluid.Pipes.DynamicPipe pipe21(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    length=Pipe.pipe21.L,
    diameter=Pipe.pipe21.Di,
    roughness=Pipe.pipe21.kappa,
    p_a_start=Pipe.pipe21.pin_start,
    p_b_start=Pipe.pipe21.pout_start,
    T_start=Pipe.pipe21.Tin_start,
    m_flow_start=Pipe.pipe21.m_flow_start,
    nNodes=3)
    annotation (Placement(transformation(extent={{-64,-4},{-52,8}})));
  Modelica.Fluid.Sources.MassFlowSource_T User5(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.035600,
    T=288.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-56,26},{-44,38}})));
  Modelica.Fluid.Sources.MassFlowSource_T User4(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.045489,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={32,48})));
  Modelica.Fluid.Sources.FixedBoundary SourceP1(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    p=150000,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={0,64})));
  Modelica.Fluid.Sources.FixedBoundary SourceP2(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    p=150000,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-78,2})));
  Modelica.Fluid.Sources.MassFlowSource_T User15(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.017800,
    T=288.15,                                      nPorts=1) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={60,36})));
  Modelica.Fluid.Sources.MassFlowSource_T User14(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.008900,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={83,-1})));
  Modelica.Fluid.Sources.MassFlowSource_T User13(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.006922,
    T=288.15,                                      nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={87,-75})));
  Modelica.Fluid.Sources.MassFlowSource_T User12(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.014833,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={103,-41})));
  Modelica.Fluid.Sources.MassFlowSource_T User11(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.009889,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={57,-29})));
  Modelica.Fluid.Sources.MassFlowSource_T User16(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.012856,
    T=288.15,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={19,-67})));
  Modelica.Fluid.Sources.MassFlowSource_T User17(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4,
    m_flow=-0.010878,
    T=288.15,                                      nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-45,-65})));
  inner Modelica.Fluid.System system(
    T_ambient=288.15,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start=0.03,
    use_eps_Re=false)
    annotation (Placement(transformation(extent={{-96,68},{-76,88}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={61,3})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-1,-63})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={87,-43})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={57,-41})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-37,29})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={31,29})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal6(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-39,-37})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    use_m_flow_in=true,
    T=288.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-100,-56},{-88,-44}})));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=1,
    height=0.005,
    offset=0,
    startTime=50)                                                                                           annotation (
    Placement(visible = true, transformation(origin={-118,-32},    extent={{-6,-6},
            {6,6}},                                                                                 rotation = 0)));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal7(redeclare package
      Medium = Modelica.Media.IdealGases.SingleGases.CH4) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-71,-61})));
equation
  connect(pipe10.port_a, pipe5.port_a)
    annotation (Line(points={{-42,-14},{-42,2},{-32,2}},color={0,127,255}));
  connect(pipe8.port_a, pipe5.port_a)
    annotation (Line(points={{-42,8},{-42,2},{-32,2}}, color={0,127,255}));
  connect(pipe21.port_b, pipe5.port_a)
    annotation (Line(points={{-52,2},{-32,2}}, color={0,127,255}));
  connect(pipe12.port_a, pipe19.port_a) annotation (Line(points={{6,-36},{0,-36},
          {0,-44}},                            color={0,127,255}));
  connect(pipe13.port_a, pipe19.port_a) annotation (Line(points={{-12,-36},{0,
          -36},{0,-44}},                       color={0,127,255}));
  connect(pipe7.port_b, pipe19.port_a) annotation (Line(points={{0,-32},{0,-44}},
                                                color={0,127,255}));
  connect(pipe12.port_b, pipe14.port_a)
    annotation (Line(points={{18,-36},{34,-36}}, color={0,127,255}));
  connect(pipe11.port_b, pipe14.port_a)
    annotation (Line(points={{28,-28},{28,-36},{34,-36}}, color={0,127,255}));
  connect(pipe6.port_b, pipe17.port_a)
    annotation (Line(points={{24,2},{38,2}}, color={0,127,255}));
  connect(pipe9.port_a, pipe17.port_a)
    annotation (Line(points={{28,8},{28,2},{38,2}}, color={0,127,255}));
  connect(pipe11.port_a, pipe17.port_a)
    annotation (Line(points={{28,-16},{28,2},{38,2}},color={0,127,255}));
  connect(pipe4.port_a, pipe3.port_a)
    annotation (Line(points={{-10,28},{8,28}}, color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a)
    annotation (Line(points={{0,38},{0,28},{8,28}}, color={0,127,255}));
  connect(pipe2.port_a, pipe3.port_a)
    annotation (Line(points={{0,24},{0,28},{8,28}}, color={0,127,255}));
  connect(pipe21.port_a, SourceP2.ports[1])
    annotation (Line(points={{-64,2},{-72,2}}, color={0,127,255}));
  connect(pipe18.port_b, User15.ports[1])
    annotation (Line(points={{60,26},{60,30}}, color={0,127,255}));
  connect(User13.ports[1], pipe16.port_b) annotation (Line(points={{87,-70},{87,
          -67},{88,-67},{88,-64}}, color={0,127,255}));
  connect(User17.ports[1], pipe20.port_b) annotation (Line(points={{-40,-65},{
          -40,-66},{-24,-66}}, color={0,127,255}));
  connect(SourceP1.ports[1], pipe1.port_a) annotation (Line(points={{
          -1.11022e-15,58},{-1.11022e-15,55},{1.11022e-15,55},{1.11022e-15,50}},
        color={0,127,255}));
  connect(teeJunctionIdeal.port_2, pipe18.port_a) annotation (Line(points={{61,
          8},{61,10},{60,10},{60,14}}, color={0,127,255}));
  connect(teeJunctionIdeal.port_3, pipe17.port_b)
    annotation (Line(points={{56,3},{56,2},{50,2}}, color={0,127,255}));
  connect(teeJunctionIdeal.port_1, User14.ports[1])
    annotation (Line(points={{61,-2},{78,-2},{78,-1}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_2, pipe20.port_a) annotation (Line(points={{-1,-68},
          {-8,-68},{-8,-66},{-12,-66}},      color={0,127,255}));
  connect(teeJunctionIdeal1.port_1, pipe19.port_b) annotation (Line(points={{-1,-58},
          {0,-58},{0,-56}},                            color={0,127,255}));
  connect(teeJunctionIdeal1.port_3, User16.ports[1]) annotation (Line(points={{4,-63},
          {8,-63},{8,-67},{14,-67}},        color={0,127,255}));
  connect(teeJunctionIdeal2.port_2, pipe16.port_a) annotation (Line(points={{87,-48},
          {87,-50},{88,-50},{88,-52}},      color={0,127,255}));
  connect(teeJunctionIdeal2.port_1, pipe15.port_b)
    annotation (Line(points={{87,-38},{87,-36},{82,-36}}, color={0,127,255}));
  connect(teeJunctionIdeal2.port_3, User12.ports[1])
    annotation (Line(points={{92,-43},{92,-41},{98,-41}}, color={0,127,255}));
  connect(teeJunctionIdeal3.port_3, User11.ports[1])
    annotation (Line(points={{57,-36},{57,-34}}, color={0,127,255}));
  connect(teeJunctionIdeal3.port_1, pipe14.port_b) annotation (Line(points={{52,-41},
          {50,-41},{50,-36},{46,-36}},      color={0,127,255}));
  connect(teeJunctionIdeal3.port_2, pipe15.port_a) annotation (Line(points={{62,-41},
          {66,-41},{66,-36},{70,-36}},      color={0,127,255}));
  connect(teeJunctionIdeal4.port_3, pipe8.port_b) annotation (Line(points={{-37,
          24},{-40,24},{-40,20},{-42,20}}, color={0,127,255}));
  connect(teeJunctionIdeal4.port_1, pipe4.port_b)
    annotation (Line(points={{-32,29},{-32,28},{-22,28}}, color={0,127,255}));
  connect(teeJunctionIdeal4.port_2, User5.ports[1])
    annotation (Line(points={{-42,29},{-44,29},{-44,32}}, color={0,127,255}));
  connect(pipe3.port_b, teeJunctionIdeal5.port_3)
    annotation (Line(points={{20,28},{20,29},{26,29}}, color={0,127,255}));
  connect(pipe9.port_b, teeJunctionIdeal5.port_1)
    annotation (Line(points={{28,20},{31,20},{31,24}}, color={0,127,255}));
  connect(teeJunctionIdeal5.port_2, User4.ports[1]) annotation (Line(points={{
          31,34},{31,38},{32,38},{32,42}}, color={0,127,255}));
  connect(teeJunctionIdeal6.port_1, pipe10.port_b) annotation (Line(points={{-39,-32},
          {-42,-32},{-42,-26}},          color={0,127,255}));
  connect(teeJunctionIdeal6.port_3, pipe13.port_b) annotation (Line(points={{-34,-37},
          {-29,-37},{-29,-36},{-24,-36}},          color={0,127,255}));
  connect(m_flow_H2.y, boundary.m_flow_in) annotation (Line(points={{-111.4,-32},
          {-100,-32},{-100,-45.2}},
                                  color={0,0,127}));
  connect(teeJunctionIdeal7.port_1, boundary.ports[1]) annotation (Line(points={{-76,-61},
          {-88,-61},{-88,-50}},            color={0,127,255}));
  connect(pipe5.port_b, pipe6.port_a)
    annotation (Line(points={{-20,2},{12,2}}, color={0,127,255}));
  connect(pipe2.port_b, pipe7.port_a) annotation (Line(points={{-1.11022e-15,12},
          {-1.11022e-15,-4},{1.11022e-15,-4},{1.11022e-15,-20}}, color={0,127,
          255}));
  connect(pipe5.port_b, teeJunctionIdeal7.port_3) annotation (Line(points={{-20,
          2},{-18,2},{-18,-12},{-71,-12},{-71,-56}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_2, pipe7.port_a) annotation (Line(points={{-66,
          -61},{-64,-61},{-64,-62},{-52,-62},{-52,-8},{1.11022e-15,-8},{
          1.11022e-15,-20}}, color={0,127,255}));
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
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end PaperCaseI_MSL_A;
