within MultiEnergySystem.DistrictHeatingNetwork.Media;
model WaterLiquidVaryingcp
  "Liquid water model with varying specific heat capacity and constant density"
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
equation
  rho = rho_start;
  rho = 1/v;
  cp = cp_T(T, cp_coeff);
  h = h_T(T,cp_coeff);
  h = u + p/rho;
  cv = du_dT;
  //cp = du_dT;
  cv = cp;
  rho = MM/v_mol;
  dv_dp = 0;
  dv_dT = 0;
  drho_dT = 0;
  du_dp = 1e-5;
  if computeTransport == true then
    mu = mu_start;
    kappa = kappa_T(T, kappa_coeff);
  else
    mu = 0;
    kappa = 0;
  end if;
  s = 0;
  annotation (
    Documentation(info="<HTML>
  <p><b>WaterLiquidVaryingcp</b> models liquid water as an incompressible fluid with:</p>
  <ul>
    <li>Constant density <code>rho = rho_start</code></li>
    <li>Temperature-dependent specific heat capacity <code>cp = cp(T)</code></li>
  </ul>

  <p>This model captures better thermal dynamics than <code>WaterLiquidIdeal</code> 
  but retains simplicity by neglecting compressibility effects.</p>
        </HTML>"));
end WaterLiquidVaryingcp;
