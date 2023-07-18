within MultiEnergySystem.H2GasFacility.Media.RealGases;
model CH4H2Papay
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PapayMixture(
      nXi = 1,
      X_start = {0.9, 0.1},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 1,
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.H2.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.H2.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume,
                 Modelica.Media.IdealGases.Common.FluidData.H2.criticalMolarVolume},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.H2.Hf},
      HHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV_SCM,
      MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.HHV_SCM},
      LHV = {50e6, 119.96e6},
      cp_coeff = {{-2.0604948457659e-05,0.02738991794621,-8.523906729998,2877.5194077417},
                  {8.3022149358563e-05,-0.099563690420583,40.70928347186,8817.1836822808}},
      mu_start = 0);
equation

end CH4H2Papay;
