within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SinkPressure "Pressure sink for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Water.SourceP;
  
  // Water model
  //replaceable package Medium = Water constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(
  //  choicesAllMatching = true);
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
  
  // Definition of System
  outer System system "System wide properties";

  // Initial choices
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= if true, allow flow reversal" annotation(
    Evaluate=true, Dialog(group = "Choices"));
  parameter Boolean use_T = true "Use reference temperature if true, otherwise use specific enthalpy" annotation(
    Dialog(group = "Choices"));
  
  // External input conditions
  parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation(
    Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation(
    Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_h = false "Use connector input for the specific enthalpy" annotation(
    Dialog(group="External inputs"), choices(checkBox=true));  
  
  // Nominal parameters
  parameter Types.Pressure p0=1.01325e5 "Nominal pressure" annotation(
    Dialog(group = "Fluid parameters"));
  parameter Types.Temperature T0 = 298.15 "Nominal temperature" annotation(
    Dialog(enable = use_T and not use_in_T, group = "Fluid parameters"));
  parameter Types.SpecificEnthalpy h0=1e5 "Nominal specific enthalpy" annotation(
    Dialog(enable = not use_T and not use_in_h, group = "Fluid parameters"));
  parameter Types.HydraulicResistance R=0 "Hydraulic resistance" annotation (
    Evaluate=true, Dialog(group = "Fluid parameters"));  

  // Variables
  //Medium.ThermodynamicState fluid "Actual fluid, including its variables";
  Medium fluid(T_start = T0, p_start = p0);
  
  Types.Pressure p "Actual pressure";
  Types.SpecificEnthalpy h "Actual specific enthalpy";
  //Medium.AbsolutePressure p(start = p0) "Actual pressure";
  //Medium.SpecificEnthalpy h "Actual specific enthalpy";
  
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
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T "Externally supplied temperature" annotation (Placement(transformation(
        origin={0,60},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={0,96})));
  Modelica.Blocks.Interfaces.RealInput in_h if use_in_h "Externally supplied specific enthalpy" annotation (Placement(
        transformation(
        origin={40,90},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={42,84})));
protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;
  Modelica.Blocks.Interfaces.RealInput in_h_internal;

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

  if use_T then
//    inlet.h_out = Medium.specificEnthalpy_pTX(
//      inlet.p,
//      in_T_internal,
//      fill(0, 0));
    inlet.h_out = fluid.h;
  else
    inlet.h_out = in_h_internal "Enthalpy set by connector";
  end if;

  if not use_in_T then
    in_T_internal = T0 "Temperature set by parameter";
  end if;
  if not use_in_h then
    in_h_internal = h0 "Enthalpy set by parameter";
  end if;
  
  h = inlet.h_out;
  //fluid = Medium.setState_pTX(p, T0);
  fluid.p = p;
  fluid.T = T0;

  // Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T, in_T_internal);
  connect(in_h, in_h_internal);

  // Restrictions on modelling options
  assert(not (use_in_T and use_in_h), "Either temperature or specific enthalpy input");
  assert(not (use_T and use_in_h), "use_in_h required use_T = false");
  assert(not (not use_T and use_in_T), "use_in_T required use_T = true");
  annotation (
    Diagram(graphics),
    Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the incoming flowrate.</p>
<p>If <code>use_T</code> is false, the specific enthalpy is prescribed, otherwise the temperature is prescribed.</p>
<p>The pressure, specific enthalpy and temperature can be supplied from external inputs by setting to true the corresponding <code>use_in_XX</code> parameter and connecting an external signal to the input connector.</p>
</HTML>",
        revisions="<html>
<ul>
<li><i>09 Oct 2017</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Restructured and added temperature input.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
end SinkPressure;
