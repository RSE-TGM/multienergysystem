within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealAbsolutePressureSensor
  "Get absolute pressure of the attached port"
  extends MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialAbsoluteSensor;
  Modelica.Blocks.Interfaces.RealOutput p annotation (
    Placement(visible = true, transformation(origin = {6, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={0,130},    extent = {{-10, -10}, {10, 10}}, rotation=90)));
  Real p_meas;
equation
  //inlet.p = p;
  p = inlet.p;
  p_meas = p;
annotation (
    Icon(graphics={  Text(origin = {2, 60}, textColor = {140, 56, 54}, extent = {{-20, 20}, {20, -20}}, textString = "P")}));
end IdealAbsolutePressureSensor;
