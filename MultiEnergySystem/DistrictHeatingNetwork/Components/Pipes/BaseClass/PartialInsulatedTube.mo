within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialInsulatedTube
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialHorizontalTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  parameter Types.Length L
    "Length of the tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length h = 0
    "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length t = 0.003
    "Thickness of the tube" annotation (
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
    "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.ThermalConductivity lambdam = 45
    "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));

  parameter Types.Temperature T_ext = 25+273.15
    "External temperature" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.MassFlowRate m_flow_start
    "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pin_start
    "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pout_start
    "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.SpecificEnthalpy hin_start
    "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tin_start
    "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tout_start
    "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));

equation


  annotation (
    Icon(graphics={Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}})}));
end PartialInsulatedTube;
