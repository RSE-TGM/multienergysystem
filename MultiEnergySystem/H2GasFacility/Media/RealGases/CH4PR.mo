within MultiEnergySystem.H2GasFacility.Media.RealGases;
model CH4PR
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PengRobinsonMixture(
      nXi = 0,
      X_start = {1},
      T_start = 25 + 273.15,
      posDom = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.CH4.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume},
      delta = {{ 0}},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      HHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV},
      LHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.LHV},
      HHV_SCM = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV_SCM},
      LHV_SCM = {50e6},
      cp_coeff = {{-1.942367532068e-05,0.026331526513384,-8.2083625257152,2846.2158110588}},
      mu_start = 0);
      //v_start = 0.022336,
end CH4PR;
