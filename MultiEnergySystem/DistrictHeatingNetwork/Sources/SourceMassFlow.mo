within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SourceMassFlow "Mass flow rate source for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Water.SourceW;

  // Water model
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Default water medium model" annotation(choicesAllMatching = true);

  // Definition of System
  outer MultiEnergySystem.System system "System wide properties";

  // Initial Choices
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= if true, allow flow reversal" annotation (
    Evaluate=true, Dialog(group = "Choices"));
  parameter Boolean computeEnthalpyWithFixedPressure = false "True if fluid enthalpy is computed with p_start" annotation (
    Dialog(group = "Choices"));

  // External input conditions
  parameter Boolean use_in_m_flow = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));

  //Nominal parameters
  parameter Types.Pressure p0=7e6 "Nominal pressure starting value";
  parameter Types.Temperature T0=500 "Nominal temperature and starting value for fluid";
  parameter Types.MassFlowRate m_flow0=20 "Nominal mass flowrate";
  parameter Types.HydraulicConductance G=0 "HydraulicConductance";

  // Variables
  Types.MassFlowRate m_flow(start = m_flow0) "Actual mass flow rate";
  Types.Temperature T(start = T0) "Actual temperature";
  Types.Pressure p(start = p0) "Actual pressure";
  Types.SpecificEnthalpy h "Actual specific enthalpy";
  Medium fluid(T_start = T0, p_start = p0) "Actual fluid, including its variables";

  // Outlet fluid connector
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (Placement(
        visible=true,
        transformation(
          origin={100,0},
          extent={{-10,-10},{10,10}},
          rotation=0),
        iconTransformation(
          origin={100,-1.33227e-15},
          extent={{-20,-20},{20,20}},
          rotation=0)));

  // Input connectors
  Modelica.Blocks.Interfaces.RealInput in_m_flow if use_in_m_flow "Externally supplied mass flow" annotation (Placement(
        transformation(
        origin={-60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T "Externally supplied temperature" annotation (Placement(
        transformation(
        origin={0,50},
        extent={{10,-10},{-10,10}},
        rotation=90)));

protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;
equation
  outlet.m_flow = -in_m_flow_internal + (outlet.p - p0)*G "Mass Conservation";
  if use_in_m_flow == false then
    in_m_flow_internal = m_flow0 "Flow rate set by parameter";
  end if;
  m_flow = -outlet.m_flow;

  T = in_T_internal;
  if use_in_T == false then
    in_T_internal = T0 "Temperature set by parameter";
  end if;

  if computeEnthalpyWithFixedPressure then
    p = p0;
  else
    p = outlet.p;
  end if;

  //fluid = Medium.setState_pTX(p, T);
  fluid.p = p;
  fluid.T = T;

  h = outlet.h_out;
  outlet.h_out = fluid.h;

  // Connect protected connectors to public conditional connectors
  connect(in_m_flow, in_m_flow_internal);
  connect(in_T, in_T_internal);
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end SourceMassFlow;
