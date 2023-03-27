within MultiEnergySystem.H2GasFacility.Interfaces;

connector FluidPortOutlet "Conventional outlet port"
  extends FluidPort;
  annotation(
    Icon(graphics = {Ellipse(lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {0, 2}, lineColor = {182, 109, 49}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}})}));
end FluidPortOutlet;
