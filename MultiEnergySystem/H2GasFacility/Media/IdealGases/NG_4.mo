within MultiEnergySystem.H2GasFacility.Media.IdealGases;

model NG_4
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.IdealMixture(
      nXi = 3,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
      X_start = {0.9, 0.05, 0.04, 0.01},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 1,
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C2H6.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C3H8.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_n_butane.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C2H6.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C3H8.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C2H6.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C3H8.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume,
                 Modelica.Media.IdealGases.Common.FluidData.C2H6.criticalMolarVolume,
                 Modelica.Media.IdealGases.Common.FluidData.C3H8.criticalMolarVolume,
                 Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalMolarVolume},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C2H6.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C3H8.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_n_butane.Hf},
      HHV = {37.669e6, 12.75e6, 95.830e6, 120.160e6},
      LHV = {50e6, 119.96e6, 46.35e6, 0},
      cp_coeff = {{-2.0604948457659e-05,    0.02738991794621,       -8.523906729998,      2877.5194077417},
                  {8.3022149358563e-05,     -0.099563690420583,      40.70928347186,      8817.1836822808},
                  {6.9469559921695e-07,     -0.0034853852149653,     6.8351551007804,    -82.089844972399},
                  {7.1379237407726e-07,     -0.0035119111734142,     6.7355090155386,    -21.590244098504}},
      mu_start = 0
  );
equation

end NG_4;