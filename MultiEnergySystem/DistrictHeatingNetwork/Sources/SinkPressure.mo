within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SinkPressure "Pressure sink for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Water.SourceP;

  // Water model
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp "Medium model" annotation (
    choicesAllMatching = true);


  // Definition of System
  outer System system "System wide properties";

  // Initial choices
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= if true, allow flow reversal" annotation (
    Evaluate=true, Dialog(group = "Choices"));

  // External input conditions
  parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation (
    Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_T0 = false "Use connector input for the temperature" annotation (
    Dialog(group="External inputs"), choices(checkBox=true));

  // Nominal parameters
  parameter Types.Pressure p0=1.01325e5 "Nominal pressure" annotation (
    Dialog(group = "Fluid parameters"));
  parameter Types.Temperature T0 = 298.15 "Nominal temperature" annotation (
    Dialog(group = "Fluid parameters"));
  parameter Types.HydraulicResistance R=0 "Hydraulic resistance" annotation (
    Evaluate=true, Dialog(group = "Fluid parameters"));

  // Variables
  //Medium.ThermodynamicState fluid "Actual fluid, including its variables";
  Medium fluid(T_start = T0, p_start = p0);

  Types.Pressure p "Actual pressure";
  Types.Temperature T "Actual temperature";
  Types.SpecificEnthalpy h "Actual specific enthalpy";

  // Outlet fluid connector
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
     Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));

  // Input connectors
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 "Externally supplied pressure" annotation (Placement(
        transformation(
        origin={-40,92},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={-40,84})));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 "Externally supplied temperature" annotation (Placement(transformation(
        origin={0,60},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={0,96})));

protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;

equation
  if R > 0 then
    inlet.p = p + inlet.m_flow*R;
  else
    inlet.p = p;
  end if;

  p = in_p0_internal;
  if not use_in_p0 then
    in_p0_internal = p0 "Pressure set by parameter";
  end if;

  T = in_T0_internal;
  if not use_in_T0 then
    in_T0_internal = T0 "Temperature set by parameter";
  end if;

  {fluid.p, fluid.T} = {p, T};

  inlet.h_out = h;

  h = fluid.h;

  // Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T0, in_T0_internal);

  annotation (
    Diagram(graphics),
    Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the incoming flowrate.</p>
<p>If <code>use_T</code> is false, the specific enthalpy is prescribed, otherwise the temperature is prescribed.</p>
<p>The pressure, specific enthalpy and temperature can be supplied from external inputs by setting to true the corresponding <code>use_in_XX</code> parameter and connecting an external signal to the input connector.</p>
</HTML>",
        revisions=""),
    __Dymola_UserMetaData(MetaData(category="User Meta Data")));
end SinkPressure;
