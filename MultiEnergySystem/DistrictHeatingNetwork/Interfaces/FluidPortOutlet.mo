within MultiEnergySystem.DistrictHeatingNetwork.Interfaces;
connector FluidPortOutlet "Conventional outlet port"
  extends FluidPort;
  annotation (
    Icon(graphics={  Ellipse(lineColor = {136, 136, 136}, fillColor = {168, 168, 168}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}})}));
end FluidPortOutlet;
