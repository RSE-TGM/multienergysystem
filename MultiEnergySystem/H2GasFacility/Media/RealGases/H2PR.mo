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
      HHV = {12.75e6},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.H2.Hf},
      cp_coeff = {{8.3022149358563e-05,-0.099563690420583,40.70928347186,8817.1836822808}},
      mu_start = 0  
  );
end H2PR;
