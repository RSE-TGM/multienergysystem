within MultiEnergySystem.ElectricNetwork.Components;
model Electrolyzer "PEM Water Electrolyzer: P_el -> H2 production (molar + mass flow). Water supply assumed infinite."

  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;

  // ---- Parameters ----
  parameter Integer nCells(min=1) = 50 "Number of cells in series";
  parameter SI.Area A_cell = 0.01 "Active area per cell [m2]";
  parameter Real eta_F(min=0, max=1) = 0.98 "Faradaic efficiency [-]";
  parameter Boolean usePolarization = false
    "If true, use (activation + ohmic) polarization; otherwise use fixed V_stack";

  // Fixed-voltage mode
  parameter SI.Voltage V_cell_fixed = 1.9
    "Fixed cell voltage (used if usePolarization=false) [V]";
  parameter SI.Voltage V_stack_fixed = nCells*V_cell_fixed
    "Fixed stack voltage (derived) [V]";

  // Polarization mode (per cell)
  parameter SI.Voltage Vocv_cell = 1.23
    "Open-circuit voltage per cell [V]";
  parameter SI.Resistance R_ohm_cell = 2e-4
    "Area-specific ohmic resistance normalized to cell area [ohm·m2]";
  parameter SI.Voltage a_act = 0.05
    "Tafel slope (activation overvoltage) [V]";
  parameter SI.CurrentDensity i0 = 1e-3
    "Exchange current density [A/m2] (for activation term)";
  parameter Real iReg = 1e-6
    "Regularization (A/m2) to keep logs finite";

  // Constants
  parameter SI.MolarMass M_H2 = 2.01588e-3 "H2 molar mass [kg/mol]";
  parameter SI.FaradayConstant F = 96485.33212 "Faraday constant [C/mol]";

  // ---- Connectors ----
  Modelica.Blocks.Interfaces.RealInput P_el(final unit="W")
    "Electrical power input to the stack [W]";
  Modelica.Blocks.Interfaces.RealOutput nDot_H2(final unit="mol/s")
    "Hydrogen molar production rate [mol/s]";
  Modelica.Blocks.Interfaces.RealOutput mDot_H2(final unit="kg/s")
    "Hydrogen mass production rate [kg/s]";

  // Internal variables
protected
  SI.Voltage V_stack "Computed stack voltage [V]";
  SI.Current I_stack(min=0) "Stack current [A]";
  SI.CurrentDensity i_density "Current density per cell [A/m2]";
  SI.MolarFlowRate nDotFaraday "Ideal Faraday molar rate (no losses) [mol/s]";

equation
  // Non-negativity on power (no consumption => no production)
  0 = if P_el < 0 then P_el else 0;

  // Choose stack voltage model
  if not usePolarization then
    V_stack = V_stack_fixed;
  else
    // Current density is defined from total current and total active area
    // (A_total = nCells * A_cell). We define equations implicitly via V_stack.
    // Polarization per cell: V_cell = Vocv + a_act*ln(i/i0 + 1) + (R_ohm_cell/A_cell)*i
    // Stack voltage = nCells * V_cell
    i_density = if A_cell*nCells > 0 then I_stack/(nCells*A_cell) else 0;
    V_stack = nCells * (
                Vocv_cell
              + a_act * Modelica.Math.log( i_density/i0 + 1 + iReg)
              + (R_ohm_cell/A_cell) * i_density);
  end if;

  // Electrical relation: P = V * I  (guard against division by ~0 V)
  // If V_stack is tiny, current goes to zero.
  I_stack = if V_stack > 1e-6 then P_el / V_stack else 0;

  // Current density (also defined in fixed-V case)
  i_density = if A_cell*nCells > 0 then I_stack/(nCells*A_cell) else 0;

  // Faraday's law: nDot = eta_F * I / (2F)
  nDotFaraday = I_stack / (2*F);
  nDot_H2 = eta_F * noEvent( max(0, nDotFaraday));

  // Mass flow
  mDot_H2 = nDot_H2 * M_H2;

  // Basic sanity checks
  assert(V_stack >= 0, "Computed negative stack voltage; check parameters.");
  assert(nDot_H2 >= -1e-12, "Negative hydrogen flow (numerical issue).");

annotation (
  Documentation(info="
<p><b>ElectrolyzerSimple</b> converts electrical power into hydrogen flow using Faraday's law.</p>
<ul>
  <li><b>Inputs:</b> P_el [W]</li>
  <li><b>Outputs:</b> nDot_H2 [mol/s], mDot_H2 [kg/s]</li>
  <li><b>Assumptions:</b> Infinite water supply; no thermal dynamics.</li>
  <li><b>Modes:</b>
    <ul>
      <li><i>Fixed voltage</i> (default): V_stack = nCells * V_cell_fixed</li>
      <li><i>Polarization</i>: V_cell = Vocv + a_act*ln(i/i0 + 1) + (R_ohm_cell/A_cell)*i</li>
    </ul>
  </li>
  <li><b>Faraday law:</b> nDot_H2 = eta_F * I / (2F)</li>
</ul>
", revisions="
- v1.0 Initial version.
"),           Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), Documentation(info="
<p><b>ElectrolyzerSimple</b> converts electrical power into hydrogen flow using Faraday's law.</p>
<ul>
  <li><b>Inputs:</b> P_el [W]</li>
  <li><b>Outputs:</b> nDot_H2 [mol/s], mDot_H2 [kg/s]</li>
  <li><b>Assumptions:</b> Infinite water supply; no thermal dynamics.</li>
  <li><b>Modes:</b>
    <ul>
      <li><i>Fixed voltage</i> (default): V_stack = nCells * V_cell_fixed</li>
      <li><i>Polarization</i>: V_cell = Vocv + a_act*ln(i/i0 + 1) + (R_ohm_cell/A_cell)*i</li>
    </ul>
  </li>
  <li><b>Faraday law:</b> nDot_H2 = eta_F * I / (2F)</li>
</ul>
", revisions="
- v1.0 Initial version.
"));
end Electrolyzer;
