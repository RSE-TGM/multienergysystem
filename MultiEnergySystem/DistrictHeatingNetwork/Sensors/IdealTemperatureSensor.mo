within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealTemperatureSensor "Measure temperature of the flow, returns Celsius [°C] measure"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialIdealFlowSensor;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.cp;
  Modelica.Blocks.Interfaces.RealOutput T annotation (
    Placement(visible = true, transformation(origin = {-6, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//T = Modelica.Fluid.Utilities.regStep(x = inlet.m_flow, y1 = inStream(inlet.h_out) / cp - 273.16, y2 = inStream(outlet.h_out) / cp - 273.16, x_small = 0.01);
  T = inStream(inlet.h_out)/cp;
  annotation (
    Icon(graphics={  Text(origin = {0, 60}, textColor = {140, 56, 54}, extent = {{-20, 20}, {20, -20}}, textString = "T")}));
end IdealTemperatureSensor;
