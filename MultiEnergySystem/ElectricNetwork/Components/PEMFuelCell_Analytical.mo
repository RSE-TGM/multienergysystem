within MultiEnergySystem.ElectricNetwork.Components;
model PEMFuelCell_Analytical "PEM Fuel Cell with analytical polarization curve"
  // Based on: Czarnigowski et al. "Simple dynamic model of a PEM-type fuel cell"
  // This version uses analytical equations for the polarization curve
  // instead of experimental data tables

  import Modelica.Electrical.Analog.Interfaces;

  // Electrical pins
  Interfaces.PositivePin pin_p "Positive electrical pin"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Interfaces.NegativePin pin_n "Negative electrical pin"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));

  // Parameters for analytical polarization curve
  parameter Integer nCells = 60 "Number of cells in stack";
  parameter Real E0 = 1.229 "Open circuit voltage per cell at standard conditions [V]";
  parameter Real T = 333.15 "Operating temperature [K] (60°C default)";
  parameter Real R_gas = 8.314 "Universal gas constant [J/(mol·K)]";
  parameter Real F = 96485 "Faraday constant [C/mol]";

  // Activation overvoltage parameters (Tafel equation)
  parameter Real alpha = 0.5 "Charge transfer coefficient";
  parameter Real i0 = 1e-7 "Exchange current density [A/cm²]";
  parameter Real A_cell = 100 "Active cell area [cm²]";

  // Ohmic overvoltage parameters
  parameter Real R_ohm = 0.15 "Ohmic resistance per cell [Ohm]";

  // Mass transport overvoltage parameters
  parameter Real i_L = 1.5 "Limiting current density [A/cm²]";
  parameter Real m = 2.5e-5 "Mass transport parameter";

  // Parameters for dynamic model
  parameter Real kDyn = 0.541 "Fuel cell inertia coefficient";

  // Parameters for purging/cleaning model
  parameter Real deltaUmax = 3.00 "Maximum voltage increase over polarization curve [V]";
  parameter Real deltaUtot = 3.12 "Total possible voltage drop under polarization curve [V]";
  parameter Real kC = 10.03 "Cleaning decay coefficient";
  parameter Real purgeFrequency = 1.0 "Purge frequency [Hz]";
  parameter Real purgeDuration = 0.1 "Duration of purge event [s]";
  parameter Real shortCircuitResistance = 0.01 "Resistance during short circuit [Ohm]";

  // Internal variables
  Real UFC(start=40.0) "Total fuel cell voltage [V]";
  Real UP(start=40.0) "Static polarization curve voltage [V]";
  Real UDyn(start=0.0) "Dynamic component of voltage [V]";
  Real UPurg(start=0.0) "Purging component of voltage [V]";
  Real I(start=0.0) "Fuel cell current [A]";
  Real ILoad(start=0.0) "Load current [A]";
  Real IShort "Short circuit current during purge [A]";
  Boolean purgeActive "Purge activation flag";
  Real timeSinceLastPurge(start=0.0) "Time since last purge event [s]";
  Real dU_dt "Voltage derivative [V/s]";

  // Intermediate variables for polarization curve calculation
  Real i_density "Current density [A/cm²]";
  Real V_Nernst "Nernst voltage (ideal voltage) [V]";
  Real V_act "Activation overvoltage [V]";
  Real V_ohm "Ohmic overvoltage [V]";
  Real V_conc "Concentration (mass transport) overvoltage [V]";
  Real V_cell "Single cell voltage [V]";

protected
  constant Real eps = 1e-10 "Small value to avoid division by zero";

equation
  // Electrical connections
  pin_p.i + pin_n.i = 0;
  UFC = pin_p.v - pin_n.v;
  I = pin_p.i;

  // Purge control logic
  purgeActive = mod(time, 1/purgeFrequency) < purgeDuration;

  // Time tracking for purge cycle
  der(timeSinceLastPurge) = if purgeActive then -timeSinceLastPurge/0.001 else 1.0;

  // Current selection based on purge state
  ILoad = if not purgeActive then I else 0;
  IShort = if purgeActive then UFC/shortCircuitResistance else 0;

  // Calculate current density
  i_density = (if purgeActive then IShort else ILoad) / A_cell;

  // === Analytical Polarization Curve Calculation ===

  // 1. Nernst voltage (thermodynamic ideal voltage)
  // Simplified - assumes constant pressure and concentrations
  V_Nernst = E0 - (R_gas * T) / (2 * F) * log(1.0); // ln(1) = 0 for standard conditions

  // 2. Activation overvoltage (Tafel equation)
  // V_act = (R*T)/(alpha*F) * ln(i/i0)
  // Using smooth approximation to avoid log(0)
  V_act = (R_gas * T) / (alpha * F) * log((i_density + eps) / i0);

  // 3. Ohmic overvoltage (linear with current)
  // V_ohm = I * R_ohm
  V_ohm = (if purgeActive then IShort else ILoad) * R_ohm;

  // 4. Concentration/Mass transport overvoltage (exponential region)
  // V_conc = m * ln(i_L / (i_L - i))
  // Using smooth approximation to avoid division by zero and negative logs
  V_conc = if i_density < i_L - eps then
             m * log(max(eps, i_L / (i_L - i_density)))
           else
             m * log(1/eps); // Large penalty for exceeding limit

  // Single cell voltage
  V_cell = V_Nernst - V_act - V_ohm - V_conc;

  // Total stack voltage (static polarization)
  UP = nCells * V_cell;

  // === Dynamic component - inertia effect ===
  // UDyn = -kDyn * dU/dt
  dU_dt = der(UFC);
  UDyn = -kDyn * dU_dt;

  // === Purging/cleaning component ===
  // UPurg = deltaUmax + deltaUtot * (1/(e^(kC*t)) - 1)
  UPurg = if timeSinceLastPurge > 0 then
            deltaUmax + deltaUtot * (1/exp(kC * timeSinceLastPurge) - 1)
          else
            deltaUmax;

  // === Total fuel cell voltage ===
  // UFC = UP + UDyn + UPurg
  UFC = UP + UDyn + UPurg;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
      Rectangle(
        extent={{-100,100},{100,-100}},
        lineColor={0,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Line(points={{-80,60},{-80,-60}}, color={0,0,255}),
      Line(points={{-60,60},{-60,-60}}, color={0,0,255}),
      Line(points={{60,60},{60,-60}}, color={255,0,0}),
      Line(points={{80,60},{80,-60}}, color={255,0,0}),
      Line(points={{-80,0},{-100,0}}, color={0,0,255}),
      Line(points={{80,0},{100,0}}, color={255,0,0}),
      Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        textColor={0,0,255}),
      Text(
        extent={{-100,-70},{100,-100}},
        textString="PEM FC (Analytical)",
        textColor={0,0,0}),
      Polygon(
        points={{-20,60},{20,60},{0,80},{-20,60}},
        lineColor={0,0,0},
        fillColor={0,255,0},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-20,-60},{20,-60},{0,-80},{-20,-60}},
        lineColor={0,0,0},
        fillColor={0,255,0},
        fillPattern=FillPattern.Solid),
      Text(
        extent={{-40,40},{40,20}},
        textString="H₂",
        textColor={0,0,0}),
      Text(
        extent={{-40,-20},{40,-40}},
        textString="O₂",
        textColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4>PEM Fuel Cell Model with Analytical Polarization Curve</h4>
<p>
This model implements a PEM fuel cell with an analytical polarization curve based on
electrochemical principles, eliminating the need for experimental data tables.
</p>

<h4>Polarization Curve Components</h4>
<p>The cell voltage is calculated as:</p>
<p><b>V_cell = V_Nernst - V_act - V_ohm - V_conc</b></p>

<h5>1. Nernst Voltage (Thermodynamic Potential)</h5>
<p>
The ideal reversible voltage based on Gibbs free energy:
<br/>V_Nernst = E0 - (RT/2F) × ln(1)
<br/>where E0 = 1.229 V at standard conditions
</p>

<h5>2. Activation Overvoltage (Tafel Equation)</h5>
<p>
Energy loss due to electrochemical reaction kinetics:
<br/>V_act = (RT/αF) × ln(i/i0)
<br/>where:
<ul>
<li>α = charge transfer coefficient (typically 0.5)</li>
<li>i0 = exchange current density (very small, ~10⁻⁷ A/cm²)</li>
</ul>
This creates the logarithmic voltage drop at low currents.
</p>

<h5>3. Ohmic Overvoltage</h5>
<p>
Linear voltage drop due to electrical resistance:
<br/>V_ohm = I × R_ohm
<br/>This creates the linear middle region of the polarization curve.
</p>

<h5>4. Concentration Overvoltage (Mass Transport)</h5>
<p>
Voltage loss due to reactant depletion at high currents:
<br/>V_conc = m × ln(i_L / (i_L - i))
<br/>where:
<ul>
<li>i_L = limiting current density</li>
<li>m = mass transport parameter</li>
</ul>
This creates the exponential voltage drop at high currents.
</p>

<h4>Key Parameters to Adjust</h4>
<table border=\"1\">
<tr><th>Parameter</th><th>Default</th><th>Effect</th></tr>
<tr><td>nCells</td><td>60</td><td>Number of cells in stack (scales total voltage)</td></tr>
<tr><td>E0</td><td>1.229 V</td><td>Standard cell potential</td></tr>
<tr><td>T</td><td>333.15 K</td><td>Operating temperature (affects all losses)</td></tr>
<tr><td>i0</td><td>1e-7 A/cm²</td><td>Exchange current (affects activation region)</td></tr>
<tr><td>R_ohm</td><td>0.15 Ω</td><td>Ohmic resistance (affects linear region slope)</td></tr>
<tr><td>i_L</td><td>1.5 A/cm²</td><td>Current limit (affects high-current region)</td></tr>
<tr><td>A_cell</td><td>100 cm²</td><td>Active area (scales current capacity)</td></tr>
</table>

<h4>Advantages</h4>
<ul>
<li>No experimental data required</li>
<li>Physics-based equations</li>
<li>Easy to understand parameter effects</li>
<li>Can be adapted for different conditions (temperature, pressure)</li>
</ul>

<h4>Calibration Guide</h4>
<p>To match a real fuel cell:</p>
<ol>
<li>Set nCells to match your stack</li>
<li>Adjust R_ohm to match the slope of the linear region</li>
<li>Adjust i0 to match the activation region steepness</li>
<li>Adjust i_L and m to match the high-current region</li>
<li>Adjust A_cell to scale total current capacity</li>
</ol>

<h4>Dynamic and Purging Components</h4>
<p>
The dynamic inertia (UDyn) and purging (UPurg) components remain the same as 
in the table-based model, following the equations from the paper.
</p>
</html>"));
end PEMFuelCell_Analytical;
