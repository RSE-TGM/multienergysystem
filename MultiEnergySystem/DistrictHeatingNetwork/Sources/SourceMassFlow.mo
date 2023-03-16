within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SourceMassFlow
  extends DistrictHeatingNetwork.Icons.Water.SourceW;
  replaceable package Medium =
      MultiEnergySystem.DistrictHeatingNetwork.Media.StandardWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(choicesAllMatching = true);
  //Nominal Values
  parameter SI.Pressure p0=7e6 "Nominal pressure starting value";
  parameter SI.Temperature T0=500 "Nominal temperature and starting value for fluid";
  parameter SI.MassFlowRate m_flow0=20 "Nominal mass flowrate";
  parameter Real G=0 "HydraulicConductance";
  parameter Boolean computeEnthalpyWithFixedPressure = false "True if fluid enthalpy is computed with p_start";
  parameter Boolean use_in_m_flow = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  Modelica.Blocks.Interfaces.RealInput in_m_flow if use_in_m_flow annotation (Placement(
        transformation(
        origin={-60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T annotation (Placement(
        transformation(
        origin={0,50},
        extent={{10,-10},{-10,10}},
        rotation=90)));
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
  SI.MassFlowRate m_flow(start = m_flow0) "Actual mass flow rate";
  SI.Temperature T(start = T0) "Actual temperature";
  SI.Pressure p(start = p0) "Actual pressure";
  SI.SpecificEnthalpy h "Actual specific enthalpy";
  Medium.ThermodynamicState fluid;
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
  
  fluid = Medium.setState_pTX(p, T);
  
  h = outlet.h_out;
  outlet.h_out = Medium.specificEnthalpy_pTX(outlet.p, in_T_internal, fill(0,0));

  // Connect protected connectors to public conditional connectors
  connect(in_m_flow, in_m_flow_internal);
  connect(in_T, in_T_internal);
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end SourceMassFlow;
