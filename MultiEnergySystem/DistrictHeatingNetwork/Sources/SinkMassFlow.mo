within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SinkMassFlow "Mass flow rate sink for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Water.SourceW;
  
  // Water model
  //replaceable package Medium = Water constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(
  //  choicesAllMatching = true);
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
  
  // Definition of System
  outer System system "System wide properties";
  
  // Initial Choices
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= if true, allow flow reversal" annotation(
    Evaluate=true, Dialog(group = "Choices"));
  parameter Boolean computeEnthalpyWithFixedPressure = false "True if fluid enthalpy is computed with p_start" annotation(
    Dialog(group = "Choices"));

  // External input conditions
  parameter Boolean use_in_m_flow = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
    
  //Nominal Values
  parameter Types.Pressure pin_start = 8e6 "Pressure start value of outgoing fluid" annotation(
    Dialog(group = "Fluid parameters"));
  parameter Types.Pressure p0 = 7e6 "Pressure start value of outgoing fluid DIFFERENCE" annotation(
    Dialog(group = "Fluid parameters"));
  parameter Types.Temperature T0 = 500 "Nominal temperature and starting value for fluid" annotation(
    Dialog(group = "Fluid parameters"));
  parameter Types.MassFlowRate m_flow0 = 20 "Nominal mass flowrate" annotation(
    Dialog(group = "Fluid parameters"));
  parameter Types.HydraulicConductance G=0 "HydraulicConductance" annotation(
    Dialog(group = "Fluid parameters"));

  // Variables
  Types.MassFlowRate m_flow "Actual mass flow rate";
  Types.Temperature T "Actual temperature";
  Types.Pressure p "Actual pressure";
  Types.SpecificEnthalpy h "Actual specific enthalpy";
  //Medium.ThermodynamicState fluid "Actual fluid, including its variables";
  Medium fluid(T_start = T0, p_start = p0);

  // Outlet fluid connector
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (Placement(
        visible=true,
        transformation(
          origin={100,0},
          extent={{-10,-10},{10,10}},
          rotation=0),
        iconTransformation(
          origin={-100,-1.33227e-15},
          extent={{-20,-20},{20,20}},
          rotation=0)));

  // Input connectors
  Modelica.Blocks.Interfaces.RealInput in_m_flow if use_in_m_flow annotation (Placement(
        transformation(
        origin={-60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T annotation (Placement(
        transformation(
        origin={0,50},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  
protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;
equation
  inlet.m_flow = in_m_flow_internal + (inlet.p - p0)*G;
  if not use_in_m_flow then
    in_m_flow_internal = m_flow0 "Flow rate set by parameter";
  end if;
  m_flow = inlet.m_flow;
  
  T = in_T_internal;
  if use_in_T == false then
    in_T_internal = T0 "Temperature set by parameter";
  end if;
  
  //fluid = Medium.setState_pTX(p, T);
  fluid.p = p;
  fluid.T = T;
  
  h = inlet.h_out;
  //inlet.h_out = Medium.specificEnthalpy_pTX(inlet.p, in_T_internal, fill(0,0));
  inlet.h_out = fluid.h;
  p = inlet.p;

// Connect protected connectors to public conditional connectors
  connect(in_m_flow, in_m_flow_internal);
  connect(in_T, in_T_internal);

  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end SinkMassFlow;
