within MultiEnergySystem.H2GasFacility.Sources;
model SinkMassFlow
  extends DistrictHeatingNetwork.Icons.Gas.SourceW;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPR                        constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
    "Medium model"  annotation(choicesAllMatching=true);

  // Nominal Values
  parameter Types.Pressure pin_start = 8e6 "Pressure start value of outgoing fluid";
  parameter Types.Pressure p0 = 1e5 "Pressure start value of outgoing fluid DIFFERENCE";
  parameter Types.Temperature T0 = 15 + 273.15 "Nominal temperature and starting value for fluid";
  parameter Types.MassFraction X0[fluid.nX] "Nominal mass fraction";
  parameter Types.MassFlowRate m_flow0 = 20 "Nominal mass flowrate";
  parameter Types.HydraulicConductance G=1000 "Hydraulic Conductance";
  final parameter Types.MassFraction[fluid.nXi] Xi_start = X0[1:fluid.nXi] "Nominal mass fraction of independent variables";

  // Boolean Parameters
  parameter Boolean computeTransport = false "Used to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to calculate specific entropy";
  parameter Boolean computeEnergyVariables = false "Used to calculate HHV, SG & WI";
  parameter Boolean use_in_m_flow0 = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T0 = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_X0 = false "Use connector input for the composition" annotation (
  Dialog(group="External inputs"), choices(checkBox=true));

  // Fluid model initialization
  Medium fluid(
    T_start = T0,
    p_start = p0,
    X_start = X0,
    computeTransport = computeTransport,
    computeEntropy = computeEntropy,
    computeEnergyVariables = computeEnergyVariables);

  // Variables
  Types.MassFlowRate m_flow "Actual mass flow rate";
  Types.Temperature T "Actual temperature";
  Types.Pressure p "Actual pressure";
  Types.MassFraction X[fluid.nX] "Actual mass fraction";
  Types.SpecificEnthalpy h "Actual specific enthalpy";

  Modelica.Blocks.Interfaces.RealInput in_m_flow0 if use_in_m_flow0 annotation (Placement(
        transformation(
        origin={-60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 annotation (Placement(
        transformation(
        origin={0,50},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput in_X0[fluid.nX] if use_in_X0 annotation (Placement(
        transformation(
        origin={60,50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = fluid.nXi)  annotation (Placement(
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
  Modelica.Blocks.Interfaces.RealInput in_m_flow0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
  Modelica.Blocks.Interfaces.RealInput in_X0_internal[fluid.nX];

equation
  // Mass flow rate is calculated based on external input or parameter value, with a pressure-dependent component if G > 0
  inlet.m_flow = in_m_flow0_internal + (inlet.p - p0)*G;

  if not use_in_m_flow0 then
    in_m_flow0_internal = m_flow0 "Flow rate set by parameter";
  end if;
  m_flow = inlet.m_flow;

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

  // Fluid Definition
  fluid.p = p;
  fluid.T = T;
  fluid.Xi = X[1:fluid.nXi];

  // Connector balance
  inlet.h_out = fluid.h;
  inlet.Xi = fluid.Xi;
  inlet.p = fluid.p;

  h = inlet.h_out;

// Connect protected connectors to public conditional connectors
  connect(in_m_flow0, in_m_flow0_internal);
  connect(in_T0, in_T0_internal);
  connect(in_X0, in_X0_internal);

  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Documentation(info="<html>
<p><span style=\"font-family: Arial;\">The&nbsp;</span><span style=\"font-family: Courier New;\">SourceMassFlow</span><span style=\"font-family: Arial;\">&nbsp;model defines a mass flow source for gas flows. It operates as an ideal source with constant mass flow when G=0 or includes a pressure-dependent flow variation when G&gt;0.</span></p>
<p><b><span style=\"font-family: Arial; color: #008000;\">Modeling Options</span></b></p>
<ul>
<li><b><span style=\"font-family: Arial;\">External Inputs:</b>&nbsp;Enable external mass flow, temperature, or mass fraction inputs with&nbsp;</span><span style=\"font-family: Courier New;\">use_in_m_flow0</span><span style=\"font-family: Arial;\">,&nbsp;</span><span style=\"font-family: Courier New;\">use_in_T0</span><span style=\"font-family: Arial;\">, or&nbsp;</span><span style=\"font-family: Courier New;\">use_in_X0</span><span style=\"font-family: Arial;\">. Otherwise, nominal values (</span><span style=\"font-family: Courier New;\">m_flow0</span><span style=\"font-family: Arial;\">,&nbsp;</span><span style=\"font-family: Courier New;\">T0</span><span style=\"font-family: Arial;\">,&nbsp;</span><span style=\"font-family: Courier New;\">X0</span><span style=\"font-family: Arial;\">) are used.</span></li>
<li><b><span style=\"font-family: Arial;\">Additional Calculations:</b>&nbsp;Optional flags compute transport properties, entropy, or energy variables.</span></li>
</ul>
<p><b><span style=\"font-family: Arial; color: #008000;\">Connections</span></b></p>
<ul>
<li><b><span style=\"font-family: Arial;\">Output:</b>&nbsp;Provides outlet mass flow, temperature, mass fraction, and specific enthalpy.</span></li>
<li><b><span style=\"font-family: Arial;\">Inputs:</b>&nbsp;Conditional connectors for external inputs when enabled.</span></li>
</ul>
<p><b><span style=\"font-family: Arial; color: #008000;\">Usage</span></b></p>
<p><span style=\"font-family: Arial;\">Adapt G and input settings for energy systems and fluid networks requiring flexible mass flow control.</span></p>
</html>"));
end SinkMassFlow;
