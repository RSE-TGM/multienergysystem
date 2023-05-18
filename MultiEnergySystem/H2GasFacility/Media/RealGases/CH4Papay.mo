within MultiEnergySystem.H2GasFacility.Media.RealGases;

model CH4Papay
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PapayMixture(
      nXi = 0,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
      X_start = {1},
      T_start = 25 + 273.15,
      //v_start = 0.022336,
      posDom = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.CH4.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature},
      v_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume},
      delta = {{ 0}},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      HHV = {37.669e6},
      LHV = {50e6},
      cp_coeff = {{-1.942367532068e-05,0.026331526513384,-8.2083625257152,2846.2158110588}},
      mu_start = 0  
  );
end CH4Papay;
