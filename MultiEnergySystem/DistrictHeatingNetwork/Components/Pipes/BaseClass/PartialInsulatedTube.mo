within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialInsulatedTube
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};



  parameter Modelica.Units.SI.Length L
    "Length of the tube" annotation (
    Dialog(tab = "General Data", group = "Pipe"));
  parameter Modelica.Units.SI.Length h = 0
    "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "General Data", group = "Pipe"));
  parameter Modelica.Units.SI.Length dWall = 0.003
    "Thickness of the tube" annotation (
    Dialog(tab = "General Data", group = "Pipe"));
  parameter Modelica.Units.SI.Length dIns = 0.15
    "Insulation thickness" annotation (
    Dialog(tab = "General Data", group = "Insulation"));
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04
    "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "General Data", group = "Insulation"));

  // Metal Parameter
  parameter Boolean thermalInertia = true
    "if true then account for metal thermal inertia" annotation (
    Dialog(tab = "Metal properties"));
  parameter Modelica.Units.SI.SpecificHeatCapacity cpm = 445
    "Metal specific heat capacity" annotation (
    Dialog(tab = "Metal properties"));
  parameter Modelica.Units.SI.Density rhom = 8000
    "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Metal properties"));
  parameter Modelica.Units.SI.ThermalConductivity lambdaM = 45
    "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Metal properties"));

  parameter Modelica.Units.SI.Temperature T_ext = 298.15
    "External temperature" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature T_start = 273.15 + 70
    "Temperature start value of the fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_start
    "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start
    "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start
    "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.SpecificEnthalpy hin_start
    "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tin_start
    "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tout_start
    "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));

equation

  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;

  annotation (
    Icon(graphics={  Rectangle(lineColor = {102, 102, 102},fillColor = {173, 173, 173}, fillPattern = FillPattern.HorizontalCylinder, extent={{-100,40},
              {100,-40}})}));
end PartialInsulatedTube;
