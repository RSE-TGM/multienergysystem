within MultiEnergySystem.ElectricNetwork.Interfaces;

partial model PartialTwoPin 
  "Two-pin electrical component (V–I formulation)"

  ElectricPortInlet_i p annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));

  ElectricPortOutlet_i n annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Units.SI.Voltage v;
  Modelica.Units.SI.Current i;

equation
  v = p.v - n.v;
  i = p.i;
  0 = p.i + n.i;

end PartialTwoPin;
