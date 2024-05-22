within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_MSL
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
    nNodes=3)                             annotation (Placement(transformation(
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
        origin={0,14})));
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
    annotation (Placement(transformation(extent={{-22,-4},{-10,8}})));
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
    annotation (Placement(transformation(extent={{6,-4},{18,8}})));
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
        origin={0,-8})));
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
        origin={-42,-8})));
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
        origin={28,-10})));
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
    annotation (Placement(transformation(extent={{6,-30},{18,-18}})));
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
        origin={-18,-24})));
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
    annotation (Placement(transformation(extent={{34,-30},{46,-18}})));
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
    annotation (Placement(transformation(extent={{70,-30},{82,-18}})));
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
        origin={88,-46})));
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
        origin={60,18})));
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
        origin={0,-38})));
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
        origin={-18,-52})));
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
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2)
    annotation (Placement(transformation(extent={{-54,22},{-42,34}})));
  Modelica.Fluid.Sources.MassFlowSource_T User4(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={28,34})));
  Modelica.Fluid.Sources.FixedBoundary SourceP1(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    p=50000,
    T=288.15) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={0,62})));
  Modelica.Fluid.Sources.FixedBoundary SourceP2(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    p=50000,
    T=288.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-78,2})));
  Modelica.Fluid.Sources.MassFlowSource_T User10(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2)
    annotation (Placement(transformation(extent={{-54,-30},{-42,-18}})));
  Modelica.Fluid.Sources.MassFlowSource_T User15(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=1) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={60,36})));
  Modelica.Fluid.Sources.MassFlowSource_T User14(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={75,3})));
  Modelica.Fluid.Sources.MassFlowSource_T User13(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={87,-63})));
  Modelica.Fluid.Sources.MassFlowSource_T User12(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={95,-25})));
  Modelica.Fluid.Sources.MassFlowSource_T User11(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={59,-19})));
  Modelica.Fluid.Sources.MassFlowSource_T User16(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=2) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={5,-51})));
  Modelica.Fluid.Sources.MassFlowSource_T User17(redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4, nPorts=1) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-45,-53})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CH4,
    use_m_flow_in=true,
    T=288.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-94,-38},{-84,-28}})));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=0,
    height=0.005,
    offset=0,
    startTime=50)                                                                                           annotation (
    Placement(visible = true, transformation(origin={-118,-16},    extent={{-4,-4},
            {4,4}},                                                                                 rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient=288.15)
    annotation (Placement(transformation(extent={{-96,68},{-76,88}})));
equation
  connect(pipe10.port_a, pipe5.port_a)
    annotation (Line(points={{-42,-2},{-42,2},{-22,2}}, color={0,127,255}));
  connect(pipe8.port_a, pipe5.port_a)
    annotation (Line(points={{-42,8},{-42,2},{-22,2}}, color={0,127,255}));
  connect(pipe21.port_b, pipe5.port_a)
    annotation (Line(points={{-52,2},{-22,2}}, color={0,127,255}));
  connect(pipe7.port_a, pipe2.port_b) annotation (Line(points={{0,-2},{0,8},{
          -1.11022e-15,8}}, color={0,127,255}));
  connect(pipe6.port_a, pipe2.port_b) annotation (Line(points={{6,2},{0,2},{0,8},
          {-1.11022e-15,8}}, color={0,127,255}));
  connect(pipe5.port_b, pipe2.port_b) annotation (Line(points={{-10,2},{0,2},{0,
          8},{-1.11022e-15,8}}, color={0,127,255}));
  connect(pipe12.port_a, pipe19.port_a) annotation (Line(points={{6,-24},{
          1.11022e-15,-24},{1.11022e-15,-32}}, color={0,127,255}));
  connect(pipe13.port_a, pipe19.port_a) annotation (Line(points={{-12,-24},{
          1.11022e-15,-24},{1.11022e-15,-32}}, color={0,127,255}));
  connect(pipe7.port_b, pipe19.port_a) annotation (Line(points={{0,-14},{0,-22},
          {1.11022e-15,-22},{1.11022e-15,-32}}, color={0,127,255}));
  connect(pipe12.port_b, pipe14.port_a)
    annotation (Line(points={{18,-24},{34,-24}}, color={0,127,255}));
  connect(pipe11.port_b, pipe14.port_a)
    annotation (Line(points={{28,-16},{28,-24},{34,-24}}, color={0,127,255}));
  connect(pipe6.port_b, pipe17.port_a)
    annotation (Line(points={{18,2},{38,2}}, color={0,127,255}));
  connect(pipe9.port_a, pipe17.port_a)
    annotation (Line(points={{28,8},{28,2},{38,2}}, color={0,127,255}));
  connect(pipe11.port_a, pipe17.port_a)
    annotation (Line(points={{28,-4},{28,2},{38,2}}, color={0,127,255}));
  connect(pipe4.port_a, pipe3.port_a)
    annotation (Line(points={{-10,28},{8,28}}, color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a)
    annotation (Line(points={{0,38},{0,28},{8,28}}, color={0,127,255}));
  connect(pipe2.port_a, pipe3.port_a)
    annotation (Line(points={{0,20},{0,28},{8,28}}, color={0,127,255}));
  connect(User5.ports[1], pipe8.port_b)
    annotation (Line(points={{-42,27.85},{-42,20}}, color={0,127,255}));
  connect(User5.ports[2], pipe4.port_b) annotation (Line(points={{-42,28.15},{
          -30,28.15},{-30,28},{-22,28}}, color={0,127,255}));
  connect(pipe3.port_b, User4.ports[1])
    annotation (Line(points={{20,28},{27.85,28}}, color={0,127,255}));
  connect(pipe9.port_b, User4.ports[2])
    annotation (Line(points={{28,20},{28,28},{28.15,28}}, color={0,127,255}));
  connect(pipe21.port_a, SourceP2.ports[1])
    annotation (Line(points={{-64,2},{-72,2}}, color={0,127,255}));
  connect(User10.ports[1], pipe10.port_b)
    annotation (Line(points={{-42,-24.15},{-42,-14}}, color={0,127,255}));
  connect(pipe13.port_b, User10.ports[2]) annotation (Line(points={{-24,-24},{
          -30,-24},{-30,-23.85},{-42,-23.85}}, color={0,127,255}));
  connect(pipe18.port_b, User15.ports[1])
    annotation (Line(points={{60,24},{60,30}}, color={0,127,255}));
  connect(pipe17.port_b, User14.ports[1]) annotation (Line(points={{50,2},{52,2},
          {52,3.125},{70,3.125}}, color={0,127,255}));
  connect(pipe18.port_a, User14.ports[2]) annotation (Line(points={{60,12},{60,
          2.875},{70,2.875}}, color={0,127,255}));
  connect(User13.ports[1], pipe16.port_b) annotation (Line(points={{87,-58},{87,
          -55},{88,-55},{88,-52}}, color={0,127,255}));
  connect(pipe15.port_b, User12.ports[1]) annotation (Line(points={{82,-24},{82,
          -24.875},{90,-24.875}}, color={0,127,255}));
  connect(pipe16.port_a, User12.ports[2]) annotation (Line(points={{88,-40},{88,
          -25.125},{90,-25.125}}, color={0,127,255}));
  connect(pipe14.port_b, User11.ports[1])
    annotation (Line(points={{46,-24},{58.875,-24}}, color={0,127,255}));
  connect(User11.ports[2], pipe15.port_a)
    annotation (Line(points={{59.125,-24},{70,-24}}, color={0,127,255}));
  connect(User17.ports[1], pipe20.port_b) annotation (Line(points={{-40,-53},{
          -40,-52},{-24,-52}}, color={0,127,255}));
  connect(pipe20.port_a, User16.ports[1]) annotation (Line(points={{-12,-52},{
          -8.88178e-16,-52},{-8.88178e-16,-50.875}}, color={0,127,255}));
  connect(User16.ports[2], pipe19.port_b) annotation (Line(points={{
          -8.88178e-16,-51.125},{-8.88178e-16,-44}}, color={0,127,255}));
  connect(pipe6.port_a, pipe7.port_a) annotation (Line(points={{6,2},{
          1.11022e-15,2},{1.11022e-15,-2}}, color={0,127,255}));
  connect(boundary.ports[1], pipe2.port_b) annotation (Line(points={{-84,-33},{
          -58,-33},{-58,-34},{-30,-34},{-30,-10},{-8,-10},{-8,-2},{-6,-2},{-6,2},
          {-1.11022e-15,2},{-1.11022e-15,8}}, color={0,127,255},
      thickness=0.5));
  connect(m_flow_H2.y, boundary.m_flow_in) annotation (Line(points={{-113.6,-16},
          {-94,-16},{-94,-29}}, color={0,0,127}));
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
end PaperCaseI_MSL;
