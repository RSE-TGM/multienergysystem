within MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass;
partial model PartialIdealFlowSensor
  "Partial component of a generic sensor for flow properties"
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
equation
  // mass balance
  0 = inlet.m_flow + outlet.m_flow;

  // momentum equation (no pressure loss)
  inlet.p = outlet.p;

  // isenthalpic state transformation (no storage and no loss of energy)
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;
annotation (
    Icon(graphics={  Line(origin = {0, -80}, points = {{-60, 0}, {60, 0}}, color = {0, 0, 255}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 20)}));
end PartialIdealFlowSensor;
