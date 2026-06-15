within MultiEnergySystem.ElectricNetwork.Components;

model SimpleLine "Line model that take in account only enrgy losses, no voltage drop"

  type LossCoefficient = Real(unit="1/m") "New type definition";
 
  // Parameters
  parameter LossCoefficient k = 1e-5 "Loss coefficient of the electric line";
  parameter Modelica.Units.SI.Length L = 1 "Lenght of the line";
  parameter Boolean useThermalPort = false "Enable thermal losses reporting";
  parameter Modelica.Units.SI.Power eps = 1e-6 "Regularization power";

  // Variables
  Modelica.Units.SI.Power P_loss "Accounts losses for Joule effect";  
  
  Interfaces.ElectricPortInlet electricPortInlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.ElectricPortOutlet electricPortOutlet annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  DistrictHeatingNetwork.Interfaces.HeatPort thermalPort if useThermalPort annotation(
    Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {1, 13}, extent = {{-5, -5}, {5, 5}})));

equation

  // Losses evaluation
  P_loss = k*L*smooth(1, sqrt(electricPortInlet.P^2 + eps));
  
  // Set power balance
  0 = electricPortInlet.P + electricPortOutlet.P + P_loss;

  // Set voltage bus as equipotential
  electricPortOutlet.v = electricPortInlet.v;
  
  // Set thermal losses
  if useThermalPort then
    thermalPort.Q_flow = -P_loss;
  end if;
  
annotation(
    Icon(graphics = {Rectangle(lineColor = {79, 129, 189}, fillColor = {79, 129, 189}, lineThickness = 1, extent = {{-60, 12}, {60, -12}}), Line(origin = {3, 0}, points = {{-93, 0}, {-63, 0}, {93, 0}}, thickness = 0.5)}));
end SimpleLine;
