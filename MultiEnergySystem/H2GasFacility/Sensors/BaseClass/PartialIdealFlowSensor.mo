within MultiEnergySystem.H2GasFacility.Sensors.BaseClass;
partial model PartialIdealFlowSensor "Partial component of a generic sensor for flow properties"

  extends MultiEnergySystem.H2GasFacility.Interfaces.PartialHorizontalTwoPort(
                                                                        inlet(nXi = fluidIn.nXi), outlet(nXi = fluidOut.nXi));

  replaceable model Medium = MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4;

  // Parameters
  parameter Types.Pressure pin_start "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pout_start "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tin_start "Temperature start value of fluid at the start of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tout_start "Temperature start value of fluid at the end of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter H2GasFacility.Types.MassFraction X_start[fluidIn.nX] = {1} "Mass fraction start value of fluid" annotation (
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

  annotation (                                                   Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialIdealFlowSensor;
