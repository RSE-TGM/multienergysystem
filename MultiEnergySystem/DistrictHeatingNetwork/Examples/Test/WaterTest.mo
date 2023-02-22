within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model WaterTest
  extends Modelica.Icons.Example;
  replaceable package Medium =
      MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater                          constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model";

  Medium.ThermodynamicState fluidIn, fluidOut;

  parameter Modelica.Units.SI.Temperature Tin = 28 + 273.15;
  parameter Modelica.Units.SI.Temperature Tout = 24.9 + 273.15;
  parameter Modelica.Units.SI.Density rhoin = 995.03;
  parameter Modelica.Units.SI.Density rhoout = 996.01;
  Modelica.Units.SI.Pressure pin, pout, dp;
  Modelica.Units.SI.SpecificHeatCapacity cpin, cpout;
equation

  fluidIn = Medium.setState_dTX(rhoin, Tin);
  pin = fluidIn.p;
  fluidOut = Medium.setState_dTX(rhoout, Tout);
  pout = fluidOut.p;
  dp = pin - pout;
  cpin = Medium.specificHeatCapacityCp(fluidIn);
  cpout = Medium.specificHeatCapacityCp(fluidOut);


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WaterTest;
