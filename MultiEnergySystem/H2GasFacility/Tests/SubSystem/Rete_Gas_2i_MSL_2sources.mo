within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_MSL_2sources
  "PaperCaseII implemented using the Modelica Standard Library"
  replaceable package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4 constrainedby
    Modelica.Media.Interfaces.PartialMedium;

   parameter Types.MassFraction X_start[1]= Medium.X_default;

  Modelica.Fluid.Pipes.DynamicPipe s1(
    redeclare package Medium = Medium,
    length=842.777,
    diameter=2.091,
    roughness=1e-08,
    height_ab=-18,
    p_a_start=493000,
    p_b_start=491600,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.4,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-71,-23})));
  Modelica.Fluid.Sources.FixedBoundary SourceP1(
    redeclare package Medium = Medium,
    p(displayUnit="bar") = 493000,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-49,-23})));
  inner Modelica.Fluid.System system(
    T_ambient=288.15,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start=0.03,
    use_eps_Re=true)
    annotation (Placement(transformation(extent={{-148,130},{-128,150}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package
      Medium =                                                                          Medium) annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-41,48})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_7(
    redeclare package Medium = Medium,
    m_flow=-0.098685,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={124,92})));
  Modelica.Fluid.Pipes.DynamicPipe sds1(
    redeclare package Medium = Medium,
    length=3081.109,
    diameter=0.1603,
    roughness=1e-08,
    height_ab=-71,
    p_a_start=491600,
    p_b_start=488800,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.14706,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-95,-14})));
  Modelica.Fluid.Pipes.DynamicPipe sds2(
    redeclare package Medium = Medium,
    length=92.5,
    diameter=0.1472,
    roughness=1e-08,
    redeclare model FlowModel =
        Modelica.Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
    p_a_start=488800,
    p_b_start=488700,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.14706,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-85,0})));
  Modelica.Fluid.Pipes.DynamicPipe sds3(
    redeclare package Medium = Medium,
    length=677.303,
    diameter=01603,
    roughness=1e-08,
    height_ab=-14,
    p_a_start=488700,
    p_b_start=488100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.14706,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-57,0})));
  Modelica.Fluid.Pipes.DynamicPipe sds4(
    redeclare package Medium = Medium,
    length=433.985,
    diameter=0.1325,
    roughness=1e-08,
    height_ab=-8,
    p_a_start=488100,
    p_b_start=487000,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.14706,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,10})));
  Modelica.Fluid.Pipes.DynamicPipe sds6(
    redeclare package Medium = Medium,
    length=8027.812,
    diameter=0.1325,
    roughness=1e-08,
    height_ab=59,
    p_a_start=487000,
    p_b_start=467300,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.14706,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,27})));
  Modelica.Fluid.Pipes.DynamicPipe sds7(
    redeclare package Medium = Medium,
    length=2103.419,
    diameter=0.1325,
    roughness=1e-08,
    height_ab=19,
    p_a_start=467300,
    p_b_start=464900,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0987,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-8,51})));
  Modelica.Fluid.Pipes.DynamicPipe sds8(
    redeclare package Medium = Medium,
    length=13379.322,
    diameter=0.1325,
    roughness=1e-08,
    height_ab=-107,
    p_a_start=464900,
    p_b_start=437100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0987,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={123,73})));
  Modelica.Fluid.Pipes.DynamicPipe sds9(
    redeclare package Medium = Medium,
    length=193.484,
    diameter=0.1325,
    roughness=1e-08,
    height_ab=-8,
    p_a_start=467300,
    p_b_start=467200,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.04837,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,64})));
  Modelica.Fluid.Pipes.DynamicPipe sds10(
    redeclare package Medium = Medium,
    length=7.845,
    diameter=0.1079,
    roughness=1e-08,
    height_ab=-4,
    p_a_start=467200,
    p_b_start=467200,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0213,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-62,74})));
  Modelica.Fluid.Pipes.DynamicPipe sds11(
    redeclare package Medium = Medium,
    length=357.121,
    diameter=0.1079,
    roughness=1e-08,
    height_ab=-12,
    p_a_start=467200,
    p_b_start=467100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.02711,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,95})));
  Modelica.Fluid.Pipes.DynamicPipe sds12(
    redeclare package Medium = Medium,
    length=787.51,
    diameter=0.1079,
    roughness=1e-08,
    height_ab=40,
    p_a_start=467100,
    p_b_start=466900,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.02711,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-27,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds13(
    redeclare package Medium = Medium,
    length=190.14,
    diameter=0.0831,
    roughness=1e-08,
    height_ab=1,
    p_a_start=466900,
    p_b_start=466700,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.02711,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={1,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds15(
    redeclare package Medium = Medium,
    length=1015.74,
    diameter=0.0831,
    roughness=1e-08,
    height_ab=72,
    p_a_start=466700,
    p_b_start=466600,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0078,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={19,127})));
  Modelica.Fluid.Pipes.DynamicPipe sds14(
    redeclare package Medium = Medium,
    length=38.829,
    diameter=0.0831,
    roughness=1e-08,
    p_a_start=466700,
    p_b_start=466700,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0194,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={41,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds16(
    redeclare package Medium = Medium,
    length=194.511,
    diameter=0.0831,
    roughness=1e-08,
    height_ab=-1,
    p_a_start=467100,
    p_b_start=467100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.2,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-67,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds17(
    redeclare package Medium = Medium,
    length=1077.595,
    diameter=0.0831,
    roughness=1e-08,
    p_a_start=467100,
    p_b_start=467100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.2,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-95,113})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_6(
    redeclare package Medium = Medium,
    m_flow=-0.019358,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={70,114})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_5(
    redeclare package Medium = Medium,
    m_flow=-0.007765,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={18,144})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_4(
    redeclare package Medium = Medium,
    m_flow=-0.021261,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-88,74})));
  Modelica.Fluid.Sources.MassFlowSource_T Immissione_2(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    m_flow=0,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-126,112})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal2(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-41,78})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal3(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=0,
        origin={-43,112})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal4(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{5,5},{-5,-5}},
        rotation=180,
        origin={19,114})));
  Modelica.Fluid.Pipes.DynamicPipe s2(
    redeclare package Medium = Medium,
    length=3273.422,
    diameter=1.603,
    roughness=1e-08,
    height_ab=-42,
    p_a_start=491600,
    p_b_start=482100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.22601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-95,-39})));
  Modelica.Fluid.Pipes.DynamicPipe s3(
    redeclare package Medium = Medium,
    length=100.058,
    diameter=1.325,
    roughness=1e-08,
    p_a_start=482100,
    p_b_start=482100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-77,-55})));
  Modelica.Fluid.Pipes.DynamicPipe s4(
    redeclare package Medium = Medium,
    length=1663.921,
    diameter=1.325,
    roughness=1e-08,
    height_ab=-32,
    p_a_start=482100,
    p_b_start=468800,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-95,-73})));
  Modelica.Fluid.Pipes.DynamicPipe s8(
    redeclare package Medium = Medium,
    length=154.637,
    diameter=1.325,
    roughness=1e-08,
    height_ab=-11,
    p_a_start=468800,
    p_b_start=467600,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.22601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-87,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s9(
    redeclare package Medium = Medium,
    length=1.635,
    diameter=1.603,
    roughness=1e-08,
    height_ab=-1,
    p_a_start=467600,
    p_b_start=467100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-61,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s11(
    redeclare package Medium = Medium,
    length=503.188,
    diameter=1.603,
    roughness=1e-08,
    height_ab=31,
    p_a_start=467100,
    p_b_start=465600,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-39,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s12(
    redeclare package Medium = Medium,
    length=238.385,
    diameter=1.325,
    roughness=1e-08,
    height_ab=-11,
    p_a_start=465600,
    p_b_start=463600,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-15,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s14(
    redeclare package Medium = Medium,
    length=589.227,
    diameter=1.603,
    roughness=1e-08,
    height_ab=-5,
    p_a_start=463600,
    p_b_start=461800,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={9,-11})));
  Modelica.Fluid.Pipes.DynamicPipe s16(
    redeclare package Medium = Medium,
    length=19.065,
    diameter=1.603,
    roughness=1e-08,
    p_a_start=461800,
    p_b_start=461800,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={33,-11})));
  Modelica.Fluid.Pipes.DynamicPipe s18(
    redeclare package Medium = Medium,
    length=880.651,
    diameter=1.603,
    roughness=1e-08,
    height_ab=-1,
    p_a_start=461800,
    p_b_start=459100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.26601,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={53,-11})));
  Modelica.Fluid.Pipes.DynamicPipe s31(
    redeclare package Medium = Medium,
    length=256.081,
    diameter=0.1603,
    roughness=1e-08,
    height_ab=-2,
    p_a_start=459100,
    p_b_start=459100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0341,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={71,-23})));
  Modelica.Fluid.Pipes.DynamicPipe s36(
    redeclare package Medium = Medium,
    length=1224.898,
    diameter=0.0831,
    roughness=1e-08,
    height_ab=-11,
    p_a_start=459100,
    p_b_start=459100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.0341,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={59,-49})));
  Modelica.Fluid.Pipes.DynamicPipe s19(
    redeclare package Medium = Medium,
    length=540.807,
    diameter=1.472,
    roughness=1e-08,
    height_ab=-18,
    p_a_start=459100,
    p_b_start=457200,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.23194,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-21})));
  Modelica.Fluid.Pipes.DynamicPipe s20(
    redeclare package Medium = Medium,
    length=14.682,
    diameter=1.603,
    roughness=1e-08,
    height_ab=14,
    p_a_start=457200,
    p_b_start=457100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.23194,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-39})));
  Modelica.Fluid.Pipes.DynamicPipe s21(
    redeclare package Medium = Medium,
    length=13.074,
    diameter=0.831,
    roughness=1e-08,
    height_ab=-10,
    p_a_start=457100,
    p_b_start=456900,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1123,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={117,-51})));
  Modelica.Fluid.Pipes.DynamicPipe s22(
    redeclare package Medium = Medium,
    length=95.937,
    diameter=1.603,
    roughness=1e-08,
    height_ab=-3,
    p_a_start=457100,
    p_b_start=457100,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1196,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-71})));
  Modelica.Fluid.Pipes.DynamicPipe s24(
    redeclare package Medium = Medium,
    length=92.59,
    diameter=1.603,
    roughness=1e-08,
    height_ab=2,
    p_a_start=457100,
    p_b_start=457000,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1196,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-87})));
  Modelica.Fluid.Pipes.DynamicPipe s26(
    redeclare package Medium = Medium,
    length=181.028,
    diameter=1.325,
    roughness=1e-08,
    height_ab=-2,
    p_a_start=457000,
    p_b_start=456700,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1196,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={117,-95})));
  Modelica.Fluid.Pipes.DynamicPipe s28(
    redeclare package Medium = Medium,
    length=84.565,
    diameter=0.831,
    roughness=1e-08,
    height_ab=-2,
    p_a_start=456700,
    p_b_start=455000,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1196,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={137,-107})));
  Modelica.Fluid.Pipes.DynamicPipe s30(
    redeclare package Medium = Medium,
    length=138.527,
    diameter=0.831,
    roughness=1e-08,
    height_ab=-3,
    p_a_start=455000,
    p_b_start=454700,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=0.1196,
    nNodes=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={137,-125})));
  Modelica.Fluid.Sources.MassFlowSource_T Immissione_1(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    m_flow=0,
    T=288.15,
    X=X_start,
    nPorts=1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-56,-56})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_1(
    redeclare package Medium = Medium,
    m_flow=-0.112338,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={138,-50})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_2(
    redeclare package Medium = Medium,
    m_flow=-0.119588,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={132,-142})));
  Modelica.Fluid.Sources.MassFlowSource_T GRM_3(
    redeclare package Medium = Medium,
    m_flow=-0.034069,
    T=288.15,
    X=X_start,
    nPorts=1)                                                annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={42,-50})));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=60,
    height=0.09889,
    offset=0,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={56.5,26},     extent={{-4.5,-4},
            {4.5,4}},                                                                               rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=18000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={56.5,10},     extent={{-4.5,-4},
            {4.5,4}},                                                                               rotation=180)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-2,14})));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=60,
    height=0.09889,
    offset=0,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-181.5,102},  extent={{-4.5,-4},
            {4.5,4}},                                                                               rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=360,
    height=-0.09889,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-180.5,119},  extent={{-5.5,-5},
            {5.5,5}},                                                                               rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-154,108},{-144,118}})));
equation
  connect(s1.port_a, SourceP1.ports[1])
    annotation (Line(points={{-65,-23},{-55,-23}}, color={0,127,255}));
  connect(s1.port_b, sds1.port_a) annotation (Line(points={{-77,-23},{-95,-23},
          {-95,-20}}, color={0,127,255}));
  connect(sds1.port_b, sds2.port_a)
    annotation (Line(points={{-95,-8},{-95,0},{-91,0}}, color={0,127,255}));
  connect(sds2.port_b, sds3.port_a)
    annotation (Line(points={{-79,0},{-63,0}}, color={0,127,255}));
  connect(sds3.port_b, sds4.port_a)
    annotation (Line(points={{-51,0},{-41,0},{-41,4}}, color={0,127,255}));
  connect(sds4.port_b, sds6.port_a)
    annotation (Line(points={{-41,16},{-41,21}}, color={0,127,255}));
  connect(sds7.port_b, sds8.port_a)
    annotation (Line(points={{-2,51},{123,51},{123,67}}, color={0,127,255}));
  connect(sds8.port_b, GRM_7.ports[1]) annotation (Line(points={{123,79},{123,
          84},{124,84},{124,87}}, color={0,127,255}));
  connect(sds12.port_b, sds13.port_a)
    annotation (Line(points={{-21,113},{-5,113}}, color={0,127,255}));
  connect(sds17.port_a, sds16.port_b)
    annotation (Line(points={{-89,113},{-73,113}}, color={0,127,255}));
  connect(sds14.port_b, GRM_6.ports[1])
    annotation (Line(points={{47,113},{47,114},{65,114}}, color={0,127,255}));
  connect(sds15.port_b, GRM_5.ports[1])
    annotation (Line(points={{19,133},{18,133},{18,139}}, color={0,127,255}));
  connect(GRM_4.ports[1], sds10.port_b)
    annotation (Line(points={{-83,74},{-68,74}}, color={0,127,255}));
  connect(Immissione_2.ports[1], sds17.port_b) annotation (Line(points={{-121,
          112},{-106,112},{-106,113},{-101,113}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_2, sds9.port_a)
    annotation (Line(points={{-41,53},{-41,58}}, color={0,127,255}));
  connect(sds6.port_b, teeJunctionIdeal1.port_1)
    annotation (Line(points={{-41,33},{-41,43}}, color={0,127,255}));
  connect(teeJunctionIdeal1.port_3, sds7.port_a) annotation (Line(points={{-36,48},
          {-18,48},{-18,51},{-14,51}},     color={0,127,255}));
  connect(sds9.port_b, teeJunctionIdeal2.port_1) annotation (Line(points={{-41,
          70},{-40,70},{-40,73},{-41,73}}, color={0,127,255}));
  connect(teeJunctionIdeal2.port_2, sds11.port_a)
    annotation (Line(points={{-41,83},{-41,89}}, color={0,127,255}));
  connect(sds10.port_a, teeJunctionIdeal2.port_3) annotation (Line(points={{-56,
          74},{-50,74},{-50,78},{-46,78}}, color={0,127,255}));
  connect(sds16.port_a, teeJunctionIdeal3.port_1) annotation (Line(points={{-61,
          113},{-60,112},{-48,112}}, color={0,127,255}));
  connect(sds11.port_b, teeJunctionIdeal3.port_3) annotation (Line(points={{-41,
          101},{-40,101},{-40,107},{-43,107}}, color={0,127,255}));
  connect(teeJunctionIdeal3.port_2, sds12.port_a) annotation (Line(points={{-38,
          112},{-38,113},{-33,113}}, color={0,127,255}));
  connect(sds13.port_b, teeJunctionIdeal4.port_1)
    annotation (Line(points={{7,113},{8,114},{14,114}}, color={0,127,255}));
  connect(teeJunctionIdeal4.port_3, sds15.port_a)
    annotation (Line(points={{19,119},{19,121}}, color={0,127,255}));
  connect(teeJunctionIdeal4.port_2, sds14.port_a) annotation (Line(points={{24,
          114},{30,114},{30,113},{35,113}}, color={0,127,255}));
  connect(s2.port_a, sds1.port_a)
    annotation (Line(points={{-95,-33},{-95,-20}}, color={0,127,255}));
  connect(s2.port_b, s3.port_a) annotation (Line(points={{-95,-45},{-96,-45},{
          -96,-55},{-83,-55}}, color={0,127,255}));
  connect(s4.port_a, s3.port_a) annotation (Line(points={{-95,-67},{-96,-54},{
          -96,-55},{-83,-55}}, color={0,127,255}));
  connect(s4.port_b, s8.port_a) annotation (Line(points={{-95,-79},{-93,-79},{
          -93,-89}}, color={0,127,255}));
  connect(s8.port_b, s9.port_a)
    annotation (Line(points={{-81,-89},{-67,-89}}, color={0,127,255}));
  connect(s9.port_b, s11.port_a)
    annotation (Line(points={{-55,-89},{-45,-89}}, color={0,127,255}));
  connect(s11.port_b, s12.port_a)
    annotation (Line(points={{-33,-89},{-21,-89}}, color={0,127,255}));
  connect(s14.port_a, s12.port_b) annotation (Line(points={{3,-11},{-4,-11},{-4,
          -89},{-9,-89}}, color={0,127,255}));
  connect(s14.port_b, s16.port_a)
    annotation (Line(points={{15,-11},{27,-11}}, color={0,127,255}));
  connect(s16.port_b, s18.port_a)
    annotation (Line(points={{39,-11},{47,-11}}, color={0,127,255}));
  connect(s18.port_b, s31.port_a)
    annotation (Line(points={{59,-11},{71,-11},{71,-17}}, color={0,127,255}));
  connect(s31.port_b, s36.port_a)
    annotation (Line(points={{71,-29},{71,-49},{65,-49}}, color={0,127,255}));
  connect(s19.port_a, s18.port_b)
    annotation (Line(points={{95,-15},{95,-11},{59,-11}}, color={0,127,255}));
  connect(s19.port_b, s20.port_a)
    annotation (Line(points={{95,-27},{95,-33}}, color={0,127,255}));
  connect(s20.port_b, s21.port_a) annotation (Line(points={{95,-45},{96,-45},{
          96,-51},{111,-51}}, color={0,127,255}));
  connect(s20.port_b, s22.port_a)
    annotation (Line(points={{95,-45},{95,-65}}, color={0,127,255}));
  connect(s22.port_b, s24.port_a) annotation (Line(points={{95,-77},{96,-78},{
          95,-78},{95,-81}}, color={0,127,255}));
  connect(s24.port_b, s26.port_a) annotation (Line(points={{95,-93},{96,-93},{
          96,-98},{108,-98},{108,-95},{111,-95}}, color={0,127,255}));
  connect(s26.port_b, s28.port_a) annotation (Line(points={{123,-95},{137,-95},
          {137,-101}}, color={0,127,255}));
  connect(s28.port_b, s30.port_a)
    annotation (Line(points={{137,-113},{137,-119}}, color={0,127,255}));
  connect(s3.port_b, Immissione_1.ports[1]) annotation (Line(points={{-71,-55},
          {-66,-55},{-66,-56},{-61,-56}}, color={0,127,255}));
  connect(s21.port_b, GRM_1.ports[1]) annotation (Line(points={{123,-51},{128,
          -51},{128,-50},{133,-50}}, color={0,127,255}));
  connect(GRM_2.ports[1], s30.port_b)
    annotation (Line(points={{137,-142},{137,-131}}, color={0,127,255}));
  connect(s36.port_b, GRM_3.ports[1])
    annotation (Line(points={{53,-49},{54,-50},{47,-50}}, color={0,127,255}));
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{51.55,10},{51.55,10.4},
          {5.2,10.4}},  color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{51.55,26},{28,26},{28,
          17.6},{5.2,17.6}},
                        color={0,0,127}));
  connect(add.y, Immissione_1.m_flow_in) annotation (Line(points={{-8.6,14},{
          -12,14},{-12,10},{-22,10},{-22,-60},{-51,-60}}, color={0,0,127}));
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-174.45,119},{-160,
          119},{-160,116},{-155,116}},
                                  color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-176.55,102},{-162,
          102},{-162,110},{-155,110}},
                                  color={0,0,127}));
  connect(add1.y, Immissione_2.m_flow_in) annotation (Line(points={{-143.5,113},
          {-143.5,116},{-131,116}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{150,
            150}}),                                   graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{
            150,150}})),
    experiment(
      StopTime=90000,
      Interval=2,
      Tolerance=0.001,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_MSL_2sources;
