within MultiEnergySystem.ElectricNetwork.Components;
model Inductance
"Model of inductance with stored energy"
extends Interfaces.PartialTwoPin;

// Parameters
parameter Modelica.Units.SI.Inductance L = 1 "Constant inductance";

// Variables
Modelica.Units.SI.Energy E "Stored energy";

equation

v - L * der(i) = 0 "Constitutive equation";

E = 0.5 * L * i^2;

annotation(
    Icon(graphics = {Ellipse(origin = {-30, 0}, extent = {{-10, 20}, {10, -20}}), Ellipse(origin = {30, 0}, extent = {{-10, 20}, {10, -20}}), Ellipse(origin = {-10, 0}, extent = {{-10, 20}, {10, -20}}), Ellipse(origin = {10, 0}, extent = {{-10, 20}, {10, -20}}), Rectangle(origin = {-1, -17}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-77, 17}, {77, -17}}), Line(origin = {-65, 0}, points = {{-25, 0}, {25, 0}}), Line(origin = {65, 0}, points = {{-25, 0}, {25, 0}})}));
end Inductance;
