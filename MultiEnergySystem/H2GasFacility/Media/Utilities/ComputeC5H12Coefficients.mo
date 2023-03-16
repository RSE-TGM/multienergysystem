within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeC5H12Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.C5H12_n_pentane);

end ComputeC5H12Coefficients;
