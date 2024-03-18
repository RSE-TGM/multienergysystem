within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeCH4Coefficients
  extends ComputeIdealGasCoefficients(T_min = 0 + 273.15, T_max = 100 + 273.15, ord_cp = 3, redeclare
      package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4);
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ComputeCH4Coefficients;
