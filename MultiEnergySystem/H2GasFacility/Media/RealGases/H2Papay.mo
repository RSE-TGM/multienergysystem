within MultiEnergySystem.H2GasFacility.Media.RealGases;

model H2Papay
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PapayMixture(
      nXi = 0,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM,
      X_start = {1},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.H2.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalMolarVolume},
      delta = {{ 0}},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.H2.Hf},
      HHV = {12.75e6},
      LHV = {119.96e6},
      cp_coeff = {{8.3022149358563e-05,-0.099563690420583,40.70928347186,8817.1836822808}},
      mu_start = 0  
  );
end H2Papay;
