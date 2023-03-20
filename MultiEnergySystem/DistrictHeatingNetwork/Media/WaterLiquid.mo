within MultiEnergySystem.DistrictHeatingNetwork.Media;

model WaterLiquid
  extends BaseClasses.PartialSubstance(nX = 1, mu_start = 0, MM = Modelica.Media.IdealGases.Common.SingleGasesData.H2O.MM);
  parameter Types.MassFraction X_start[1] = {1};
  Types.Density rho "Density";
  //Start parameters
initial equation
  assert(computeEntropy == false, "This model is not able to compute entropy");
equation
  rho = (((+1.48186e-005)*T + (-0.0177278))*T + 6.36275)*T + 283.08;
  u = (((+0.00393447)*T + (-3.7185))*T + 5350.25)*T + (-1.26407e+006);
  h = u + p/rho;
  cp = du_dT;
  cv = cp;
  du_dp = 0.0001 "Pressure derivative of the Specific Internal Energy";
//MESSE A 0
  rho = MM/v;
  dv_dp = 0 "Pressure derivative of specific volume at constant Temperature";
  du_dT = ((+0.00393447*3)*T + (-3.7185)*2)*T + 5350.25;
  dv_dT = -(((+1.48186e-005*3)*T + (-0.0177278)*2)*T + 6.36275)/rho^2;
  dv_dX = {0.0001};
  du_dX = {0.0001};
//p_sat = ((((+0.000342217) * T + (-0.295484)) * T + 85.5469) * T + (-8298.06)) * T + (-104.079);
  if computeTransport == true then
    mu = 0.001;
    k = 0.62;
  else
    mu = 0;
    k = 0;
  end if;
  s = 0;
  annotation(
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
end WaterLiquid;
