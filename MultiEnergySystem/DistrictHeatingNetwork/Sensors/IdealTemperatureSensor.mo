within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealTemperatureSensor
  "Measure temperature of the flow, returns Celsius [°C] measure"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialIdealFlowSensor;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.cp;

  Modelica.Blocks.Interfaces.RealOutput T annotation (
    Placement(visible = true, transformation(origin = {-6, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  //T = Modelica.Fluid.Utilities.regStep(x = inlet.m_flow, y1 = inStream(inlet.h_out) / cp - 273.16, y2 = inStream(outlet.h_out) / cp - 273.16, x_small = 0.01);

  T = inStream(inlet.h_out)/cp - 273.15;

annotation (
    Icon(graphics={  Line(points = {{0, 100}, {0, 50}}, color = {0, 0, 127}), Line(points = {{-40, -10}, {-12, -10}}), Line(points = {{-40, 20}, {-12, 20}}), Line(points = {{-40, 50}, {-12, 50}}), Ellipse(fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-20, -68}, {20, -30}}), Rectangle(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-12, 50}, {12, -34}}), Line(points = {{12, 50}, {12, -34}}, thickness = 0.5), Line(points = {{-12, 50}, {-12, -35}}, thickness = 0.5), Polygon(lineThickness = 0.5, points = {{-12, 50}, {-12, 70}, {-10, 76}, {-6, 78}, {0, 80}, {6, 78}, {10, 76}, {12, 70}, {12, 50}, {-12, 50}}), Line(origin = {-64.2857, 0.714286}, points = {{-50, 0}, {50, 0}}, color = {173, 173, 173}, thickness = 2), Line(origin = {64.8572, 0.42857}, points = {{-50, 0}, {50, 0}}, color = {173, 173, 173}, thickness = 2)}));
end IdealTemperatureSensor;
