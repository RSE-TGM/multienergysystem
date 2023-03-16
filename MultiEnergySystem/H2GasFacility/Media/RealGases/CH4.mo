within MultiEnergySystem.H2GasFacility.Media.RealGases;

model CH4
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PengRobinsonMixture(
      reducedX = false,
      computeEnthalpyCondensation = false,
      computehidealComp = false,
      nX = 1,
      nC = 0,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
      X_start = {1},
      T_start = 25 + 273.15,
      posDom = 1,
      posCond = 1,
      posOxygen = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.CH4.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature},
      Z_c = {0.277},
      delta = {{ 0}},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      cp_coeff = {{-5.6776551798464e-07,     0.0004856226884952,     3.5809130457096,     1087.3242540246}},
      Hf_track = zeros(nC),
      cp_coeff_track = zeros(nC,ord_cp_ideal+1),
      mu_start = 0  
  );
equation
  cp_cond_coeff = zeros(4);
end CH4;
