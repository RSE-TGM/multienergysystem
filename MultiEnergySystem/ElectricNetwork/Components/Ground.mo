within MultiEnergySystem.ElectricNetwork.Components;
model Ground
"Ground reference model that fixes the electrical potential of its port to zero, providing a voltage reference for the network"

  Interfaces.ElectricPortInlet_i electricPortInlet_i annotation(
    Placement(transformation(origin = {0, 96}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 96}, extent = {{-10, -10}, {10, 10}})));

equation
  electricPortInlet_i.v = 0;
 
annotation(
    Icon(graphics = {Line(origin = {0, 64}, points = {{0, 24}, {0, -24}}, thickness = 0.5), Line(origin = {0, 40}, points = {{-60, 0}, {60, 0}}, thickness = 0.5), Line(origin = {0, 20}, points = {{-40, 0}, {40, 0}}, thickness = 0.5), Line(points = {{-20, 0}, {20, 0}}, thickness = 0.5)}));
end Ground;
