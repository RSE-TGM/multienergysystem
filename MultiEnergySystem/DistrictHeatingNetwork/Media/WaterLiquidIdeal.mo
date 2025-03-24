within MultiEnergySystem.DistrictHeatingNetwork.Media;
model WaterLiquidIdeal
  "Liquid water model with constant density and constant specific heat capacity"
  extends BaseClasses.PartialSubstance(
    mu_start = 0.00113,
    MM = Modelica.Media.IdealGases.Common.SingleGasesData.H2O.MM,
    rho_coeff = {-0.0034821889243192,1.8159726369743,764.95410451574},
    cp_coeff = {-7.9613160841789e-05,0.090325271418373,-33.186924873704,8156.6624352755},
    kappa_coeff = {-8.1509980345909e-06,0.0063995962643842,-0.57622073567604});

  //Start parameters
  parameter Types.SpecificEnergy u_bias = 1.492354e+06;


initial equation
  assert(computeEntropy == false, "This model is not able to compute entropy");
equation
  rho = rho_start;
  cp = cp_start;
  drho_dT = 0;
  rho = 1/v;
  v_mol = MM/rho;
  h = u + p/rho;
  //h = h_T(T,cp_coeff);
  h = cp*T;
  cp = du_dT;
  cv = cp;
  du_dp = 0.00001 "Pressure derivative of the Specific Internal Energy";
  dv_dp = 0 "Pressure derivative of specific volume at constant Temperature";
  dv_dT = 0;
  if computeTransport == true then
    mu = mu_start;
    kappa = kappa_T(T, kappa_coeff);
  else
    mu = 0;
    kappa = 0;
  end if;
  s = 0;
  annotation (
    Documentation(info = "<HTML>
        <p>Liquid Water modeled using polynomial correlations obtained by interpolation of data from IF-97 standard to determine the saturated liquid state as a function of temperature.
        <p>From that reference point the water is modeled as an incompressible liquid with the density of the saturated liquid, so it obeys the following equations of state:
        <ul>
        <li>d(T,p) = d_sat(T)</li>
        </ul>
        For an incompressible fluid Internal energy os only a function of temperature, so:
        <ul>
        <li>u(T,p) = u_sat(T)</li>
        </ul>
        And cp = cv and it defined as the temperature derivative of internal energy.
        And to conclude, enthalpy is calculated following the definition:
        <ul>
        <li>h = u + p / d</li>
        </ul>
        </HTML>"));
end WaterLiquidIdeal;
