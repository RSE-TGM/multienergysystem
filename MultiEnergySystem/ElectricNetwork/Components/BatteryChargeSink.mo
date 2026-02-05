within MultiEnergySystem.ElectricNetwork.Components;
model BatteryChargeSink
  outer System system;

  // Single power-port connection to the bus
  Interfaces.ElectricPortInlet inlet;

  // Parameters
  parameter Modelica.Units.SI.Energy E_nom = 3.2*3600*3.7 "Nominal energy [J]";
  parameter Real eta_chg(min=0, max=1) = 0.95 "Charging efficiency";
  parameter Real SOC0(min=0, max=1) = 0.5 "Initial SOC";
  parameter Real SOC_max(min=0, max=1) = 0.90 "Maximum SOC";

  parameter Modelica.Units.SI.Power P_chg_max = 6e3 "Max charging power (P>0)";
  parameter Real SOC_eps = 1e-4 "Smoothing band near SOC_max";

  // Optional: constant charging request (could be replaced by an input later)
  parameter Modelica.Units.SI.Power P_request = 5e3 "Requested charging power (>=0)";

  // Variables
  Modelica.Units.SI.Voltage v "Bus voltage (read only)";
  Modelica.Units.SI.Power P "Power drawn from bus (>=0)";
  Real SOC(min=0, max=1) "State of charge";

  Real aChg(min=0, max=1) "Charge availability factor";

equation
  // Read the bus voltage (do NOT impose it)
  v = inlet.v;

  // Smoothly reduce charging as SOC approaches SOC_max
  aChg = smooth(1, min(1, max(0, (SOC_max - SOC)/SOC_eps)));

  // Battery draws power from the bus (positive into battery)
  P = min(max(P_request, 0), P_chg_max) * aChg;

  // Set port power (flow variable)
  inlet.P = P;

  // SOC dynamics from energy balance (charging increases SOC)
  der(SOC) = eta_chg * P / E_nom;

initial equation
  SOC = SOC0;

end BatteryChargeSink;
