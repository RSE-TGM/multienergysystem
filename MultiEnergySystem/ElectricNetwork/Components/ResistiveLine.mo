within MultiEnergySystem.ElectricNetwork.Components;

model ResistiveLine "Physical line model with Joule losses and voltage drop"

  // Parameters
  parameter Modelica.Units.SI.Length L = 0.1 "Lenght of the line";
  parameter Modelica.Units.SI.Area A = 0.1 "Section of the line";
  parameter Modelica.Units.SI.Resistivity rho "Electrical resistivity of the conductor";
  final parameter Modelica.Units.SI.Resistance R = rho*L/A "Line resistance";
  parameter Modelica.Units.SI.Power eps = 1e-6 "Regularization";
  parameter Boolean useThermalPort = true "Enable thermal losses reporting";

  // Variables
  Modelica.Units.SI.Power P_loss;

  // Ports
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.HeatPort thermalPort if useThermalPort annotation(
    Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {1, 13}, extent = {{-5, -5}, {5, 5}})));
  Interfaces.ElectricPortInlet electricPortInlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.ElectricPortOutlet electricPortOutlet annotation(
    Placement(transformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}})));

equation
// Joule losses
  P_loss = R * (electricPortInlet.P^2) / (electricPortInlet.v^2 + eps);
// Power balance
  electricPortInlet.P + electricPortOutlet.P - P_loss = 0;
// voltage drop
  electricPortInlet.v - electricPortOutlet.v =  R * electricPortInlet.P / (abs(electricPortInlet.v) + eps);
// Thermal port
  if useThermalPort then
    thermalPort.Q_flow = -P_loss;
  end if;
  annotation(
    Diagram(graphics),
    Icon(graphics = {Rectangle(lineColor = {79, 129, 189}, fillColor = {79, 129, 189}, lineThickness = 1, extent = {{-60, 12}, {60, -12}}), Line(points = {{-60, 0}, {-50, -12}, {-30, 12}, {-10, -12}, {10, 12}, {30, -12}, {50, 12}, {60, 0}, {60, 0}}, thickness = 0.5), Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}, {15, 0}}, thickness = 0.5), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}, {15, 0}}, thickness = 0.5)}));end ResistiveLine;
