within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.BaseClass;
partial model PartialBoiler
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid "Medium model" annotation (
     choicesAllMatching = true);

  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure pin_start=1e5
    "Start value Inlet pressure of the fluid"
    annotation (Dialog(tab="Initialisation", group="fluid"));
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure pout_start=0.9e5
    "Start value Outlet pressure of the fluid"
    annotation (Dialog(tab="Initialisation", group="fluid"));
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Temperature Tin_start=58 + 273.15
    "Start value inlet temperature of the fluid"
    annotation (Dialog(tab="Initialisation", group="fluid"));
  parameter SI.Temperature Tout_start = 80 + 273.15 "Start value outlet temperature of the fluid" annotation (
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter SI.Density rho_start = 1000 "Start value outlet density of the fluid" annotation (
    Dialog(tab = "Initialisation", group = "fluid"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(tab = "Initialisation"));
  parameter SI.Length h = 1.2 "High of the water deposite" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Diameter D = 0.64 "In case the shape of the Water deposite is a Cylinder" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.ThermalConductivity lambdaIns = 0.045 "Conductance of the insulation material" annotation (
    Dialog(tab = "Insulation Data"));
  parameter SI.Length tIns = 0.04 "Insulation thickness" annotation (
    Dialog(tab = "Insulation Data"));
  parameter SI.Power Pmaxnom = 147.6e3 "Maximum heating capacity" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnimnom = 40.2e3 "Minimum heating capacity" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Power Pnom = 100e3 "Nominal Power" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.MassFlowRate m_flow_nom = 147.6e3/(20*4186) "Nominal fluid mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.PerUnit etanom = 0.98 "Nominal useful efficiency" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Volume V = h*MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.pi
                              *D^2/4 "Nominal volume of the fluid container (boiler)" annotation (
    Dialog(tab = "Boiler Data"));
  parameter SI.Temperature T_ext = system.T_amb "Ambient temperature";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + tIns)/(D/2))/(lambdaIns*2*
      MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.pi                                   *h) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = tIns/(lambdaIns*MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.pi
                                                                                 *(D/2)^2) "Flat Surface of the cylinder";
  outer DistrictHeatingNetwork.System system "system object for global defaults";

  SI.MassFlowRate m_flow "mass flowrate of the fluid";
  SI.Pressure pin(start = pin_start) "inlet pressure of fluid";
  SI.Pressure pout "Outlet pressure of fluid";
  SI.Temperature Tin(start = Tin_start) "inlet temperature fluid";
  SI.Temperature Tout(start = Tout_start) "Outlet temperature cold fluid";
  SI.SpecificEnthalpy hin "inlet specific enthalpy cold fluid";
  SI.SpecificEnthalpy hout "Outlet specific enthalpy cold fluid";
  SI.Power Pheat "Total power";
  SI.Mass M "Total mass of water";
  SI.Time tr "Residence time inside the boiler";
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
  assert(10e5 >= inlet.p, "Actual heat power is higher than Maximum heat power", AssertionLevel.warning);

  // Balance equations
  V*(fluidOut.drho_dT*der(Tout)) = inlet.m_flow + outlet.m_flow;
  M = rho*V;
  M*cp*der(Tout) = outlet.m_flow*hout + inlet.m_flow*hin + Pheat - Q_amb;
  Q_amb = 1/(R_lateral + 2*R_flat)*(Tout - T_ext) "Insulation all around, computation of heat loss to ambient";
  inlet.h_out = inStream(outlet.h_out) "Dummy equation considering not flow reversal";

  // Define fluids and properties
  fluidIn.p = pin;
  fluidIn.T = Tin;
  fluidOut.p = pout;
  fluidOut.T = Tout;
  //fluidIn = Medium.setState_pTX(pin, Tin);
  //fluidOut = Medium.setState_pTX(pout, Tout);

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
  tr = M/m_flow;
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
    Icon);
end PartialBoiler;