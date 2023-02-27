within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;

model LumpedStorage "Model a perfectly mixed thermal storage with insulation all around. Output temperature in Celsius [°C]"
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  // Insulation parameters
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter Modelica.Units.SI.Length dIns = 0.15 "Insulation thickness";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*h) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";
  Modelica.Units.SI.Mass M "Total mass in the tank";
  Modelica.Units.SI.Density rho(start = 1000) "Density of the fluid in the tank";
  replaceable package Medium =
      MultiEnergySystem.DistrictHeatingNetwork.Media.StandarWater constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium model"
    annotation(choicesAllMatching = true);
  Medium.ThermodynamicState fluidIn, fluidOut;  
equation
// Fluid
  fluidIn = Medium.setState_phX(pin, inlet.h_out);
  fluidOut = Medium.setState_pTX(pout, Tout);
  rho = Medium.density(fluidOut);
  
  Tin = Medium.temperature(fluidIn);
  outlet.h_out = Medium.specificHeatCapacityCp(fluidOut)*Tout;
  Ttilde = Tout;

// Mass Balance
  der(M) = inlet.m_flow + outlet.m_flow;
  M = rho*V;
// Energy Balance
  M * Medium.specificHeatCapacityCp(fluidOut) * der(Ttilde) = m_flow_in * Medium.specificHeatCapacityCp(fluidOut) * (Tin - Tout) - Q_amb; 
// Pressure at the bottom of the tank is increased as Stevino
  pin - pout = rho*h*Modelica.Constants.g_n;
// Computation of heat loss to ambient
  Q_amb = 1/(R_lateral + 2*R_flat)*(Ttilde - T_ext) "Insulation all around";

initial equation
  der(Ttilde) = 0;
  der(rho) = 0;
  annotation(
    Icon(graphics = {Rectangle(origin = {76, -120}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-4, 20}, {4, -20}}), Rectangle(origin = {-76, -120}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-4, 20}, {4, -20}}), Text(origin = {0, -160}, extent = {{-100, 20}, {100, -20}}, textString = "%name"), Rectangle(origin = {0, 10}, lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 90}, {100, -90}}), Ellipse(origin = {0, 103}, lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}), Ellipse(origin = {0, -83}, lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}), Polygon(origin = {-61, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Rectangle(origin = {-71, 54}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin = {-71, -60}, lineColor = {0, 0, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Polygon(origin = {-61, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin = {73, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {-21, 12}, {-13, 14}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin = {5, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-13, -14}, {-13, 22}, {3, 22}, {3, -14}, {3, -14}, {-13, -14}})}, coordinateSystem(extent = {{-100, -140}, {100, 140}})));
end LumpedStorage;
