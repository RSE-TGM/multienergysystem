within MultiEnergySystem.H2GasFacility.Sources;
model SourceMassFlow
  extends DistrictHeatingNetwork.Icons.Gas.SourceW;
  // Replaceable Medium model
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPR                        constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
    "Medium model" annotation (
     choicesAllMatching = true);

  // Real Type Parameters
  parameter Types.Pressure p0 = 0.1e5 "Nominal pressure starting value";
  parameter Types.Temperature T0 = 15 + 273.15 "Nominal temperature and starting value for fluid";
  parameter Types.MassFraction X0[fluid.nX] "Nominal mass fraction and start value for fluid";
  parameter Types.MassFlowRate m_flow0 = 20 "Nominal mass flowrate";
  parameter Real G(unit = "kg/(s.Pa)") = 0 "HydraulicConductance";

  // Boolean Type  parameters
  parameter Boolean computeTransport = false "Used to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to calculate specific entropy";
  parameter Boolean computeEnthalpyWithFixedPressure = false "True if fluid enthalpy is computed with p_start";
  parameter Boolean computeEnergyVariables = false "Used to calculate HHV, WI, SG";
  parameter Boolean use_in_m_flow0 = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T0 = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_X0 = false "Use connector input for the mass fraction" annotation (
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
  Modelica.Blocks.Interfaces.RealInput in_X0[fluid.nX] if use_in_X0 annotation (Placement(
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

  // Fluid model initialization
  Medium fluid(
    p_start = p0,
    T_start = T0,
    X_start = X0,
    computeEntropy = computeEntropy,
    computeTransport = computeTransport,
    computeEnergyVariables = computeEnergyVariables);

  // Variables
  Types.MassFlowRate m_flow(start = m_flow0) "Actual mass flow rate";
  Types.Temperature T(start = T0) "Actual temperature";
  Types.Pressure p(start = p0) "Actual pressure";
  Types.MassFraction X[fluid.nX](start = X0) "Actual mass fraction";
  Types.SpecificEnthalpy h "Actual specific enthalpy";
  Types.Power E "Energy given to the grid";

protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
  Modelica.Blocks.Interfaces.RealInput in_X0_internal[fluid.nX];

equation
  // Mass flow rate is calculated based on external input or parameter value, with a pressure-dependent component if G > 0
  outlet.m_flow = -in_m_flow0_internal + (outlet.p - p0)*G "Mass Conservation";

  if use_in_m_flow0 == false then
    in_m_flow0_internal = m_flow0 "Flow rate set by parameter";
  end if;

  m_flow = in_m_flow0_internal;

  // Use external temperature input if enabled; otherwise, default to T0
  T = in_T0_internal;
  if use_in_T0 == false then
    in_T0_internal = T0 "Temperature set by parameter";
  end if;

  // Use external mass fraction input if enabled; otherwise, default to X0
  X = in_X0_internal;
  if use_in_X0 == false then
    in_X0_internal = X0 "Mass fraction set by parameter";
  end if;

  // Enthalpy calculations use either fixed or outlet pressure
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

  // Compute specific enthalpy and energy transfer
  h = outlet.h_out;
  E = m_flow*fluid.LHV_mix;

// Connect protected connectors to public conditional connectors
  connect(in_m_flow0, in_m_flow0_internal);
  connect(in_T0, in_T0_internal);
  connect(in_X0, in_X0_internal);
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">SourceMassFlow</span> model defines a mass flow source for gas flows. It operates as an ideal source with constant mass flow when G=0 or includes a pressure-dependent flow variation when G&gt;0.</p>
<h4>Modeling Options</h4>
<ul>
<li><b>External Inputs:</b> Enable external mass flow, temperature, or mass fraction inputs with <span style=\"font-family: Courier New;\">use_in_m_flow0</span>, <span style=\"font-family: Courier New;\">use_in_T0</span>, or <span style=\"font-family: Courier New;\">use_in_X0</span>. Otherwise, nominal values (<span style=\"font-family: Courier New;\">m_flow0</span>, <span style=\"font-family: Courier New;\">T0</span>, <span style=\"font-family: Courier New;\">X0</span>) are used.</li>
<li><b>Additional Calculations:</b> Optional flags compute transport properties, entropy, or energy variables.</li>
</ul>
<h4>Connections</h4>
<ul>
<li><b>Output:</b> Provides outlet mass flow, temperature, mass fraction, and specific enthalpy.</li>
<li><b>Inputs:</b> Conditional connectors for external inputs when enabled.</li>
</ul>
<h4>Usage</h4>
<p>Adapt G and input settings for energy systems and fluid networks requiring flexible mass flow control.</p>
</html>"));
end SourceMassFlow;
