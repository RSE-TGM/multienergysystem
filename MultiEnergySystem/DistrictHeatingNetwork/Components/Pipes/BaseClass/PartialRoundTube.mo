within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialRoundTube
  extends PartialInsulatedTube;

  parameter Modelica.Units.SI.Length Di
    "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Geometrical Data", group = "Pipe"));

  // Compute final parameters assuming the tube has cilindrical shape
  final parameter Modelica.Units.SI.Area A = Modelica.Constants.pi * Di ^ 2 / 4
    "Round tube Transversal inner Area";
  final parameter Modelica.Units.SI.Length omega = Modelica.Constants.pi * Di
    "Round tube transversal perimeter";
  final parameter Modelica.Units.SI.Area Am = ((Di / 2 + dWall) ^ 2 - (Di / 2) ^ 2) * Modelica.Constants.pi
    "Transveral area of the metal tube (cross-section)";
  final parameter Real rhomcm(unit = "J/(m3.K)") = cpm * rhom
    "Metal heat capacity per unit volume [J/m^3.K]; steel = 3.12e6";
  final parameter Modelica.Units.SI.HeatCapacity Cm = L * Am * rhomcm
    "Total heat capacity of the metal";
  final parameter Modelica.Units.SI.ThermalConductance U_wm = lambdaM * 2 * Modelica.Constants.pi/ log((Di / 2 + Di / 2 + dWall) / Di)
    "Thermal conductance water-metal per unit meter";
  final parameter Modelica.Units.SI.ThermalConductance U_me = lambdaIns * 2 * Modelica.Constants.pi/ log((Di / 2 + dWall + dIns) / (Di/2) + dWall)
    "Thermal conductance metal-ambient per unit meter";
  final parameter Modelica.Units.SI.SpecificHeatCapacity cPip = rhomcm/rhom
    "Specific heat capacity of the material";



end PartialRoundTube;
