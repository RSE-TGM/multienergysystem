within MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass;

partial model PartialIdealFlowSensor "Partial component of a generic sensor for flow properties"
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.ThroughSensor;
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
// mass balance
  0 = inlet.m_flow + outlet.m_flow;
// momentum balance (no pressure losses)
  0 = inlet.p - outlet.p;
// isenthalpic state transformation (no storage and no loss of energy)
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;
  annotation(
    Icon);
end PartialIdealFlowSensor;
