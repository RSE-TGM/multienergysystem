within MultiEnergySystem.ElectricNetwork.Components.Batteries;
model Battery_powerinput
  "Battery sink/source with a single port. Imposed and variable power request"
  extends Icons.BatteryIcon
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
              Diagram(coordinateSystem(preserveAspectRatio=false)));

  Interfaces.ElectricPortInlet inlet annotation (
    Placement(transformation(extent={{82,-10},{102,10}}),
              iconTransformation(extent={{82,-10},{102,10}})));

  // Parameters
  parameter Modelica.Units.SI.Energy E_nom = 3.2*3600*3.7 "Nominal energy [J]";
  parameter Real eta_chg(min=0, max=1) = 0.95 "Charging efficiency";
  parameter Real eta_dis(min=0, max=1) = 0.95 "Discharging efficiency";

  parameter Real SOC0(min=0, max=1) = 0.5 "Initial SOC";
  parameter Real SOC_max(min=0, max=1) = 0.90 "Maximum SOC";
  parameter Real SOC_min(min=0, max=1) = 0.10 "Minimum SOC";

  parameter Modelica.Units.SI.Power P_chg_max = 6e3 "Max charging power (P > 0)";
  parameter Modelica.Units.SI.Power P_dis_max = 6e3 "Max discharging power (P < 0)";

  parameter Real SOC_eps = 1e-4 "Smoothing band near SOC limits";

  // Power request (bidirectional)
  Modelica.Blocks.Interfaces.RealInput P_request
    annotation (Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(origin = {-8, 0}, extent = {{-120, -20}, {-80, 20}})));

  // Variables
  Modelica.Units.SI.Voltage v "Bus voltage";
  Modelica.Units.SI.Power P "Battery power (+ charge, - discharge)";
  Real SOC(min=0, max=1) "State of charge";

  // Availability factors
  Real aChg(min=0, max=1) "Charge availability factor";
  Real aDis(min=0, max=1) "Discharge availability factor";

equation

  // Voltage (read only)
  v = inlet.v;

  // Availability factors (smooth limits)
  aChg = smooth(1, min(1, max(0, (SOC_max - SOC)/SOC_eps)));
  aDis = smooth(1, min(1, max(0, (SOC - SOC_min)/SOC_eps)));

  // Power law (bidirectional)
  P =
    if P_request >= 0 then
      min(P_request, P_chg_max) * aChg
    else
      max(P_request, -P_dis_max) * aDis;

  // Port power
  inlet.P = P;

  // SOC dynamics
  der(SOC) =
    if P >= 0 then
      eta_chg * P / E_nom
    else
      P / (eta_dis * E_nom);  // charging increases SOC
                              // discharging decreases SOC

initial equation
  SOC = SOC0;

end Battery_powerinput;
