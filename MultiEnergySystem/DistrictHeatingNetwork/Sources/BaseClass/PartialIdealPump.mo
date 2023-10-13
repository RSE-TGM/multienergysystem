within MultiEnergySystem.DistrictHeatingNetwork.Sources.BaseClass;
partial model PartialIdealPump
  "Partial model of a ideal pump, neglecting the work done on the fluid"
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // Energy conservation considering flow reversal
  outlet.h_out = inStream(inlet.h_out);
  inlet.h_out = inStream(outlet.h_out);

annotation (
    Diagram,
    Icon(graphics={  Rectangle(lineColor = {173, 173, 173}, lineThickness = 3, extent = {{-100, 60}, {100, -60}}), Polygon(fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{-60, 40}, {-60, -40}, {60, 0}, {-60, 40}})}));
end PartialIdealPump;
