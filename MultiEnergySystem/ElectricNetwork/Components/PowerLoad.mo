within MultiEnergySystem.ElectricNetwork.Components;
model PowerLoad
"A constant power load model that enforces a fixed power consumption at its terminals, regardless of the voltage and current values"
  extends MultiEnergySystem.ElectricNetwork.Interfaces.PartialTwoPin;

  parameter Modelica.Units.SI.Power P_nominal = 1000;

  Modelica.Units.SI.Power P_abs;

equation
  P_abs = v*i;
  P_abs = P_nominal;

annotation(
    Icon(graphics = {Rectangle(lineThickness = 0.5, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}})}));
end PowerLoad;
