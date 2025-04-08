within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SourcePressure "Pressure source for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Water.SourceP;

  // Water model
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Default water medium model" annotation(choicesAllMatching = true);

  // Definition of System
  outer MultiEnergySystem.System system "System wide properties";

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
  parameter Types.Temperature T0=298.15 "Nominal temperature" annotation (
    Dialog(group="Fluid parameters"));
  parameter Types.SpecificEnthalpy h0=1e5 "Nominal specific enthalpy" annotation (
    Dialog(group="Fluid parameters"));
  parameter Types.HydraulicResistance R=0 "Hydraulic resistance" annotation (
    Dialog(group="Fluid parameters"));

  // Variables
  //Medium.ThermodynamicState fluid "Actual fluid, including its variables";
  Medium fluid(T_start = T0, p_start = p0);
  //Medium.AbsolutePressure p "Actual pressure";
  //Medium.SpecificEnthalpy h "Actual specific enthalpy";
  Types.Pressure p;
  Types.Temperature T;
  Types.SpecificEnthalpy h;

  // Outlet fluid connector
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (Placement(
    transformation(extent={{80,-20},{120,20}}, rotation=0)));

  // Input connectors
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 "Externally supplied pressure" annotation (Placement(
        transformation(
        origin={-40,92},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={-40,84})));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 "Externally supplied temperature" annotation (Placement(
    visible = true,transformation(
        origin={0,60},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(origin = {40, 84}, extent = {{-16, -16}, {16, 16}}, rotation = 270)));

protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
equation
  if R > 0 then
    outlet.p = p +outlet.m_flow *R;
  else
    outlet.p = p;
  end if;

  p = in_p0_internal;
  if not use_in_p0 then
    in_p0_internal = p0 "Pressure set by parameter";
  end if;

  T = in_T0_internal;
  if not use_in_T0 then
    in_T0_internal = T0;
  end if;
  //in_T_internal = T0 "Temperature set by parameter";


  //fluid = Medium.setState_pTX(p, T0);
  fluid.p = p;
  fluid.T = T;

  h = fluid.h;

  outlet.h_out = h;

  // Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T0, in_T0_internal);

  annotation (
    Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
<p>If <code>use_T</code> is false, the specific enthalpy is prescribed, otherwise the temperature is prescribed.</p>
<p>The pressure, specific enthalpy and temperature can be supplied from external inputs by setting to true the corresponding <code>use_in_XX</code> parameter and connecting an external signal to the input connector.</p>
</HTML>",
        revisions=""), __Dymola_UserMetaData(MetaData(category="User Meta Data")));
end SourcePressure;
