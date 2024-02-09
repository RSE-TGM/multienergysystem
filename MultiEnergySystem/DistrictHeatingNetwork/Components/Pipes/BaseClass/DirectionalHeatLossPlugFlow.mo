within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
model DirectionalHeatLossPlugFlow
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialRoundTube;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  // Parameter
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal "Nominal mass flow rate";
  parameter Modelica.Units.SI.Temperature T_start = 20 + 273.15;
  // Final parameters
  final parameter Real C = rho0 * Modelica.Constants.pi * (Di / 2) ^ 2 * cp "Thermal capacity per unit length of pipe";
  final parameter Real R = 1 / (lambdaIns * 2 * Modelica.Constants.pi / Modelica.Math.log((Di / 2 + tIns) / (Di / 2))) "Thermal resistance per unit length from fluid to boundary temperature";
  final parameter Modelica.Units.SI.Time tau_char = R * C "Characteristic delay time";

  // Variables
  Modelica.Units.SI.HeatFlowRate Q_flow "Heat flowing from the pipe";
  Modelica.Units.SI.Temperature T_a_inflow(start = T_start) "Temperature at port_a for inflowing fluid";
  Modelica.Units.SI.Temperature T_b_outflow(start = T_start) "Temperature at port_b for outflowing fluid";

  // Inputs
  Modelica.Blocks.Interfaces.RealInput tau(unit = "s") "Time delay at pipe level" annotation (
    Placement(visible = true, transformation(origin = {-98, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // No pressure drop
  inlet.p - outlet.p = 0;
  inlet.h_out = inStream(outlet.h_out);
  outlet.h_out = cp * T_b_outflow "Calculate enthalpy of output state";
  T_a_inflow = inStream(inlet.h_out) / cp;
  // Heat losses
  T_b_outflow = T_ext + (T_a_inflow - T_ext) * Modelica.Math.exp(-tau / tau_char);
  Q_flow = -Modelica.Media.Air.MoistAir.Utilities.spliceFunction(pos = (T_a_inflow - T_b_outflow) * cp, neg = 0, x = inlet.m_flow, deltax = m_flow_nominal / 1000) * inlet.m_flow;

annotation (
    Icon(graphics={  Line(origin = {-60, 28.7143}, points = {{0, -30}, {0, 30}}, color = {255, 0, 0}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 20), Line(origin = {60, 29.1429}, points = {{0, -30}, {0, 30}}, color = {255, 0, 0}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 20), Line(origin = {0, 28.7143}, points = {{0, -30}, {0, 30}}, color = {255, 0, 0}, thickness = 2, arrow = {Arrow.None, Arrow.Open}, arrowSize = 20)}));
end DirectionalHeatLossPlugFlow;
