within MultiEnergySystem.H2GasFacility.Media.IdealGases;
model CO_H2_CH4
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.IdealMixture(
      nXi = 2,
      X_start = {0.1, 0.2, 0.7},
      T_start = 25 + 273.15,
      p_start = 1e5,
      posDom = 3,
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CO.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.H2.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CO.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.H2.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CO.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.H2.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature},
      v_mol_c = {Modelica.Media.IdealGases.Common.FluidData.CO.criticalMolarVolume,
                 Modelica.Media.IdealGases.Common.FluidData.H2.criticalMolarVolume,
                 Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume},
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CO.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.H2.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf},
      HHV = {0,
             MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.HHV,
             MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV},
      LHV = {0,
             MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.LHV,
             MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.LHV},
      HHV_SCM = {0,
                 MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.H2.HHV_SCM,
                 MultiEnergySystem.H2GasFacility.Data.FuelHeatingData.CH4.HHV_SCM},
      LHV_SCM = {50e6, 119.96e6, 46.35e6},
      cp_coeff = {{8.8083923895083e-07,-0.00046038300217292,0.068103393586353,1037.6553052293},
                  {8.0738788389137e-05,-0.097360047650082,40.00291818555,8892.3843103683},
                  {-2.0604948457659e-05,0.02738991794621,-8.523906729998,2877.5194077417}},
      mu_start = 1.088e-5
                         "check this value later");
equation

end CO_H2_CH4;
