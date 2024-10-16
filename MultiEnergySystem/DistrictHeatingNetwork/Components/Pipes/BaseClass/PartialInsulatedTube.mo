within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialInsulatedTube
  extends DistrictHeatingNetwork.Interfaces.PartialHorizontalTwoPort;
  extends DistrictHeatingNetwork.Icons.Water.Pipe;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  parameter Types.Length L = 1 "Length of the tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length h = 0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length t = 0.003 "Thickness of the tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Pressure pmax = 6e5 "Maximum pressure that the component can support" annotation (
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Length tIns = 0.15 "Insulation thickness" annotation (
    Dialog(tab = "Data", group = "Insulation"));
  parameter Types.ThermalConductivity lambdaIns = 0.04 "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "Data", group = "Insulation"));

  //Metal Parameter
  parameter Boolean set_m_flow_start = false;
  parameter Boolean thermalInertia = true "if true then account for metal thermal inertia" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.SpecificHeatCapacity cm = 445 "Metal wall specific heat capacity" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.Density rhom = 8000 "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));
  parameter Types.ThermalConductivity lambdam = 45 "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Data", group = "Metal Properties"));

  parameter Types.Temperature T_ext = 25 + 273.15 "External temperature" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.MassFlowRate m_flow_start = 1 "Start value for mass flow rate" annotation (
    Dialog(enable = set_m_flow_start, group = "Initialisation"));
  parameter Types.Pressure pin_start = 2e5 "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pout_start = 1.8e5 "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.SpecificEnthalpy hin_start = 3.3e5 "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tin_start = 25 + 273.15 "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Temperature Tout_start = 24.8 + 273.15 "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
equation


  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end PartialInsulatedTube;
