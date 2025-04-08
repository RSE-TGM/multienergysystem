within MultiEnergySystem.DistrictHeatingNetwork.Media;
model WaterLiquidIdeal
  "Liquid water model with constant density and constant specific heat capacity"
  extends BaseClasses.PartialSubstance(
    compressibilityEffect = false,
    mu_start = 0.00113,
    MM = Modelica.Media.IdealGases.Common.SingleGasesData.H2O.MM,
    rho_coeff = {-0.0034821889243192,1.8159726369743,764.95410451574},
    cp_coeff = {-7.9613160841789e-05,0.090325271418373,-33.186924873704,8156.6624352755},
    kappa_coeff = {-8.1509980345909e-06,0.0063995962643842,-0.57622073567604});

  //Start parameters
initial equation
  assert(computeEntropy == false, "This model is not able to compute entropy");
  assert(computeTransport == false, "This model fixes constant values for transport properties");
equation
  rho = rho_start;
  cp = cp_start;
  kappa = kappa_T(T_start,kappa_coeff);
  mu = mu_start;
  rho = 1/v;
  v_mol = MM/rho;
  h = u + p/rho;
  h = cp*T;
  du_dT = cv;
  cv = cp;
  drho_dT = 0;
  dv_dT = 0;
  du_dp = 1e-5 "Pressure derivative of the Specific Internal Energy";
  dv_dp = 0 "Pressure derivative of specific volume at constant Temperature";
  s = 0;
  annotation (
    Documentation(info="<HTML>
  <p><b>WaterLiquidIdeal</b> provides a simplified model for liquid water assuming:</p>

  <ul>
    <li>Constant density <code>rho = rho_start</code></li>
    <li>Constant specific heat capacity <code>cp = cp_start</code></li>
    <li>Thermal properties are independent of temperature and pressure</li>
  </ul>

  <p>This model is recommended for simple validation, rapid prototyping, and control-oriented simulations 
  where full thermodynamic accuracy is not required.</p>

  <p>Note: entropy and compressibility effects are disabled.</p>
</HTML>"));
end WaterLiquidIdeal;
