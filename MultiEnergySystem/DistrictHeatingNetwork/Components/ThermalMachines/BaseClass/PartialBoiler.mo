within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.BaseClass;
partial model PartialBoiler
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp "Medium model" annotation (
     choicesAllMatching = true);

  //-------------------------------
  // Constants
  //-------------------------------
  constant Real pi = Modelica.Constants.pi;

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Pressure pin_start=1e5 "Start value Inlet pressure of the fluid"  annotation (
    Dialog(tab="Initialisation", group="fluid"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_start=0.9e5 "Start value Outlet pressure of the fluid" annotation (
    Dialog(tab="Initialisation", group="fluid"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start=58 + 273.15 "Start value inlet temperature of the fluid" annotation (
    Dialog(tab="Initialisation", group="fluid"));
  parameter SI.Temperature Tout_start = 80 + 273.15 "Start value outlet temperature of the fluid" annotation (
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter SI.Density rho_start = 1000 "Start value outlet density of the fluid" annotation (
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(tab = "Initialisation"));

  //-------------------------------
  // Geometric parameters
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Length h = 1.2 "High of the water deposite" annotation (
    Dialog(tab = "Boiler Data"));
  parameter DistrictHeatingNetwork.Types.Length D = 0.64 "In case the shape of the Water deposite is a Cylinder" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.ThermalConductivity lambdaIns = 0.045 "Conductance of the insulation material" annotation (
    Dialog(tab = "Insulation Data"));
  parameter SI.Length tIns = 0.04 "Insulation thickness" annotation (
    Dialog(tab = "Insulation Data"));
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + tIns)/(D/2))/(lambdaIns*2*pi*h) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = tIns/(lambdaIns*pi*(D/2)^2) "Flat Surface of the cylinder";
  final parameter SI.Volume V = h*pi*D^2/4 "Nominal volume of the fluid container (boiler)";

  //-------------------------------
  // Nominal parameters
  //-------------------------------
  parameter SI.Power Pmaxnom = 147.6e3 "Maximum heating capacity" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnimnom = 40.2e3 "Minimum heating capacity" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnom = Pmaxnom "Nominal Power" annotation (
    Dialog(tab = "Boiler Data"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_nom = 147.6e3/(20*4186) "Nominal fluid mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.PerUnit etanom = 0.98 "Nominal useful efficiency" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Temperature T_ext = system.T_amb "Ambient temperature";

  //-------------------------------
  // System Object
  //-------------------------------
  outer DistrictHeatingNetwork.System system "system object for global defaults";

  //-------------------------------
  // Variables
  //-------------------------------
  SI.MassFlowRate m_flow "mass flowrate of the fluid";
  SI.Pressure pin(start = pin_start) "inlet pressure of fluid";
  SI.Pressure pout "Outlet pressure of fluid";
  SI.Temperature Tin(start = Tin_start) "inlet temperature fluid";
  SI.Temperature Tout(start = Tout_start) "Outlet temperature cold fluid";
  SI.SpecificEnthalpy hin "inlet specific enthalpy cold fluid";
  SI.SpecificEnthalpy hout "Outlet specific enthalpy cold fluid";
  SI.Power Pheat "Total power";
  SI.Mass M "Total mass of water";
  SI.Density rho "Outlet density of fluid";
  SI.SpecificHeatCapacity cp "Outlet specific heat capacity of the fluid";
  SI.Power Q_amb "heat loss to ambient";

  Medium fluidIn(T_start = Tin_start, p_start = pin_start), fluidOut(T_start = Tout_start, p_start = pout_start);

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  assert(Pmaxnom >= Pheat, "Actual heat power is higher than Maximum heat power", AssertionLevel.warning);
  assert(50e5 >= inlet.p, "Actual pressure is higher than Maximum pressure", AssertionLevel.warning);

  // Balance equations
  0 = inlet.m_flow + outlet.m_flow;
  M = rho*V;
  M*cp*der(Tout) = outlet.m_flow*hout + inlet.m_flow*hin + Pheat - Q_amb;
  Q_amb = 1/(R_lateral + 2*R_flat)*(Tout - T_ext) "Insulation all around, computation of heat loss to ambient";
  inlet.h_out = inStream(outlet.h_out) "Dummy equation considering not flow reversal";

  // Define fluids and properties
  fluidIn.p = pin;
  fluidIn.T = Tin;
  fluidOut.p = pout;
  fluidOut.T = Tout;

  // Fluid properties
  hin = fluidIn.h;
  hout = fluidOut.h;
  rho = fluidOut.rho;
  cp = fluidOut.cp;

  // Define variables
  m_flow = inlet.m_flow;
  pin = inlet.p;
  pout = outlet.p;
  hin = inStream(inlet.h_out);
  hout = outlet.h_out;

initial equation
  if initOpt == Choices.Init.Options.steadyState then
    //der(M) = 0;
    der(Tout) = 0;
    //der(pout) = 0;
  elseif initOpt == Choices.Init.Options.fixedState then
    Tout = Tout_start;
  else
//No initial equations
  end if;
  annotation (
    Diagram,
    Icon,
    Documentation(info="<html>
<h2>PartialBoiler</h2>

<p>
  <h3>Summary:</h3>
  This partial model represents a simplified water boiler in a district heating system. It includes:
  heat input, fluid thermal behavior, and heat loss to the ambient through insulation.
</p>

<p>
  <h3>Key Features:</h3>
  <ul>
    <li>Lumped volume model with temperature and enthalpy balances</li>
    <li>Supports steady-state and fixed-state initialization</li>
    <li>Accounts for heat losses using geometrical insulation properties</li>
    <li>Fluid properties determined via replaceable media</li>
  </ul>
</p>

<p>
  <h3>Parameters:</h3>
  <ul>
    <li><code>pin_start</code>, <code>pout_start</code>: Initial inlet/outlet pressures</li>
    <li><code>Tin_start</code>, <code>Tout_start</code>: Initial temperatures</li>
    <li><code>lambdaIns</code>, <code>tIns</code>: Insulation characteristics</li>
    <li><code>Pmaxnom</code>: Maximum heating power</li>
    <li><code>etanom</code>: Nominal useful efficiency</li>
    <li><code>h</code>, <code>D</code>: Geometry of the boiler tank</li>
  </ul>
</p>

<p>
  <h3>Equations:</h3>
  <ul>
    <li>Mass balance: Ensures no accumulation</li>
    <li>Energy balance: Includes enthalpy flows, heat input, and ambient losses</li>
    <li>Thermal loss: Based on cylindrical surface and flat ends</li>
  </ul>
</p>

<p>
  <h3>Usage:</h3>
  This model should be extended to implement specific boiler behavior (e.g., on/off logic, ideal temperature control).
</p>

</html>"));
end PartialBoiler;
