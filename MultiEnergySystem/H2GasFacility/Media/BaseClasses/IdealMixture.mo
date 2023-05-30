within MultiEnergySystem.H2GasFacility.Media.BaseClasses;

partial model IdealMixture
  extends PartialMixture(Xi_start = X_start[1:nXi], mu(start = mu_start), rho(start = rho_start), cp(start = cp_id_start));
  import Modelica.Fluid.Utilities.regStep;
  replaceable package MediumH2O = Modelica.Media.Water.StandardWater;
  constant Types.Density rhoair = 1.2250 "Density of air at T = 15°C and p = 1atm";
  parameter Integer posDom = 1 "Position of the dominant component, usually 1";
  final parameter Types.MoleFraction Y_start[nX] = massToMoleFractions(X_start, MM) "Start value for mole fraction";
  parameter Real eps = 1e-9 "small constant to avoid 'log(0)' when a gas component molar mass is zero";
  parameter Types.MolarMass MM[nX] "Molar mass of the gas components";
  parameter Types.SpecificHeatCapacity R_star[nX] = {Modelica.Constants.R/MM[i] for i in 1:nX} "Specific gas constants per unit mass";
  parameter Types.SpecificHeatCapacityMol R = Modelica.Constants.R "Universal gas constant per unit mol";
  parameter Types.Pressure p_c[nX] "Critical pressure of each component";
  parameter Types.Temperature T_c[nX] "Critical temperature of each component";
  parameter Types.MolarVolume v_mol_c[nX] "Critical molar volume of each component";
  parameter Types.SpecificEnthalpy Hf[nX] "Hf derived from Modelica.Media.IdealGases.Common.SingleGasesData";
  parameter Real HHV[nX](each unit = "J/m3")  "Higher Heating Value of each component in J/m3 units";
  parameter Types.SpecificEnergy LHV[nX] "Lower Heating Value of each component";
  parameter Integer ord_cp_ideal = 3 "order of the polynomial ideal cp(T)";
  parameter Real cp_coeff[nX, ord_cp_ideal + 1] "copied from the result of Utilities.ComputeGasCoefficients, for independent mass components";
  parameter Types.TemperatureDifference dT_smooth = 1 "Smoothing temperature interval for cp_cond calculation";
  parameter Types.Temperature T0 = 15 + 273.15 "Reference temperature";
  parameter Types.Pressure p0 = 101325; //1e5 "Reference pressure";
  parameter Types.PerUnit T_red_start = T_start/T_c[posDom] "Reduced temperature of the main component of the gas, which is the dominant component";
  parameter Types.PerUnit p_red_start = p_start/p_c[posDom] "Reduced pressure of of the main component of the gas, which is the dominant component";
  parameter Types.MolarVolume v_mol_start = R*T_start/p_start "provided that this fluid composition is mostly the dominant component";
  parameter Types.Density rho_start = MM[posDom]/v_mol_start;
  parameter Types.MolarMass MM_mix_start = MM*Y_start;
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";
  parameter Types.Temperature Tsat_min = 273.15 + 20;
  parameter Types.Temperature Tsat_max = 273.15 + 150;
  final parameter Types.PerUnit Z_c[nX] = {p_c[i]*v_mol_c[i]/(R*T_c[i]) for i in 1:nX} "Critical compressibility factor";
  final parameter Types.SpecificHeatCapacity cp_id_start = X_start*{cp_T(T_start, cp_coeff[i]) for i in 1:nX} "Ideal Specific heat capacity";
  final parameter Types.SpecificEnthalpy h_star_start[nX] = {Hf[i] + h_T(T_start, cp_coeff[i]) - h_T(T0, cp_coeff[i]) for i in 1:nX};
  final parameter Types.SpecificEnthalpy h_id_start = X_start*h_star_start;
  final parameter Types.DerPressurebySpecificVolume dp_dv_start = -(R*T_start/MM_mix_start)*rho_start^2;
  final parameter Types.SpecificHeatCapacity cp_star_start[nX] = {cp_T(T_start, cp_coeff[i]) for i in 1:nX};
  final parameter Types.PerUnit dX_dX_start[nX, nX] = identity(nX);
  final parameter Types.PerUnit dY_dX_start[nX, nX] = {(MM_mix_start/MM[i])*(dX_dX_start[i, j] - (MM_mix_start/MM[j])*X_start[i]) for j in 1:nX, i in 1:nX};
  final parameter Types.DerPressureByTemperature dp_dT_start = R*rho_start*sum(X_start[j]/MM[j] for j in 1:nX) "Temperature derivative of Pressure at constant specific volume";
  
  //Variables
  Types.SpecificEnthalpy h_star[nX](start = h_star_start) "Ideal Specific Enthalpy of each component";
  Types.SpecificEnthalpy h_id(start = h_id_start) "Ideal Specific Enthalpy of the fluid";
  Types.SpecificEnthalpy dh_id_dX[nX] "Mass fraction of Ideal Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_dX[nX] "Mass fraction derivative of Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_id_dY[nX] "Molar fraction of Ideal Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_dY[nX] "Molar fraction derivative of Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnergy du_dY[nX] "Mole fraction derivative of Specific Internal Energy at constant pressure, per each component";
  Types.SpecificEntropy s_star[nX] "Specific entropy of the fluid";
  Types.SpecificEntropy s_id "Ideal Specific Entropy of the fluid";
  Types.SpecificHeatCapacity cp_star[nX](start = cp_star_start) "Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_id(start = X_start*cp_star_start) "Ideal Specific heat capacity of the fluid";
  Types.ThermalConductivity k "Thermal Conductivity" annotation(
    HideResult = not ComputeTransport);
  Types.MoleFraction Y[nX](start = Y_start) "Mole fractions of the components";
  Types.MolarMass MM_mix(start = MM*Y_start) "Molar Mass of the fluid (mixture)";
  Types.SpecificVolume v(start = v_mol_start/MM_mix_start) "Speficic volume";
  Types.MolarVolume v_mol(start = v_mol_start) "Molar volume";
  //Types.Pressure dp_dY[nX] "Mole fraction derivative of pressure at constant temperature, per each component";
  Types.DerPressureByTemperature dp_dT(start = dp_dT_start) "Temperature derivative of Pressure at constant specific volume";
  Types.DerPressurebySpecificVolume dp_dv(start = dp_dv_start) "Specific volumen derivative of Pressure at constant temperature";
  Types.PerUnit Z(start = 1) "Compressibility factor of the mixture";
  Types.PerUnit dY_dX[nX, nX](start = dY_dX_start) "Mole fraction derivative of mass fraction per each component";
  Types.PerUnit dX_dX[nX, nX](start = dX_dX_start) "Mass fraction derivative of mass fraction per each component";
  Types.MolarMass dMM_mix_dY[nX](start = MM) "Mole fraction derivative of the mixture molar mass";
  Types.SpecificVolume dv_dY[nX] "Mole fraction derivative of specific volumen, per each component";
  //Real dT_dX[nX](each unit = "K") "Mass fraction derivative vector of Temperature at constant pressure";
  //Real dT_dY[nX](each unit = "K") "Mole fraction derivative vectir of temperature at constant pressure";
  Real drho_dT(unit = "kg/(K.m3)") "Temperature derivative of density per each component";
  Real drho_dp(unit = "kg/(Pa.m3)") "Pressure derivative at constant temperature, per each component";
  Real drho_dX[nX](each unit = "kg/m3") "Mass fraction derivative of the density per each component";
  Real HHV_mix(unit = "J/m3") "Higher Heating Value of the fluid mixture";
  Types.Density rho0 "Density of the fluid mixture at reference temperature and pressure";
  Types.MolarVolume v0(start = 0.0244) "Molar volume of the fluid mixture at reference temperature and pressure";
  Types.PerUnit SG "Specific gravity of the fluid mixture";
  Real WI(unit = "J/m3") "Wobbex Index of the fluid mixture";
  
//  Types.Pressure dp_dYi[nXi];
//  Types.Pressure dp_dXi[nXi];
//  Types.SpecificVolume dv_dYi[nXi];
//  Types.SpecificVolume dv_dXi[nXi];
//  Types.SpecificVolume dv_dXi_check[nXi];
  //Types.SpecificVolume dv_dX_check[nX];
  //Real dp_dT_check(unit = "Pa/K");
//  Real dT_dYi[nXi](each unit = "K");
//  Real dT_dXi[nXi](each unit = "K");
//  Real dT_dXi_check[nXi](each unit = "K");
//  Real dXi_dXi[nXi, nXi];
//  Real dYi_dYi[nXi, nXi];
//  Real dYi_dXi[nXi, nXi];
//  Real dXi_dYi[nXi, nXi];
//  Real drho_dXi[nXi](each unit = "kg/m3");
//  Types.SpecificEnthalpy dh_id_dXi[nXi];
//  Types.SpecificEnthalpy dh_id_dYi[nXi];
//  Types.SpecificEnthalpy dh_dXi[nXi];
//  Types.SpecificEnthalpy dh_dYi[nXi];
//  Types.SpecificEnergy du_dYi[nXi];
//  Types.SpecificEnergy du_dXi[nXi];
//  Types.SpecificEnergy du_dXi_check[nXi];
//  Types.MolarMass dMM_mix_dYi[nXi];
//  Types.MolarMass dMM_mix_dXi[nXi];
//  Types.MolarMass dMM_mix_dXi_check[nXi];
//  Types.MolarMass MM_mix_check;

  //Functions to compute cp, h and s using the coefficients obtained through Utilities.ComputegGasCoefficients
protected
  function cp_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificHeatCapacity cp;
  algorithm
    cp := a[4] + T*(a[3] + T*(a[2] + T*a[1]));
    annotation(
      Inline = true);
  end cp_T;

  function h_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnthalpy h;
  algorithm
    h := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
    annotation(
      Inline = true);
  end h_T;

  function s_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEntropy s;
  algorithm
    s := a[4]*log(T) + T*(a[3] + T*(a[2]/2 + T*a[1]/3));
    annotation(
      Inline = true);
  end s_T;

  function massToMoleFractions "Return mole fractions from mass fractions X"
    extends Modelica.Icons.Function;
    input Types.MassFraction X[:] "Mass fractions of mixture";
    input Types.MolarMass[:] MMX "Molar masses of components";
    output Types.MoleFraction moleFractions[size(X, 1)] "Mole fractions of gas mixture";
  protected
    Real invMMX[size(X, 1)] "Inverses of molar weights";
    Types.MolarMass Mmix "Molar mass of mixture";
  algorithm
    for i in 1:size(X, 1) loop
      invMMX[i] := 1/MMX[i];
    end for;
    Mmix := 1/(X*invMMX);
    for i in 1:size(X, 1) loop
      moleFractions[i] := Mmix*X[i]/MMX[i];
    end for;
    annotation(
      smoothOrder = 5);
  end massToMoleFractions;

initial equation
  assert(abs(p/p_start - 1) < 0.25, "Please check p_start, you may get convergence to wrong solution of P-R EoS", AssertionLevel.warning);

equation
  X[1:nXi] = Xi;
  X[nX] = 1 - sum(Xi);

  assert(sum(X) > 0, "error1");
  assert(sum(MM) > 0, "error2");

  Y = massToMoleFractions(X, MM) "conversion from mass to mole fractions";
  MM_mix = MM*Y "molar mass of the fluid"; 
  
  Z = 1;
  p*v_mol = Z*R*T;
  rho = 1/v;
  v_mol = v*MM_mix;
  
  for i in 1:nX loop
    h_star[i] = Hf[i] + h_T(T, cp_coeff[i]) - h_T(T0, cp_coeff[i]) "Ideal specific enthalpy of each component in unit mass";
   // h_star[i] = h_T(T, cp_coeff[i]) "Ideal specific enthalpy of each component in unit mass";
    cp_star[i] = cp_T(T, cp_coeff[i]) "Ideal specific heat capacity of each component in unit mass";
  end for;

  //Specific Enthalpy
  h_id = X*h_star "Ideal Specific Enthalpy of the fluid in unit mass";
  h - h_id = 0;

  //Specific Heat Capacity
  cp_id = X*cp_star "Ideal Specific Heat Capacity of the fluid in unit mass";
  cp = cp_id;
  cp = cv - (T*(dp_dT^2)/dp_dv) "in unit mass, from(2)-Equation S2.126";

  //Specific enthaly and energy relationship
  h = u + p*v "in unit mass";
  
  // Pressure and temperature derivatives
  //dp_dY = R/(MM_mix^2)*MM;
//  dp_dY = -p/MM_mix*MM;
  dp_dv = -(R*T/MM_mix)*rho^2 "in mass units";
  dp_dT = R*rho*sum(X[j]/MM[j] for j in 1:nX);
//  dT_dY = -dp_dY/dp_dT;
//  dT_dX = dT_dY*dY_dX;

  // Specific volume and density derivates
  dv_dT = v/T;
  dv_dp = -v/p;
  dv_dX = v*MM_mix./MM;
  dv_dY = -v*MM/MM_mix;
  drho_dp = -rho^2*dv_dp;
  drho_dT = -rho^2*dv_dT;
  drho_dX = -rho^2*dv_dX;
  
  // Mass/mol fraction derivaties
  dX_dX = identity(nX);
  dY_dX = {(MM_mix/MM[i])*(dX_dX[i, j] - (MM_mix/MM[j])*X[i]) for j in 1:nX, i in 1:nX};
  dMM_mix_dY = MM;
  
  // Specific enthalpy derivatives
  dh_id_dX = h_star "in mass units";
  dh_id_dY = {(1/MM_mix)*MM[i]*h_star[i] - (1/MM_mix^2)*MM[i]*(Y.*MM)*h_star for i in 1:nX};
  dh_dX = dh_id_dX "in mass units";
  dh_dY = dh_id_dY "in mass units";
  
  // Specific Energy derivatives
  du_dT = cp - p*dv_dT;
  du_dp = -v - p*dv_dp;
  du_dX = dh_dX - p*dv_dX;
  du_dY = dh_dY - p*dv_dY;
  
  mu = 0 "computation not included in the model";
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
  
  
  // Energy parameters
  HHV_mix = HHV*Y;
  p0*v0 = Z*R*T0;
  rho0 = MM_mix/v0;
  SG = rho0/rhoair;
  WI = HHV_mix/sqrt(SG);
  
  
//  dXi_dXi = {if i==j then 1 else -1 for j in 1:nXi, i in 1:nXi};
//  dYi_dYi = identity(nXi);
//  dYi_dXi = {(MM_mix/MM[i])*(dXi_dXi[i, j] - ((MM_mix)*(1/MM[j] - 1/MM[nX]))*X[i]) for j in 1:nXi, i in 1:nXi};
//  dXi_dYi = Modelica.Math.Matrices.inv(dYi_dXi);
//  dMM_mix_dXi = -(MM_mix)^2*{1/MM[i] - 1/MM[nX] for i in 1:nXi};
//  dMM_mix_dYi = MM[1:nXi] - ones(nXi)*MM[nX];
//  dMM_mix_dXi_check = dYi_dXi*dMM_mix_dYi;
  
//  dT_dYi = (p*v/R)*dMM_mix_dYi;
//  dT_dXi = dT_dYi*dYi_dXi;
//  dT_dXi_check = (p*v/R)*dMM_mix_dXi;
//  dv_dYi = -(R*T/p)*(1/MM_mix^2)*dMM_mix_dYi;
//  dv_dXi = dv_dYi*dYi_dXi;
//  dv_dXi_check = (R*T/p)*{1/MM[i] - 1/MM[nX] for i in 1:nXi};
//  dp_dYi = -(R*T/v)*(1/MM_mix^2)*dMM_mix_dYi;
//  dp_dXi = dp_dYi*dYi_dXi;
//  drho_dXi = -rho^2*dv_dYi*dYi_dXi;
  
//  dh_id_dXi = h_star[1:nXi] - ones(nXi)*h_star[nX];
//  dh_id_dYi = dh_id_dXi*dXi_dYi;
//  dh_dXi = dh_id_dXi "in mass units";
//  dh_dYi = dh_id_dYi "in mass units";
//  du_dYi = dh_dYi - p*dv_dYi;
//  du_dXi = dh_id_dXi - p*dv_dXi;
//  du_dXi_check = du_dYi*dYi_dXi "in mass units";
  
  
  annotation(
    Documentation(info = "<html><head></head><body><h3>Model of a gas fluid using Peng Robinson EoS</h3><div class=\"htmlDoc\"><p>The objetive of this model is to obtain approximately the thermodynamic properties of the mixture gas to use it in the modeling of the Allam Cycle. The following references has been used:</p><p></p><p>(1)&nbsp;<a href=\"https://www.researchgate.net/publication/231293953_New_Two-Constant_Equation_of_State\">Peng, Ding-yu &amp; Robinson, Donald. (1976). New Two-Constant Equation of State. Industrial &amp; Engineering Chemistry Fundamentals. 15. 10.1021/i160057a011.&nbsp;</a></p><p>(2)&nbsp;<a href=\"https://ars.els-cdn.com/content/image/1-s2.0-S0896844618307903-mmc1.pdf\">\"Equation of State and Thermodynamic Properties for Mixtures of H2O, O2, N2 and CO2 from Ambient up to 1000K and 280MPa - S. Supporting Information\" - F. Mangold, St. Pilz, S. Beljic, F. Vogel - 2019,&nbsp;pp 19-20</a></p><p>(3)&nbsp;<a href=\"https://www.researchgate.net/publication/327832564_Thermodynamics_Fundamentals_and_Engineering_Applications\">Colonna, Piero &amp; Reynolds, William. (2018). Thermodynamics: Fundamentals and Engineering Applications. 10.1017/9781139050616.&nbsp;</a></p><p>(4)&nbsp;<a href=\"http://web.nchu.edu.tw/pweb/users/cmchang/lesson/10174.pdf\">Chapter 6 \"Calculation of Properties of Pure Fluids\" - CM. J. Chang from National Chung Hsing University - 2012, pp 59-64</a></p><p>(5)&nbsp;<a href=\"http://www.sciencedirect.com/science/article/pii/S0306261916308352\">R. Scaccabarozzi, M. Gatti, E. Martelli. (2016). Thermodynamic analysis and numerical optimization of the NET Power oxy-combustion cycle, Applied Energy, Volume 178. Pages 505-526. ISSN 0306-2619. https://doi.org/10.1016/j.apenergy.2016.06.060.</a></p></div></body></html>"));
end IdealMixture;
