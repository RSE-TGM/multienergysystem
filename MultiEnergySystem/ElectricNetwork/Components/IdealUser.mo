within MultiEnergySystem.ElectricNetwork.Components;

model IdealUser 
  "Ideal electrical user with time-varying power demand"

  Interfaces.ElectricPortInlet inlet annotation (
    Placement(transformation(extent={{82,-10},{102,10}}),
              iconTransformation(origin = {-10, 0}, extent = {{82, -10}, {102, 10}})));

  // Inputs
  Modelica.Blocks.Interfaces.RealInput P_in 
    annotation (Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(origin = {20, 0}, extent = {{-120, -20}, {-80, 20}})));

  // Variables
  Modelica.Units.SI.Voltage v;
  Modelica.Units.SI.Power P;

equation

  // Read voltage
  v = inlet.v;

  // Power must be >= 0 (utenza)
  P = max(P_in, 0);

  // Flow convention
  inlet.P = P;

annotation(
    Icon(graphics = {Ellipse(extent = {{-80, 80}, {80, -80}}), Ellipse(fillColor = {79, 129, 189}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}})}));
end IdealUser;
