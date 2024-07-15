within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass;
partial model PartialThreeWayValve "Partial model for the implementation of three-way valve models"
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.ThreeWayValve;
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialHorizontalTwoPort(allowFlowReversal = true);

  //-------------------------------
  // Declaration of fluid
  //-------------------------------
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;


  //-------------------------------
  // General Parameters
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.PerUnit nomOpening = 1 "Nominal valve opening" annotation (
    Dialog(group = "Valve characteristics"));
  parameter DistrictHeatingNetwork.Types.PerUnit minimumOpening = 0.001 "Minimum opening area, avoid no flow condition, default 3mm diameter" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Real Kv(unit = "m3/h") = 12 "Metri Flow Coefficient" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Components.Types.valveOpeningChar openingChar = Components.Types.valveOpeningChar.Linear "opening characteristic" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Modelica.Units.SI.PressureDifference dp_nom = 2e5 "Pressure drop between supply and return, as imposed by the differential pump";
  parameter DistrictHeatingNetwork.Types.Density rho_nom = 1000 "Nominal fluid density at supply";
  parameter Real q_m3h_nom = 6 "Nominal volumetric flowrate in m3h";

  //-------------------------------
  // Start Values
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start = 20 + 273.15 annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_start = 2e5 annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Density rho_start = 985 "Start value fluid density at the inlet" annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start1 = 20 + 273.15 annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_start1 = pin_start annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Density rho_start1 = 985 "Start value fluid density at the inlet" annotation (
    Dialog(group = "Initialisation"));
  parameter Real q_m3h_start(unit = "m3/h") = 6 "Start value for total volumetric flowrate" annotation (
    Dialog(group = "Initialisation"));
  parameter Real q_q1_start = 0.5 "Start value for proportion of volumetric flowrate between the two inputs" annotation (
    Dialog(group = "Initialisation"));
  final parameter Real q_m3h_start_valve(unit = "m3/h") = q_m3h_start*(q_q1_start /(q_q1_start + 1));
  final parameter Real q_m3h_start_valve1(unit = "m3/h") = q_m3h_start*(1/(q_q1_start + 1));
  //final parameter Modelica.Units.SI.PressureDifference dp_start = m_flow_start^2/(Av^2*rho_start) "Start value valve pressure drop" annotation (
  //  Dialog(group = "Initialisation"));


  //-------------------------------
  // Variables
  //-------------------------------
  DistrictHeatingNetwork.Types.MassFlowRate m_flow1;
  DistrictHeatingNetwork.Types.MassFlowRate m_flow2;
  DistrictHeatingNetwork.Types.MassFlowRate m_flow3;


  //-------------------------------
  //   Components
  //-------------------------------
  replaceable PartialValve partialValve(
    redeclare model Medium = Medium,
    nomOpening=nomOpening,
    minimumOpening=minimumOpening,
    Kv=Kv,
    openingChar=openingChar,
    rho_nom=rho_nom,
    Tin_start=Tin_start,
    pin_start=pin_start,
    rho_start=rho_start,
    q_m3h_start=q_m3h_start_valve)
                         "Representation of one valve in a three-way valve representation" annotation (Placement(transformation(extent={{-74,-18},{-38,18}})));
  replaceable PartialValve partialValve1(redeclare model Medium = Medium,
    nomOpening=nomOpening,
    minimumOpening=minimumOpening,
    Kv=Kv,
    openingChar=openingChar,
    rho_nom=rho_nom,
    Tin_start=Tin_start1,
    pin_start=pin_start1,
    rho_start=rho_start1,
    q_m3h_start=q_m3h_start_valve1)                                       "Representation of one valve in a three-way valve representation" annotation (Placement(transformation(
        extent={{18,-18},{-18,18}},
        rotation=90,
        origin={0,-48})));
  Modelica.Blocks.Interfaces.RealInput opening(max=1, min=0) "Valve Displacement" annotation (
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin={0,80},    extent = {{-20, -20}, {20, 20}}, rotation = 270)));
  Interfaces.FluidPortOutlet outlet2(m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
    annotation (Placement(transformation(origin={0,-100}, extent={{-10,-10},{10,10}}), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-10,56},{10,36}})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-38,36},{-18,56}})));
equation
  m_flow1 = inlet.m_flow;
  m_flow2 =-outlet2.m_flow;
  m_flow3 = -outlet.m_flow;
  connect(opening, feedback.u2) annotation (Line(points={{0,90},{0,54}}, color={0,0,127}));
  connect(const.y, feedback.u1) annotation (Line(points={{-17,46},{-8,46}}, color={0,0,127}));
  connect(partialValve.opening, feedback.u2) annotation (Line(points={{-56,14.4},{-56,60},{0,60},{0,54}}, color={0,0,127}));
  connect(partialValve1.outlet, outlet2) annotation (Line(
      points={{-9.99201e-16,-66},{-9.99201e-16,-83},{0,-83},{0,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(feedback.y, partialValve1.opening) annotation (Line(points={{9,46},{14,46},{14,20},{-32,20},{-32,-48},{-14.4,-48}}, color={0,0,127}));
  connect(inlet, partialValve.inlet) annotation (Line(
      points={{-100,0},{-74,0}},
      color={140,56,54},
      thickness=0.5));
  connect(partialValve.outlet, outlet) annotation (Line(
      points={{-38,0},{100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(partialValve1.inlet, outlet) annotation (Line(
      points={{0,-30},{0,0},{100,0}},
      color={140,56,54},
      thickness=0.5));
end PartialThreeWayValve;
