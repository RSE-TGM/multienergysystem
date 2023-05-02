within MultiEnergySystem.H2GasFacility.Media.RealGases;

model H2PR
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PengRobinsonMixture(
      nXi = 0,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM,
      X_start = {1},
      T_start = 25 + 273.15,
      posDom = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.H2.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalTemperature},
      delta = {{ 0}},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      cp_coeff = {{-1.942367532068e-05,0.026331526513384,-8.2083625257152,2846.2158110588}},
      mu_start = 0  
  );
end H2PR;
