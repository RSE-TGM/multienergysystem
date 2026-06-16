within MultiEnergySystem.ElectricNetwork.Sources;
model PowerSource "Ideal power source"

  // System
  outer System system;

  // Options
  parameter Boolean use_in_P0 = false
    "Use external input for power";

  // Nominal value
  parameter Modelica.Units.SI.Power P0 = 5e3
    "Generated power (positive injects into grid)";

  // Variables
  Modelica.Units.SI.Power P;

  // Port
  Interfaces.ElectricPortOutlet outlet annotation (
    Placement(transformation(extent={{80,-20},{120,20}})));

  // Input
  Modelica.Blocks.Interfaces.RealInput in_P0 if use_in_P0
    annotation (Placement(transformation(origin = {-40, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-40, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));

protected
  Modelica.Blocks.Interfaces.RealInput in_P0_internal;
equation

  // Power assignment
  P = in_P0_internal;

  // Flow convention: P entering component → negative injection
  outlet.P = -P;

  // Input handling
  if not use_in_P0 then
    in_P0_internal = P0;
  end if;

  connect(in_P0, in_P0_internal);

annotation (
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {79, 129, 189}, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {80, -40}}), Text(origin = {3, 5}, textColor = {255, 255, 255}, extent = {{-43, 29}, {43, -29}}, textString = "P")}));
end PowerSource;
