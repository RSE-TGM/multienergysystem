within MultiEnergySystem.ElectricNetwork.Components;

model Switch
"Simple electrical switch model that toggles between a very low resistance (closed state) and a very high resistance (open state), controlling current flow between two pins"
  
  extends Interfaces.PartialTwoPin;

  Boolean closed(start = false) "true = switch closed";

  parameter Modelica.Units.SI.Resistance R_closed = 1e-5;
  parameter Modelica.Units.SI.Resistance R_open = 1e8;

  Modelica.Units.SI.Resistance R_actual;

equation
  R_actual = if closed then R_closed else R_open;

  v = R_actual*i;

annotation(
    Icon(graphics = {Line(origin = {-28.8462, 15.1538}, points = {{-61.1538, -15.1538}, {-11.1538, -15.1538}, {60.8462, 14.8462}}), Line(origin = {65, 0}, points = {{-25, 0}, {25, 0}})}));
end Switch;
