within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeCO2Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3, T_min = 0 + 273.15, T_max = 100 + 273.15,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CO2);
end ComputeCO2Coefficients;
