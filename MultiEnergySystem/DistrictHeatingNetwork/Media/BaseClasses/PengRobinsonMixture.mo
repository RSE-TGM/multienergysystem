within MultiEnergySystem.DistrictHeatingNetwork.Media.BaseClasses;

partial model PengRobinsonMixture
  extends PartialMixture(nC = 0, Xi_start = X_start[1:nXi], nXi = if reducedX then nX - 1 else nX, mu(start = mu_start), rho(start = rho_start), cp(start = cp_id_start));
  import Modelica.Fluid.Utilities.regStep;
  replaceable package MediumH2O = Modelica.Media.Water.StandardWater;
  parameter Boolean reducedX = false;
  parameter Boolean computeEnthalpyCondensation = false;
  parameter Integer posDom = 1 "Position of the dominant component, usually 1";
  parameter Integer posCond = 1 "Position of H2O which condensates in the array";
  parameter Integer posOxygen = 1 "Position of O2 in the array";
  parameter Boolean computehidealComp = false;
  final parameter Types.MoleFraction Y_start[nX] = massToMoleFractions(X_start, MM);
  parameter Real eps = 1e-9 "small constant to avoid 'log(0)' when a gas component molar mass is zero";
  parameter Types.PerUnit w[nX] "Acentric factors";
  parameter Types.PerUnit m[nX] = {0.378893 + w[i]*(1.4897153 + w[i]*((-0.17131848) + w[i]*0.0196554)) for i in 1:nX} "Constant characteristic of each substance";
  parameter Types.PerUnit delta[nX, nX] "Binary interaction parameters (BIP) from ASPEN simulation";
  parameter Types.PerUnit Z_c[nX] "Compressibility factor";
  parameter Types.MolarMass MM[nX] "Molar mass of the gas components";
  parameter Types.SpecificHeatCapacity R_star[nX] = {Modelica.Constants.R/MM[i] for i in 1:nX} "Specific gas constants per unit mass";
  parameter Types.SpecificHeatCapacityMol R = Modelica.Constants.R "Universal gas constant per unit mol";
  parameter Types.Pressure p_c[nX] "Critical pressure of each component";
  parameter Types.Temperature T_c[nX] "Critical temperature of each component";
  parameter Types.AttractionForce ac[nX] = {0.45724*R^2*T_c[i]^2/(p_c[i] + eps) for i in 1:nX} "attraction parameter at critical point";
  parameter Types.MolarVolume b[nX] = {0.07780*R*T_c[i]/(p_c[i] + eps) for i in 1:nX} "molar covolume parameter";
  parameter Types.SpecificEnthalpy Hf[nX] "Hf derived from Modelica.Media.IdealGases.Common.SingleGasesData";
  parameter Types.SpecificEnthalpy Hf_track[nC] "Hf derived from Modelica.Media.IdealGases.Common.SingleGasesData for tracking components";
  parameter Integer ord_cp_ideal = 3 "order of the polynomial ideal cp(T)";
  parameter Integer ord_cp_cond = 3 "order of the polynomial ideal cp_cond(T)";
  parameter Real cp_coeff[nX, ord_cp_ideal + 1] "copied from the result of Utilities.ComputeGasCoefficients, per unit mass, for independent mass components";
  parameter Real cp_coeff_track[nC, ord_cp_ideal + 1] "copied from the result of Utilities.ComputeGasCoefficients, per unit mass for tracking mass components";
  //parameter Real cp_cond_coeff[ord_cp_cond+1] "copied from the result of Utilities.ComputeAdditionalCpCoefficients, per unit mass";
  final parameter Types.SpecificHeatCapacity cp_id_start = X_start*{cp_T(T_start, cp_coeff[i]) for i in 1:nX} "Ideal Specific heat capacity of the fluid";
  parameter Types.TemperatureDifference dT_smooth = 1 "Smoothing temperature interval for cp_cond calculation";
  parameter Types.Temperature T0 = 298.15 "Reference temperature";
  parameter Types.Pressure p0 = 1e5 "Reference pressure";
  parameter Types.PerUnit T_red_start = T_start/T_c[posDom] "Reduced temperature of the main component of the gas, which is the dominant component";
  parameter Types.PerUnit p_red_start = p_start/p_c[posDom] "Reduced pressure of of the main component of the gas, which is the dominant component";
  parameter Types.MolarVolume v_start = if T_red_start > 1.255 or p_red_start < 1 then R*T_start/p_start else b*Y_start*1.3*(1.5*T_red_start) "provided that this fluid composition is mostly the dominant component";
  parameter Types.Density rho_start = MM[posDom]/v_start;
  parameter Types.MolarMass MM_mix_start = MM*Y_start;
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";
  //parameter Types.SpecificEnthalpy h_start "Start value of the specific enthalpy";
  parameter Types.Temperature Tsat_min = 273.15 + 20;
  parameter Types.Temperature Tsat_max = 273.15 + 150;
  final parameter Types.PerUnit alpha_start[nX] = {(1 + m[i]*(1 - sqrt(T_start/T_c[i])))^2 for i in 1:nX};
  final parameter Types.AttractionForce a_start[nX] = {ac[i]*alpha_start[i] for i in 1:nX};
  final parameter Types.SpecificEnthalpy h_star_start[nX] = {Hf[i] + h_T(T_start, cp_coeff[i]) - h_T(T0, cp_coeff[i]) for i in 1:nX};
  final parameter Types.SpecificEnthalpy h_id_start = X_start*h_star_start;
  final parameter Types.AttractionForce a_star_start[nX, nX] = {(1 - delta[i, j])*sqrt(a_start[i])*sqrt(a_start[j]) for i in 1:nX, j in 1:nX} "Left-hand side terms of eq. (22)";
  final parameter Types.AttractionForce amix_start = sum(Y_start[i]*Y_start[j]*a_star_start[i, j] for i in 1:nX, j in 1:nX);
  final parameter Types.DerPressurebySpecificVolume dp_dv_start = (-R*T_start/(v_start - b*Y_start)^2 + 2*amix_start*(v_start + b*Y_start)/(v_start*(v_start + b*Y_start) + b*Y_start*(v_start - b*Y_start))^2)*MM_mix_start;
  final parameter Types.SpecificHeatCapacity cp_star_start[nX] = {cp_T(T_start, cp_coeff[i]) for i in 1:nX};
  final parameter Types.DerAttractionForcebyTemperature da_dT_start[nX] = {ac[i]*dalpha_dT_start[i] for i in 1:nX};
  final parameter Types.DerPerUnitbyTemperature dalpha_dT_start[nX] = {2*(1 + m[i]*(1 - sqrt(T_start/T_c[i])))*m[i]*(-(1/T_c[i])/(2*sqrt(T_start/T_c[i]))) for i in 1:nX};
  final parameter Types.PerUnit dX_dX_start[nX, nX] = identity(nX);
  final parameter Types.PerUnit dY_dX_start[nX, nX] = {(MM_mix_start/MM[i])*(dX_dX_start[i, j] - (MM_mix_start/MM[j])*X_start[i]) for j in 1:nX, i in 1:nX};
  final parameter Types.DerAttractionForcebyTemperature damix_dT_start = 0.5*sum(Y_start[i]*Y_start[j]*a_star_start[i, j]*(da_dT_start[i]/a_start[i] + da_dT_start[j]/a_start[j]) for i in 1:nX, j in 1:nX);
  final parameter Types.DerPressureByTemperature dp_dT_start = R/(v_start - b*Y_start) - damix_dT_start/(v_start*(v_start + b*Y_start) + b*Y_start*(v_start - b*Y_start)) "Temperature derivative of Pressure at constant specific volume";
  final parameter Types.AttractionForce damix_dY_start[nX] = 2*{sum(Y_start[j]*a_star_start[i, j] for j in 1:nX) for i in 1:nX};
  //Variables
  Types.SpecificEnthalpy h_star[nX](start = h_star_start) "Ideal Specific Enthalpy of each component";
  Types.SpecificEnthalpy h_star_track[nC] "Ideal Specific Enthalpy of each tracking component";
  Types.SpecificEnthalpy h_res "Residual or Departure Specific Enthalpy of the fluid";
  Types.SpecificEnthalpy h_id(start = h_id_start) "Ideal Specific Enthalpy of the fluid";
  Types.SpecificEnthalpy h_id_comp;
  Types.SpecificEnthalpy h_res_comp;
  //Types.SpecificEnthalpy h_id_track "Ideal Specifc Enthalpy of the tracking components in the fluid";
  Types.SpecificEnthalpy h_cond "Condensation Enthalpy of the fluid";
  //Types.SpecificEnergy du_dX[nX] "Mass fraction derivative of Specific Internal Energy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_res_dX[nX] "Mass fraction derivative of Specific Residual Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_res_dY[nX] "Mass fraction derivative of Specific Residual Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_id_dX[nX] "Mass fraction of Ideal Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_dX[nX] "Mass fraction derivative of Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_cond_dY[nX] "Mole fraction derivative of Specific Condensation Enthalpy, per each component";
  Types.SpecificEnthalpy dh_cond_dX[nX] "Mass fraction derivative of Specific Condensation Enthalpy, per each component";
  Types.SpecificEnthalpy dh_id_dY[nX] "Molar fraction of Ideal Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_dY[nX] "Molar fraction derivative of Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnergy du_dY[nX] "Mole fraction derivative of Specific Internal Energy at constant pressure, per each component";
  Types.SpecificEntropy s_res "Residual or Departure Specific Entropy of the fluid";
  Types.SpecificEntropy s_star[nX] "Specific entropy of the fluid";
  Types.SpecificEntropy s_id "Ideal Specific Entropy of the fluid";
  Types.SpecificHeatCapacity cp_res "Residual or Departure Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_id(start = X_start*cp_star_start) "Ideal Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_cond "Condensation specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_star[nX](start = cp_star_start) "Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cp_star_track[nC] "Specific heat capacity for tracking components";
  Types.ThermalConductivity k "Thermal Conductivity" annotation(
    HideResult = not ComputeTransport);
  Types.DerPerUnitbyTemperature dTr_dT[nX] "Temperature derivative of Reduced Temperature per each component";
  Types.DerPerUnitbyTemperature dalpha_dT[nX](start = dalpha_dT_start) "Temperature derivative of alpha per each component";
  Types.MoleFraction Y[nX](start = Y_start) "Mole fractions of the components";
  Types.MolarMass MM_mix(start = MM*Y_start) "Molar Mass of the fluid (mixture)";
  Types.MolarVolume v(start = v_start) "Molar volume";
  Types.MolarVolume bmix(start = b*Y_start) "Covolume of mixture";
  Types.MolarVolume dbmix_dY[nX] "Mole fraction derivative of the fluid's molar covolumen, per each component";
  Types.MolarEnthalpy h_res_m(nominal = 5e2) "Residual or departure Molar Enthalpy of the fluid";
  Types.MolarEnthalpy dh_res_m_dY[nX](each nominal = 5e2) "Mole fraction of Molar Residual Enthalpy at constant pressure, per each component";
  Types.AttractionForce a[nX](start = a_start) "Attraction parameter of each component";
  Types.AttractionForce a_star[nX, nX](start = a_star_start) "Left-hand side terms of eq. (22)";
  Types.AttractionForce damix_dY[nX](start = damix_dY_start) "Mole fraction derivative of the fluid's attraction parameter per each component";
  Types.AttractionForce amix(start = amix_start) "Attraction parameter for the fluid";
  Types.DerAttractionForcebyTemperature da_dT[nX](start = da_dT_start) "Temperature derivative of attraction parameter per each component";
  Types.DerAttractionForcebyTemperature damix_dT(start = damix_dT_start) "Temperature Derivative of the fluid attraction parameter";
  Types.DerAttractionForcebyTemperature ddamix_dTdY[nX] "Second Temperature and Mole fraction derivative of the fluid's attraction parameter, per each component";
  Types.Pressure dp_dY[nX] "Mole fraction derivative of pressure at constant temperature, per each component";
  Types.DerPressureByTemperature dp_dT(start = dp_dT_start) "Temperature derivative of Pressure at constant specific volume";
  Types.DerPressurebySpecificVolume dp_dv(start = dp_dv_start) "Specific volumen derivative of Pressure at constant temperature";
  Types.PerUnit Tr[nX](start = T_start./T_c) "Reduced temperatures of each component";
  Types.PerUnit alpha[nX](start = alpha_start) "dimensionless function";
  Types.PerUnit dY_dX[nX, nX](start = dY_dX_start) "Mole fraction derivative of mass fraction per each component";
  Types.PerUnit dX_dX[nX, nX](start = dX_dX_start) "Mass fraction derivative of mass fraction per each component";
  Real dv_mol_dT(unit = "m3/(mol.K)") "Temperature derivative of molar volume at constant pressure";
  Real dv_mol_dp(unit = "m3/(Pa.mol)") "Pressure derivative of molar volume at constant temperature";
  Real ddalpha_ddT[nX](each unit = "1/K2") "Second Temperature derivative of alpha per each component";
  Real dda_ddT[nX](each unit = "J.m3/(mol2.K2)") "Second Temperature derivative of attraction parameter per each component";
  Real ddamix_ddT(unit = "J.m3/(mol2.K2)") "Second Temperature Derivative of the fluid attraction parameter";
  Real dp_dv_mol(unit = "Pa.mol/m3") "Molar volumen derivative of pressure at constant temperature";
  //Real dv_dX[nX](each unit="m3/kg") "Mass fraction derivative of specific volumen, per each component";
  Real dv_dY[nX](each unit = "m3/kg") "Mole fraction derivative of specific volumen, per each component";
  Real dv_mol_dY[nX](each unit = "m3/mol") "Mole fraction derivative of molar volumen, per each component";
  Real dT_dX[nX](each unit = "K") "Mass fraction derivative of Temperature at constant pressure, per each component";
  Real dT_dY[nX](each unit = "K") "Mole fraction derivative of temperature at constant pressure, per each component";
  Real drho_dT(unit = "kg/(K.m3)") "Temperature derivative of density per each component";
  Real drho_dp(unit = "kg/(Pa.m3)") "Pressure derivative at constant temperature, per each component";
  Real drho_dX[nX](each unit = "kg/m3") "Mass fraction derivative of the density per each component";
  Types.Temperature Tsat_real;
  Real cp_cond_coeff[ord_cp_cond + 1];
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

  function h_res_comp_T
    input Types.Temperature T;
    //input Real a[4];
    output Types.SpecificEnthalpy h;
  algorithm
    h := 29632796590.9264*(T)^(-2.35262288);
//h := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
    annotation(
      Inline = true);
  end h_res_comp_T;

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
/*  FOR DEBUGGING PURPOSES - REMOVE ASAP
    Modelica.Utilities.Streams.print("X="+String(X[1])+", MMX="+String(MMX[1]));
    Modelica.Utilities.Streams.print("X="+String(X[2])+", MMX="+String(MMX[2]));
    Modelica.Utilities.Streams.print("X="+String(X[3])+", MMX="+String(MMX[3]));
    Modelica.Utilities.Streams.print("X="+String(X[4])+", MMX="+String(MMX[4]));
    Modelica.Utilities.Streams.print("X="+String(X[5])+", MMX="+String(MMX[5]));
*/
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
  Xi = X[1:nXi];
  if nX > 1 then
    if reducedX then
      X[nX] = 1 - sum(Xi);
    end if;
  end if;
  assert(sum(X) > 0, "error1");
  assert(sum(MM) > 0, "error2");
  if nX > 1 then
    assert(Tsat_real >= Tsat_min, "Tsat es menor que minimum Tsat", AssertionLevel.warning);
    assert(Tsat_real <= Tsat_max, "Tsat es mayor que maximum Tsat", AssertionLevel.warning);
  end if;
//assert((p < 70e5 or p > 75e5) or (T < 28 + 273.15 or T > 32 + 273.15), "Working CO2 close to the critical point", AssertionLevel.warning);
  Y = massToMoleFractions(X, MM) "conversion from mass to mole fractions";
  MM_mix = MM*Y "molar mass of the fluid";
  if computeEnthalpyCondensation then
    Tsat_real = MediumH2O.saturationTemperature(p*Y[posCond]);
  else
    Tsat_real = Tsat_min;
  end if;
//Tr = homotopy(T./T_c, T_start./T_c);
  Tr = T./T_c;
  for i in 1:nX loop
//Tr[i] = T/T_c[i];
    dTr_dT[i] = 1/T_c[i];
    alpha[i] = (1 + m[i]*(1 - sqrt(Tr[i])))^2 "from(1)-Equation 17";
    dalpha_dT[i] = 2*(1 + m[i]*(1 - sqrt(Tr[i])))*m[i]*(-dTr_dT[i]/(2*sqrt(Tr[i]))) "from(2)-Equation S2.131";
    ddalpha_ddT[i] = 0.5*m[i]*(m[i] + 1)*((Tr[i])^(-3/2))*(dTr_dT[i])^2 "from(2)-Equation S2.132";
    a[i] = ac[i]*alpha[i] "from(1)-Equation 12";
    da_dT[i] = ac[i]*dalpha_dT[i] "first derivative of a w.r.t. T";
    dda_ddT[i] = ac[i]*ddalpha_ddT[i] "second derivative of a w.r.t T";
    for j in 1:nX loop
      a_star[i, j] = (1 - delta[i, j])*sqrt(a[i])*sqrt(a[j]) "from(1)-Equation 22";
    end for;
  end for;
  amix = sum(Y[i]*Y[j]*a_star[i, j] for i in 1:nX, j in 1:nX) "Attraction parameter of the mixture in molar units, from(1)-Equation 20";
  damix_dT = 0.5*sum(Y[i]*Y[j]*a_star[i, j]*(da_dT[i]/a[i] + da_dT[j]/a[j]) for i in 1:nX, j in 1:nX) "Manually derivated from amix";
  ddamix_ddT = 0.5*sum(Y[i]*Y[j]*a_star[i, j]*((-0.5*da_dT[i]^2/(a[i]^2)) + (-0.5*da_dT[j]^2/(a[j]^2)) + (da_dT[i]*da_dT[j]/(a[i]*a[j])) + (dda_ddT[i]/a[i]) + (dda_ddT[j]/a[j])) for i in 1:nX, j in 1:nX) "Manually derivated from amix";
  damix_dY = 2*{sum(Y[j]*a_star[i, j] for j in 1:nX) for i in 1:nX} "Manually derivated from amix";
  ddamix_dTdY = {sum(Y[j]*a_star[i, j]*(da_dT[i]/(a[i]) + da_dT[j]/(a[j])) for j in 1:nX) for i in 1:nX};
  bmix = b*Y "Molar covolumen of the mixture, from(1)-Equation 21";
  dbmix_dY = b "Manually derivated from bmix";
  p = R*T/(v - bmix) - amix/(v*(v + bmix) + bmix*(v - bmix)) "Peng-Robinson EoS in molar units, from(1)-Equation 4";
  rho = MM_mix/v;
  for i in 1:nX loop
    h_star[i] = Hf[i] + h_T(T, cp_coeff[i]) - h_T(T0, cp_coeff[i]) "Ideal specific enthalpy of each component in unit mass";
    cp_star[i] = cp_T(T, cp_coeff[i]) "Ideal specific heat capacity of each component in unit mass";
    s_star[i] = s_T(T, cp_coeff[i]) - s_T(T0, cp_coeff[i]) - (R*log(p/p0))/MM_mix "Ideal specific entropy of each component in unit mass, from(3)-Equation 6.11";
  end for;
  for i in 1:nC loop
    h_star_track[i] = Hf_track[i] + h_T(T, cp_coeff_track[i]) - h_T(T0, cp_coeff_track[i]) "Ideal specific enthalpy of each component in unit mass, for tracking components only";
    cp_star_track[i] = cp_T(T, cp_coeff_track[i]) "Ideal specific heat capacity of each component in unit mass, for tracking components only";
  end for;
//Specific Enthalpy
  h_id = (1 - sum(C))*X*h_star + C*h_star_track + h_id_comp "Ideal Specific Enthalpy of the fluid in unit mass";
//h_id_track = C*h_star_track "Ideal Specific Enthalpy of the fluid in unit mass for tracking components";
// h_id_real = (1-C)*h_id + C*h_star_track;
//h_id_m = Y.*h_star.*MM "Ideal Specific Enthalpy of the fluid in molar mass";
//h_id_comp = if computehidealComp == false then 0 else if nC > 0 then 1.05e5 else 1.25e5; // 0.9e5
  h_id_comp = if computehidealComp == false then 0 else if nX > 1 then 1.04e5 else 0.95e5;
  h_res_comp = if size(C, 1) == 0 then 0 else h_res_comp_T(T);
//h_res_comp = 0;
  h_res_m = p*v - R*T + ((T*damix_dT - amix)/(2*sqrt(2)*bmix))*log(abs((v + (1 + sqrt(2))*bmix)/(v + (1 - sqrt(2))*bmix)));
  h_res = h_res_m/MM_mix + h_res_comp "Residual Specific Enthalpy of the fluid in unit mass, from(2)-Equation S2.122";
  if computeEnthalpyCondensation then
    h_cond = regStep(T - MediumH2O.saturationTemperature(p*Y[posCond]), 0, h_T(T, cp_cond_coeff) - h_T(MediumH2O.saturationTemperature(p*Y[posCond]), cp_cond_coeff), dT_smooth);
//if T<MediumH2O.saturationTemperature(p*Y[posCond]) then
//  h_T(T,cp_cond_coeff)- h_T(MediumH2O.saturationTemperature(p*Y[posCond]),cp_cond_coeff)
//else 0;
//homotopy(h_T(T,cp_cond_coeff)- h_T(MediumH2O.saturationTemperature(p*Y[posCond]),cp_cond_coeff), h_T(T,cp_cond_coeff) - h_T(MediumH2O.saturationTemperature(p_start*Y_start[posCond]),cp_cond_coeff))
    for i in 1:nX loop
      if (i == posCond) and T < MediumH2O.saturationTemperature(p*Y[posCond]) then
        dh_cond_dY[i] = -cp_T(MediumH2O.saturationTemperature(p*Y[posCond]), cp_cond_coeff)*MediumH2O.saturationTemperature_derp(p*Y[posCond])*p;
      else
        dh_cond_dY[i] = 0;
      end if;
    end for;
  else
    dh_cond_dY = zeros(nX);
    h_cond = 0;
  end if;
  h - h_id = h_res + h_cond;
//Specific Heat Capacity
//cp_id = X*cp_star "Ideal Specific Heat Capacity of the fluid in unit mass";
  cp_id = (1 - sum(C))*X*cp_star + C*cp_star_track;
  cp_res = (-R + T*ddamix_ddT*log(abs((v + (1 + sqrt(2))*bmix)/(v + (1 - sqrt(2))*bmix)))/(2*sqrt(2)*bmix))/MM_mix - T*(dp_dT^2)/dp_dv "Residual Specific Heat Capacity of the fluid in unit mass, from(2)-Equation S2.125";
  if computeEnthalpyCondensation then
// cp_cond = if T<MediumH2O.saturationTemperature(p*Y[posCond]) then cp_T(T,cp_cond_coeff) else 0;
    cp_cond = regStep(T - MediumH2O.saturationTemperature(p*Y[posCond]), 0, cp_T(T, cp_cond_coeff), dT_smooth);
  else
    cp_cond = 0;
  end if;
  cp = cp_id + cp_res + cp_cond;
  cp = cv - (T*(dp_dT^2)/dp_dv) "in unit mass, from(2)-Equation S2.126";
//Thermodynamic variables
  h = u + (p*v)/MM_mix "in unit mass";
  dp_dT = R/(v - bmix) - damix_dT/(v*(v + bmix) + bmix*(v - bmix)) "from(2)-Equation S2.127";
  dp_dY = (R*T/(v - bmix)^2 + 2*(v - bmix)*amix/(v*(v + bmix) + bmix*(v - bmix))^2)*dbmix_dY - (1/(v*(v + bmix) + bmix*(v - bmix)))*damix_dY;
  dp_dv_mol = (-R*T/(v - bmix)^2 + 2*amix*(v + bmix)/(v*(v + bmix) + bmix*(v - bmix))^2) "in mole units";
  dv_mol_dT = -dv_mol_dp*dp_dT "in mole units";
  dv_mol_dp = 1/dp_dv_mol "in mole units";
  dv_mol_dY = -dp_dY*dv_mol_dp "in mole units";
  dp_dv = (-R*T/(v - bmix)^2 + 2*amix*(v + bmix)/(v*(v + bmix) + bmix*(v - bmix))^2)*MM_mix "in mass units, from(2)-Equation S2.128";
  du_dT = cp + p*dp_dT*dv_dp "in mass units";
  du_dp = -(T*dv_dT + p*dv_dp) "in mass units";
  dv_dT = -dv_dp*dp_dT "in mass units";
  dv_dp = (1/((-R*T/(v - bmix)^2) + 2*amix*(v + bmix)/(v*(v + bmix) + bmix*(v - bmix))^2))/MM_mix "in mass units";
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
  dh_res_m_dY = p*dv_mol_dY + (log(abs((v + (1 + sqrt(2))*bmix)/(v + (1 - sqrt(2))*bmix)))*((sqrt(2)/4)*(T*ddamix_dTdY/bmix - damix_dY/bmix - (dbmix_dY*(T*damix_dT - amix)/(bmix^2)))) + (((T*damix_dT - amix)/(2*sqrt(2)*bmix))*((v + (1 - sqrt(2))*bmix)/(v + (1 + sqrt(2))*bmix))*(2*sqrt(2)*(v*dbmix_dY - bmix*dv_mol_dY)/(v + (1 - sqrt(2))*bmix)^2))) "in mole units";
  dh_res_dX = (1/MM_mix)*dh_res_m_dY*dY_dX - (1/(MM_mix^2))*h_res_m*MM*dY_dX "in mass units";
  dh_res_dY = (1/MM_mix)*dh_res_m_dY - (1/(MM_mix^2))*h_res_m*MM "in mass units";
  dh_cond_dX = dh_cond_dY*dY_dX;
  dh_dX = dh_res_dX + dh_id_dX + dh_cond_dX "in mass units";
  dh_dY = dh_res_dY + dh_id_dY + dh_cond_dY "in mass units";
  du_dY = dh_dY - p*((1/MM_mix)*dv_mol_dY - (v*MM/(MM_mix^2)));
  du_dX = du_dY*dY_dX "in mass units";
//du_dX = dh_dX - p*((1/MM_mix)*dv_mol_dY*dY_dX-(v*MM*dY_dX/(MM_mix^2))) "in mass units";
  mu = 0 "computation not included in the model";
  k = 0 "computation not included in the model";
//Entropy
  if computeEntropy then
    s_id = X*s_star + (R*sum(Y[i]*log(Y[i] + eps) for i in 1:nX))/MM_mix "from(3)-Equation 8.6";
    s_res = (R*log(abs(p*(v - bmix)/(R*T))) + (damix_dT*log(abs((v + (1 + sqrt(2))*bmix)/(v + (1 - sqrt(2))*bmix)))/(2*sqrt(2)*bmix)))/MM_mix "from(4)-Equation 6.4-30";
  else
    s_id = 0;
    s_res = 0;
  end if;
  s - s_id = s_res;
  annotation(
    Documentation(info = "<html><head></head><body><h3>Model of a gas fluid using Peng Robinson EoS</h3><div class=\"htmlDoc\"><p>The objetive of this model is to obtain approximately the thermodynamic properties of the mixture gas to use it in the modeling of the Allam Cycle. The following references has been used:</p><p></p><p>(1)&nbsp;<a href=\"https://www.researchgate.net/publication/231293953_New_Two-Constant_Equation_of_State\">Peng, Ding-yu &amp; Robinson, Donald. (1976). New Two-Constant Equation of State. Industrial &amp; Engineering Chemistry Fundamentals. 15. 10.1021/i160057a011.&nbsp;</a></p><p>(2)&nbsp;<a href=\"https://ars.els-cdn.com/content/image/1-s2.0-S0896844618307903-mmc1.pdf\">\"Equation of State and Thermodynamic Properties for Mixtures of H2O, O2, N2 and CO2 from Ambient up to 1000K and 280MPa - S. Supporting Information\" - F. Mangold, St. Pilz, S. Beljic, F. Vogel - 2019,&nbsp;pp 19-20</a></p><p>(3)&nbsp;<a href=\"https://www.researchgate.net/publication/327832564_Thermodynamics_Fundamentals_and_Engineering_Applications\">Colonna, Piero &amp; Reynolds, William. (2018). Thermodynamics: Fundamentals and Engineering Applications. 10.1017/9781139050616.&nbsp;</a></p><p>(4)&nbsp;<a href=\"http://web.nchu.edu.tw/pweb/users/cmchang/lesson/10174.pdf\">Chapter 6 \"Calculation of Properties of Pure Fluids\" - CM. J. Chang from National Chung Hsing University - 2012, pp 59-64</a></p><p>(5)&nbsp;<a href=\"http://www.sciencedirect.com/science/article/pii/S0306261916308352\">R. Scaccabarozzi, M. Gatti, E. Martelli. (2016). Thermodynamic analysis and numerical optimization of the NET Power oxy-combustion cycle, Applied Energy, Volume 178. Pages 505-526. ISSN 0306-2619. https://doi.org/10.1016/j.apenergy.2016.06.060.</a></p></div></body></html>"));
end PengRobinsonMixture;
