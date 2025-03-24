within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ChillerNoDynamics
  extends DistrictHeatingNetwork.Icons.ThermalMachines.HeatPump;
  //replaceable package Medium =
  //    MultiEnergySystem.DistrictHeatingNetwork.Media.StandardWater                          constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation (
  //   choicesAllMatching = true);
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp "Medium model" annotation (
     choicesAllMatching = true);
  // Declaration of fluid models

  Medium fluidInCold(T_start = Tin_cold_start, p_start = pin_cold_start) "Cold inlet fluid";
  Medium fluidOutCold(T_start = Tout_cold_start, p_start = pout_cold_start) "Cold outlet fluid";
  parameter SI.PerUnit COP_nom = 2.7 "Nominal coefficient of performance";
  parameter SI.Temperature Tin_cold_start = 14 + 273.15 "Start/Nominal value for Cold side inlet temperature";
  final parameter SI.Temperature Tout_cold_start = Tout_cold_set "Start/Nominal value for Cold side outlet temperature";
  parameter SI.Temperature Tout_cold_set = 8 + 273.15 "Nominal value at the outlet of the hot fluid";
  parameter SI.Pressure pin_cold_start = 2e5 "Start/Nominal value for Cold side inlet pressure";
  parameter SI.Pressure dp_cold_start = 50e3 "Start/Nominal value for delta pressure in cold side";
  final parameter SI.Pressure pout_cold_start = pin_cold_start - dp_cold_start "Start/Nominal value for Cold side outlet pressure";
  parameter SI.MassFlowRate m_flow_cold_start = 1 "Cold fluid mass flow rate";
  parameter Real k_cold(unit = "Pa/(kg/s)") = (pin_cold_start - pout_cold_start)/m_flow_cold_start "Pressure loss across the cold side";


  SI.Pressure pin_cold "Cold side inlet pressure";
  SI.Pressure pout_cold "Cold side outlet pressure";

  SI.Temperature Tin_cold "Cold side inlet temperature";
  SI.Temperature Tout_cold "Cold side outlet temperature";
  SI.Temperature Tout_cold_min "Minimum possible cold side outlet temperature";

  SI.SpecificEnthalpy hin_cold "Cold side inlet Specific Enthalpy";
  SI.SpecificEnthalpy hout_cold "Cold side outlet Specific Enthalpy";

  SI.MassFlowRate m_flow_cold "Cold fluid mass flow rate";
  //SI.PerUnit COP "Coefficient of performance";
  //SI.Power Pcomp "Compression Power";
  SI.Power Pcold "Thermal Power cold side (lato surgente)";
  //SI.Power Phot "Themal Power hot side (lato utenze)";
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold annotation (
    Placement(visible = true, transformation(origin = {-76, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold annotation (
    Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
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

// Ideal Controlled variables
  Tout_cold_min = min(Tout_cold_set, Tin_cold);
  Tout_cold = Tout_cold_min "Fixed hot side outlet temperature";
// Balance equation
  incold.m_flow + outcold.m_flow = 0 "Mass Balance cold side";
  pin_cold - pout_cold = k_cold*m_flow_cold "Momentum balance cold side";
  Pcold = m_flow_cold*(hin_cold - hout_cold) "Themal Power Cold side";
//  Phot = Pcomp + Pcold "Energy Balance";
//Pcomp =  a[1]*m_flow_hot + a[2]*m_flow_cold + a[3]*Tin_cold + a[4]*m_flow_hot*Tin_cold + a[5]*m_flow_cold*Tin_cold + a[6]*m_flow_hot*m_flow_cold;
//  COP = Phot/Pcomp;
//COP = Tin_cold*a[1]+a[2];
// Dummy equations for energy balance

  incold.h_out = inStream(incold.h_out);
  annotation (
    Icon);
end ChillerNoDynamics;
