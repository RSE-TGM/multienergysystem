within MultiEnergySystem.H2GasFacility.Media.RealGases;
model H2PR "Hydrogen model using PR EoS"
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PengRobinsonMixture(
      nXi = 0,
      X_start = {1},
      T_start = 25 + 273.15,
      posDom = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.H2.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.H2.criticalMolarVolume},
      delta = {{ 0}},
      HHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.HHV},
      LHV = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.LHV},
      HHV_SCM = {MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.HHV_SCM},
      LHV_SCM = {119.96e6},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.H2.Hf},
      cp_coeff = {{8.3022149358563e-05,-0.099563690420583,40.70928347186,8817.1836822808}},
      mu_start = 0);
end H2PR;
