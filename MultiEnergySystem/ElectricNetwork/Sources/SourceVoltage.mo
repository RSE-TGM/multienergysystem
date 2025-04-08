within MultiEnergySystem.ElectricNetwork.Sources;
model SourceVoltage "Voltage source"
  extends Icons.SourceV;

  // Definition of System
  outer MultiEnergySystem.System system "System wide properties";

  // Initial choices
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= if true, allow flow reversal" annotation (
    Evaluate=true, Dialog(group = "Choices"));

  // External input conditions
  parameter Boolean use_in_v0 = false "Use connector input for the voltage" annotation (
    Dialog(group="External inputs"), choices(checkBox=true));

  // Nominal parameters
  parameter Modelica.Units.SI.Voltage v0=385 "Nominal voltage" annotation (Dialog(group="Fluid parameters"));

  // Variables
  //Medium.ThermodynamicState fluid "Actual fluid, including its variables";

  Modelica.Units.SI.Voltage v;

  // Outlet fluid connector
  Interfaces.ElectricPortOutlet outlet annotation (Placement(
    transformation(extent={{80,-20},{120,20}}, rotation=0)));

  // Input connectors
  Modelica.Blocks.Interfaces.RealInput in_v0 if use_in_v0 "Externally supplied Voltage"  annotation (Placement(
        transformation(
        origin={-40,92},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={-40,84})));


protected
  Modelica.Blocks.Interfaces.RealInput in_v0_internal;
equation
  outlet.v = v;

  v = in_v0_internal;
  if not use_in_v0 then
    in_v0_internal = v0 "Pressure set by parameter";
  end if;

  // Connect protected connectors to public conditional connectors
  connect(in_v0, in_v0_internal);

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
end SourceVoltage;
