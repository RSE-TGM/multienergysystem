within MultiEnergySystem.H2GasFacility.Sources;
model SourcePressure "Pressure source for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Gas.SourceP;
  // Replaceable Medium model
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPR constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                                                                              "Medium model" annotation (
     choicesAllMatching = true);
  // Type definition for hydraulic resistance with predefined units and quantity
  type HydraulicResistance = Real(final quantity = "HydraulicResistance", final unit = "Pa/(kg/s)");

  // Nominal Parameters
  parameter Types.Pressure p0 = 1.01325e5 "Nominal pressure (Pa)";
  parameter Types.Temperature T0 = 25 + 273.15 "Nominal temperature (Kelvin)";
  parameter Types.MassFraction X0[fluid.nX] "Nominal mass fraction";
  parameter HydraulicResistance R = 0 "Hydraulic resistance, 0 implies ideal pressure source";

  // Boolean Parameters
  parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T0 = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_X0 = false "Use connector input for the mass fraction" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean computeTransport = true "Used to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to calculate the specific entropy";
  parameter Boolean computeEnergyVariables = false "Used to calculate HHV, SG & WI";

  // Variables for state and flow properties
  Types.Pressure p "Actual pressure";
  Types.Temperature T "Actual temperature";
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
  H2GasFacility.Interfaces.FluidPortOutlet outlet(nXi = fluid.nXi) annotation (
    Placement(transformation(extent = {{80, -20}, {120, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 "Externally supplied pressure" annotation (
    Placement(transformation(origin = {-40, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {-40, 84})));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 "Externally supplied temperature" annotation (
    Placement(visible = true, transformation(origin = {0, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {0, 96}, extent = {{-16, -16}, {16, 16}}, rotation = 270)));
  Modelica.Blocks.Interfaces.RealInput in_X0[fluid.nX] if use_in_X0 "Externally supplied mass fraction" annotation (
    Placement(visible = true, transformation(origin = {40, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {40, 84}, extent = {{-16, -16}, {16, 16}}, rotation = 270)));
protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
  Modelica.Blocks.Interfaces.RealInput in_X0_internal[fluid.nX];
equation
  // Assign outlet properties
  outlet.h_out = fluid.h;
  outlet.Xi = fluid.Xi;

  // Outlet pressure depends on hydraulic resistance and flow rate
  if R > 0 then
    outlet.p = p + outlet.m_flow*R; // Non-ideal pressure source.
  else
    outlet.p = p; // Ideal pressure source.
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
  // Variables
  m_flow = -outlet.m_flow; //Mass flow rate is the negative of the outlet flow rate
  // Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T0, in_T0_internal);
  connect(in_X0, in_X0_internal);
  annotation (
    Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">SourcePressure</span> model represents a pressure source for gas flows. It can function as an ideal source (constant outlet pressure) when the hydraulic resistance R=0, or a non-ideal source with flow-dependent pressure drop when R&gt;0.</p>
<h4>Modeling Options</h4>
<ul>
<li><b>External Inputs</b>: Pressure, temperature, and mass fraction can be supplied externally by setting <span style=\"font-family: Courier New;\">use_in_p0</span>, <span style=\"font-family: Courier New;\">use_in_T0</span>, or <span style=\"font-family: Courier New;\">use_in_X0</span> to <span style=\"font-family: Courier New;\">true</span>. Otherwise, nominal values (p0, T0, X0) are used.</li>
<li><b>Additional Calculations</b>: Optional flags enable the calculation of transport properties, specific entropy, and energy variables like HHV and Wobbe Index.</li>
</ul>
<h4>Connections</h4>
<ul>
<li><b>Output</b>: Provides outlet pressure, temperature, mass fraction, and flow rate.</li>
<li><b>Inputs</b> (Conditional): External connectors for pressure, temperature, and mass fraction when enabled.</li>
</ul>
<h4>Usage</h4>
<p>This model is suitable for energy systems and fluid networks where flexibility in source properties is required. Adjust R and input settings to fit your application.</p>
</html>",        revisions = "<html><head></head><body></body></html>"));
end SourcePressure;
