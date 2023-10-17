within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass;

partial model PartialValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.Valve;
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  import Modelica.Fluid.Utilities.regRoot;
  
  constant Modelica.Units.SI.PerUnit pr = 0.85 "Pressure recovery coefficient";
  
  // Parameters
  parameter Modelica.Units.SI.PerUnit nomOpening = 1 "Nominal valve opening";
  parameter Real Kv(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Modelica.Units.SI.PerUnit minimumOpening = 0.001 "Minimum opening area, avoid no flow condition, default 3mm diameter";
  parameter Modelica.Units.SI.PressureDifference dp_nom = 4e5 "Pressure drop between supply and return, as imposed by the differential pump";
  parameter Components.Types.valveOpeningChar openingChar = Components.Types.valveOpeningChar.Linear "opening characteristic";
  
  // Final parameters
  final parameter Modelica.Units.SI.MassFlowRate m_nom = Kv*dp_nom*dp_nom*1 "Peak mass flow rate at full opening";
  
  // Variables
  Modelica.Units.SI.Area A_v = 2.7778e-5*Kv "Opening area of the valve";
  Modelica.Units.SI.MassFlowRate m_flow "mass flow rate through the valve";
  
  // Inputs
  Modelica.Blocks.Interfaces.RealInput opening(max = 1, min = 0) "Valve Displacement" annotation(
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
    m_flow = homotopy((BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)*A_v*sqrt(rho0)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)/nomOpening*m_nom/dp_nom*(inlet.p - outlet.p));
  elseif openingChar == Components.Types.valveOpeningChar.Quadratic then
    m_flow = homotopy((BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)*A_v*sqrt(rho0)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)/nomOpening*m_nom/dp_nom*(inlet.p - outlet.p));
  end if;
  annotation(
    Icon);
end PartialValve;
