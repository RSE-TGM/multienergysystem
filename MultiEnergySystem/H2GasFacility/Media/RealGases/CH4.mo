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
      cp_coeff = {{2.2131327339674e-007,    -0.00092151007501244,  1.4416059822539,     493.52730053016}},
      Hf_track = zeros(nC),
      cp_coeff_track = zeros(nC,ord_cp_ideal+1),
      mu_start = 0  
  );
equation
  cp_cond_coeff = zeros(4);
end CH4;
