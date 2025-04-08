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
    annotation (
      Inline = true);
  end cp_T;

  function h_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnthalpy h;
  algorithm
    h := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
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
    Documentation(info="<html>
<p><b>PartialSubstance &ndash; Base Model for Incompressible Liquid Substances</b> </p>
<p>This is a partial model that provides the structure for modeling liquid substances used in district heating networks. It is designed for substances where density and internal energy are primarily temperature-dependent, such as saturated liquid water in operating conditions (15&ndash;85&nbsp;&deg;C). </p>
<p>Models extending this base can define various levels of complexity, from constant property models to polynomial approximations of <span style=\"font-family: Courier New;\">cp(T)</span>, <span style=\"font-family: Courier New;\">rho(T)</span>, and transport properties. </p>
<p><b><span style=\"font-size: 8pt;\">Main Assumptions</span></b> </p>
<ul>
<li>Substance is a <b>pure liquid</b>, modeled as incompressible or weakly compressible depending on <span style=\"font-family: Courier New;\">compressibilityEffect</span>. </li>
<li>Enthalpy follows the relation: <span style=\"font-family: Courier New;\">h = u + p / rho</span>. </li>
<li>Specific heat capacities: <span style=\"font-family: Courier New;\">cp = cv = du/dT</span>. </li>
<li>Entropy <span style=\"font-family: Courier New;\">s</span> is not computed by default (<span style=\"font-family: Courier New;\">computeEntropy = false</span>). </li>
<li>Transport properties <span style=\"font-family: Courier New;\">mu</span> and <span style=\"font-family: Courier New;\">kappa</span> are computed only if <span style=\"font-family: Courier New;\">computeTransport = true</span>. </li>
</ul>
<p><b><span style=\"font-size: 8pt;\">Key Parameters</span></b> </p>
<ul>
<li><span style=\"font-family: Courier New;\">rho_coeff</span>, <span style=\"font-family: Courier New;\">cp_coeff</span>, <span style=\"font-family: Courier New;\">kappa_coeff</span> &ndash; Polynomial coefficients for fitting thermophysical properties. </li>
<li><span style=\"font-family: Courier New;\">mu_start</span>, <span style=\"font-family: Courier New;\">rho_start</span>, <span style=\"font-family: Courier New;\">cp_start</span> &ndash; Used as initialization or fixed values. </li>
<li><span style=\"font-family: Courier New;\">compressibilityEffect</span> &ndash; If <span style=\"font-family: Courier New;\">true</span>, enables derivatives such as <span style=\"font-family: Courier New;\">drho/dT</span> and <span style=\"font-family: Courier New;\">du/dp</span>. </li>
<li><span style=\"font-family: Courier New;\">computeTransport</span> &ndash; Enables dynamic viscosity and thermal conductivity calculation. </li>
<li><span style=\"font-family: Courier New;\">computeEntropy</span> &ndash; Enables entropy output if needed (disabled by default). </li>
</ul>
<p><b><span style=\"font-size: 8pt;\">Typical Use</span></b> </p>
<p>Use this model as a base class when building custom liquid medium models for simulation in heating systems. Extend it and define the necessary thermodynamic and transport property equations in the <span style=\"font-family: Courier New;\">equation</span> section. </p>
<p><b><span style=\"font-size: 8pt;\">Helper Functions</span></b> </p>
<p>Several inline helper functions are available to evaluate property polynomials: </p>
<ul>
<li><span style=\"font-family: Courier New;\">cp_T(T, a)</span>: Computes <span style=\"font-family: Courier New;\">cp</span> from 4-coefficient polynomial </li>
<li><span style=\"font-family: Courier New;\">rho_T(T, a)</span>: Computes <span style=\"font-family: Courier New;\">rho</span> from 3-coefficient polynomial </li>
<li><span style=\"font-family: Courier New;\">kappa_T(T, a)</span>: Computes <span style=\"font-family: Courier New;\">kappa</span> from 3-coefficient polynomial </li>
<li><span style=\"font-family: Courier New;\">drhodT_T(T, a)</span>: Computes <span style=\"font-family: Courier New;\">drho/dT</span> </li>
<li><span style=\"font-family: Courier New;\">u_T(T, a)</span>: Computes internal energy from polynomial cp(T) </li>
</ul>
<p>For coefficient generation, see models in the <span style=\"font-family: Courier New;\">Utilities</span> subpackage. </p>
</html>"));

end PartialSubstance;
