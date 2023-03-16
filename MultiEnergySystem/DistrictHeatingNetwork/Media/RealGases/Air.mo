within MultiEnergySystem.DistrictHeatingNetwork.Media.RealGases;

model Air "Mixture real gas model with CO2, N2, O2, H2O & Ar (in that order) using PR EoS"
  extends AllamCycle.Substances.BaseClasses.PengRobinsonMixture(
      reducedX = false,
      computeEnthalpyCondensation = false,
      computehidealComp = false,
      nX = 5,
      nC = 0,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.N2.MM,
      X_start = {0.00062, 0.75553, 0.23131, 0.00001, 0.01253},
      T_start = 25+273.15,
      posDom = 2,
      posCond = 4,
      posOxygen = 3,
      w =   {Modelica.Media.IdealGases.Common.FluidData.CO2.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.N2.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.O2.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.H2O.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.Ar.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CO2.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.N2.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.O2.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.H2O.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.Ar.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CO2.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.N2.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.O2.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.H2O.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.Ar.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CO2.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.N2.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.O2.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.H2O.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.Ar.criticalTemperature},
      Z_c = {0.277,0.290,0.288,0.229,0.291},
      delta = {{ 0,     -0.017,  0,      0.12, 0},
               {-0.017,  0,     -0.0119, 0,   -0.0026},
               { 0,     -0.0119, 0,      0,    0.0104},
               { 0.12,   0,      0,      0,    0},
               { 0,     -0.0026, 0.0104, 0,    0}},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CO2.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.N2.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.O2.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.H2O.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.Ar.Hf},
      cp_coeff = {{2.2131327339674e-007,    -0.00092151007501244,  1.4416059822539,     493.52730053016},
                  {-1.7194266972964e-007,    0.00044985407669627, -0.16123790188215,    1048.8091727539},
                  {-6.9227589493842e-009,   -0.00011005218338677,  0.40567177501433,    801.06933856571},
                  {-2.2817222567514e-007,    0.00068126780231501,  0.046306944938422,   1792.2033608181},
                  { 7.7666428271886e-014,   -1.9260545554682e-010, 1.37924351757e-007,  520.33090172226}},
      Hf_track = zeros(nC),
      cp_coeff_track = zeros(nC,ord_cp_ideal+1),
      mu_start = 0);
      //cp_cond_coeff = {0.0012473406994848, -1.0758153361635, 312.45929094554, -30526.814345532},

equation
  cp_cond_coeff[1] = 0.0053829910 + (p/1e5)*(-0.0002456170 + 0.0000035939*(p/1e5));
  cp_cond_coeff[2] = -4.6150453224 + (p/1e5)*(0.2105769035 - 0.0030812248*(p/1e5));
  cp_cond_coeff[3] = 1331.1529357756 + (p/1e5)*(-60.7383121266 + 0.8887413046*(p/1e5));
  cp_cond_coeff[4] = -129029.8397929920 + (p/1e5)*(5887.4186972587 - 86.1464863001*(p/1e5));

end Air;
