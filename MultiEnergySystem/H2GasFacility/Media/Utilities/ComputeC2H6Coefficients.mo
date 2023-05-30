within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeC2H6Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(T_min = 0 + 273.15, T_max = 100 + 273.15, ord_cp = 3, redeclare package Medium = Modelica.Media.IdealGases.SingleGases.C2H6);
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));

end ComputeC2H6Coefficients;
