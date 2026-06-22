within MultiEnergySystem.ElectricNetwork.Sources;
model SourceVoltage_i "Ideal Voltage source"
extends Interfaces.PartialTwoPin;

parameter Modelica.Units.SI.Voltage V = 385 "Imposed voltage";

equation

v = V;

annotation(
    Icon(graphics = {Ellipse(fillColor = {255, 255, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 100}, {100, -100}})}));
end SourceVoltage_i;
