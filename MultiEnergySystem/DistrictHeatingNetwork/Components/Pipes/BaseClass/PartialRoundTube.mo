within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model PartialRoundTube
  extends PartialInsulatedTube;

  parameter Types.Length Di = 51e-3 "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));

  // Compute final parameters assuming the tube has cilindrical shape
  final parameter Types.Area A = Modelica.Constants.pi * Di ^ 2 / 4 "Round tube Transversal inner Area";
  final parameter Types.Length omega = Modelica.Constants.pi * Di "Round tube transversal perimeter";
  final parameter Types.Area Am = Modelica.Constants.pi * (Di + t) * t "Transveral area of the metal tube (cross-section)";
  final parameter Real cvolm(unit = "J/(m3.K)") = cm * rhom "Wall volumetric heat capacity [J/m^3.K]; steel = 3.12e6";
  final parameter Types.HeatCapacity Cm = L * Am * cvolm "Total heat capacity of the metal";
  final parameter Types.ThermalConductivity U_wm = lambdam * 2 * Modelica.Constants.pi/ log((Di + 2*t) / Di) "Thermal conductance water-metal per unit meter";
  final parameter Types.ThermalConductivity U_me = lambdaIns * 2 * Modelica.Constants.pi/ log(((Di / 2) + t + tIns) / ((Di/2) + t)) "Thermal conductance metal-ambient per unit meter";
  final parameter Types.ThermalConductance UA_wm = U_wm*L "Equivalent thermal conductance water-metal";
  final parameter Types.ThermalConductance UA_me = U_me*L "Equivalent thermal conductance metal-ambient";


end PartialRoundTube;
