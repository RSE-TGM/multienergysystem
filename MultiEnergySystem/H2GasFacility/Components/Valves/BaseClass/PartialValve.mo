within MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass;

partial model PartialValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Gas.Valve;
  extends MultiEnergySystem.H2GasFacility.Interfaces.PartialHorizontalTwoPort;
  import Modelica.Fluid.Utilities.regRoot;
  replaceable package Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.CH4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;  
  
  parameter Types.PerUnit nomOpening = 1 
    "Nominal valve opening";
  parameter Real Kv(unit = "m3/h") = 12 
    "Metric Flow Coefficient ";
  parameter Types.PerUnit minimumOpening = 0.001 
    "Minimum opening area, avoid no flow condition, default 3mm diameter";
  constant Types.PerUnit pr = 0.85 
    "Pressure recovery coefficient";
  parameter Types.Pressure dp_nom = 0.1e5 
    "Pressure drop between supply and return, as imposed by the differential pump";
  parameter Types.Pressure pin_start = 1e5
    "Inlet nominal and start pressure";
  final parameter Types.Pressure pout_start = pin_start - dp_nom
    "Outlet nominal and start pressure";
  parameter Types.Temperature Tin_start = 25 + 273.15
    "Inlet nominal and start temperature";
  parameter Types.Temperature Tout_start = 20 + 273.15
    "Outlet nominal and start temperature";
  final parameter Types.MassFraction X_start[fluidIn.nX] = fluidIn.X_start
    "Nominal mass fraction through the valve"; 
  parameter Types.valveOpeningChar openingChar = Types.valveOpeningChar.Linear
    "opening characteristic";
  final parameter Types.MassFlowRate m_flow_nom = Kv*dp_nom*dp_nom*1 
    "Peak mass flow rate at full opening";
  Types.Area A_v = 2.7778e-5*Kv "Opening area of the valve";
  Modelica.Blocks.Interfaces.RealInput opening(max = 1, min = 0) "Valve Displacement" annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));

  Medium fluidIn(T_start = Tin_start, p_start = pin_start, X_start = X_start);
  Medium fluidOut(T_start = Tout_start, p_start = pout_start, X_start = X_start);
  
  Types.MassFlowRate m_flow(start = m_flow_nom)
    "Mass flow rate through the valve";
  Types.Density rhoin
    "Density at the inlet";
  Types.Pressure pin 
    "Actual inlet pressure";
  Types.Pressure pout 
    "Actual outlet pressure";
  Types.Temperature Tin 
    "Actual inlet temperature";
  Types.Temperature Tout 
    "Actual outlet temperature";
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
