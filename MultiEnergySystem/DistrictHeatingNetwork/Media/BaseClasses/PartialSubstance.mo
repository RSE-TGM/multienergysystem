within MultiEnergySystem.DistrictHeatingNetwork.Media.BaseClasses;
partial model PartialSubstance "Base model for liquid pure substances"
  extends Modelica.Icons.MaterialProperty;

  // --- General Options ---
  parameter Boolean computeTransport = false "Set to true to compute transport properties (dynamic viscosity and thermal conductivity)";
  parameter Boolean computeEntropy = false "Set to true to compute specific entropy";
  parameter Boolean compressibilityEffect = false "Enable computation of compressibility-related effects";

  // --- Thermodynamic Initialization ---
  parameter Types.Pressure p_start "Start value of the fluid pressure";
  parameter Types.Temperature T_start "Start value of the fluid temperature";
  final parameter Types.SpecificEnthalpy h_start = h_T(T_start,cp_coeff) "Start value specific enthalpy (calculated)";

  // --- Fluid Properties ---
  parameter Types.Density rho_start = 990 "Start value of the fluid density";
  parameter Types.SpecificHeatCapacity cp_start = 4185 "Start value of fluid specific heat capacity";
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";
  parameter Types.MolarMass MM "Molar mass of the fluid";

  // --- Polynomial Coefficients ---
  parameter Real rho_coeff[3] "Coefficients to compute fluid density";
  parameter Real cp_coeff[4] "Coefficients to compute specific heat capacity";
  parameter Real kappa_coeff[3] "Coefficients to compute thermal conductivity";

  //Variables
  connector InputPressure = input Types.Pressure "Pseudo-input to check model balancedness";
  connector InputTemperature = input Types.Temperature "Pseudo-input to check model balancedness";
  InputPressure p(start = p_start) "Absolute pressure";
  InputTemperature T(start = T_start) "Temperature";
  Types.Density rho(start = rho_start) "Density";
  Real drho_dT(unit = "kg/(m3.K)") annotation (
    HideResult = not compressibilityEffect);
  Types.SpecificVolume v "Specific volume";
  Types.MolarVolume v_mol "Molar volume";
  Types.SpecificEnergy u "Specific Internal Energy of the fluid";
  Types.SpecificEnthalpy h(start = h_start) "Specific Enthalpy of the fluid";
  Types.SpecificEntropy s "Specific Entropy" annotation (
    HideResult = not computeEntropy);
  Types.SpecificHeatCapacity cp(start = cp_start) "Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cv "Specific heat capacity of the fluid";
  Types.DerSpecEnergyByTemperature du_dT "Temperature derivative of the Specific Internal Energy";
  Types.DerSpecEnergyByPressure du_dp "Pressure derivative of the Specific Internal Energy" annotation (
    HideResult = not compressibilityEffect);
  Types.DerSpecificVolumeByTemperature dv_dT "Temperature derivative of specific volume at constant pressure" annotation (
    HideResult = not compressibilityEffect);
  Types.DerSpecificVolumeByPressure dv_dp "Pressure derivative of specific volume at constant Temperature" annotation (
    HideResult = not compressibilityEffect);
  Types.DynamicViscosity mu(start = mu_start) "Dynamic viscosity" annotation (
    HideResult = not computeTransport);
  Types.ThermalConductivity kappa "Thermal Conductivity" annotation (
    HideResult = not computeTransport);

protected
  function cp_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificHeatCapacity cp;
  algorithm
    cp := a[4] + T*(a[3] + T*(a[2] + T*a[1]));
    //cp := a[3] + T*(a[2] + T*a[1]);
    annotation (
      Inline = true);
  end cp_T;

  function h_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnthalpy h;
  algorithm
    h := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
    //h := T*(a[3] + T*(a[2]/2 + T*a[1]/3));
  annotation(Inline = true);
  end h_T;

  function kappa_T
    input Types.Temperature T;
    input Real a[3];
    output Types.ThermalConductivity kappa;
  algorithm
    kappa := a[3] + T*(a[2] + T*(a[1]));
    annotation (
      Inline = true);
  end kappa_T;


  function rho_T
    input Types.Temperature T;
    input Real a[3];
    output Types.Density rho;
  algorithm
    rho := a[3] + T*(a[2] + T*(a[1]));
    annotation (
      Inline = true);
  end rho_T;

  function drhodT_T
    input Types.Temperature T;
    input Real a[3];
    output Real drho_dT(unit = "kg/(m3.K)");
  algorithm
    drho_dT := a[2] + T*(2*a[1]);
    annotation (
      Inline = true);
  end drhodT_T;

  function u_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnergy u;
  algorithm
    u := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
    annotation (
      Inline = true);
  end u_T;

  function s_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEntropy s;
  algorithm
    s := a[4]*log(T) + T*(a[3] + T*(a[2]/2 + T*a[1]/3));
    annotation (
      Inline = true);
  end s_T;
  annotation (
    Documentation(info="<HTML>
  <h4>PartialSubstance – Base Model for Incompressible Liquid Substances</h4>

  <p>This is a partial model that provides the structure for modeling liquid substances used in 
  district heating networks. It is designed for substances where density and internal energy are 
  primarily temperature-dependent, such as saturated liquid water in operating conditions 
  (15–85&nbsp;°C).</p>

  <p>Models extending this base can define various levels of complexity, from constant property models 
  to polynomial approximations of <code>cp(T)</code>, <code>rho(T)</code>, and transport properties.</p>

  <h5>Main Assumptions</h5>
  <ul>
    <li>Substance is a <b>pure liquid</b>, modeled as incompressible or weakly compressible depending on <code>compressibilityEffect</code>.</li>
    <li>Internal energy <code>u</code> is primarily a function of temperature: <code>u = u(T)</code>.</li>
    <li>Enthalpy follows the relation: <code>h = u + p / rho</code>.</li>
    <li>Specific heat capacities: <code>cp = cv = du/dT</code>.</li>
    <li>Entropy <code>s</code> is not computed by default (<code>computeEntropy = false</code>).</li>
    <li>Transport properties <code>mu</code> and <code>kappa</code> are computed only if <code>computeTransport = true</code>.</li>
  </ul>

  <h5>Key Parameters</h5>
  <ul>
    <li><code>rho_coeff</code>, <code>cp_coeff</code>, <code>kappa_coeff</code> – Polynomial coefficients for fitting thermophysical properties.</li>
    <li><code>mu_start</code>, <code>rho_start</code>, <code>cp_start</code> – Used as initialization or fallback values.</li>
    <li><code>compressibilityEffect</code> – If <code>true</code>, enables derivatives such as <code>drho/dT</code> and <code>du/dp</code>.</li>
    <li><code>computeTransport</code> – Enables dynamic viscosity and thermal conductivity calculation.</li>
    <li><code>computeEntropy</code> – Enables entropy output if needed (disabled by default).</li>
  </ul>

  <h5>Typical Use</h5>
  <p>Use this model as a base class when building custom liquid medium models for simulation in 
  heating systems. Extend it and define the necessary thermodynamic and transport property equations 
  in the <code>equation</code> section.</p>

  <h5>Helper Functions</h5>
  <p>Several inline helper functions are available to evaluate property polynomials:</p>
  <ul>
    <li><code>cp_T(T, a)</code>: Computes <code>cp</code> from 4-coefficient polynomial</li>
    <li><code>rho_T(T, a)</code>: Computes <code>rho</code> from 3-coefficient polynomial</li>
    <li><code>kappa_T(T, a)</code>: Computes <code>kappa</code> from 3-coefficient polynomial</li>
    <li><code>drhodT_T(T, a)</code>: Computes <code>drho/dT</code></li>
    <li><code>u_T(T, a)</code>: Computes internal energy from polynomial cp(T)</li>
  </ul>

  <p>For coefficient generation, see models in the <code>Utilities</code> subpackage.</p>

        </HTML>"));

end PartialSubstance;
