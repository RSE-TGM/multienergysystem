within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealAbsolutePressureSensor
  "Get absolute pressure of the attached port"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialAbsoluteSensor;
  extends Modelica.Icons.RoundSensor;
  Modelica.Blocks.Interfaces.RealOutput p annotation (
    Placement(visible = true, transformation(origin = {6, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  inlet.p = p;
end IdealAbsolutePressureSensor;
