within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialInsulatedTube
  extends DHN4Control.Interfaces.PartialTwoPort;
  import DHN4Control.Media.{cp,rho0};

  parameter Modelica.Units.SI.Length L "Length";
  parameter Modelica.Units.SI.Length D "Internal diameter";
  parameter Modelica.Units.SI.Length h = 0 "Hight, positive if outlet is higher than inlet. = 0 ports at same hight";
  parameter Modelica.Units.SI.Length dIns = 0.15 "Insulation thickness";
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04 "Thermal conductivity of the insulant material";

  // Metal Parameter
  parameter Boolean thermalInertia = true "= true account for metal thermal inertia";
  parameter Modelica.Units.SI.Length dWall = 0.003 "Metal tube thickness";
  parameter Real rhomcm(unit = "J/(m3.K)") = 3.12e6 "Metal heat capacity per unit volume [J/m^3.K]; steel = 3.12e6";
  parameter Modelica.Units.SI.Density rhom = 8000 "Metal density [g/cm^3], for steel = 8";
  parameter Modelica.Units.SI.ThermalConductivity lambdaM = 45 "Thermal conductivity; steel = 45";
  parameter Modelica.Units.SI.Temperature T_ext = 298.15 "External temperature";
  parameter Modelica.Units.SI.Temperature T_start = 273.15 + 70 "Temperature start value";

  // Compute final parameters
  final parameter Modelica.Units.SI.Area A = Modelica.Constants.pi * D ^ 2 / 4;
  final parameter Modelica.Units.SI.Length omega = Modelica.Constants.pi * D;
  final parameter Modelica.Units.SI.Volume V = A * L "Pipe inner Volume";
  final parameter Modelica.Units.SI.Area Am = ((D / 2 + dWall) ^ 2 - (D / 2) ^ 2) * Modelica.Constants.pi "Area of the metal tube cross-section";
  final parameter Modelica.Units.SI.HeatCapacity Cm = L * Am * rhomcm "Total heat capacity";
  final parameter Modelica.Units.SI.ThermalConductance U_wm = lambdaM * 2 * Modelica.Constants.pi/ log((D / 2 + D / 2 + dWall) / D)
                                                                                                                                   "Thermal conductance water-metal per unit meter";
  final parameter Modelica.Units.SI.ThermalConductance U_me = lambdaIns * 2 * Modelica.Constants.pi/ log((D / 2 + dWall + dIns) / (D/2) + dWall)
                                                                                                                                                "Thermal conductance metal-ambient per unit meter";
  final parameter Modelica.Units.SI.SpecificHeatCapacity cPip = rhomcm/rhom "Specific heat capacity of the material";

  annotation (
    Icon(graphics={  Rectangle(lineColor = {102, 102, 102},fillColor = {173, 173, 173}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 44}, {100, -44}})}));
end PartialInsulatedTube;
