within MultiEnergySystem.DistrictHeatingNetwork.Interfaces;
connector FluidPortInlet "Conventional inlet port"
  extends FluidPort;
  annotation (
    Icon(graphics={  Ellipse(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent={{-100,100},{100,-100}})},      coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end FluidPortInlet;
