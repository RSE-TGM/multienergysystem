within MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass;
partial model PartialRoundTube
  extends PartialInsulatedTube;

  parameter Types.Length Di "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Data", group = "Pipe"));

  // Compute final parameters assuming the tube has cilindrical shape
  final parameter Types.Area A = Modelica.Constants.pi * Di ^ 2 / 4 "Cross-sectional area of the inner tube [m^2]";
  final parameter Types.Length omega = Modelica.Constants.pi * Di "Perimeter of the inner tube cross-section [m]";
  final parameter Types.Area Am = Modelica.Constants.pi * (Di + t) * t "Transveral area of the metal tube (cross-section)";
  final parameter Real cvolm(unit = "J/(m3.K)") = cm * rhom "Wall volumetric heat capacity [J/m^3.K]; steel = 3.12e6";
  final parameter Types.HeatCapacity Cm = L * Am * cvolm "Total heat capacity of the metal";
  final parameter Types.ThermalConductance U_wm = lambdam * 2 * Modelica.Constants.pi/ log((Di + 2*t) / Di) "Thermal conductance from fluid to metal wall per unit length [W/(m·K)]";
  final parameter Types.ThermalConductance U_me = lambdaIns * 2 * Modelica.Constants.pi/ log((Di / 2 + t + tIns) / (Di/2) + t) "Thermal conductance from metal wall to environment per unit length [W/(m·K)]";

initial equation
  assert(Di > 0, "Internal diameter (Di) must be positive.");
  assert(t > 0, "Tube thickness (t) must be positive.");
  assert(tIns >= 0, "Insulation thickness (tIns) must be non-negative.");


  annotation (Documentation(info="<html>
<h4>Documentation:</h4>
<p>This partial model represents a cylindrical insulated tube for fluid transport. It extends the <span style=\"font-family: Courier New;\">PartialInsulatedTube</span> model by adding geometry-specific calculations for a round tube, such as cross-sectional area, perimeter, and thermal conductances.</p>
<h4>Usage:</h4>
<p>Extend this model to implement specific behaviors such as heat transfer dynamics, pressure drop calculations, or fluid-structure interactions.</p>
</html>"));
end PartialRoundTube;
