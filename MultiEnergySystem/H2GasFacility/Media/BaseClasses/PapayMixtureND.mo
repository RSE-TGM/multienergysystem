within MultiEnergySystem.H2GasFacility.Media.BaseClasses;
partial model PapayMixtureND
  extends PartialMixture(Xi_start = X_start[1:nXi], rho(start = rho_start), cp(start = cp_id_start), computeDerivatives = false);
  import Modelica.Fluid.Utilities.regStep;

  // Constants
  constant Real Zcoeff[4] = {1, 3.52, 2.2660, 1.878};

  // Parameters
  parameter Integer posDom = 1 "Position of the dominant component, usually 1";
  parameter Types.MolarMass MM[nX] "Molar mass of the gas components";
  parameter Types.Pressure p_c[nX] "Critical pressure of each component";
  parameter Types.Temperature T_c[nX] "Critical temperature of each component";
  parameter Types.MolarVolume v_mol_c[nX] "Critical molar volume of each component";
  parameter Types.SpecificEnthalpy Hf[nX] "Hf derived from Modelica.Media.IdealGases.Common.SingleGasesData";
  parameter Real HHV[nX](each unit = "J/kg") "Higher Heating Value of each component in mass units";
  parameter Real LHV[nX](each unit = "J/kg") "Lower Heating Value of each component in mass units";
  parameter Real HHV_SCM[nX](each unit = "J/m3") "Higher Heating Value of each component in J/Sm3 units T = 15°C, p = 1.01325 bar";
  parameter Real LHV_SCM[nX](each unit = "J/m3") "Lower Heating Value of each component in J/Sm3 units T = 15°C, p = 1.01325 bar";
  parameter Types.Temperature T0 = 15 + 273.15 "Reference temperature";
  parameter Types.Pressure p0 = 101325; //1e5 "Reference pressure";
  parameter Real cp_coeff[nX, ord_cp_ideal + 1] "copied from the result of Utilities.ComputeGasCoefficients, for independent mass components";

  // Final parameters
  final parameter Types.SpecificHeatCapacity R_star[nX] = {Modelica.Constants.R/MM[i] for i in 1:nX} "Specific gas constants per unit mass";
  final parameter Types.MoleFraction Y_start[nX] = massToMoleFractions(X_start, MM) "Start value for mole fraction";
  final parameter Types.MolarMass MM_mix_start = MM*Y_start;
  final parameter Types.PerUnit Z_c[nX] = {p_c[i]*v_mol_c[i]/(R*T_c[i]) for i in 1:nX} "Critical compressibility factor";
  final parameter Types.PerUnit T_red_start = T_start/T_c[posDom] "Reduced temperature of the main component of the gas, which is the dominant component";
  final parameter Types.PerUnit p_red_start = p_start/p_c[posDom] "Reduced pressure of of the main component of the gas, which is the dominant component";
  final parameter Types.Density rho_start = MM_mix_start/v_mol_start;
  final parameter Types.SpecificHeatCapacity cp_id_start = X_start*{cp_T(T_start, cp_coeff[i]) for i in 1:nX} "Ideal Specific heat capacity of the fluid";
  final parameter Types.SpecificEnthalpy h_star_start[nX] = {Hf[i] + h_T(T_start, cp_coeff[i]) - h_T(T0, cp_coeff[i]) for i in 1:nX};
  final parameter Types.SpecificEnthalpy h_id_start = X_start*h_star_start;
  final parameter Types.SpecificHeatCapacity cp_star_start[nX] = {cp_T(T_start, cp_coeff[i]) for i in 1:nX};
  final parameter Types.PerUnit dX_dX_start[nX, nX] = identity(nX);
  final parameter Types.PerUnit dY_dX_start[nX, nX] = {(MM_mix_start/MM[i])*(dX_dX_start[i, j] - (MM_mix_start/MM[j])*X_start[i]) for j in 1:nX, i in 1:nX};
  final parameter Types.MolarVolume v_mol_start = R*T_start/p_start "provided that this fluid composition is mostly the dominant component";

  //Variables
  Types.Temperature T_c_mix(start = T_c[posDom]) "Pseudo-critical temperature of the fluid mixture";
  Types.Pressure p_c_mix(start = p_c[posDom]) "Pseudo-critical pressure of the mixture";
  Types.SpecificEnthalpy h_star[nX](start = h_star_start) "Ideal Specific Enthalpy of each component";
  Types.SpecificEnthalpy h_id(start = h_id_start) "Ideal Specific Enthalpy of the fluid";
  Types.SpecificEntropy s_star[nX] "Specific entropy of the fluid";
  Types.SpecificEntropy s_id "Ideal Specific Entropy of the fluid";
  Types.SpecificHeatCapacity cp_id(start = X_start*cp_star_start) "Ideal Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_star[nX](start = cp_star_start) "Specific heat capacity of the fluid";
  Types.ThermalConductivity k "Thermal Conductivity" annotation (
    HideResult = not ComputeTransport);
  Types.MoleFraction Y[nX](start = Y_start) "Mole fractions of the components";
  Types.MolarMass MM_mix(start = MM*Y_start, nominal = MM*Y_start) "Molar Mass of the fluid (mixture)";
  Types.SpecificVolume v(start = v_mol_start/MM_mix_start) "Speficic volume";
  Types.MolarVolume v_mol(start = v_mol_start) "Molar volume";
  Types.DerPressureByTemperature dp_dT "Temperature derivative of Pressure at constant specific volume";
  Types.DerPressurebySpecificVolume dp_dv "Specific volumen derivative of Pressure at constant temperature";
  Types.PerUnit Tr[nX](start = T_start./T_c) "Reduced temperatures of each component";
  Types.PerUnit Tr_mix(start = T_start/T_c[posDom]) "Pseudo-reduced temperature of the mixture";
  Types.PerUnit pr[nX](start = p_start./p_c) "Reduced pressure of each component";
  Types.PerUnit pr_mix(start = p_start/p_c[posDom]) "Pseudo-reduced pressure of the mixture";
  Types.PerUnit Tr0[nX](start = T0./T_c) "Reduced temperatures of each component";
  Types.PerUnit Z(start = 1) "Compressibility factor of the mixture";

  //** Energy Variables
  Types.PerUnit Z0(start = 1) "Compressibility factor of the mixture at Standard Conditions";
  Real HHV_mix(unit = "J/kg") "Higher Heating Value of the fluid in mass units";
  Real LHV_mix(unit = "J/kg") "Lower Heating Value of the fluid in mass units";
  Real HHV_SCM_mix(unit = "J/m3") "Higher Heating Value of the fluid mixture in Standard conditions";
  Real LHV_SCM_mix(unit = "J/m3") "Lower Heating Value of the fluid mixture in Standard conditions";
  Types.Density rho0 "Density of the fluid mixture at reference temperature and pressure";
  Types.MolarVolume v_mol_0(start = R*T0/p0) "Molar volume of the fluid mixture at reference temperature and pressure";
  Types.PerUnit SG "Specific gravity of the fluid mixture";
  Real WI(unit = "J/m3") "Wobbex Index of the fluid mixture";

initial equation
  assert(abs(p/p_start - 1) < 0.25, "Please check p_start, you may get convergence to wrong solution of P-R EoS", AssertionLevel.warning);
equation
  if nX == nXi+1 then
    X[1:nXi] = Xi;
    X[nX] = 1 - sum(Xi);
  else
    X = Xi;
  end if;
//  X[1:nXi] = Xi;
//  X[nX] = 1 - sum(Xi);

  assert(sum(X) > 0, "error1");
  assert(sum(MM) > 0, "error2");

  Y = massToMoleFractions(X, MM) "conversion from mass to mole fractions";
  MM_mix = MM*Y "molar mass of the fluid";
  Tr = T./T_c;
  pr = p./p_c;
  T_c_mix = X*T_c + eps;
  p_c_mix = X*p_c + eps;
  Tr_mix = T/T_c_mix;
  pr_mix = p/p_c_mix;
  Tr0 = T0./T_c;

  p*v_mol = Z*R*T;
  Z = 1 - Zcoeff[1]*pr_mix*exp(-Zcoeff[2]*Tr_mix) + Zcoeff[3]*pr_mix*pr_mix*exp(-Zcoeff[4]*Tr_mix);
  rho = 1/v;
  v_mol = v*MM_mix;

  for i in 1:nX loop
    h_star[i] = Hf[i] + h_T(T, cp_coeff[i]) - h_T(T0, cp_coeff[i]) "Ideal specific enthalpy of each component in unit mass";
    //h_star[i] = h_T(T, cp_coeff[i]) "Ideal specific enthalpy of each component in unit mass";
    cp_star[i] = cp_T(T, cp_coeff[i]) "Ideal specific heat capacity of each component in unit mass";
  end for;

  //Specific Enthalpy
  h_id = X*h_star "Ideal Specific Enthalpy of the fluid in unit mass";
  h - h_id = 0;

  //Specific Heat Capacity
  cp_id = X*cp_star;
  cp = cp_id;
  cp = cv - (T*(dp_dT^2)/dp_dv) "in unit mass, from(2)-Equation S2.126";

  //Thermodynamic variables
  h = u + p*v "in unit mass";

  dp_dv = p/(((-Zcoeff[1]*exp(-Zcoeff[2]*Tr_mix) + 2*pr_mix*Zcoeff[3]*exp(-Zcoeff[4]*Tr_mix))/p_c_mix) - v) "in mass units";
  dp_dT = ((R/MM_mix)*T*(Zcoeff[1]*Zcoeff[2]*pr_mix*exp(-Zcoeff[2]*Tr_mix)/p_c_mix - Zcoeff[3]*Zcoeff[4]*pr_mix^2*exp(-Zcoeff[4]*Tr_mix)/T_c_mix) + Z*(R/MM_mix)) / (v - (R/MM_mix)*T*(-Zcoeff[1]*exp(-Zcoeff[2]*Tr_mix)/p_c_mix + Zcoeff[3]*exp(-Zcoeff[4]*Tr_mix)*2*pr_mix/p_c_mix));

  mu = if computeTransport then mu_start else 0;
  k = 0 "computation not included in the model";

  //Entropy
  if computeEntropy then
    for i in 1:nX loop
      s_star[i] = s_T(T, cp_coeff[i]) - s_T(T0, cp_coeff[i]) - (R*log(p/p0))/MM_mix "Ideal specific entropy of each component in unit mass, from(3)-Equation 6.11";
    end for;
    s_id = X*s_star + (R*sum(Y[i]*log(Y[i] + eps) for i in 1:nX))/MM_mix "from(3)-Equation 8.6";
  else
    s_id = 0;
    s_star = zeros(nX);
  end if;
  s - s_id = 0;

  // Energy variables
  Z0 = 1 - Zcoeff[1]*(p0/p_c_mix)*exp(-Zcoeff[2]*T0/T_c_mix) + Zcoeff[3]*(p0/p_c_mix)*(p0/p_c_mix)*exp(-Zcoeff[4]*T0/T_c_mix);
  p0*v_mol_0 = Z0*R*T0;
  rho0 = MM_mix/v_mol_0;
  if computeEnergyVariables then
    HHV_mix = HHV*X;
    LHV_mix = LHV*X;
    HHV_SCM_mix = HHV_SCM*Y;
    LHV_SCM_mix = LHV_SCM*Y;
    SG = rho0/rhoair;
    WI = HHV_SCM_mix/sqrt(SG);
  else
    HHV_mix = 0;
    LHV_mix = 0;
    HHV_SCM_mix = 0;
    LHV_SCM_mix = 0;
    SG = 0;
    WI = 0;
  end if;

  annotation (
    Documentation(info = "<html><head></head><body><h3>Model of a gas fluid using Peng Robinson EoS</h3><div class=\"htmlDoc\"><p>The objetive of this model is to obtain approximately the thermodynamic properties of the mixture gas to use it in the modeling of the Allam Cycle. The following references has been used:</p><p></p><p>(1)&nbsp;<a href=\"https://www.researchgate.net/publication/231293953_New_Two-Constant_Equation_of_State\">Peng, Ding-yu &amp; Robinson, Donald. (1976). New Two-Constant Equation of State. Industrial &amp; Engineering Chemistry Fundamentals. 15. 10.1021/i160057a011.&nbsp;</a></p><p>(2)&nbsp;<a href=\"https://ars.els-cdn.com/content/image/1-s2.0-S0896844618307903-mmc1.pdf\">\"Equation of State and Thermodynamic Properties for Mixtures of H2O, O2, N2 and CO2 from Ambient up to 1000K and 280MPa - S. Supporting Information\" - F. Mangold, St. Pilz, S. Beljic, F. Vogel - 2019,&nbsp;pp 19-20</a></p><p>(3)&nbsp;<a href=\"https://www.researchgate.net/publication/327832564_Thermodynamics_Fundamentals_and_Engineering_Applications\">Colonna, Piero &amp; Reynolds, William. (2018). Thermodynamics: Fundamentals and Engineering Applications. 10.1017/9781139050616.&nbsp;</a></p><p>(4)&nbsp;<a href=\"http://web.nchu.edu.tw/pweb/users/cmchang/lesson/10174.pdf\">Chapter 6 \"Calculation of Properties of Pure Fluids\" - CM. J. Chang from National Chung Hsing University - 2012, pp 59-64</a></p><p>(5)&nbsp;<a href=\"http://www.sciencedirect.com/science/article/pii/S0306261916308352\">R. Scaccabarozzi, M. Gatti, E. Martelli. (2016). Thermodynamic analysis and numerical optimization of the NET Power oxy-combustion cycle, Applied Energy, Volume 178. Pages 505-526. ISSN 0306-2619. https://doi.org/10.1016/j.apenergy.2016.06.060.</a></p></div></body></html>"));
end PapayMixtureND;
