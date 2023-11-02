within MultiEnergySystem.H2GasFacility.Media.BaseClasses;
partial model IdealMixture
  extends IdealMixtureND(computeDerivatives = true);
  import Modelica.Fluid.Utilities.regStep;

  //Variables
  Types.SpecificEnthalpy dh_id_dX[nX] "Mass fraction of Ideal Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_dX[nX] "Mass fraction derivative of Specific Enthalpy at constant pressure, per each component";
  Types.SpecificEnthalpy dh_id_dXi[nXi];
  Types.SpecificEnthalpy dh_dXi[nXi];
  Real drho_dT(unit = "kg/(K.m3)") "Temperature derivative of density per each component";
  Real drho_dp(unit = "kg/(Pa.m3)") "Pressure derivative at constant temperature, per each component";
  Real drho_dX[nX](each unit = "kg/m3") "Mass fraction derivative of the density per each component";
  Real drho_dXi[nXi](each unit = "kg/m3") "Mass fraction derivative of the density per each independent component variable";
  Types.SpecificVolume dv_dXi[nXi];
  Types.SpecificEnergy du_dXi[nXi];
//  Types.SpecificEnergy du_dXi_check[nXi];
//  Types.MolarMass dMM_mix_dYi[nXi];
//  Types.MolarMass dMM_mix_dXi[nXi];
//  Types.MolarMass dMM_mix_dXi_check[nXi];
//  Types.MolarMass MM_mix_check;
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
//  Types.SpecificEnthalpy dh_id_dYi[nXi];
//  Types.SpecificEnthalpy dh_dYi[nXi];
//  Types.SpecificEnergy du_dYi[nXi];
equation

  // Specific volume and density derivates
  dv_dT = v/T;
  dv_dp = -v/p;
  dv_dX = v*MM_mix./MM;

  drho_dp = rho/p;
  drho_dT = -rho/T;
  drho_dX = -rho^2*dv_dX;
  drho_dXi = -rho*MM_mix*(ones(nXi)./MM[1:nXi] + ones(nXi)/MM[nX]);
  drho_dXi = -rho^2*dv_dXi;

  // Specific enthalpy derivatives
  dh_id_dX = h_star "in mass units";
  dh_dX = dh_id_dX "in mass units";

  // Specific Energy derivatives
  du_dT = cp - p*dv_dT;
  du_dp = -v - p*dv_dp;
  du_dX = dh_dX - p*dv_dX;

  dh_id_dXi = h_star[1:nXi] - ones(nXi)*h_star[nX];
  dh_dXi = dh_id_dXi "in mass units";
  du_dXi = dh_dXi - p*dv_dXi;

//du_dY = dh_dY - p*dv_dY;
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


//  dh_id_dYi = dh_id_dXi*dXi_dYi;
//  dh_dYi = dh_id_dYi "in mass units";
//  du_dYi = dh_dYi - p*dv_dYi;
//  du_dXi_check = du_dYi*dYi_dXi "in mass units";

  //dv_dY = -v*MM/MM_mix;
  //drho_dp = -rho^2*dv_dp;
  //drho_dT = -rho^2*dv_dT;
  //dh_id_dY = {(1/MM_mix)*MM[i]*h_star[i] - (1/MM_mix^2)*MM[i]*(Y.*MM)*h_star for i in 1:nX};
  //dh_dY = dh_id_dY "in mass units";

  // Mass/mol fraction derivaties
  //dX_dX = identity(nX);
  //dY_dX = {(MM_mix/MM[i])*(dX_dX[i, j] - (MM_mix/MM[j])*X[i]) for j in 1:nX, i in 1:nX};
  //dMM_mix_dY = MM;

  annotation (
    Documentation(info = "<html><head></head><body><h3>Model of a gas fluid using Peng Robinson EoS</h3><div class=\"htmlDoc\"><p>The objetive of this model is to obtain approximately the thermodynamic properties of the mixture gas to use it in the modeling of the Allam Cycle. The following references has been used:</p><p></p><p>(1)&nbsp;<a href=\"https://www.researchgate.net/publication/231293953_New_Two-Constant_Equation_of_State\">Peng, Ding-yu &amp; Robinson, Donald. (1976). New Two-Constant Equation of State. Industrial &amp; Engineering Chemistry Fundamentals. 15. 10.1021/i160057a011.&nbsp;</a></p><p>(2)&nbsp;<a href=\"https://ars.els-cdn.com/content/image/1-s2.0-S0896844618307903-mmc1.pdf\">\"Equation of State and Thermodynamic Properties for Mixtures of H2O, O2, N2 and CO2 from Ambient up to 1000K and 280MPa - S. Supporting Information\" - F. Mangold, St. Pilz, S. Beljic, F. Vogel - 2019,&nbsp;pp 19-20</a></p><p>(3)&nbsp;<a href=\"https://www.researchgate.net/publication/327832564_Thermodynamics_Fundamentals_and_Engineering_Applications\">Colonna, Piero &amp; Reynolds, William. (2018). Thermodynamics: Fundamentals and Engineering Applications. 10.1017/9781139050616.&nbsp;</a></p><p>(4)&nbsp;<a href=\"http://web.nchu.edu.tw/pweb/users/cmchang/lesson/10174.pdf\">Chapter 6 \"Calculation of Properties of Pure Fluids\" - CM. J. Chang from National Chung Hsing University - 2012, pp 59-64</a></p><p>(5)&nbsp;<a href=\"http://www.sciencedirect.com/science/article/pii/S0306261916308352\">R. Scaccabarozzi, M. Gatti, E. Martelli. (2016). Thermodynamic analysis and numerical optimization of the NET Power oxy-combustion cycle, Applied Energy, Volume 178. Pages 505-526. ISSN 0306-2619. https://doi.org/10.1016/j.apenergy.2016.06.060.</a></p></div></body></html>"));
end IdealMixture;
