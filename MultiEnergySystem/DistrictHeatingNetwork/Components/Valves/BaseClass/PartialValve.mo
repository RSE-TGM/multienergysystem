within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass;
partial model PartialValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.Valve;
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  import Modelica.Fluid.Utilities.regRoot;
  import Modelica.Fluid.Utilities.regStep;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;

  constant Types.PerUnit pr = 0.85 "Pressure recovery coefficient";

  // Nominal Parameters
  parameter Types.PerUnit nomOpening = 1 "Nominal valve opening";
  parameter Real Kv(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.PerUnit minimumOpening = 0.001 "Minimum opening area, avoid no flow condition, default 3mm diameter";
  parameter Modelica.Units.SI.PressureDifference dp_nom = 4e5 "Pressure drop between supply and return, as imposed by the differential pump";
  parameter Modelica.Units.SI.Density rho_nom = 998 "Nominal fluid density at supply";
  parameter Components.Types.valveOpeningChar openingChar = Components.Types.valveOpeningChar.Linear "opening characteristic";

  // Start values
  parameter Types.Temperature Tin_start = 20 + 273.15;
  parameter Types.Pressure pin_start = 2e5;

  // Final parameters
  final parameter Types.MassFlowRate m_flow_nom = 2.7778e-5*Kv*sqrt(dp_nom)*sqrt(990) "Peak mass flow rate at full opening";
  final parameter Types.Temperature Tout_start =  Tin_start;
  final parameter Types.Pressure pout_start = pin_start - dp_nom;

  // Variables
  Types.Area A_v = 2.7778e-5*Kv "Opening area of the valve";
  Types.MassFlowRate m_flow(start = m_flow_nom) "mass flow rate through the valve";
  Types.Temperature Tin(start = Tin_start);
  Types.Temperature Tout(start = Tout_start);

  // Medium
  Medium fluidIn(T_start = Tin_start, p_start = pin_start);
  Medium fluidOut(T_start = Tout_start, p_start = pout_start);

  // Inputs
  Modelica.Blocks.Interfaces.RealInput opening(max = 1, min = 0) "Valve Displacement" annotation (
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  m_flow = inlet.m_flow;

  // Energy balance
  outlet.h_out = inStream(inlet.h_out);
  inStream(outlet.h_out) = inlet.h_out;

  // Momentum balance
  if openingChar == Components.Types.valveOpeningChar.Linear then
    m_flow = homotopy((BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)*A_v*regRoot(fluidIn.rho)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  elseif openingChar == Components.Types.valveOpeningChar.Quadratic then
    m_flow = homotopy((BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)*A_v*regRoot(fluidIn.rho)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  end if;

  // Definition of fluids
  fluidIn.p = inlet.p;
  fluidIn.h = regStep(m_flow, inStream(inlet.h_out), inlet.h_out, m_flow_nom*1e-5);
  fluidOut.p = outlet.p;
  fluidOut.h = regStep(m_flow, outlet.h_out, inStream(outlet.h_out), m_flow_nom*1e-5);

  Tin = fluidIn.T;
  Tout = fluidOut.T;

  annotation (
    Icon);
end PartialValve;
