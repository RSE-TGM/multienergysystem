within MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass;
partial model PartialInsulatedTube
  extends MultiEnergySystem.H2GasFacility.Interfaces.PartialHorizontalTwoPort(
                                                                        inlet(nXi = fluidIn.nXi), outlet(nXi = fluidOut.nXi));

  // Medium for the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
                                                                     "Medium model" annotation (
     choicesAllMatching = true);

  parameter Types.Length L = 1
    "Length of the tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length H = 0
    "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length t = 0.003
    "Thickness of the tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Pressure pmax = 6e5
    "Maximum pressure that the component can support" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length tIns = 0.15
    "Insulation thickness" annotation (
    Dialog(tab = "Data", group = "Insulation"));
  parameter Types.ThermalConductivity lambdaIns = 0.04
    "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "Data", group = "Insulation"));

// Metal Parameter
  parameter Boolean thermalInertia = true
    "if true then account for metal thermal inertia" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.SpecificHeatCapacity cm = 445
    "Metal wall specific heat capacity" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.Density rhom = 8000
    "Metal density [kg/m^3], for steel = 8000" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.ThermalConductivity lambdam = 45
    "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));

  parameter Types.Temperature T_ext = 15 + 273.15
    "External temperature" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.MassFlowRate m_flow_start = 5
    "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pin_start = 5e5
    "Pressure start value of ingoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pout_start = 4.5e5
    "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.SpecificEnthalpy hin_start
    "Specific enthalpy start value at the inlet of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tin_start = 15 + 273.15
    "Temperature start value of fluid at the start of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tout_start = 15 + 273.15
    "Temperature start value of fluid at the end of the volume" annotation (
    Dialog(group = "Initialisation"));
  parameter H2GasFacility.Types.MassFraction X_start[fluidIn.nX] = H2GasFacility.Data.MassMolFractionData.NG_Abeysekera.X
    "Mass fraction start value of fluid" annotation (
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


  annotation (
    Icon(graphics={Rectangle(lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Text(
          extent={{-100,-60},{100,-120}},
          textColor={28,108,200},
          textString="%name")}), Documentation(info="<html>
<p>This partial model represents a horizontally oriented insulated tube designed for gas transport in energy systems. It defines the physical properties of the tube, including dimensions, insulation characteristics, and material properties, and provides parameters for initializing flow and thermal conditions.</p>
<h4>Usage:</h4>
<p>Extend this model to define specific behaviors, such as heat transfer through the insulation or pressure drop along the tube, depending on the application.</p>
</html>"));
end PartialInsulatedTube;
