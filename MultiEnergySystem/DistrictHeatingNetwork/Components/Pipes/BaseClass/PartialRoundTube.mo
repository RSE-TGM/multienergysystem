within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialRoundTube
  extends PartialInsulatedTube;

  parameter Types.Length Di
    "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));

  // Compute final parameters assuming the tube has cilindrical shape
  final parameter Types.Area A = Modelica.Constants.pi * Di ^ 2 / 4
    "Round tube Transversal inner Area";
  final parameter Types.Length omega = Modelica.Constants.pi * Di
    "Round tube transversal perimeter";
  final parameter Types.Area Am = ((Di / 2 + t) ^ 2 - A) * Modelica.Constants.pi
    "Transveral area of the metal tube (cross-section)";
  final parameter Real cvolm(unit = "J/(m3.K)") = cm * rhom
    "Wall volumetric heat capacity [J/m^3.K]; steel = 3.12e6";
  final parameter Types.HeatCapacity Cm = L * Am * cvolm
    "Total heat capacity of the metal";
  final parameter Types.ThermalConductance U_wm = lambdam * 2 * Modelica.Constants.pi/ log((Di + 2*t) / Di)
    "Thermal conductance water-metal per unit meter";
  final parameter Types.ThermalConductance U_me = lambdaIns * 2 * Modelica.Constants.pi/ log((Di / 2 + t + tIns) / (Di/2) + t)
    "Thermal conductance metal-ambient per unit meter";



end PartialRoundTube;
