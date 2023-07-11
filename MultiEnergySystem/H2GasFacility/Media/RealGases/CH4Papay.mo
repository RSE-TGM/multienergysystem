within MultiEnergySystem.H2GasFacility.Media.RealGases;
model CH4Papay
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PapayMixture(
      nXi = 0,
      X_start = {1},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 1,
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      HHV = {37.669e6},
      LHV = {50e6},
      cp_coeff = {{-1.942367532068e-05,0.026331526513384,-8.2083625257152,2846.2158110588}},
      mu_start = 0);
end CH4Papay;
