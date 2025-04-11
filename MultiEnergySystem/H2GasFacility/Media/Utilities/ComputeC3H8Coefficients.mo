within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeC3H8Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp = 3, redeclare
      package                                                                       Medium =
        Modelica.Media.IdealGases.SingleGases.C3H8);
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));

end ComputeC3H8Coefficients;
