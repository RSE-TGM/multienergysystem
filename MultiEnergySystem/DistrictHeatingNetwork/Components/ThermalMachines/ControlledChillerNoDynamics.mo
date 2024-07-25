within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledChillerNoDynamics
  extends DistrictHeatingNetwork.Icons.ThermalMachines.HeatPump;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Medium model"    annotation (
     choicesAllMatching = true);

  parameter Boolean use_in_Tout_cold_set = false "Use connector input for the pressure" annotation (
    Dialog(group="External inputs"), choices(checkBox=true));
  parameter DistrictHeatingNetwork.Types.PerUnit COP_nom = 2.7 "Nominal coefficient of performance";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_cold_start = 14 + 273.15 "Start/Nominal value for Cold side inlet temperature";
  final parameter DistrictHeatingNetwork.Types.Temperature Tout_cold_start = Tout_cold_nom "Start/Nominal value for Cold side outlet temperature";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_cold_nom = 8 + 273.15 "Nominal value at the outlet of the hot fluid";
  parameter DistrictHeatingNetwork.Types.Pressure pin_cold_start = 2e5 "Start/Nominal value for cold side inlet pressure";
  parameter DistrictHeatingNetwork.Types.Pressure dp_cold_start = 50e3 "Start/Nominal value for delta pressure in cold side";
  final parameter DistrictHeatingNetwork.Types.Pressure pout_cold_start = pin_cold_start - dp_cold_start "Start/Nominal value for Cold side outlet pressure";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_cold_start = 1 "Cold fluid mass flow rate";
  parameter Real k_cold(unit = "Pa/(kg/s)") = (pin_cold_start - pout_cold_start)/m_flow_cold_start "Pressure loss across the cold side";
  parameter DistrictHeatingNetwork.Types.Volume V = 0.1;

  DistrictHeatingNetwork.Types.Pressure pin_cold "Cold side inlet pressure";
  DistrictHeatingNetwork.Types.Pressure pout_cold "Cold side outlet pressure";

  DistrictHeatingNetwork.Types.Temperature Tin_cold(start = Tin_cold_start) "Cold side inlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold(start = Tout_cold_start) "Cold side outlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold_min "Minimum possible cold side outlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold_set "Actual set-point for the outlet cold temperature";

  DistrictHeatingNetwork.Types.SpecificEnthalpy hin_cold "Cold side inlet Specific Enthalpy";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_cold "Cold side outlet Specific Enthalpy";

  DistrictHeatingNetwork.Types.MassFlowRate m_flow_cold(start = m_flow_cold_start) "Cold fluid mass flow rate";
  DistrictHeatingNetwork.Types.VolumeFlowRate q_m3h_cold "Cold volumetric flow rate in m3h";
  //SI.PerUnit COP "Coefficient of performance";
  //SI.Power Pcomp "Compression Power";
  DistrictHeatingNetwork.Types.Power Pcold "Thermal Power cold side (cold source side)";
  //SI.Power Phot "Themal Power hot side (lato utenze)";
  DistrictHeatingNetwork.Types.Mass M;


  // Declaration of fluid models

  Medium fluidInCold(T_start = Tin_cold_start, p_start = pin_cold_start) "Cold inlet fluid";
  Medium fluidOutCold(T_start = Tout_cold_start, p_start = pout_cold_start) "Cold outlet fluid";


  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold annotation (
    Placement(visible = true, transformation(origin = {-76, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold annotation (
    Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_Tout_cold_set if use_in_Tout_cold_set "Externally supplied pressure" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={10,70}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,60})));
protected
  Modelica.Blocks.Interfaces.RealInput in_Tout_cold_set_internal;

equation
// Fluid Definition

  {fluidInCold.p, fluidInCold.h} = {pin_cold, hin_cold};
  {fluidOutCold.p, fluidOutCold.h} = {pout_cold, hout_cold};

// Assignation of name variables

  pin_cold = incold.p;
  pout_cold = outcold.p;
  hin_cold = inStream(incold.h_out);
  hout_cold = outcold.h_out;

  Tin_cold = fluidInCold.T;
  Tout_cold = fluidOutCold.T;
  m_flow_cold = incold.m_flow;
  q_m3h_cold = m_flow_cold/fluidInCold.rho;

// Ideal Controlled variables
  Tout_cold_min = min(Tout_cold_set, Tin_cold);
  Tout_cold = Tout_cold_min "Fixed hot side outlet temperature";

// Balance equation
  incold.m_flow + outcold.m_flow = 0 "Mass Balance cold side";
  M = V*fluidInCold.rho;
  //der(M) = incold.m_flow + outcold.m_flow;
  //pin_cold - pout_cold = k_cold*m_flow_cold  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.222802761867126*m_flow_cold -0.485096261101112)*1e5  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.2228*m_flow_cold -0.56)*1e5  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.243353*m_flow_cold - 0.76)*1e5  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.245867*m_flow_cold - 0.77)*1e5  "Momentum balance cold side";
  pin_cold - pout_cold = (0.2692545*m_flow_cold - 0.97)*1e5  "Momentum balance cold side";

  //pin_cold = pout_cold;
  Pcold = m_flow_cold*(hin_cold - hout_cold) "Themal Power Cold side";
//  Phot = Pcomp + Pcold "Energy Balance";
//Pcomp =  a[1]*m_flow_hot + a[2]*m_flow_cold + a[3]*Tin_cold + a[4]*m_flow_hot*Tin_cold + a[5]*m_flow_cold*Tin_cold + a[6]*m_flow_hot*m_flow_cold;
//  COP = Phot/Pcomp;
//COP = Tin_cold*a[1]+a[2];
// Dummy equations for energy balance

  incold.h_out = inStream(incold.h_out);

  // Definition of Tout_cold_set
  Tout_cold_set = in_Tout_cold_set_internal;
  if not use_in_Tout_cold_set then
    in_Tout_cold_set_internal = Tout_cold_nom "Pressure set by parameter";
  end if;

  // Connect protected connectors to public conditional connectors
  connect(in_Tout_cold_set, in_Tout_cold_set_internal);


  annotation (
    Icon);
end ControlledChillerNoDynamics;
