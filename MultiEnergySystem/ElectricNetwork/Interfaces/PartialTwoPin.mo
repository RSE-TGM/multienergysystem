within MultiEnergySystem.ElectricNetwork.Interfaces;

partial model PartialTwoPin 
  "Two-pin electrical component (V–I formulation)"

  ElectricPortInlet_i electricPortInlet_i annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  ElectricPortOutlet_i electricPortOutlet_i annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {102, -2}, extent = {{-10, -10}, {10, 10}})));

  // Variables
  Modelica.Units.SI.Voltage v;
  Modelica.Units.SI.Current i;

equation

  // Voltage drop
  v = p.v - n.v;

  // Current
  i = p.i;

  // Kirchoff
  0 = p.i + n.i;

end PartialTwoPin;
