within MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass;

partial model PartialValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Gas.Valve;
  extends H2GasFacility.Components.Valves.BaseClass.BasePressureDrop;
  import Modelica.Fluid.Utilities.regRoot;
  replaceable package Medium = MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;  
  
  parameter Types.PerUnit nomOpening = 1 
    "Nominal valve opening";
  parameter Real Kv(unit = "m3/h") = 12 
    "Metric Flow Coefficient ";
  parameter Types.PerUnit minimumOpening = 0.001 
    "Minimum opening area, avoid no flow condition, default 3mm diameter";
  constant Types.PerUnit pr = 0.85 
    "Pressure recovery coefficient";
  parameter Types.valveOpeningChar openingChar = Types.valveOpeningChar.Linear
    "opening characteristic";
  final parameter Types.MassFlowRate m_flow_nom = Kv*dp_nom*dp_nom*1 
    "Peak mass flow rate at full opening";
  Types.Area A_v = 2.7778e-4*Kv 
    "Opening area of the valve";
  Modelica.Blocks.Interfaces.RealInput opening(max = 1, min = 0) 
    "Valve Displacement" annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));

  
  Types.MassFlowRate m_flow(start = m_flow_nom)
    "Mass flow rate through the valve";

equation

// Mass balance
  inlet.m_flow + outlet.m_flow = 0;

// Energy balance
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;
  if openingChar == Types.valveOpeningChar.Linear then
// Momentum balance
    m_flow = homotopy((BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)*A_v*sqrt(rhoin)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.linear(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  elseif openingChar == Types.valveOpeningChar.Quadratic then
// Momentum balance
    m_flow = homotopy((BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)*A_v*sqrt(rhoin)*regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening)/nomOpening*m_flow_nom/dp_nom*(inlet.p - outlet.p));
  end if;
  
// Definition of fluids
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = fluidIn.X_start[1:fluidIn.nXi];
  
  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = fluidIn.Xi;
  
// Definition of complementary variables
  m_flow = inlet.m_flow; 
  rhoin = fluidIn.rho;
  pin = inlet.p;
  pout = outlet.p;
  Tin = fluidIn.T;
  Tout = fluidOut.T;
   
  
  annotation(
    Icon);
end PartialValve;
