within MultiEnergySystem.DistrictHeatingNetwork.Media;
model WaterLiquidVaryingDensity
  "Liquid water model with varying specific heat capacity and varying density"
  extends BaseClasses.PartialSubstance(
    compressibilityEffect = true,
    mu_start = 0.00113,
    MM = Modelica.Media.IdealGases.Common.SingleGasesData.H2O.MM,
    rho_coeff = {-0.0034821889243192,1.8159726369743,764.95410451574},
    cp_coeff = {-7.9613160841789e-05,0.090325271418373,-33.186924873704,8156.6624352755},
    kappa_coeff = {-8.1509980345909e-06,0.0063995962643842,-0.57622073567604});

  parameter Types.SpecificEnergy u_bias = 1.492354e+06;

  //Start parameters
initial equation
  assert(computeEntropy == false, "This model is not able to compute entropy");
equation
  rho = rho_T(T,rho_coeff);
  //rho = 985;
  //drho_dT = 0;
  rho = 1/v;
  drho_dT = drhodT_T(T, rho_coeff);
  //dTdv = drhodv/drhodT;
  //dpdT = (p/rho)*drhodT;
  //u = (((+0.00393447)*T + (-3.7185))*T + 5350.25)*T + (-1.26407e+006);
  //u = u_T(T,cp_coeff) - u_bias;
  h = u + p/rho;
  //h = h_T(T,cp_coeff) - u_bias;
  h = h_T(T,cp_coeff);
  cp = du_dT;
  cp = cp_T(T, cp_coeff);
  cv = cp;
  //cp = cv - T*dpdT/dTdv;
  du_dp = 0.00001 "Pressure derivative of the Specific Internal Energy";
//MESSE A 0
  rho = MM/v_mol "fluid density";
  dv_dp = 0 "Pressure derivative of specific volume at constant Temperature";
  //du_dT = ((+0.00393447*3)*T + (-3.7185)*2)*T + 5350.25;
  dv_dT = -(((+1.48186e-005*3)*T + (-0.0177278)*2)*T + 6.36275)/rho^2;
//p_sat = ((((+0.000342217) * T + (-0.295484)) * T + 85.5469) * T + (-8298.06)) * T + (-104.079);
  if computeTransport == true then
    mu = mu_start;
    kappa = kappa_T(T, kappa_coeff);
  else
    mu = 0;
    kappa = 0;
  end if;
  s = 0;
  annotation (
    Documentation(info="<html>

<p><b>WaterLiquidVaryingDensity</b> is the most detailed liquid water model in this package. It includes:</p>

<ul>
  <li>Temperature-dependent density <code>rho = rho(T)</code></li>
  <li>Temperature-dependent specific heat capacity <code>cp = cp(T)</code></li>
  <li>Compressibility effects: <code>drho/dT</code> and <code>dv/dT</code> enabled</li>
</ul>

<p>This model is suitable for high-fidelity simulation of thermal systems, especially when volume and density changes are relevant (e.g., storage tanks, long pipe dynamics).</p>


<p>Liquid Water modeled using polynomial correlations obtained by interpolation of data from IF-97 standard to determine the saturated liquid state as a function of temperature. </p>
<p>From that reference point the water is modeled as an incompressible liquid with the density of the saturated liquid, so it obeys the following equations of state: </p>
<ul>
<li>d(T,p) = d_sat(T) </li>
</ul>
<p>For an incompressible fluid Internal energy as only a function of temperature, so: </p>
<ul>
<li>u(T,p) = u_sat(T) </li>
</ul>
<p>And cp = cv and it defined as the temperature derivative of internal energy. And to conclude, enthalpy is calculated following the definition: </p>
<ul>
<li>h = u + p / d </li>
</ul>
</html>"));
end WaterLiquidVaryingDensity;
