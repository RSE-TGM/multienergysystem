within MultiEnergySystem.H2GasFacility.Sources;
model SourceMassFlow
  extends DistrictHeatingNetwork.Icons.Gas.SourceW;
  replaceable package Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPR constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
    "Medium model" annotation(
     choicesAllMatching = true);
  // Real Type Parameters
  parameter Types.Pressure p0 = 0.1e5 
    "Nominal pressure starting value";
  parameter Types.Temperature T0 = 15 + 273.15 
    "Nominal temperature and starting value for fluid";
  parameter Types.MassFraction X0[fluid.nX]
    "Nominal mass fraction and start value for fluid";
  parameter Types.MassFlowRate m_flow0 = 20 
    "Nominal mass flowrate";
  parameter Real G(unit = "kg/(s.Pa)") = 0 
    "HydraulicConductance";
  
  // Boolean Type  parameters
  parameter Boolean computeTransport = false
    "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false
    "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEnthalpyWithFixedPressure = false 
    "True if fluid enthalpy is computed with p_start";
  parameter Boolean use_in_m_flow0 = false 
    "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T0 = false 
    "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_X0 = false 
    "Use connector input for the mass fraction" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));  
  
  // Connectors
  Modelica.Blocks.Interfaces.RealInput in_m_flow0 if use_in_m_flow0 annotation (Placement(
        transformation(
        origin={-60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 annotation (Placement(
        transformation(
        origin={0,50},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput in_X0[fluid.nX] if use_in_X0 annotation( Placement(
  visible = true, transformation(origin = {60, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 90), iconTransformation(origin = {60, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  H2GasFacility.Interfaces.FluidPortOutlet outlet(nXi = fluid.nXi) annotation (Placement(
        visible=true,
        transformation(
          origin={100,0},
          extent={{-10,-10},{10,10}},
          rotation=0),
        iconTransformation(
          origin={100,-1.33227e-15},
          extent={{-20,-20},{20,20}},
          rotation=0)));
  
  // Fluid model
  Medium fluid(p_start = p0, T_start = T0, X_start = X0, computeEntropy = computeEntropy, computeTransport = computeTransport);
  
  // Variables
  Types.MassFlowRate m_flow(start = m_flow0)
    "Actual mass flow rate";
  Types.Temperature T(start = T0)
    "Actual temperature";
  Types.Pressure p(start = p0)
    "Actual pressure";
  Types.MassFraction X[fluid.nX](start = X0)
    "Actual mass fraction";    
  Types.SpecificEnthalpy h 
    "Actual specific enthalpy";

protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
  Modelica.Blocks.Interfaces.RealInput in_X0_internal[fluid.nX];

equation

  outlet.m_flow = -in_m_flow0_internal + (outlet.p - p0)*G "Mass Conservation";
  
  if use_in_m_flow0 == false then
    in_m_flow0_internal = m_flow0 "Flow rate set by parameter";
  end if;
  
  m_flow = in_m_flow0_internal;

  T = in_T0_internal;
  if use_in_T0 == false then
    in_T0_internal = T0 "Temperature set by parameter";
  end if;

  X = in_X0_internal;
  if use_in_X0 == false then
    in_X0_internal = X0 "Mass fraction set by parameter";
  end if;

  if computeEnthalpyWithFixedPressure then
    p = p0;
  else
    p = outlet.p;
  end if;
  
  // Fluid Definition
  fluid.p = p;
  fluid.T = T;
  fluid.Xi = X[1:fluid.nXi];
  
  // Connector balance
  outlet.h_out = fluid.h;
  outlet.Xi = fluid.Xi;
  
  h = outlet.h_out;

// Connect protected connectors to public conditional connectors
  connect(in_m_flow0, in_m_flow0_internal);
  connect(in_T0, in_T0_internal);
  connect(in_X0, in_X0_internal);
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end SourceMassFlow;
