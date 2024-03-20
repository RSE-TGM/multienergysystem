within MultiEnergySystem.DistrictHeatingNetwork.Interfaces;
connector FluidPortOutlet "Conventional outlet port"
  extends DistrictHeatingNetwork.Interfaces.FluidPort;
  annotation (
    Icon(graphics={  Ellipse(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent={{-100,100},{100,-100}}),      Ellipse(origin = {0, 2}, lineColor = {140, 56, 54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram);
end FluidPortOutlet;
