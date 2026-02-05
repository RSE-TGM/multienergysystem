within MultiEnergySystem.ElectricNetwork.Components;
model BatterySystemLevel
  //outer System system;

  Interfaces.ElectricPortOutlet outlet;

  // =========================
  // Parameters
  // =========================
  parameter Modelica.Units.SI.Energy E_nom = 3.2*3600*3.7
    "Nominal energy capacity [J]";

  parameter Real eta_dis = 0.97 "Discharge efficiency";
  parameter Real eta_chg = 0.95 "Charge efficiency";

  // SOC operating window
  parameter Real SOC0(min=0,max=1)     = 0.8  "Initial SOC";
  parameter Real SOC_min(min=0,max=1)  = 0.10 "Minimum allowed SOC";
  parameter Real SOC_max(min=0,max=1)  = 0.90 "Maximum allowed SOC";

  // Power limits (use positive magnitudes)
  parameter Modelica.Units.SI.Power P_chg_max = 5e3 "Max charging power (P>0)";
  parameter Modelica.Units.SI.Power P_dis_max = 5e3 "Max discharging power magnitude (P<0)";

  // Voltage model parameters (simple, system-level)
  parameter Modelica.Units.SI.Voltage Voc0 = 3.2 "OCV at SOC=0 (simplified)";
  parameter Modelica.Units.SI.Voltage Voc1 = 0.8 "OCV gain with SOC (simplified)";

  // Voltage sag with power (simple surrogate for internal losses)
  // Units: V/W
  parameter Real kV = 0.02 "Voltage sag coefficient: v = Voc - kV*P";

  // Smoothing for limit transitions (prevents chattering)
  parameter Real SOC_eps = 1e-4 "SOC smoothing band";

  // =========================
  // Variables
  // =========================
  Modelica.Units.SI.Power P "Raw port power (from network)";
  Modelica.Units.SI.Power P_eff "Effective power used for SOC dynamics (after limits)";
  Modelica.Units.SI.Voltage Voc "Open-circuit voltage";
  Modelica.Units.SI.Voltage v "Terminal voltage";
  Real SOC(min=0,max=1) "State of charge";

  // Availability factors (0..1) that smoothly enforce SOC limits
  Real aChg(min=0,max=1) "Charging allowed factor";
  Real aDis(min=0,max=1) "Discharging allowed factor";

equation
  // =========================
  // Port coupling
  // =========================
  outlet.v = v;
  P = outlet.P;

  // =========================
  // Open-circuit voltage
  // =========================
  // Simple linear OCV (replace with lookup table later)
  Voc = Voc0 + Voc1*SOC;

  // Simple voltage sag with power
  v = Voc - kV*P;

  // =========================
  // SOC limit availability (smooth)
  // =========================
  // When SOC is near SOC_max, reduce ability to charge (P>0).
  // When SOC is near SOC_min, reduce ability to discharge (P<0).
  // smooth(1, ...) helps solvers by avoiding events.
  aChg = smooth(1, min(1, max(0, (SOC_max - SOC)/SOC_eps)));
  aDis = smooth(1, min(1, max(0, (SOC - SOC_min)/SOC_eps)));

  // =========================
  // Power limiting
  // =========================
  // 1) Enforce max charge/discharge power
  // 2) Enforce SOC-window availability (aChg/aDis) near bounds
  //
  // P_eff is what we actually "accept" for changing SOC.
  // If the network requests more than allowed, P_eff saturates.
  //
  P_eff =
    if P >= 0 then
      min(P, P_chg_max) * aChg
    else
      max(P, -P_dis_max) * aDis;

  // =========================
  // SOC dynamics with efficiency
  // =========================
  der(SOC) =
    if P_eff > 0 then
      - eta_chg * P_eff / E_nom
    else
      - P_eff / (eta_dis * E_nom);
                              // Charging
                              // Discharging (P_eff <= 0)

  // Keep SOC within bounds (assert is diagnostic; smooth factors already prevent drift)
  assert(SOC >= SOC_min - 1e-3 and SOC <= SOC_max + 1e-3,
         "SOC outside allowed limits. Check power limits, initial SOC, and model connections.");

initial equation
  SOC = SOC0;


annotation (
  Icon(
    coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
    graphics={
      Rectangle(
        extent={{-80,40},{80,-40}},
        lineColor={0,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=2),
      Rectangle(
        extent={{80,15},{95,-15}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{-78,38},{-78 + 156*SOC, -38}},
        lineColor={0,128,0},
        fillColor={0,200,0},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{-80,40},{80,-40}},
        lineColor={0,0,0},
        fillPattern=FillPattern.None,
        lineThickness=2),
      Text(
        extent={{-100,-60},{100,-90}},
        textString="Battery",
        fontSize=10)}));
end BatterySystemLevel;
