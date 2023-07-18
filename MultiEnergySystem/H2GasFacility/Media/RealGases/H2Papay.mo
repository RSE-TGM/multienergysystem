within MultiEnergySystem.H2GasFacility.Media.RealGases;
model H2Papay
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PapayMixture(
      nXi = 0,
      X_start = {1},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 1,
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalMolarVolume},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.H2.Hf},
      HHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.HHV_SCM},
      LHV = {119.96e6},
      cp_coeff = {{8.3022149358563e-05,-0.099563690420583,40.70928347186,8817.1836822808}},
      mu_start = 0);
end H2Papay;
