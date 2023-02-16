within MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass;
partial model PartialAbsoluteSensor
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialOnePort;
equation
  // No flow in or out of the sensor
  inlet.m_flow = 0;
  inlet.h_out = 0;
end PartialAbsoluteSensor;
