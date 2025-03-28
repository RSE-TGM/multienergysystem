within MultiEnergySystem.H2GasFacility.Sources;
model SinkPressure "Pressure sink for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Gas.SourceP;
  // Replaceable Medium model
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPR constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                                                                              "Medium model" annotation (
     choicesAllMatching = true);
  type HydraulicResistance = Real(final quantity = "HydraulicResistance", final unit = "Pa/(kg/s)");

  // Real Parameters
  parameter Types.Pressure p0 = 1.01325e5 "Nominal pressure";
  parameter Types.Temperature T0 = 25 + 237.15 "Nominal temperature";
  parameter Types.MassFraction X0[fluid.nX] = fluid.X_start "Nominal mass fraction";
  parameter HydraulicResistance R = 0 "Hydraulic resistance" annotation (
    Evaluate = true);

  // Boolean Parameters
  parameter Boolean computeTransport = true "Used to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to to calculate specific entropy";
  parameter Boolean computeEnergyVariables = false "Used to calculate HHV, SG & WI";
  parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T0 = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_X0 = false "Use connector input for the mass fraction" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));

  // Variables
  Types.Pressure p(start = p0) "Actual pressure";
  Types.Temperature T(start = T0) "Actual temperature";
  Types.MassFraction X[fluid.nX] "Actual mass fraction";
  Types.MassFlowRate m_flow "Actual mass flow rate";
  // Fluid model initialization
  Medium fluid(
    T_start = T0,
    p_start = p0,
    X_start = X0,
    computeTransport = computeTransport,
    computeEntropy = computeEntropy,
    computeEnergyVariables = computeEnergyVariables);
  H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = fluid.nXi) annotation (
    Placement(transformation(extent = {{-120, -20}, {-80, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 "Externally supplied pressure" annotation (
    Placement(transformation(origin = {-40, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {-40, 84})));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 "Externally supplied temperature" annotation (
    Placement(transformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {0, 96})));
  Modelica.Blocks.Interfaces.RealInput in_X0[fluid.nX] if use_in_X0 "Externally supplied mass fraction" annotation (
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {40, 84}, extent = {{-16, -16}, {16, 16}}, rotation = 270)));
protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
  Modelica.Blocks.Interfaces.RealInput in_X0_internal[fluid.nX];
equation
  // Connector Balance: Assign inlet properties
  inlet.h_out = fluid.h;
  inlet.Xi = fluid.Xi;

  // Inlet pressure depends on hydraulic resistance and flow rate
  if R > 0 then
    inlet.p = p + inlet.m_flow*R;
  else
    inlet.p = p;
  end if;

  // Assign internal variables based on parameters or external inputs
  p = in_p0_internal;
  if not use_in_p0 then
    in_p0_internal = p0 "Pressure set by parameter";
  end if;
  T = in_T0_internal;
  if not use_in_T0 then
    in_T0_internal = T0 "Temperature set by parameter";
  end if;
  X = in_X0_internal;
  if not use_in_X0 then
    in_X0_internal = X0 "Mass fraction set by parameter";
  end if;
  // Fluid properties definition
  fluid.p = p;
  fluid.T = T;
  fluid.Xi = X[1:fluid.nXi];
  // Variables Definition
  m_flow = inlet.m_flow;
  // Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T0, in_T0_internal);
  connect(in_X0, in_X0_internal);
  annotation (
    Diagram(graphics),
    Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">SinkPressure</span> model represents a pressure sink for gas flows. It can act as an ideal sink (R=0) or a non-ideal sink with flow-dependent pressure rise (R&gt;0).</p>
<h4>Modeling Options</h4>
<ul>
<li><b>External Inputs:</b> Pressure, temperature, and mass fraction can be supplied externally by enabling <span style=\"font-family: Courier New;\">use_in_p0</span>, <span style=\"font-family: Courier New;\">use_in_T0</span>, or <span style=\"font-family: Courier New;\">use_in_X0</span>. Otherwise, nominal values (<span style=\"font-family: Courier New;\">p0</span>, <span style=\"font-family: Courier New;\">T0</span>, <span style=\"font-family: Courier New;\">X0</span>) are used.</li>
<li><b>Additional Calculations:</b> Optional flags enable the calculation of transport properties, specific entropy, and energy variables like HHV and Wobbe Index.</li>
</ul>
<h4>Connections</h4>
<ul>
<li><b>Input</b>: Receives inlet pressure, temperature, and mass fraction.</li>
<li><b>Output (Conditional)</b>: Internal connectors for pressure, temperature, and mass fraction when external inputs are enabled.</li>
</ul>
<h4>Usage</h4>
<p>This model is suitable for fluid networks requiring flexibility in sink properties. Adjust R and input settings to match your application.</p>
</html>",        revisions = "<html><head></head><body></body></html>"));
end SinkPressure;
