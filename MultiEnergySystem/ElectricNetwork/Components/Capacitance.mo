within MultiEnergySystem.ElectricNetwork.Components;
model Capacitance
"Simple capacitor model storing electrical energy"
  extends Interfaces.PartialTwoPin(
  v(start=v_start)
  );

  // Parameters
  parameter Modelica.Units.SI.Voltage v_start = 0 "Start value";
  parameter Modelica.Units.SI.Capacitance C = 1 "Capacitance of the condenser";
  
  // Variables
  Modelica.Units.SI.Energy E "Stored energy";
  
equation

 i = C * der(v) "Consistutive equation";
 
 E = 0.5 * C * v^2;

annotation(
    Icon(graphics = {Line(origin = {-55, 0}, points = {{-35, 0}, {35, 0}, {35, 0}}, thickness = 0.5), Line(origin = {55, 0}, points = {{-35, 0}, {35, 0}}, thickness = 0.5), Line(origin = {-20, 0}, points = {{0, 60}, {0, -60}}, thickness = 0.5), Line(origin = {20, 0}, points = {{0, 60}, {0, -60}}, thickness = 0.5)}));
end Capacitance;
