within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;

model ElectricBoiler
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialBoiler;
  parameter Integer nR = 5 "Total number of resistors";
  parameter SI.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter SI.Resistance R = 47.56 "Nominal resistance of each resistor";
equation
  Pheat = nR*Pmaxres;
  0 = outlet.p - inlet.p;
annotation(
    Icon(graphics = {Polygon(lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ElectricBoiler;
