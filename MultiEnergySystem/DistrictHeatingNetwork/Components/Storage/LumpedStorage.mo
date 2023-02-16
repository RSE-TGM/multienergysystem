within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;
model LumpedStorage
  "Model a perfectly mixed thermal storage with insulation all around. Output temperature in Celsius [°C]"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume;
  import DHN4Control.Media.{cp,rho0};

  // Insulation parameters
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter Modelica.Units.SI.Length dIns = 0.15 "Insulation thickness";

  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*h) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2)  "Flat Surface of the cylinder";

equation
  // Pressure at the bottom of the tank is increased as Stevino
  inlet.p - outlet.p = rho0 * h * Modelica.Constants.g_n;

  // Computation of heat loss to ambient
  Q_amb = 1/(R_lateral+2*R_flat) * (Ttilde - T_ext) "Insulation all around";

annotation (
    Icon(graphics={  Rectangle(origin = {-97, -80}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}}), Rectangle(origin = {97, -80}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}}), Polygon(lineColor = {131, 131, 131}, fillColor = {173, 173, 173}, fillPattern = FillPattern.VerticalCylinder, points = {{-100, 80}, {-40, 100}, {40, 100}, {100, 80}, {100, -60}, {40, -100}, {-40, -100}, {-100, -60}, {-100, -60}, {-100, 80}}), Text(origin = {3, 7}, extent = {{-61, 29}, {61, -29}}, textString = "TES"), Rectangle(origin={1,72},     lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}},
          rotation=90),                                                                                                                                                                                                        Rectangle(origin={-1,-72},  lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}},
          rotation=90)}));
end LumpedStorage;
