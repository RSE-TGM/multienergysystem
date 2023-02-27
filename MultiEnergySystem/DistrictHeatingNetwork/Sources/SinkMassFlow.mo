within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SinkMassFlow
  extends DistrictHeatingNetwork.Icons.Water.SourceW;
  replaceable package Medium =
      MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(choicesAllMatching = true);
  //Nominal Values
  parameter SI.Pressure pin_start = 8e6 "Pressure start value of outgoing fluid";
  parameter SI.Pressure p0 = 7e6 "Pressure start value of outgoing fluid DIFFERENCE";
  parameter SI.Temperature T0 = 500 "Nominal temperature and starting value for fluid";
  parameter SI.MassFlowRate w0 = 20 "Nominal mass flowrate";
  parameter Real G=0 "HydraulicConductance";
  parameter Boolean use_in_m_flow = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  SI.MassFlowRate m_flow "Actual mass flow rate";
  SI.Temperature T "Actual temperature";
  SI.Pressure p "Actual pressure";
  SI.SpecificEnthalpy h "Actual specific enthalpy";
  Medium.ThermodynamicState fluid;

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
protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;
equation
  inlet.m_flow = in_m_flow_internal + (inlet.p - p0)*G;
  if not use_in_m_flow then
    in_m_flow_internal = w0 "Flow rate set by parameter";
  end if;
  m_flow = inlet.m_flow;
  
  T = in_T_internal;
  if use_in_T == false then
    in_T_internal = T0 "Temperature set by parameter";
  end if;
  
  fluid = Medium.setState_pTX(p, T);
  
  h = inlet.h_out;
  inlet.h_out = Medium.specificEnthalpy_pTX(inlet.p, in_T_internal, fill(0,0));
  p = inlet.p;

// Connect protected connectors to public conditional connectors
  connect(in_m_flow, in_m_flow_internal);
  connect(in_T, in_T_internal);

  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end SinkMassFlow;
