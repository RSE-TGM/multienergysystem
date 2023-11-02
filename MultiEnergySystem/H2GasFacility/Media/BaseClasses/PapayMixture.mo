within MultiEnergySystem.H2GasFacility.Media.BaseClasses;
partial model PapayMixture
  extends PapayMixtureND(Xi_start = X_start[1:nXi], rho(start = rho_start), cp(start = cp_id_start), computeDerivatives = true);
  import Modelica.Fluid.Utilities.regStep;

  //Variables
  Types.SpecificEnthalpy dh_id_dX[nX] "Mass fraction of Ideal Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_dX[nX] "Mass fraction derivative of Specific Enthalpy at constant pressure, per each component";
  Types.PerUnit dY_dX[nX, nX](start = dY_dX_start) "Mole fraction derivative of mass fraction per each component";
  Types.PerUnit dX_dX[nX, nX](start = dX_dX_start) "Mass fraction derivative of mass fraction per each component";
  Real drho_dT(unit = "kg/(K.m3)") "Temperature derivative of density per each component";
  Real drho_dp(unit = "kg/(Pa.m3)") "Pressure derivative at constant temperature, per each component";
  Real drho_dX[nX](each unit = "kg/m3") "Mass fraction derivative of the density per each component";

  //Papay Mixture derivatives
  Real dZ_dp(unit = "Pa-1") "Pressure derivative at constant T, X of compressibility factor";
  Real dZ_dT(unit = "K-1") "Temperature derivative at constant p, X of compressibility factor";
  Types.PerUnit dZ_dX[nX] "Mass fraction derivative at constant p, T of compressibility factor, per each component";
  Real dpr_mix_dp(unit = "Pa-1") "Pressure derivative at constant T, X of pseudo-reduced pressure";
  Real dpr_mix_dT(unit = "K-1") "Temperature derivative at constant v, X of pseudo-reduced pressure";
  Types.PerUnit dpr_mix_dX[nX] "Mass fraction derivative at constant T, X of pseudo-reduced pressure";
  Real dTr_mix_dp(unit = "Pa-1") "Pressure derivative at constant v, X of pseudo-reduced temperature";
  Real dTr_mix_dT(unit = "K-1") "Temperature derivative at constant p, X of pseudo-reduced temperature";
  Types.PerUnit dTr_mix_dX[nX] "Mass fraction derivative at constant p, T of pseudo-reduced temperature";

equation
  // Derivatives of Z
  dZ_dp = (-Zcoeff[1]*exp(-Zcoeff[2]*Tr_mix) + Zcoeff[3]*exp(-Zcoeff[4]*Tr_mix)*2*pr_mix)*dpr_mix_dp;
  dZ_dT = (Zcoeff[1]*Zcoeff[2]*pr_mix*exp(-Zcoeff[2]*Tr_mix) - Zcoeff[3]*Zcoeff[4]*pr_mix^2*exp(-Zcoeff[4]*Tr_mix))*dTr_mix_dT;
  dZ_dX = (-Zcoeff[1]*exp(-Zcoeff[2]*Tr_mix) + Zcoeff[3]*exp(-Zcoeff[4]*Tr_mix)*2*pr_mix)*dpr_mix_dX + (Zcoeff[1]*Zcoeff[2]*pr_mix*exp(-Zcoeff[2]*Tr_mix) - Zcoeff[3]*Zcoeff[4]*pr_mix^2*exp(-Zcoeff[4]*Tr_mix))*dTr_mix_dX;

  dpr_mix_dp = 1/p_c_mix;
  dpr_mix_dT = (1/p_c_mix)*dp_dT;
  dpr_mix_dX = -(p/p_c_mix^2)*p_c;

  dTr_mix_dp = 1/(T_c_mix*dp_dT);
  dTr_mix_dT = 1/T_c_mix;
  dTr_mix_dX = -(T/T_c_mix^2)*T_c;

  dv_dT = ((R/MM_mix)*T*dZ_dT + Z*(R/MM_mix))/p;
  //dv_dT = ((R/MM_mix)*T*dZ_dT + Z*(R/MM_mix))/(Z*R*T/v_mol);
  dv_dp = ((R/MM_mix)*T*dZ_dp - v)/p;
  //dv_dp = ((R/MM_mix)*T*dZ_dp - v)/(Z*R*T/v_mol);
  dv_dX = ((R/MM_mix)*T*dZ_dX - Z*T*(R/MM_mix^2)*MM*dY_dX)/p;
  //dv_dX = ((R/MM_mix)*T*dZ_dX - Z*T*(R/MM_mix^2)*MM*dY_dX)/(Z*R*T/v_mol);
  drho_dp = -rho^2*dv_dp;
  drho_dT = -rho^2*dv_dT;
  drho_dX = -rho^2*dv_dX;
  du_dT = cp + p*dp_dT*dv_dp "in mass units";
  du_dp = -(T*dv_dT + p*dv_dp) "in mass units";
  du_dX = dh_dX - p*dv_dX;
  dX_dX = identity(nX);
  dY_dX = {(MM_mix/MM[i])*(dX_dX[i, j] - (MM_mix/MM[j])*X[i]) for j in 1:nX, i in 1:nX};
  dh_id_dX = h_star "in mass units";
  dh_dX = dh_id_dX "in mass units";

  annotation (
    Documentation(info = "<html><head></head><body><h3>Model of a gas fluid using Peng Robinson EoS</h3><div class=\"htmlDoc\"><p>The objetive of this model is to obtain approximately the thermodynamic properties of the mixture gas to use it in the modeling of the Allam Cycle. The following references has been used:</p><p></p><p>(1)&nbsp;<a href=\"https://www.researchgate.net/publication/231293953_New_Two-Constant_Equation_of_State\">Peng, Ding-yu &amp; Robinson, Donald. (1976). New Two-Constant Equation of State. Industrial &amp; Engineering Chemistry Fundamentals. 15. 10.1021/i160057a011.&nbsp;</a></p><p>(2)&nbsp;<a href=\"https://ars.els-cdn.com/content/image/1-s2.0-S0896844618307903-mmc1.pdf\">\"Equation of State and Thermodynamic Properties for Mixtures of H2O, O2, N2 and CO2 from Ambient up to 1000K and 280MPa - S. Supporting Information\" - F. Mangold, St. Pilz, S. Beljic, F. Vogel - 2019,&nbsp;pp 19-20</a></p><p>(3)&nbsp;<a href=\"https://www.researchgate.net/publication/327832564_Thermodynamics_Fundamentals_and_Engineering_Applications\">Colonna, Piero &amp; Reynolds, William. (2018). Thermodynamics: Fundamentals and Engineering Applications. 10.1017/9781139050616.&nbsp;</a></p><p>(4)&nbsp;<a href=\"http://web.nchu.edu.tw/pweb/users/cmchang/lesson/10174.pdf\">Chapter 6 \"Calculation of Properties of Pure Fluids\" - CM. J. Chang from National Chung Hsing University - 2012, pp 59-64</a></p><p>(5)&nbsp;<a href=\"http://www.sciencedirect.com/science/article/pii/S0306261916308352\">R. Scaccabarozzi, M. Gatti, E. Martelli. (2016). Thermodynamic analysis and numerical optimization of the NET Power oxy-combustion cycle, Applied Energy, Volume 178. Pages 505-526. ISSN 0306-2619. https://doi.org/10.1016/j.apenergy.2016.06.060.</a></p></div></body></html>"));
end PapayMixture;
