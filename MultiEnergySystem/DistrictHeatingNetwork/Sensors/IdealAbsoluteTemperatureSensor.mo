within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealAbsoluteTemperatureSensor
  "Get absolute pressure of the attached port"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialAbsoluteSensor;
  Modelica.Blocks.Interfaces.RealOutput T annotation (
    Placement(visible = true, transformation(origin = {6, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SI.Temperature T_meas;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.cp;
equation
  T = inStream(inlet.h_out)/cp;
  T_meas = T;
annotation(
    Icon(graphics = {Text(origin = {0, 60}, textColor = {140, 56, 54}, extent = {{-20, 20}, {20, -20}}, textString = "T")}));
end IdealAbsoluteTemperatureSensor;
