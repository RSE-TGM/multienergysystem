within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;

partial model PartialBoiler
  replaceable package Medium = DistrictHeatingNetwork.Media.StandarWater constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation(
     choicesAllMatching = true);
  parameter SI.Pressure pin_start = 1e5 "Start value Inlet pressure of the fluid" annotation(
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter SI.Pressure pout_start = 0.9e5 "Start value Outlet pressure of the fluid" annotation(
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter SI.Temperature Tin_start = 58 + 273.15 "Start value inlet temperature of the fluid" annotation(
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter SI.Temperature Tout_start = 80 + 273.15 "Start value outlet temperature of the fluid" annotation(
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter SI.Density rho_start = 1000 "Start value outlet density of the fluid" annotation(
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt
    "Initialisation option" annotation (
    Dialog(tab = "Initialisation"));

  parameter SI.Length h = 1.115 "Vertical distance between inlet and outlet connectors of the boiler" annotation(
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pmaxnom = 147.6e3 "Maximum heating capacity" annotation(
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnimnom = 40.2e3 "Minimum heating capacity" annotation(
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnom = 100e3 "Nominal Power" annotation(
    Dialog(tab = "Boiler Data"));
  parameter SI.MassFlowRate m_flow_nom = 147.6e3/(20*4186) "Nominal fluid mass flow rate" annotation(
    Dialog(tab = "Boiler Data"));
  parameter SI.PerUnit etanom = 0.98 "Nominal useful efficiency" annotation(
    Dialog(tab = "Boiler Data"));

  parameter SI.Volume V = 0.530 "Nominal volume of the boiler" annotation(
    Dialog(tab = "Boiler Data"));


  outer DistrictHeatingNetwork.System system "system object for global defaults";

  Medium.ThermodynamicState fluidIn, fluidOut;
  SI.MassFlowRate m_flow "mass flowrate of the fluid";
  SI.Pressure pin "inlet pressure of fluid";
  SI.Pressure pout "Outlet pressure of fluid";
  SI.Temperature Tin "inlet temperature fluid";
  SI.Temperature Tout(start = Tout_start) "Outlet temperature cold fluid";
  SI.SpecificEnthalpy hin "inlet specific enthalpy cold fluid";
  SI.SpecificEnthalpy hout "Outlet specific enthalpy cold fluid";
  SI.Power Pheat "Total power";
  SI.Mass M "Total mass of water";
  SI.Time tr "Residence time inside the boiler";
  SI.Density rho "Outlet density of fluid";
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  assert(Pmaxnom >= Pheat, "Actual heat power is higher than Maximum heat power", AssertionLevel.warning);
// Balance equations
  der(M) = inlet.m_flow + outlet.m_flow;
  M = rho*V;

  0 = outlet.m_flow*hout + inlet.m_flow*hin + Pheat;
  inlet.h_out = inStream(outlet.h_out) "Dummy equation considering not flow reversal";
// Define fluids and properties
  fluidIn = Medium.setState_pTX(pin, Tin);
  fluidOut = Medium.setState_pTX(pout, Tout);
  hin = Medium.specificEnthalpy(fluidIn);
  hout = Medium.specificEnthalpy(fluidOut);
  rho = Medium.density(fluidOut);
// Define variables
  m_flow = inlet.m_flow;
  pin = inlet.p;
  pout = outlet.p;
  hin = inStream(inlet.h_out);
  hout = outlet.h_out;
  tr = M/m_flow;
initial equation
  der(M) = 0 "steady state";
  if initOpt == Choices.Init.Options.steadyState then
    der(M) = 0;
  elseif initOpt == Choices.Init.Options.fixedState then
    rho = rho_start;
  else
//No initial equations
  end if;
  annotation(
    Diagram,
    Icon(graphics = {Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Rectangle(fillColor = {171, 171, 171}, fillPattern = FillPattern.Forward, extent = {{-60, 80}, {60, -80}}), Ellipse(origin = {0, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}}), Text(origin = {0, -100}, textColor = {28, 108, 200}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end PartialBoiler;
