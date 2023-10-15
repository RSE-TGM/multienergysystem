within MultiEnergySystem.DistrictHeatingNetwork.Tests.Media;
model WaterTest "Definition of two water states using temperature and density as thermodynamic properties"
  extends Modelica.Icons.Example;
  replaceable package Medium = Water constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model";

  //Declaration of water fluids
  Medium.ThermodynamicState fluidIn, fluidOut;

  //Parameters
  parameter Modelica.Units.SI.Temperature Tin = 28 + 273.15;
  parameter Modelica.Units.SI.Temperature Tout = 24.9 + 273.15;
  parameter Modelica.Units.SI.Density rhoin = 995.03;
  parameter Modelica.Units.SI.Density rhoout = 996.01;
  
  //Variables
  Modelica.Units.SI.Pressure pin, pout, dp;
  Modelica.Units.SI.SpecificHeatCapacity cpin, cpout;
equation
  //Definition of fluids
  fluidIn = Medium.setState_dTX(rhoin, Tin);
  fluidOut = Medium.setState_dTX(rhoout, Tout);
  
  //Definition of thermodynamic variables
  cpin = Medium.specificHeatCapacityCp(fluidIn);
  cpout = Medium.specificHeatCapacityCp(fluidOut);
  pin = fluidIn.p;
  pout = fluidOut.p;
  dp = pin - pout;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WaterTest;
