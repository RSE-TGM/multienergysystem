within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model SourcePressure "Pressure source for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Water.SourceP;
  replaceable package Medium =
      MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(choicesAllMatching = true);
  type HydraulicResistance = Real (
     final quantity="HydraulicResistance", final unit="Pa/(kg/s)");
  parameter Medium.AbsolutePressure p0=1.01325e5 "Nominal pressure";
  parameter HydraulicResistance R=0 "Hydraulic resistance";
  parameter Boolean use_T = false "Use the temperature if true, otherwise use specific enthalpy";
  parameter Medium.Temperature T = 298.15 "Nominal temperature" annotation(Dialog(enable = use_T and not use_in_T));
  parameter Medium.SpecificEnthalpy h=1e5 "Nominal specific enthalpy"   annotation(Dialog(enable = not use_T and not use_in_h));
//   parameter Boolean allowFlowReversal=system.allowFlowReversal
//     "= true to allow flow reversal, false restricts to design direction"  annotation(Evaluate=true);
  parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation(Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation(Dialog(group="External inputs"), choices(checkBox=true));
  parameter Boolean use_in_h = false "Use connector input for the specific enthalpy" annotation(Dialog(group="External inputs"), choices(checkBox=true));
  //outer ThermoPower.System system "System wide properties";
  Medium.AbsolutePressure p "Actual pressure";
  Medium.ThermodynamicState fluid;
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 annotation (Placement(
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
  Modelica.Blocks.Interfaces.RealInput in_h if use_in_h annotation (Placement(
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
    outlet.p = p +outlet.m_flow *R;
  else
    outlet.p = p;
  end if;

  p = in_p0_internal;
  if not use_in_p0 then
    in_p0_internal = p0 "Pressure set by parameter";
  end if;

  if use_T then
    outlet.h_out = Medium.specificEnthalpy_pTX(outlet.p, in_T_internal, fill(0,0));
  else
    outlet.h_out = in_h_internal "Enthalpy set by connector";
  end if;

  if not use_in_T then
    in_T_internal = T "Temperature set by parameter";
  end if;
  if not use_in_h then
    in_h_internal = h "Enthalpy set by parameter";
  end if;

  fluid = Medium.setState_pTX(p, T);

  // Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T, in_T_internal);
  connect(in_h, in_h_internal);

  // Restrictions on modelling options
  assert(not (use_in_T and use_in_h), "Either temperature or specific enthalpy input");
  assert(not (use_T and use_in_h), "use_in_h required use_T = false");
  assert(not (not use_T and use_in_T), "use_in_T required use_T = true");
  annotation (
    Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
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
end SourcePressure;
