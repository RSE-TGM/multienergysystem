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
  Modelica.Units.SI.Power P_in;
  Modelica.Units.SI.Power P_out;
  Modelica.Units.SI.Power P_loss;

  Modelica.Units.SI.Voltage v_in;
  Modelica.Units.SI.Voltage v_out;

  Real I_equiv "Equivalent current";

  // Ports

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.HeatPort thermalPort if useThermalPort annotation(
    Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {1, 13}, extent = {{-5, -5}, {5, 5}})));
  Interfaces.ElectricPortInlet electricPortInlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.ElectricPortOutlet electricPortOutlet annotation(
    Placement(transformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}})));
equation
// Read ports
  v_in = electricPortInlet.v;
  P_in = electricPortInlet.P;
// Equivalent current (regularized)
  I_equiv = smooth(1, P_in/sqrt(v_in^2 + eps));
// Joule losses
  P_loss = R*I_equiv^2;
// Voltage drop
  v_out = v_in - R*I_equiv;
// Power balance
  P_out = P_in - P_loss;
// Set ports
  electricPortOutlet.v = v_out;
  electricPortOutlet.P = P_out;
// Thermal port
  if useThermalPort then
    thermalPort.Q_flow = -P_loss;
  end if;
  annotation(
    Diagram(graphics),
    Icon(graphics = {Rectangle(lineColor = {79, 129, 189}, fillColor = {79, 129, 189}, lineThickness = 1, extent = {{-60, 12}, {60, -12}}), Line(points = {{-60, 0}, {-50, -12}, {-30, 12}, {-10, -12}, {10, 12}, {30, -12}, {50, 12}, {60, 0}, {60, 0}}, thickness = 0.5), Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}, {15, 0}}, thickness = 0.5), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}, {15, 0}}, thickness = 0.5)}));end ResistiveLine;
