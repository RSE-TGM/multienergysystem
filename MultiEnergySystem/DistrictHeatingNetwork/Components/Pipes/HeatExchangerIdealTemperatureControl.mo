within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model HeatExchangerIdealTemperatureControl
//   replaceable model Medium_Hot = AllamCycle.Substances.MainClasses.MixtureCO2
//     constrainedby AllamCycle.Substances.BaseClasses.PartialMixture
//     "Hot fluid model" annotation (
//     Dialog(group="Fluid Models"));
//   replaceable model Medium_Cold = AllamCycle.Substances.MainClasses.MixtureCO2
//     constrainedby AllamCycle.Substances.BaseClasses.PartialMixture
//     "Cold fluid model" annotation (
//     Dialog(group="Fluid Models"));

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  // HX Parameters
  parameter Real LMTD_nom = 25.62051491 "Nominal LMTD";
  parameter Types.Temperature Tout_hot_set=65 + 273.15
    "Desired outlet temperature of the cold fluid";
  parameter Real k_hot(unit = "Pa/(kg/s)") = (pin_start_hot - pout_start_hot)/m_flow_start_hot "Pressure loss across the hot side";
  parameter Real k_cold(unit = "Pa/(kg/s)") = (pin_start_cold - pout_start_cold)/m_flow_start_cold "Pressure loss across the cold side";

  parameter Types.SpecificEnthalpy hin_start_hot
    "Specific Enthalpy inlet start value of hot fluid"    annotation (Dialog(tab="Initialisation"));
  parameter Types.SpecificEnthalpy hout_start_hot
    "Specific Enthalpy inlet start value of hot fluid"    annotation (Dialog(tab="Initialisation"));
  parameter Types.SpecificEnthalpy hin_start_cold
    "Specific Enthalpy inlet start value of hot fluid"    annotation (Dialog(tab="Initialisation"));
  parameter Types.SpecificEnthalpy hout_start_cold
    "Specific Enthalpy inlet start value of hot fluid"    annotation (Dialog(tab="Initialisation"));
  parameter Types.Pressure pin_start_hot
    "Pressure start value of ingoing fluid" annotation (Dialog(tab="Initialisation"));
  parameter Types.Pressure pout_start_hot
    "Pressure start value of outgoing fluid" annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tin_start_hot
    "Temperature start value of fluid at the start of the heat exchanger"    annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tout_start_hot
    "Temperature start value of fluid at the end of the heat exchanger"    annotation (Dialog(tab="Initialisation"));
  parameter Types.MassFlowRate m_flow_start_hot "Start value for mass flow rate"    annotation (Dialog(tab="Initialisation"));
  parameter Types.Pressure pin_start_cold
    "Pressure start value of ingoing fluid" annotation (Dialog(tab="Initialisation"));
  parameter Types.Pressure pout_start_cold
    "Pressure start value of outgoing fluid" annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tin_start_cold
    "Temperature start value of fluid at the start of the heat exchanger"    annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tout_start_cold
    "Temperature start value of fluid at the end of the heat exchanger"    annotation (Dialog(tab="Initialisation"));
  parameter Types.MassFlowRate m_flow_start_cold "Start value for mass flow rate"    annotation (Dialog(tab="Initialisation"));

  // Variables
  Types.MassFlowRate m_flow_hot "Hot fluid mass flowrate";
  Types.MassFlowRate m_flow_cold "Cold fluid mass flowrate";
  Types.Temperature Tin_hot "Hot fluid inlet temperature";
  Types.Temperature Tout_hot "Hot fluid outlet temperature";
  Types.Temperature Tin_cold "Cold fluid inlet temperature";
  Types.Temperature Tout_cold "Cold fluid outlet temperature";
  Types.Temperature Tout_hot_min "Maximum temperature between Tout_hot_set and Tin_hot";
  Types.SpecificEnthalpy hin_hot "Hot fluid inlet specific enthalpy";
  Types.SpecificEnthalpy hout_hot(start=hout_start_hot)
                                                       "Hot fluid outlet specific enthalpy";
  Types.SpecificEnthalpy hin_cold "Cold fluid inlet specific enthalpy";
  Types.SpecificEnthalpy hout_cold "Cold fluid outlet specific enthalpy";
  Types.Pressure pin_hot "Hot fluid inlet pressure";
  Types.Pressure pout_hot "Hot fluid outlet pressure";
  Types.Pressure pin_cold "Cold fluid inlet pressure";
  Types.Pressure pout_cold "Cold fluid outlet pressure";

  parameter Types.Power Pset = 40e3 "Required heat Power";

  Types.Power Qtot "Heat Power";
//   Real LMTD "Log mean temperature difference";
//   Real LMTD_rel;

  // Medium Fluids
  Medium fluidIn_hot(T_start = Tin_start_hot, p_start = pin_start_hot) "Inlet hot fluid";
  Medium fluidOut_hot(T_start = Tout_start_hot, p_start = pout_start_hot) "Outlet hot fluid";
  Medium fluidIn_cold(T_start = Tin_start_cold, p_start = pin_start_cold) "Inlet cold fluid";
  Medium fluidOut_cold(T_start = Tout_start_cold, p_start = pout_start_cold) "Outlet cold fluid";

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold    annotation (Placement(transformation(extent={{92,30},{112,50}}), iconTransformation(
          extent={{80,20},{120,60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inhot    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}}),
        iconTransformation(extent={{-120,-60},{-80,-20}})));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold    annotation (Placement(transformation(extent={{-110,30},{-90,50}}), iconTransformation(
          extent={{-120,20},{-80,60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outhot    annotation (Placement(transformation(extent={{92,-52},{112,-32}}), iconTransformation(
          extent={{80,-60},{120,-20}})));
equation
  Tout_hot_min = min(Tout_hot_set, Tin_hot);
  //fluidOut_cold.T = Tout_hot_min;
  fluidOut_hot.T = Tout_hot_min;

  // Equations to set the fluid properties
  fluidIn_hot.p = pin_hot;
  fluidIn_hot.T = Tin_hot;
  fluidIn_hot.h = hin_hot;

  fluidOut_hot.p = pout_hot;
  fluidOut_hot.T = Tout_hot;
  fluidOut_hot.h = hout_hot;

  fluidIn_cold.p = pin_cold;
  fluidIn_cold.T = Tin_cold;
  fluidIn_cold.h = hin_cold;

  fluidOut_cold.p = pout_cold;
  fluidOut_cold.T = Tout_cold;
  fluidOut_cold.h = hout_cold;


  // Boundary Conditions

  inhot.m_flow = m_flow_hot;
  //incold.m_flow = m_flow_cold;
  inhot.p = pin_hot;
  outhot.p = pout_hot;
  incold.p = pin_cold;
  outcold.p = pout_cold;

  hin_hot = inStream(inhot.h_out);
  hin_cold = inStream(incold.h_out);

  outhot.h_out = hout_hot;
  outcold.h_out = hout_cold;

  inhot.h_out = hin_start_hot;
  incold.h_out = hin_start_cold;


  // Balance equations
  inhot.m_flow + outhot.m_flow = 0 "Mass Balance Hot Side";
  incold.m_flow + outcold.m_flow = 0 "Mass Balance Cold Side";
  m_flow_hot*(hin_hot - hout_hot) + m_flow_cold*(hin_cold - hout_cold) = 0 "Energy Balance";
  pin_hot - pout_hot = k_hot*m_flow_hot "Momentum Balance Hot Side";
  pin_cold - pout_cold = k_cold*m_flow_cold "Momentum Balance Cold Side";
  Qtot = -m_flow_cold*(hin_cold-hout_cold);
  Qtot = Pset;
//   LMTD = ((Tin_hot-Tout_cold)-(Tout_hot-Tin_cold))/log((Tin_hot-Tout_cold)/(Tout_hot-Tin_cold));
//   LMTD_rel = LMTD/LMTD_nom;

  annotation (Icon(                                             graphics={Rectangle(origin={-1.58,
              0.01},                                                                                       lineColor = {159, 159, 223}, fillColor = {230, 230, 230},
            fillPattern =                                                                                                     FillPattern.Solid,
            lineThickness =                                                                                                                                      0.75, extent = {{-100.88, 99.41}, {100.88, -99.41}}), Text(origin={-7,
              -116},                                                                                                                                                                                                        extent = {{-43, 14}, {43, -14}}, textString = "%name"), Line(origin={
              0.22,-40.08},                                                                                                                                                                                                        points = {{-80, 0}, {-54, 0}, {-36, 35}, {0, -35}, {36, 35}, {54, 0}, {80, 0}}, color = {196, 0, 0}, thickness = 1, arrowSize = 20), Polygon(origin={
              140,-90},                                                                                                                                                                                                        lineColor = {196, 0, 0}, fillColor = {196, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-78, 56}, {-78, 44}, {-62, 50}, {-78, 56}}), Line(origin={
              -0.2,38.02},                                                                                                                                                                                                        points = {{-80, 0}, {-54, 0}, {-36, 35}, {0, -35}, {36, 35}, {54, 0}, {80, 0}}, color = {28, 108, 200}, thickness = 1, arrowSize = 20), Polygon(origin={
              -140,88},                                                                                                                                                                                                        rotation = 180, lineColor = {28, 108, 200}, fillColor = {28, 108, 200},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-78, 56}, {-78, 44}, {-62, 50}, {-78, 56}}), Polygon(origin={8,
              -90},                                                                                                                                                                                                        lineColor = {196, 0, 0}, fillColor = {196, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-78, 56}, {-78, 44}, {-62, 50}, {-78, 56}}), Polygon(origin={-2,
              88},                                                                                                                                                                                                        rotation = 180, lineColor = {28, 108, 200}, fillColor = {28, 108, 200},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-78, 56}, {-78, 44}, {-62, 50}, {-78, 56}})}),
      Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatExchangerIdealTemperatureControl;
