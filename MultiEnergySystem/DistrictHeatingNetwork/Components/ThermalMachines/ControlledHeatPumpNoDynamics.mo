within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;

model ControlledHeatPumpNoDynamics

  replaceable package Medium = MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model"
    annotation(choicesAllMatching = true);
  
  // Declaration of fluid models
  Medium.ThermodynamicState fluidInHot "Hot inlet fluid";
  Medium.ThermodynamicState fluidOutHot "Hot outlet fluid";
  Medium.ThermodynamicState fluidInCold "Cold inlet fluid";
  Medium.ThermodynamicState fluidOutCold "Cold outlet fluid";

  parameter SI.PerUnit COP_nom = 2.7 "Nominal coefficient of performance";
  parameter SI.Temperature Tin_hot_start = 30 + 273.15 "Start/Nominal value for Hot side inlet temperature";
  final parameter SI.Temperature Tout_hot_start = Tout_hot_set "Start/Nominal value for Hot side outlet temperature";
  parameter SI.Temperature Tin_cold_start = 14 + 273.15 "Start/Nominal value for Cold side inlet temperature";
  parameter SI.Temperature Tout_cold_start = 8 + 273.15 "Start/Nominal value for Cold side outlet temperature";
  parameter SI.Temperature Tout_hot_set = 45 + 273.15 "Nominal value at the outlet of the hot fluid";
  parameter SI.Pressure pin_hot_start = 1e5 "Start/Nominal value for Hot side inlet pressure";
  parameter SI.Pressure pin_cold_start = 2e5 "Start/Nominal value for Cold side inlet pressure";
  parameter SI.Pressure dp_hot_start = 50e3 "Start/Nominal value for delta pressure in hot side";
  parameter SI.Pressure dp_cold_start = 50e3 "Start/Nominal value for delta pressure in cold side";
  final parameter SI.Pressure pout_hot_start = pin_hot_start - dp_hot_start "Start/Nominal value for Hot side outlet pressure";
  final parameter SI.Pressure pout_cold_start = pin_cold_start - dp_cold_start "Start/Nominal value for Cold side outlet pressure";
  parameter SI.MassFlowRate m_flow_hot_start = 0.5 "Hot fluid mass flow rate";
  parameter SI.MassFlowRate m_flow_cold_start = 1 "Cold fluid mass flow rate";
  parameter Real k_hot(unit = "Pa/(kg/s)") = (pin_hot_start - pout_hot_start)/m_flow_hot_start "Pressure loss across the hot side";
  parameter Real k_cold(unit = "Pa/(kg/s)") = (pin_cold_start - pout_cold_start)/m_flow_cold_start "Pressure loss across the cold side";
  
  constant Real a[2] = {-20.8918 , 4.18083} "linear equation coefficients for Tin_cold vs COP relation";
  
  SI.Pressure pin_hot "Hot side inlet pressure";
  SI.Pressure pout_hot "Hot side outlet pressure";
  SI.Pressure pin_cold "Cold side inlet pressure";
  SI.Pressure pout_cold "Cold side outlet pressure";
  SI.Temperature Tin_hot "Hot side inlet temperature";
  SI.Temperature Tout_hot "Hot side outlet temperature";
  SI.Temperature Tin_cold "Cold side inlet temperature";
  SI.Temperature Tout_cold "Cold side outlet temperature";
  SI.Temperature Tout_hot_max;
  SI.SpecificEnthalpy hin_hot "Hot side inlet Specific Enthalpy";
  SI.SpecificEnthalpy hout_hot "Hot side outlet Specific Enthalpy";
  SI.SpecificEnthalpy hin_cold "Cold side inlet Specific Enthalpy";
  SI.SpecificEnthalpy hout_cold "Cold side outlet Specific Enthalpy";  
  SI.MassFlowRate m_flow_hot "Hot fluid mass flow rate";
  SI.MassFlowRate m_flow_cold "Cold fluid mass flow rate";
  //SI.PerUnit COP "Coefficient of performance";
  SI.Power Pcomp "Compression Power";
  SI.Power Pcold "Thermal Power cold side (lato surgente)";
  SI.Power Phot "Themal Power hot side (lato utenze)";

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold annotation(
    Placement(visible = true, transformation(origin = {-76, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold annotation(
    Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inhot annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outhot annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation


  // Fluid Definition
  fluidInHot = Medium.setState_phX(pin_hot, hin_hot);
  fluidInCold = Medium.setState_phX(pin_cold, hin_cold);
  fluidOutHot = Medium.setState_phX(pout_hot, hout_hot);  
  fluidOutCold = Medium.setState_phX(pout_cold, hout_cold);
  
  // Assignation of name variables
  pin_hot = inhot.p;
  pout_hot = outhot.p;
  pin_cold = incold.p;
  pout_cold = outcold.p;
  hin_hot = inStream(inhot.h_out);
  hin_cold = inStream(incold.h_out);
  hout_hot = outhot.h_out;
  hout_cold = outcold.h_out;
  Tin_hot = Medium.temperature(fluidInHot);
  Tout_hot = Medium.temperature(fluidOutHot);
  Tin_cold = Medium.temperature(fluidInCold);
  Tout_cold = Medium.temperature(fluidOutCold);
  m_flow_hot = inhot.m_flow;
  m_flow_cold = incold.m_flow;
  
  
  //Specific Enthalpies
//  hin_hot = Medium.specificHeatCapacityCp(fluidInHot)*Tin_hot;
//  hout_hot = Medium.specificHeatCapacityCp(fluidOutHot)*Tout_hot;  
//  hin_cold = Medium.specificHeatCapacityCp(fluidInCold)*Tin_cold;
//  hout_cold = Medium.specificHeatCapacityCp(fluidOutCold)*Tout_cold;    
  
  // Ideal Controlled variables
  Tout_hot_max = max(Tout_hot_start, Tin_hot); 
  Tout_hot = Tout_hot_max;
  Tin_cold - Tout_cold = 5;
  
 
  // Balance equation
  inhot.m_flow + outhot.m_flow = 0 "Mass Balance hot side";
  incold.m_flow + outcold.m_flow = 0 "Mass Balance cold side";
  pin_hot - pout_hot = k_hot*m_flow_hot "Momentum balance hot side";
  pin_cold - pout_cold = k_cold*m_flow_cold "Momentum balance cold side";
  
  Phot = -m_flow_hot*(hin_hot-hout_hot);
  Pcold = m_flow_cold*(hin_cold-hout_cold);  
  Phot = Pcomp + Pcold "Energy Balance";
  //COP = Phot/Pcomp;
  //COP = Tin_cold*a[1]+a[2];
  
  // Dummy equations for energy balance
  inhot.h_out = inStream(inhot.h_out);
  incold.h_out = inStream(incold.h_out);


annotation(
    Icon(graphics = {Rectangle(origin = {47, -27}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, 35}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Ellipse(origin = {-40, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Rectangle( fillColor = {171, 171, 171}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Rectangle(origin = {47, 19}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, -13}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, 3}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Ellipse(origin = {-44, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-44, 0}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}}), Text(origin = {0, -100}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end ControlledHeatPumpNoDynamics;