within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledChillerNoDynamics
  extends DistrictHeatingNetwork.Icons.ThermalMachines.HeatPump;

  // Medium declaration
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Medium model"    annotation (
     choicesAllMatching = true);

  parameter Boolean use_in_Tout_cold_set = false "Use connector input for the pressure" annotation (
    Dialog(group="External inputs"), choices(checkBox=true));

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_cold_start = 14 + 273.15 "Start/Nominal value for Cold side inlet temperature";
  final parameter DistrictHeatingNetwork.Types.Temperature Tout_cold_start = Tout_cold_nom "Start/Nominal value for Cold side outlet temperature";
  parameter DistrictHeatingNetwork.Types.Pressure pin_cold_start = 2e5 "Start/Nominal value for cold side inlet pressure";
  parameter DistrictHeatingNetwork.Types.Pressure dp_cold_start = 50e3 "Start/Nominal value for delta pressure in cold side";
  final parameter DistrictHeatingNetwork.Types.Pressure pout_cold_start = pin_cold_start - dp_cold_start "Start/Nominal value for Cold side outlet pressure";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_cold_start = 1 "Cold fluid mass flow rate";
  parameter Real k_cold(unit = "Pa/(kg/s)") = (pin_cold_start - pout_cold_start)/m_flow_cold_start "Pressure loss across the cold side";

  //-------------------------------
  // Nominal parameters
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Volume V = 0.1;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_cold_nom = 8 + 273.15 "Nominal value at the outlet of the hot fluid";
  parameter DistrictHeatingNetwork.Types.Power Pth_nom = 200e3 "Thermal Nominal Power";
  parameter DistrictHeatingNetwork.Types.PerUnit COP_nom = 2.7 "Nominal coefficient of performance";


  outer DistrictHeatingNetwork.System system "system object for global defaults";

  DistrictHeatingNetwork.Types.Pressure pin_cold "Cold side inlet pressure";
  DistrictHeatingNetwork.Types.Pressure pout_cold "Cold side outlet pressure";
  DistrictHeatingNetwork.Types.Temperature Tin_cold(start = Tin_cold_start) "Cold side inlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold(start = Tout_cold_start) "Cold side outlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold_set "Actual set-point for the outlet cold temperature";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hin_cold "Cold side inlet Specific Enthalpy";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_cold "Cold side outlet Specific Enthalpy";
  DistrictHeatingNetwork.Types.MassFlowRate m_flow_cold(start = m_flow_cold_start) "Cold fluid mass flow rate";
  DistrictHeatingNetwork.Types.VolumeFlowRate q_m3h_cold "Cold volumetric flow rate in m3h";
  DistrictHeatingNetwork.Types.Power Pcold "Thermal Power cold side (cold source side)";
  DistrictHeatingNetwork.Types.Mass M;
  DistrictHeatingNetwork.Types.SpecificHeatCapacity cp "Outlet specific heat capacity of the fluid";

  // Declaration of fluid models
  Medium fluidIn(T_start = Tin_cold_start, p_start = pin_cold_start) "inlet fluid";
  Medium fluidOut(T_start = Tout_cold_start, p_start = pout_cold_start) "outlet fluid";


  // Reference Variables
  DistrictHeatingNetwork.Types.Power Pcold_ref "Reference value for computed Heat Power required";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_cold_ref "Reference required temperature";

  Medium fluidOut_ref(T_start = Tout_cold_start, p_start = pout_cold_start) "Reference outlet fluid";

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold annotation (
    Placement(visible = true, transformation(origin = {-76, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold annotation (
    Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_Tout_cold_set if use_in_Tout_cold_set
    "Externally supplied temperature"                                                                          annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={10,70}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,70})));
  Modelica.Blocks.Interfaces.BooleanInput cold_on annotation (Placement(
        transformation(extent={{110,-10},{70,30}}), iconTransformation(extent={{-120,-10},{-100,10}})));
protected
  Modelica.Blocks.Interfaces.RealInput in_Tout_cold_set_internal;

equation

  // Assign inlet/outlet values to fluid properties
  {fluidIn.p, fluidIn.h} = {pin_cold, hin_cold};
  {fluidOut.p, fluidOut.h} = {pout_cold, hout_cold};
  cp = fluidOut.cp;

  // Assign connector values to state variables
  pin_cold = incold.p;
  pout_cold = outcold.p;
  hin_cold = inStream(incold.h_out);
  hout_cold = outcold.h_out;
  Tin_cold = fluidIn.T;
  Tout_cold = fluidOut.T;
  m_flow_cold = incold.m_flow;
  q_m3h_cold = m_flow_cold/fluidIn.rho;

  // Mass and momentum balance
  incold.m_flow + outcold.m_flow = 0 "Mass Balance cold side";
  M = V*fluidIn.rho;
  pin_cold - pout_cold = (0.24522758*m_flow_cold -0.772359)*1e5  "Momentum balance cold side";

  // Energy balance
  M*cp*der(Tout_cold) = incold.m_flow*(hin_cold-hout_cold) - Pcold;
  Pcold = if cold_on then homotopy(min(Pcold_ref, Pth_nom),Pth_nom) else 40e3;

  // Reference values for outlet condition
  fluidOut_ref.p = pin_cold;
  fluidOut_ref.T = Tout_cold_set;
  hout_cold_ref = fluidOut_ref.h;
  0 = incold.m_flow*(-hout_cold_ref + hin_cold) - Pcold_ref;

  // Definition of Tout_cold_set
  Tout_cold_set = in_Tout_cold_set_internal;
  if not use_in_Tout_cold_set then
    in_Tout_cold_set_internal = Tout_cold_nom "Pressure set by parameter";
  end if;
  // Connect protected connectors to public conditional connectors
  connect(in_Tout_cold_set, in_Tout_cold_set_internal);

  // Dummy output to prevent warnings (no flow reversal assumed)
  incold.h_out = inStream(incold.h_out);

initial equation
  if initOpt == Choices.Init.Options.steadyState then
    der(Tout_cold) = 0;
  elseif initOpt == Choices.Init.Options.fixedState then
    Tout_cold = Tout_cold_start;
  else
//No initial equations
  end if;

  annotation (
    Icon, Documentation(info="<html>
<h2>ControlledChillerNoDynamics</h2>

<p>
This model represents a simplified chiller unit (cold-side) with no internal dynamics for the compressor. It calculates the cold-side thermal power as a function of a set-point temperature or fixed nominal value. It supports external control through an ON/OFF input signal and an optional reference signal for outlet temperature.
</p>

<h3>Key Features</h3>
<ul>
  <li>Cold-side fluid thermal dynamics included (energy balance with temperature derivative).</li>
  <li>Momentum balance for pressure loss across the cold side.</li>
  <li>External control signal for enabling or disabling the chiller.</li>
  <li>Optional external set-point for cold outlet temperature.</li>
  <li>Homotopy applied to power equation to enhance initialization robustness.</li>
</ul>

<h3>Parameters</h3>
<ul>
  <li><code>use_in_Tout_cold_set</code> (Boolean): Enables use of an external signal for the cold outlet temperature set-point.</li>
  <li><code>COP_nom</code> (PerUnit): Nominal coefficient of performance (not used in calculations but available for extension).</li>
  <li><code>Tin_cold_start</code> (K): Start value for cold side inlet temperature.</li>
  <li><code>Tout_cold_nom</code> (K): Nominal value for cold side outlet temperature.</li>
  <li><code>pin_cold_start</code> (Pa): Start value for cold side inlet pressure.</li>
  <li><code>dp_cold_start</code> (Pa): Nominal pressure drop across cold side.</li>
  <li><code>m_flow_cold_start</code> (kg/s): Nominal cold side mass flow rate.</li>
  <li><code>k_cold</code> (Pa/(kg/s)): Resistance coefficient (computed from pressure drop and mass flow).</li>
  <li><code>V</code> (m³): Volume of fluid on the cold side (for energy balance).</li>
  <li><code>initOpt</code>: Initialization option (steady state, fixed state, or free).</li>
</ul>

<h3>Connectors</h3>
<ul>
  <li><code>incold</code>: Fluid inlet for the cold side.</li>
  <li><code>outcold</code>: Fluid outlet for the cold side.</li>
  <li><code>in_Tout_cold_set</code>: Optional input for cold outlet temperature set-point (enabled by <code>use_in_Tout_cold_set</code>).</li>
  <li><code>cold_on</code>: Boolean ON/OFF control input for the chiller.</li>
</ul>

<h3>Equations</h3>
<ul>
  <li>Mass balance across cold side: <code>incold.m_flow + outcold.m_flow = 0</code></li>
  <li>Energy balance (thermal): <code>M·cp·der(Tout_cold) = incold.m_flow·(hin_cold - hout_cold) - Pcold</code></li>
  <li>Reference power for set-point tracking: <code>0 = incold.m_flow·(hin_cold - hout_cold_ref) - Pcold_ref</code></li>
</ul>

<h3>Initialization</h3>
<ul>
  <li>Steady state: <code>der(Tout_cold) = 0</code></li>
  <li>Fixed state: <code>Tout_cold = Tout_cold_start</code></li>
</ul>

<h3>Notes</h3>
<ul>
  <li>This model is simplified and assumes no dynamics in the compression or electrical sides.</li>
  <li>Power consumption and COP are not explicitly modeled but could be added in future extensions.</li>
  <li>InStream expressions are used for fluid properties, assuming no backflow on the cold side.</li>
</ul>

</html>"));
end ControlledChillerNoDynamics;
