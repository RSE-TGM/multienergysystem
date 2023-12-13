within MultiEnergySystem.DistrictHeatingNetwork.Components.Machines;
model GasBoiler


  replaceable package Medium = DistrictHeatingNetwork.Media.StandardWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model" annotation (
     choicesAllMatching = true);

  parameter SI.Pressure pin_start = 1e5
    "Start value Inlet pressure of the cold fluid" annotation (
    Dialog(tab = "Initialisation", group = "Cold fluid"));
  parameter SI.Pressure pout_start = 0.9e5
    "Start value Outlet pressure of the cold fluid" annotation (
    Dialog(tab = "Initialisation", group = "Cold fluid"));
  parameter SI.Temperature Tin_start = 58 + 273.15
    "Start value inlet temperature of the fluid" annotation (
    Dialog(tab = "Initialisation", group = "Cold fluid"));
  parameter SI.Temperature Tout_start = 80 + 273.15
    "Start value outlet temperature of the fluid" annotation (
    Dialog(tab = "Initialisation", group = "Cold fluid"));


  parameter SI.Length h = 1.115
    "Vertical distance between inlet and outlet connectors of the boiler" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pmaxnom = 147.6e3
    "Maximum heating capacity" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnimnom = 40.2e3
    "Minimum heating capacity" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnom = 100e3
    "Nominal Power" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.MassFlowRate m_flow_nom = 147.6e3/(20*4186)
    "Nominal fluid mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.MassFlowRate m_flow_fuel_nom = 0.004
    "Nominal fuel (CH4) mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.PerUnit etanom = 0.98
    "Nominal useful efficiency" annotation (
    Dialog(tab = "Boiler Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 50e6
    "Nominal fuel calorific power" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Volume V = 0.530
    "Nominal useful efficiency" annotation (
    Dialog(tab = "Boiler Data"));
  Medium.ThermodynamicState fluidIn, fluidOut;

  SI.MassFlowRate m_flow
    "mass flowrate of the cold fluid";
  SI.MassFlowRate m_flow_fuel
    "mass flowrate of the fuel";
  SI.Pressure pin
    "inlet pressure of cold fluid";
  SI.Pressure pout
    "Outlet pressure of cold fluid";
  SI.Temperature Tin
    "inlet temperature cold fluid";
  SI.Temperature Tout(start = Tout_start)
    "Outlet temperature cold fluid";
  SI.SpecificEnthalpy hin
    "inlet specific enthalpy cold fluid";
  SI.SpecificEnthalpy hout
    "Outlet specific enthalpy cold fluid";
  SI.Power Pheat
    "Total power";
  SI.Mass M
    "Total mass of water";
  SI.Time tr
    "Residence time inside the boiler";

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inletfuel annotation (
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  assert(Pmaxnom >= Pheat, "Actual heat power is higher than Maximum heat power", AssertionLevel.warning);

  // Balance equations
  der(M) = inlet.m_flow + outlet.m_flow;
  M = Medium.density(fluidOut)*V;
  m_flow*(449.449473 + m_flow*(14.618729 + 2.739099*m_flow)) = inlet.p - outlet.p "Momentum Balance";
  inlet.p = inletfuel.p;
  0 = outlet.m_flow*hout + inlet.m_flow*hin + Pheat;
  Pheat = m_flow_fuel*HH*etanom;

  inlet.h_out = inStream(outlet.h_out) "Dummy equation considering not flow reversal";
  inletfuel.h_out = 0 "Dummy equation considering not fuel flow reversal";

  // Define fluids and properties
  fluidIn = Medium.setState_pTX(pin, Tin);
  fluidOut = Medium.setState_pTX(pout,Tout);
  hin = Medium.specificEnthalpy(fluidIn);
  hout = Medium.specificEnthalpy(fluidOut);

  // Define variables
  m_flow = inlet.m_flow;
  m_flow_fuel = inletfuel.m_flow;
  pin = inlet.p;
  pout = outlet.p;
  hin = inStream(inlet.h_out);
  hout = outlet.h_out;
  tr = M/m_flow;

initial equation

  der(M) = 0 "steady state";

annotation (
    Diagram,
    Icon(graphics={  Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Rectangle(fillColor = {171, 171, 171}, fillPattern = FillPattern.Forward, extent = {{-60, 80}, {60, -80}}), Ellipse(origin = {0, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}}), Text(origin = {0, -100}, textColor = {28, 108, 200}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end GasBoiler;
