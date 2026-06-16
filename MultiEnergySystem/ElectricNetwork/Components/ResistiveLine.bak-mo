within MultiEnergySystem.ElectricNetwork.Components;

model ResistiveLine 
  "Physical line model with Joule losses and voltage drop (with symmetric equivalent current)"

  // Parameters
  parameter Modelica.Units.SI.Length L = 0.1 "Length of the line";
  parameter Modelica.Units.SI.Area A = 0.1 "Section of the line";
  parameter Modelica.Units.SI.Resistivity rho 
    "Electrical resistivity of the conductor";

  final parameter Modelica.Units.SI.Resistance R = rho * L / A 
    "Line resistance";

  parameter Modelica.Units.SI.Power eps = 1e-6 
    "Regularization term (avoid division by zero)";

  parameter Boolean useThermalPort = false 
    "Enable thermal losses reporting";

  // Variables
  Modelica.Units.SI.Power P_loss "Joule losses";
  Modelica.Units.SI.Current I     "Equivalent current";

  Modelica.Units.SI.Power P_mean "Mean power";
  Modelica.Units.SI.Voltage V_mean "Mean voltage";

  // Ports
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.HeatPort 
    thermalPort if useThermalPort annotation(
      Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}),
                iconTransformation(origin = {1, 13}, extent = {{-5, -5}, {5, 5}})));

  Interfaces.ElectricPortInlet electricPortInlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}),
              iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));

  Interfaces.ElectricPortOutlet electricPortOutlet annotation(
    Placement(transformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}),
              iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}})));

equation

  // Mean quantities (symmetry)
  P_mean = (electricPortInlet.P - electricPortOutlet.P) / 2;
  V_mean = (electricPortInlet.v + electricPortOutlet.v) / 2;

  // Equivalent current (symmetric)
  I = P_mean / (abs(V_mean) + eps);

  // Joule losses (physical)
  P_loss = R * I^2;

  // Power balance
  electricPortInlet.P + electricPortOutlet.P - P_loss = 0;

  // Voltage drop (Ohm's law)
  electricPortInlet.v - electricPortOutlet.v = R * I;

  // Thermal port
  if useThermalPort then
    thermalPort.Q_flow = -P_loss;
  end if;

annotation(
  Diagram(graphics),
  Icon(graphics = {
    Rectangle(lineColor = {79, 129, 189}, fillColor = {79, 129, 189}, 
              lineThickness = 1, extent = {{-60, 12}, {60, -12}}),
    Line(points = {{-60, 0}, {-50, -12}, {-30, 12}, {-10, -12}, 
                   {10, 12}, {30, -12}, {50, 12}, {60, 0}},
         thickness = 0.5),
    Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}}, thickness = 0.5),
    Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}, thickness = 0.5)
  })
);

end ResistiveLine;
