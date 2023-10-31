within MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass;
partial model PartialAbsoluteSensor
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.OnePointSensor;
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  // No flow in or out of the sensor
  inlet.m_flow = 0;
  inlet.h_out = 0;
end PartialAbsoluteSensor;
