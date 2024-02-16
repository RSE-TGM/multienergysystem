within MultiEnergySystem.DistrictHeatingNetwork.Tests.Media;
model WaterTest "Definition of two water states using temperature and density as thermodynamic properties"
  extends Modelica.Icons.Example;
  replaceable package Medium = Water constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model";
  replaceable model MediumReal =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity;
  //Declaration of water fluids
  Medium.ThermodynamicState fluidIn, fluidOut;
  MediumReal waterApprox(T_start = Tin, p_start = p_min);

  //Constants
  constant Real T0(unit = "s") = 1 "Reference value for units";

  //Parameters
  parameter Modelica.Units.SI.Temperature Tin = 80 + 273.15;
  parameter Modelica.Units.SI.Temperature Tout = 15 + 273.15;
  parameter Types.Density rhoin = 991.77;
  //parameter Modelica.Units.SI.Density rhoout = 996.01;
  parameter Types.Pressure p_min = 1e5;
  parameter Types.Pressure p_max = 5e5;

  //Variables
  Types.Pressure p;
  Modelica.Units.SI.SpecificHeatCapacity cpin, cpout;
  Types.Density rhoout;
  Real deltarho, deltacp;
equation
  p = p_min + (p_max - p_min)*time/T0;
  //Definition of fluids
  fluidIn = Medium.setState_pTX(p, Tin);
  //fluidOut = Medium.setState_dTX(rhoout, Tout);
  fluidOut = Medium.setState_pTX(p, Tout);

  //Definition of thermodynamic variables
  cpin = Medium.specificHeatCapacityCp(fluidIn);
  cpout = Medium.specificHeatCapacityCp(fluidOut);
  //pin = fluidIn.p;
  rhoout = fluidOut.d;
  //dp = pin - pout;

  waterApprox.T = Tout;
  waterApprox.p = p;

  deltarho = (abs(waterApprox.rho - fluidIn.d)/fluidIn.d)*100;
  deltacp = (abs(waterApprox.cp - cpin)/cpin)*100;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WaterTest;
