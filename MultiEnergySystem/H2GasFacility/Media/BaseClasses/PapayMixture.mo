within MultiEnergySystem.H2GasFacility.Media.BaseClasses;

partial model PapayMixture
  extends PartialMixture(Xi_start = X_start[1:nXi], mu(start = mu_start), rho(start = rho_start), cp(start = cp_id_start));
  import Modelica.Fluid.Utilities.regStep;
  
  constant Types.SpecificHeatCapacityMol R = Modelica.Constants.R "Universal gas constant per unit mol";
  constant Types.Density rhoair = 1.2250 "Density of air at T = 15°C and p = 1atm";
  
  parameter Integer posDom = 1 "Position of the dominant component, usually 1";
  parameter Real eps = 1e-9 "small constant to avoid 'log(0)' when a gas component molar mass is zero"; 
  parameter Types.MolarMass MM[nX] "Molar mass of the gas components";
  parameter Types.SpecificHeatCapacity R_star[nX] = {Modelica.Constants.R/MM[i] for i in 1:nX} "Specific gas constants per unit mass"; 
  parameter Types.Pressure p_c[nX] "Critical pressure of each component";
  parameter Types.Temperature T_c[nX] "Critical temperature of each component";
  parameter Types.MolarVolume v_mol_c[nX] "Critical molar volume of each component";
  parameter Types.SpecificEnthalpy Hf[nX] "Hf derived from Modelica.Media.IdealGases.Common.SingleGasesData";
  parameter Real HHV[nX](each unit = "J/m3")  "Higher Heating Value of each component in J/m3 units";
  parameter Integer ord_cp_ideal = 3 "order of the polynomial ideal cp(T)";
  parameter Real cp_coeff[nX, ord_cp_ideal + 1] "copied from the result of Utilities.ComputeGasCoefficients, per unit mass, for independent mass components";
  parameter Types.TemperatureDifference dT_smooth = 1 "Smoothing temperature interval for cp_cond calculation";
  parameter Types.Temperature T0 = 15 + 273.15 "Reference temperature";
  parameter Types.Pressure p0 = 101325; //1e5 "Reference pressure";
  parameter Types.PerUnit T_red_start = T_start/T_c[posDom] "Reduced temperature of the dominant component of the gas";
  parameter Types.PerUnit p_red_start = p_start/p_c[posDom] "Reduced pressure of of the dominant component of the gas";
  parameter Types.MolarVolume v_start = if T_red_start > 1.255 or p_red_start < 1 then R*T_start/p_start else b*Y_start*1.3*(1.5*T_red_start) "provided that this fluid composition is mostly the dominant component";
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";
  
  // Final Parameters 
  final parameter Types.MolarVolume b[nX] = {0.07780*R*T_c[i]/(p_c[i] + eps) for i in 1:nX} "molar covolume parameter";
  final parameter Types.PerUnit Z_c[nX] = {p_c[i]*v_mol_c[i]/(R*T_c[i]) for i in 1:nX} "Critical compressibility factor";
  final parameter Types.MoleFraction Y_start[nX] = massToMoleFractions(X_start, MM) "Start value for mole fraction";
  final parameter Types.SpecificEnthalpy h_star_start[nX] = {Hf[i] + h_T(T_start, cp_coeff[i]) - h_T(T0, cp_coeff[i]) for i in 1:nX};
  final parameter Types.SpecificEnthalpy h_id_start = X_start*h_star_start;
  final parameter Types.SpecificHeatCapacity cp_star_start[nX] = {cp_T(T_start, cp_coeff[i]) for i in 1:nX};
  final parameter Types.SpecificHeatCapacity cp_id_start = X_start*cp_star_start "Ideal Specific heat capacity";
  final parameter Types.Density rho_start = MM[posDom]/v_start;
  final parameter Types.MolarMass MM_mix_start = MM*Y_start;
  
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
  Types.SpecificHeatCapacity cp_res "Residual or Departure Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_id(start = X_start*cp_star_start) "Ideal Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_star[nX](start = cp_star_start) "Specific heat capacity of the fluid";
  Types.ThermalConductivity k "Thermal Conductivity" annotation(
    HideResult = not ComputeTransport);
  Types.DerPerUnitbyTemperature dTr_dT[nX] "Temperature derivative of Reduced Temperature per each component";
  Types.DerPerUnitbyTemperature dalpha_dT[nX] "Temperature derivative of alpha per each component";
  Types.MoleFraction Y[nX](start = Y_start) "Mole fractions of the components";
  Types.MolarMass MM_mix(start = MM*Y_start) "Molar Mass of the fluid (mixture)";
  Types.MolarVolume v(start = v_start) "Molar volume";
  Types.MolarEnthalpy h_res_m(nominal = 5e2) "Residual or departure Molar Enthalpy of the fluid";
  Types.MolarEnthalpy dh_res_m_dY[nX](each nominal = 5e2) "Mole fraction of Molar Residual Enthalpy at constant pressure, per each component";
  Types.Pressure dp_dY[nX] "Mole fraction derivative of pressure at constant temperature, per each component";
  Types.DerPressureByTemperature dp_dT "Temperature derivative of Pressure at constant specific volume";
  Types.DerPressurebySpecificVolume dp_dv "Specific volumen derivative of Pressure at constant temperature";
  Types.PerUnit pr[nX](start = p_start./p_c) "Reduced pressure of each component";
  Types.PerUnit Tr[nX](start = T_start./T_c) "Reduced temperatures of each component";
  Types.PerUnit Tr0[nX](start = T0./T_c) "Reduced temperatures of each component";
  Types.PerUnit dY_dX[nX, nX] "Mole fraction derivative of mass fraction per each component";
  Types.PerUnit dX_dX[nX, nX](start = identity(nX)) "Mass fraction derivative of mass fraction per each component";
  Real dv_mol_dT(unit = "m3/(mol.K)") "Temperature derivative of molar volume at constant pressure";
  Real dv_mol_dp(unit = "m3/(Pa.mol)") "Pressure derivative of molar volume at constant temperature";
  Real dp_dv_mol(unit = "Pa.mol/m3") "Molar volumen derivative of pressure at constant temperature";
  Real dv_dY[nX](each unit = "m3/kg") "Mole fraction derivative of specific volumen, per each component";
  Real dv_mol_dY[nX](each unit = "m3/mol") "Mole fraction derivative of molar volumen, per each component";
  Real dT_dX[nX](each unit = "K") "Mass fraction derivative of Temperature at constant pressure, per each component";
  Real dT_dY[nX](each unit = "K") "Mole fraction derivative of temperature at constant pressure, per each component";
  Real drho_dT(unit = "kg/(K.m3)") "Temperature derivative of density per each component";
  Real drho_dp(unit = "kg/(Pa.m3)") "Pressure derivative at constant temperature, per each component";
  Real drho_dX[nX](each unit = "kg/m3") "Mass fraction derivative of the density per each component";
  Types.PerUnit Z "Compressibility factor of the mixture";
  Real HHV_mix(unit = "J/m3") "Higher Heating Value of the fluid mixture";
  Types.Density rho0 "Density of the fluid mixture at reference temperature and pressure";
  Types.MolarVolume v0(start = 0.0244) "Molar volume of the fluid mixture at reference temperature and pressure";
  Types.PerUnit SG "Specific gravity of the fluid mixture";
  Real WI(unit = "J/m3") "Wobbex Index of the fluid mixture";

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

//assert((p < 70e5 or p > 75e5) or (T < 28 + 273.15 or T > 32 + 273.15), "Working CO2 close to the critical point", AssertionLevel.warning);
  Y = massToMoleFractions(X, MM) "conversion from mass to mole fractions";
  MM_mix = MM*Y "molar mass of the fluid";
  Tr = T./T_c;
  pr = p./p_c;
  Tr0 = T0./T_c;
  for i in 1:nX loop
    dTr_dT[i] = 1/T_c[i];
  end for;

  p = rho*Z*R*T/MM_mix "Equation of State";
  rho = MM_mix/v;
  for i in 1:nX loop
    h_star[i] = Hf[i] + h_T(T, cp_coeff[i]) - h_T(T0, cp_coeff[i]) "Ideal specific enthalpy of each component in unit mass";
    cp_star[i] = cp_T(T, cp_coeff[i]) "Ideal specific heat capacity of each component in unit mass";
    s_star[i] = s_T(T, cp_coeff[i]) - s_T(T0, cp_coeff[i]) - (R*log(p/p0))/MM_mix "Ideal specific entropy of each component in unit mass, from(3)-Equation 6.11";
  end for;

//Specific Enthalpy
  h_id = X*h_star "Ideal Specific Enthalpy of the fluid in unit mass";
  h - h_id = 0;
//Specific Heat Capacity
//cp_id = X*cp_star "Ideal Specific Heat Capacity of the fluid in unit mass";
  cp_id = X*cp_star;
  cp_res = 0 "Residual Specific Heat Capacity of the fluid in unit mass, from(2)-Equation S2.125";
  cp = cp_id + cp_res;
  cp = cv - (T*(dp_dT^2)/dp_dv) "in unit mass, from(2)-Equation S2.126";
//Thermodynamic variables
  h = u + (p*v)/MM_mix "in unit mass";
  dp_dT = 1 "from(2)-Equation S2.127";
  dp_dY = {1};
  dp_dv_mol = 1 "in mole units";
  dv_mol_dT = -dv_mol_dp*dp_dT "in mole units";
  dv_mol_dp = 1/dp_dv_mol "in mole units";
  dv_mol_dY = -dp_dY*dv_mol_dp "in mole units";
  dp_dv = 1 "in mass units, from(2)-Equation S2.128";
  du_dT = cp + p*dp_dT*dv_dp "in mass units";
  du_dp = -(T*dv_dT + p*dv_dp) "in mass units";
  dv_dT = -dv_dp*dp_dT "in mass units";
  dv_dp = 1 "in mass units";
  dv_dY = (1/MM_mix)*dv_mol_dY - v*(1/MM_mix^2)*MM "in mass units";
  dv_dX = (1/MM_mix)*dv_mol_dY*dY_dX - v*(1/MM_mix^2)*MM*dY_dX "in mass units";
  dT_dY = -dp_dY/dp_dT;
  dT_dX = dT_dY*dY_dX;
  dX_dX = identity(nX);
  dY_dX = {(MM_mix/MM[i])*(dX_dX[i, j] - (MM_mix/MM[j])*X[i]) for j in 1:nX, i in 1:nX};
  drho_dp = -MM_mix*(1/v^2)*dv_mol_dp "in mass units";
  drho_dT = -MM_mix*(1/v^2)*dv_mol_dT "in mass units";
  drho_dX = (1/v)*MM*dY_dX - MM_mix*(1/v^2)*dv_mol_dY*dY_dX;
  dh_id_dX = h_star "in mass units";
  dh_id_dY = {(1/MM_mix)*MM[i]*h_star[i] - (1/MM_mix^2)*MM[i]*(Y.*MM)*h_star for i in 1:nX};
  dh_dX = dh_id_dX "in mass units";
  dh_dY = dh_id_dY "in mass units";
  du_dY = dh_dY - p*((1/MM_mix)*dv_mol_dY - (v*MM/(MM_mix^2)));
  du_dX = du_dY*dY_dX "in mass units";
//du_dX = dh_dX - p*((1/MM_mix)*dv_mol_dY*dY_dX-(v*MM*dY_dX/(MM_mix^2))) "in mass units";
  mu = 0 "computation not included in the model";
  k = 0 "computation not included in the model";
//Entropy
  if computeEntropy then
    s_id = X*s_star + (R*sum(Y[i]*log(Y[i] + eps) for i in 1:nX))/MM_mix "from(3)-Equation 8.6";
  else
    s_id = 0;
  end if;
  s - s_id = 0;
  
  HHV_mix = HHV*Y; 
  p0 = 1;
  rho0 = MM_mix/v0;
  SG = rho0/rhoair;
  WI = HHV_mix/sqrt(SG);
  
  annotation(
    Documentation(info = "<html><head></head><body><h3>Model of a gas fluid using Peng Robinson EoS</h3><div class=\"htmlDoc\"><p>The objetive of this model is to obtain approximately the thermodynamic properties of the mixture gas to use it in the modeling of the Allam Cycle. The following references has been used:</p><p></p><p>(1)&nbsp;<a href=\"https://www.researchgate.net/publication/231293953_New_Two-Constant_Equation_of_State\">Peng, Ding-yu &amp; Robinson, Donald. (1976). New Two-Constant Equation of State. Industrial &amp; Engineering Chemistry Fundamentals. 15. 10.1021/i160057a011.&nbsp;</a></p><p>(2)&nbsp;<a href=\"https://ars.els-cdn.com/content/image/1-s2.0-S0896844618307903-mmc1.pdf\">\"Equation of State and Thermodynamic Properties for Mixtures of H2O, O2, N2 and CO2 from Ambient up to 1000K and 280MPa - S. Supporting Information\" - F. Mangold, St. Pilz, S. Beljic, F. Vogel - 2019,&nbsp;pp 19-20</a></p><p>(3)&nbsp;<a href=\"https://www.researchgate.net/publication/327832564_Thermodynamics_Fundamentals_and_Engineering_Applications\">Colonna, Piero &amp; Reynolds, William. (2018). Thermodynamics: Fundamentals and Engineering Applications. 10.1017/9781139050616.&nbsp;</a></p><p>(4)&nbsp;<a href=\"http://web.nchu.edu.tw/pweb/users/cmchang/lesson/10174.pdf\">Chapter 6 \"Calculation of Properties of Pure Fluids\" - CM. J. Chang from National Chung Hsing University - 2012, pp 59-64</a></p><p>(5)&nbsp;<a href=\"http://www.sciencedirect.com/science/article/pii/S0306261916308352\">R. Scaccabarozzi, M. Gatti, E. Martelli. (2016). Thermodynamic analysis and numerical optimization of the NET Power oxy-combustion cycle, Applied Energy, Volume 178. Pages 505-526. ISSN 0306-2619. https://doi.org/10.1016/j.apenergy.2016.06.060.</a></p></div></body></html>"));
end PapayMixture;
