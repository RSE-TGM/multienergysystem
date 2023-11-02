within MultiEnergySystem.H2GasFacility.Sources;
model SourcePressure "Pressure source for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Gas.SourceP;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPR constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation (
     choicesAllMatching = true);
  type HydraulicResistance = Real(final quantity = "HydraulicResistance", final unit = "Pa/(kg/s)");

  // Nominal Parameters
  parameter Types.Pressure p0 = 1.01325e5 "Nominal pressure";
  parameter Types.Temperature T0 = 25 + 273.15 "Nominal temperature";
  parameter Types.MassFraction X0[fluid.nX] "Nominal mass fraction";
  parameter HydraulicResistance R = 0 "Hydraulic resistance";

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

  //Variables
  Types.Pressure p "Actual pressure";
  Types.Temperature T "Actual temperature";
  Types.MassFraction X[fluid.nX] "Actual mass fraction";
  Types.MassFlowRate m_flow "Actual mass flow rate";
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
  outlet.h_out = fluid.h;
  outlet.Xi = fluid.Xi;
  if R > 0 then
    outlet.p = p + outlet.m_flow*R;
  else
    outlet.p = p;
  end if;
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
// Fluid definition
  fluid.p = p;
  fluid.T = T;
  fluid.Xi = X[1:fluid.nXi];
// Variables Definition
  m_flow = -outlet.m_flow;
// Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T0, in_T0_internal);
  connect(in_X0, in_X0_internal);
  annotation (
    Documentation(info = "<html><head></head><body><p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
<p>The pressure, temperature and mass fraction vector can be supplied from external inputs by setting to true the corresponding <code>use_in_XX</code> parameter and connecting an external signal to the input connector.</p>
</body></html>", revisions = "<html><head></head><body></body></html>"));
end SourcePressure;
