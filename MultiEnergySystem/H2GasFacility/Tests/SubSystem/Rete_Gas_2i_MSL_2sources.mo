within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_MSL_2sources
  "PaperCaseII implemented using the Modelica Standard Library"
  replaceable package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4 constrainedby
    Modelica.Media.Interfaces.PartialMedium;

   parameter Types.MassFraction X_start[1]= Medium.X_default;
   parameter Integer nV = 5;

  Modelica.Fluid.Pipes.DynamicPipe s1(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s1.L,
    diameter=Data.PipelineData_2i.s1.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s1.h,
    p_a_start=Data.PipelineData_2i.s1.pin_start,
    p_b_start=Data.PipelineData_2i.s1.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s1.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_eps_Re=false)
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
    length=Data.PipelineData_2i.sds1.L,
    diameter=Data.PipelineData_2i.sds1.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds1.h,
    p_a_start=Data.PipelineData_2i.sds1.pin_start,
    p_b_start=Data.PipelineData_2i.sds1.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds1.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-95,-14})));
  Modelica.Fluid.Pipes.DynamicPipe sds2(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds2.L,
    diameter=Data.PipelineData_2i.sds2.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds2.h,
    redeclare model FlowModel =
        Modelica.Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
    p_a_start=Data.PipelineData_2i.sds2.pin_start,
    p_b_start=Data.PipelineData_2i.sds2.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds2.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-85,0})));
  Modelica.Fluid.Pipes.DynamicPipe sds3(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds3.L,
    diameter=Data.PipelineData_2i.sds3.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds3.h,
    p_a_start=Data.PipelineData_2i.sds3.pin_start,
    p_b_start=Data.PipelineData_2i.sds3.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds3.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-57,0})));
  Modelica.Fluid.Pipes.DynamicPipe sds4(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds4.L,
    diameter=Data.PipelineData_2i.sds4.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds4.h,
    p_a_start=Data.PipelineData_2i.sds4.pin_start,
    p_b_start=Data.PipelineData_2i.sds4.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds4.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,10})));
  Modelica.Fluid.Pipes.DynamicPipe sds6(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds6.L,
    diameter=Data.PipelineData_2i.sds6.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds6.h,
    p_a_start=Data.PipelineData_2i.sds6.pin_start,
    p_b_start=Data.PipelineData_2i.sds6.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds6.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,27})));
  Modelica.Fluid.Pipes.DynamicPipe sds7(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds7.L,
    diameter=Data.PipelineData_2i.sds7.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds7.h,
    p_a_start=Data.PipelineData_2i.sds7.pin_start,
    p_b_start=Data.PipelineData_2i.sds7.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds7.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-8,51})));
  Modelica.Fluid.Pipes.DynamicPipe sds8(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds8.L,
    diameter=Data.PipelineData_2i.sds8.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds8.h,
    p_a_start=Data.PipelineData_2i.sds8.pin_start,
    p_b_start=Data.PipelineData_2i.sds8.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds8.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={123,73})));
  Modelica.Fluid.Pipes.DynamicPipe sds9(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds9.L,
    diameter=Data.PipelineData_2i.sds9.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds9.h,
    p_a_start=Data.PipelineData_2i.sds9.pin_start,
    p_b_start=Data.PipelineData_2i.sds9.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds9.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,64})));
  Modelica.Fluid.Pipes.DynamicPipe sds10(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds10.L,
    diameter=Data.PipelineData_2i.sds10.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds10.h,
    p_a_start=Data.PipelineData_2i.sds10.pin_start,
    p_b_start=Data.PipelineData_2i.sds10.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds10.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-62,74})));
  Modelica.Fluid.Pipes.DynamicPipe sds11(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds11.L,
    diameter=Data.PipelineData_2i.sds11.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds11.h,
    p_a_start=Data.PipelineData_2i.sds11.pin_start,
    p_b_start=Data.PipelineData_2i.sds11.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds11.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-41,95})));
  Modelica.Fluid.Pipes.DynamicPipe sds12(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds12.L,
    diameter=Data.PipelineData_2i.sds12.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds12.h,
    p_a_start=Data.PipelineData_2i.sds12.pin_start,
    p_b_start=Data.PipelineData_2i.sds12.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds12.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-27,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds13(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds13.L,
    diameter=Data.PipelineData_2i.sds13.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds13.h,
    p_a_start=Data.PipelineData_2i.sds13.pin_start,
    p_b_start=Data.PipelineData_2i.sds13.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds13.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={1,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds15(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds15.L,
    diameter=Data.PipelineData_2i.sds15.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds15.h,
    p_a_start=Data.PipelineData_2i.sds15.pin_start,
    p_b_start=Data.PipelineData_2i.sds15.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds15.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={19,127})));
  Modelica.Fluid.Pipes.DynamicPipe sds14(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds14.L,
    diameter=Data.PipelineData_2i.sds14.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds14.h,
    p_a_start=Data.PipelineData_2i.sds14.pin_start,
    p_b_start=Data.PipelineData_2i.sds14.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds14.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={41,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds16(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds16.L,
    diameter=Data.PipelineData_2i.sds16.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds16.h,
    p_a_start=Data.PipelineData_2i.sds16.pin_start,
    p_b_start=Data.PipelineData_2i.sds16.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds16.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-67,113})));
  Modelica.Fluid.Pipes.DynamicPipe sds17(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.sds17.L,
    diameter=Data.PipelineData_2i.sds17.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.sds17.h,
    p_a_start=Data.PipelineData_2i.sds17.pin_start,
    p_b_start=Data.PipelineData_2i.sds17.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
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
    length=Data.PipelineData_2i.s2.L,
    diameter=Data.PipelineData_2i.s2.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s2.h,
    p_a_start=Data.PipelineData_2i.s2.pin_start,
    p_b_start=Data.PipelineData_2i.s2.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s2.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-95,-39})));
  Modelica.Fluid.Pipes.DynamicPipe s3(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s3.L,
    diameter=Data.PipelineData_2i.s3.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s3.h,
    p_a_start=Data.PipelineData_2i.s3.pin_start,
    p_b_start=Data.PipelineData_2i.s3.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s3.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-77,-55})));
  Modelica.Fluid.Pipes.DynamicPipe s4(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s4.L,
    diameter=Data.PipelineData_2i.s4.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s4.h,
    p_a_start=Data.PipelineData_2i.s4.pin_start,
    p_b_start=Data.PipelineData_2i.s4.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s4.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-95,-73})));
  Modelica.Fluid.Pipes.DynamicPipe s8(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s8.L,
    diameter=Data.PipelineData_2i.s8.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s8.h,
    p_a_start=Data.PipelineData_2i.s8.pin_start,
    p_b_start=Data.PipelineData_2i.s8.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s8.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-87,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s9(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s9.L,
    diameter=Data.PipelineData_2i.s9.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s9.h,
    p_a_start=Data.PipelineData_2i.s9.pin_start,
    p_b_start=Data.PipelineData_2i.s9.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s9.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-61,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s11(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s11.L,
    diameter=Data.PipelineData_2i.s11.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s11.h,
    p_a_start=Data.PipelineData_2i.s11.pin_start,
    p_b_start=Data.PipelineData_2i.s11.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s11.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-39,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s12(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s12.L,
    diameter=Data.PipelineData_2i.s12.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s12.h,
    p_a_start=Data.PipelineData_2i.s12.pin_start,
    p_b_start=Data.PipelineData_2i.s12.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s12.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-15,-89})));
  Modelica.Fluid.Pipes.DynamicPipe s14(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s14.L,
    diameter=Data.PipelineData_2i.s14.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s14.h,
    p_a_start=Data.PipelineData_2i.s14.pin_start,
    p_b_start=Data.PipelineData_2i.s14.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s14.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={9,-11})));
  Modelica.Fluid.Pipes.DynamicPipe s16(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s16.L,
    diameter=Data.PipelineData_2i.s16.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s16.h,
    p_a_start=Data.PipelineData_2i.s16.pin_start,
    p_b_start=Data.PipelineData_2i.s16.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s16.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={33,-11})));
  Modelica.Fluid.Pipes.DynamicPipe s18(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s18.L,
    diameter=Data.PipelineData_2i.s18.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s18.h,
    p_a_start=Data.PipelineData_2i.s18.pin_start,
    p_b_start=Data.PipelineData_2i.s18.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s18.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
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
    nNodes=nV)
              annotation (Placement(transformation(
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
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={59,-49})));
  Modelica.Fluid.Pipes.DynamicPipe s19(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s19.L,
    diameter=Data.PipelineData_2i.s19.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s19.h,
    p_a_start=Data.PipelineData_2i.s19.pin_start,
    p_b_start=Data.PipelineData_2i.s19.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s19.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-21})));
  Modelica.Fluid.Pipes.DynamicPipe s20(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s20.L,
    diameter=Data.PipelineData_2i.s20.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s20.h,
    p_a_start=Data.PipelineData_2i.s20.pin_start,
    p_b_start=Data.PipelineData_2i.s20.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s20.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-39})));
  Modelica.Fluid.Pipes.DynamicPipe s21(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s21.L,
    diameter=Data.PipelineData_2i.s21.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s21.h,
    p_a_start=Data.PipelineData_2i.s21.pin_start,
    p_b_start=Data.PipelineData_2i.s21.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s21.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={117,-51})));
  Modelica.Fluid.Pipes.DynamicPipe s22(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s22.L,
    diameter=Data.PipelineData_2i.s22.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s22.h,
    p_a_start=Data.PipelineData_2i.s22.pin_start,
    p_b_start=Data.PipelineData_2i.s22.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s22.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-71})));
  Modelica.Fluid.Pipes.DynamicPipe s24(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s24.L,
    diameter=Data.PipelineData_2i.s24.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s24.h,
    p_a_start=Data.PipelineData_2i.s24.pin_start,
    p_b_start=Data.PipelineData_2i.s24.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s24.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={95,-87})));
  Modelica.Fluid.Pipes.DynamicPipe s26(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s26.L,
    diameter=Data.PipelineData_2i.s26.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s26.h,
    p_a_start=Data.PipelineData_2i.s26.pin_start,
    p_b_start=Data.PipelineData_2i.s26.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s26.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={117,-95})));
  Modelica.Fluid.Pipes.DynamicPipe s28(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s28.L,
    diameter=Data.PipelineData_2i.s28.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s28.h,
    p_a_start=Data.PipelineData_2i.s28.pin_start,
    p_b_start=Data.PipelineData_2i.s28.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s28.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={137,-107})));
  Modelica.Fluid.Pipes.DynamicPipe s30(
    redeclare package Medium = Medium,
    length=Data.PipelineData_2i.s30.L,
    diameter=Data.PipelineData_2i.s30.Di,
    roughness=1e-08,
    height_ab=Data.PipelineData_2i.s30.h,
    p_a_start=Data.PipelineData_2i.s30.pin_start,
    p_b_start=Data.PipelineData_2i.s30.pout_start,
    T_start=288.15,
    X_start=X_start,
    m_flow_start=Data.PipelineData_2i.s30.m_flow_start,
    nNodes=nV)
              annotation (Placement(transformation(
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
    duration=60,
    height=-0.09889,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-180.5,119},  extent={{-5.5,-5},
            {5.5,5}},                                                                               rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-154,108},{-144,118}})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal6(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-95,-56})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal7(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={73,-10})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal8(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={95,-56})));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal5(redeclare package
      Medium = Medium)                                                                          annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-103,-26})));
equation
  connect(s1.port_a, SourceP1.ports[1])
    annotation (Line(points={{-65,-23},{-55,-23}}, color={0,127,255}));
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
  connect(s31.port_b, s36.port_a)
    annotation (Line(points={{71,-29},{71,-49},{65,-49}}, color={0,127,255}));
  connect(s19.port_b, s20.port_a)
    annotation (Line(points={{95,-27},{95,-33}}, color={0,127,255}));
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
  connect(teeJunctionIdeal6.port_2, s4.port_a)
    annotation (Line(points={{-95,-61},{-95,-67}}, color={0,127,255}));
  connect(teeJunctionIdeal6.port_1, s2.port_b)
    annotation (Line(points={{-95,-51},{-95,-45}}, color={0,127,255}));
  connect(teeJunctionIdeal6.port_3, s3.port_a) annotation (Line(points={{-90,
          -56},{-90,-55},{-83,-55}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_1, s18.port_b) annotation (Line(points={{73,-5},
          {74,-5},{74,0},{64,0},{64,-11},{59,-11}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_2, s31.port_a)
    annotation (Line(points={{73,-15},{74,-17},{71,-17}}, color={0,127,255}));
  connect(teeJunctionIdeal7.port_3, s19.port_a)
    annotation (Line(points={{78,-10},{95,-10},{95,-15}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_2, s22.port_a) annotation (Line(points={{95,
          -61},{96,-62},{95,-62},{95,-65}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_3, s21.port_a) annotation (Line(points={{100,
          -56},{106,-56},{106,-51},{111,-51}}, color={0,127,255}));
  connect(teeJunctionIdeal8.port_1, s20.port_b) annotation (Line(points={{95,
          -51},{95,-47.5},{95,-47.5},{95,-45}}, color={0,127,255}));
  connect(teeJunctionIdeal5.port_1, sds1.port_a) annotation (Line(points={{-103,
          -21},{-102,-20},{-95,-20}}, color={0,127,255}));
  connect(teeJunctionIdeal5.port_3, s1.port_b) annotation (Line(points={{-98,
          -26},{-82,-26},{-82,-23},{-77,-23}}, color={0,127,255}));
  connect(teeJunctionIdeal5.port_2, s2.port_a) annotation (Line(points={{-103,
          -31},{-102,-33},{-95,-33}}, color={0,127,255}));
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
      Interval=1,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_MSL_2sources;
