within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass;
partial model PartialValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.Valve;
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialHorizontalTwoPort(allowFlowReversal = true);
  import Modelica.Fluid.Utilities.regRoot;
  import Modelica.Fluid.Utilities.regStep;

  //-------------------------------
  // Declaration of fluid
  //-------------------------------
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  //-------------------------------
  // Valve Characteristics
  //-------------------------------
  parameter Types.PerUnit nomOpening = 1 "Nominal valve opening" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Types.PerUnit minimumOpening = 0.001 "Minimum opening area, avoid no flow condition" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Real Kv(unit = "m3/h") = 12 "Metri Flow Coefficient" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Components.Types.valveOpeningChar openingChar = Components.Types.valveOpeningChar.Linear "opening characteristic" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Real N = 50 "Rangeability factor (used for equal-percentage opening law)" annotation (
    Dialog(group = "Valve characteristics"));

  //-------------------------------
  // Nominal Conditions
  //-------------------------------
  parameter Modelica.Units.SI.PressureDifference dp_nom = 2e5 "Pressure drop between supply and return, as imposed by the differential pump" annotation (
    Dialog(group = "Nominal Conditions"));
  parameter Types.Density rho_nom = 1000 "Nominal fluid density at supply" annotation (
    Dialog(group = "Nominal Conditions"));
  parameter Real q_m3h_nom = 6 "Nominal volumetric flowrate in m3h" annotation (
    Dialog(group = "Nominal Conditions"));

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter Types.Temperature Tin_start = 20 + 273.15 annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pin_start = 2e5 annotation (
    Dialog(group = "Initialisation"));
  final parameter Modelica.Units.SI.PressureDifference dp_start = m_flow_start^2/(Av^2*rho_start) "Start value valve pressure drop" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Density rho_start = 985 "Start value fluid density at the inlet" annotation (
    Dialog(group = "Initialisation"));
  parameter Real q_m3h_start(unit = "m3/h") = 6 "Start value volumetric flowrate" annotation (
    Dialog(group = "Initialisation"));


  // Final parameters
  final parameter Types.MassFlowRate m_flow_start = q_start*rho_start;
  final parameter Types.MassFlowRate m_flow_nom = 2.7778e-5*Kv*sqrt(dp_nom)*sqrt(rho_start) "Peak mass flow rate at full opening";
  final parameter Types.VolumeFlowRate q_start = q_m3h_start/3600;
  final parameter Types.Temperature Tout_start =  Tin_start;
  final parameter Types.Pressure pout_start = pin_start - dp_nom;
  final parameter Types.Area Av = 2.7778e-5*Kv "Opening area of the valve";

  //-------------------------------
  // Fluid Variables
  //-------------------------------
  Types.MassFlowRate m_flow(start = m_flow_start) "Mass flow rate through the valve";
  Types.VolumeFlowRate q "Volumetric flow rate";
  Real q_m3h(unit = "m3/h") "Volumetric flow rate in m3/h";
  Types.Temperature Tin(start = Tin_start);
  Types.Temperature Tout(start = Tout_start);
  Types.Pressure pin(start = pin_start);
  Types.Pressure pout;
  Types.Pressure dp(start = dp_start);
  Types.Density rho(start = rho_start, nominal = rho_nom);

  // Medium
  Medium fluidIn(T_start = Tin_start, p_start = pin_start);
  Medium fluidOut(T_start = Tout_start, p_start = pout_start);

  // Inputs
  Modelica.Blocks.Interfaces.RealInput opening(max = 1, min = 0) "Valve Displacement" annotation (
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  m_flow = inlet.m_flow;

  // Energy balance
  outlet.h_out = inStream(inlet.h_out);
  inStream(outlet.h_out) = inlet.h_out;

  // Momentum balance
  if openingChar == Components.Types.valveOpeningChar.Linear then
    m_flow = homotopy((BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)*Av*regRoot(fluidIn.rho)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  elseif openingChar == Components.Types.valveOpeningChar.Quadratic then
    m_flow = homotopy((BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)*Av*regRoot(fluidIn.rho)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  elseif openingChar == Components.Types.valveOpeningChar.SquareRoot then
    m_flow = homotopy((BaseClass.ValveCharacteristics.squareRoot(opening) + minimumOpening)*Av*regRoot(fluidIn.rho)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.squareRoot(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  elseif openingChar == Components.Types.valveOpeningChar.EqualPercentage then
    m_flow = homotopy((BaseClass.ValveCharacteristics.equalPercentage(opening, N) + minimumOpening)*Av*regRoot(fluidIn.rho)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.equalPercentage(opening, N) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  end if;

  // Definition of fluids
  fluidIn.p = inlet.p;
  fluidIn.h = regStep(m_flow, inStream(inlet.h_out), inlet.h_out, m_flow_nom*1e-6);
  fluidOut.p = outlet.p;
  fluidOut.h = regStep(m_flow, outlet.h_out, inStream(outlet.h_out), m_flow_nom*1e-6);

  Tin = fluidIn.T;
  Tout = fluidOut.T;
  pin = fluidIn.p;
  pout = fluidOut.p;
  rho = fluidIn.rho;
  q = m_flow/fluidIn.rho;
  q_m3h = q*3600;
  dp = pin - pout;

  annotation (
    Icon, Documentation(info="<html>

  <h4>PartialValve – 2-Port Control Valve Base Model</h4>

  <p>This is a base class for two-port flow control valves with configurable opening laws. 
  It models pressure drop, mass flow rate, and thermodynamic conditions across the valve.</p>

  <h5>Features</h5>
  <ul>
    <li>Supports multiple valve characteristics (linear, quadratic, square-root, equal-percentage)</li>
    <li>Polynomial coefficient-free formulation using <code>Kv</code> (metric flow coefficient)</li>
    <li>Flow, pressure, and temperature dynamics included</li>
    <li>Fluid medium is customizable via replaceable model</li>
  </ul>

  <h5>Equations</h5>
  <ul>
    <li>Mass flow: <code>m_flow = f(opening, Δp)</code></li>
    <li>Enthalpy continuity: <code>h_out = h_in</code> (perfect mixing)</li
  </ul>

  <p>Extend this model to implement specific valve behaviors.</p>

</html>"));
end PartialValve;
