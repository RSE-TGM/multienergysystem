within MultiEnergySystem.H2GasFacility.Media.IdealGases;
model CH4
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.IdealMixture(
      nXi = 0,
      X_start = {1},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 1,
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      HHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV},
      LHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.LHV},
      HHV_SCM = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV_SCM},
      LHV_SCM = {50e6},
      cp_coeff = {{-2.0604948457659e-05,0.02738991794621,-8.523906729998,2877.5194077417}},
      mu_start = 1.1e-5,
      mu_const = 1.1e-5);
equation

end CH4;
