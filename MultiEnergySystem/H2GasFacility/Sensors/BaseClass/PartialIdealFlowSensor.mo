within MultiEnergySystem.H2GasFacility.Sensors.BaseClass;
model PartialIdealFlowSensor "Partial component of a generic sensor for flow properties"

  // icon to be extended?

  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
     choicesAllMatching = true);


equation

  // mass balance
  0 = inlet.m_flow + outlet.m_flow;
  // momentum balance (no pressure losses)
  0 = inlet.p - outlet.p;
  // isenthalpic state transformation (no storage and no loss of energy)
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialIdealFlowSensor;
