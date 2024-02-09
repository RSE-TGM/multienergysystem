within MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass;
model DirectionalHeatLossPlugFlow
  extends MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube;

  // Parameters
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal "Nominal mass flow rate";
  parameter Modelica.Units.SI.Temperature T_start = 20 + 273.15;

  // Final parameters
  // cp,rho0--> NG6_H2_Papay/PapayMixture
  final parameter Real R = 1 / (lambdaIns * 2 * Modelica.Constants.pi / Modelica.Math.log((Di / 2 + tIns) / (Di / 2))) "Thermal resistance per unit length from fluid to boundary temperature";

  // Variables
  Modelica.Units.SI.HeatFlowRate Q_flow "Heat flowing from the pipe";
  Modelica.Units.SI.Temperature T_a_inflow(start = T_start) "Temperature at inlet for inflowing fluid";
  Modelica.Units.SI.Temperature T_b_outflow(start = T_start) "Temperature at outlet for outflowing fluid";

  Real C "Thermal capacity per unit length of pipe";
  Modelica.Units.SI.Time tau_char "Characteristic delay time";

  // Inputs
  Modelica.Blocks.Interfaces.RealInput tau(unit="s")   "Time delay at pipe level" annotation (
    Placement(visible = true, transformation(origin={-100,80},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));

equation
  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = inStream(inlet.Xi);

  fluidOut.p = outlet.p;
  fluidOut.T = T_b_outflow;
  fluidOut.Xi = outlet.Xi;

  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // Mass composition balance
  inlet.Xi = inStream(outlet.Xi) "Not revelant";
  outlet.Xi = inStream(inlet.Xi);

  // No pressure drop
  inlet.p - outlet.p = 0;
  // Energy Balance
  inlet.h_out = inStream(outlet.h_out) "Not revelant";
  outlet.h_out = fluidOut.h;
  T_a_inflow = fluidIn.T;
  //outlet.h_out = cp * T_b_outflow "Calculate enthalpy of output state";
  //T_a_inflow = inStream(inlet.h_out) / cp;
  // Heat losses
  T_b_outflow = T_ext + (T_a_inflow - T_ext) * Modelica.Math.exp(-tau / tau_char);
  Q_flow = -Modelica.Media.Air.MoistAir.Utilities.spliceFunction(pos = (T_a_inflow - T_b_outflow) * fluidIn.cp, neg = 0, x = inlet.m_flow, deltax = m_flow_nominal / 1000) * inlet.m_flow;


  C = fluidIn.rho * Modelica.Constants.pi * (Di / 2) ^ 2 * fluidIn.cp;
  tau_char = R * C;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DirectionalHeatLossPlugFlow;
