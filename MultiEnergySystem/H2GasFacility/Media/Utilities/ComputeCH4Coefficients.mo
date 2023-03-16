within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeCH4Coefficients
  extends ComputeIdealGasCoefficients(T_min = 0 + 273.15, T_max = 50 + 273.15, ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4);
end ComputeCH4Coefficients;
