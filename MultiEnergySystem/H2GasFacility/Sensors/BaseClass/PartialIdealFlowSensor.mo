within MultiEnergySystem.H2GasFacility.Sensors.BaseClass;
model PartialIdealFlowSensor "Partial component of a generic sensor for flow properties"

  extends
    MultiEnergySystem.H2GasFacility.Interfaces.PartialHorizontalTwoPort(inlet(nXi = fluidIn.nXi), outlet(nXi = fluidOut.nXi));

  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
     choicesAllMatching = true);

  // Parameters
  parameter Types.Pressure pin_start "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pout_start "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tin_start "Temperature start value of fluid at the start of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tout_start "Temperature start value of fluid at the end of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter H2GasFacility.Types.MassFraction X_start[fluidIn.nX] = H2GasFacility.Data.MassMolFractionData.NG_Abeysekera.X "Mass fraction start value of fluid" annotation (
    Dialog(group = "Initialisation"));

     // Medium
  Medium fluidIn(
    T_start = Tin_start,
    p_start = pin_start,
    X_start = X_start,
    computeTransport = false,
    computeEntropy = false);
  Medium fluidOut(
    T_start = Tout_start,
    p_start = pout_start,
    X_start = X_start,
    computeTransport = false,
    computeEntropy = false);

equation

  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = inStream(inlet.Xi);

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = outlet.Xi;

  // mass balance
  0 = inlet.m_flow + outlet.m_flow;
  // momentum balance (no pressure losses)
  0 = inlet.p - outlet.p;
  // isenthalpic state transformation (no storage and no loss of energy)
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;
  inStream(inlet.Xi) = outlet.Xi;
  inStream(outlet.Xi) = inlet.Xi;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialIdealFlowSensor;
