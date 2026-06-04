within MultiEnergySystem.ElectricNetwork.Components;

model Transformer "Transformer defined by number of spires"

  // Parameters
  parameter Integer N1 "Number of spires primary circuit";
  parameter Integer N2 "Number of spires secondary circuit";
  parameter Real n = N1/N2 "Spires ratio";
  parameter Real eta = 0.98 "Transformer efficiency";
  parameter Modelica.Units.SI.Power eps = 1e-6 "Regularization power";
  parameter Boolean useThermalPort = true "Enable thermal losses reporting";

  
  // Variables
  Modelica.Units.SI.Power P_in "Entering power in the primary circuit";
  Modelica.Units.SI.Power P_out "Output power in the secoondary circuit";
  Modelica.Units.SI.Power P_loss "Accounts losses for joule effect and in the iron core";
  Modelica.Units.SI.Voltage v_in "Primary circuit voltage";
  Modelica.Units.SI.Voltage v_out "Secondary circuit voltage";

  Interfaces.ElectricPortInlet electricPortInlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.ElectricPortOutlet electricPortOutlet annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  DistrictHeatingNetwork.Interfaces.HeatPort thermalPort annotation(
    Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 78}, extent = {{-10, -10}, {10, 10}})));

equation

// Read primary circuit voltage
  v_in = electricPortInlet.v;
  
// Secondary circuit voltage equation
  v_out = v_in/n;
  
// Set voltage bus
  electricPortOutlet.v = v_out;
  
// Read the incoming electric power
  P_in = electricPortInlet.P;
  
// Losses evaluation through efficiency
  P_loss = (1 - eta)*smooth(1, sqrt(P_in^2 + eps));
  
// Output power equation
  P_out = P_in - P_loss;
  
// Set port power
  electricPortOutlet.P = P_out;
  
// Set thermal losses
  thermalPort.Q_flow = if useThermalPort then -P_loss else 0;
  
// Fixed temperature if not accounting thermal dispersions  
  if not useThermalPort then
    thermalPort.T = 293.15;
  end if;

  
  annotation(
    Icon(graphics = {Rectangle(fillColor = {166, 166, 166}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Line(origin = {-65, 0}, points = {{-25, 0}, {25, 0}, {25, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {-60, 10}, points = {{-20, 0}, {20, 0}, {20, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {-60, 20}, points = {{-20, 0}, {20, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {-60, 30}, points = {{-20, 0}, {20, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {65, 0}, points = {{25, 0}, {-25, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {60, -10}, points = {{20, 0}, {-20, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {60, -20}, points = {{20, 0}, {-20, 0}, {-20, 0}}, color = {79, 129, 189}, thickness = 0.75), Line(origin = {60, -30}, points = {{20, 0}, {-20, 0}}, color = {79, 129, 189}, thickness = 0.75)}));
end Transformer;
