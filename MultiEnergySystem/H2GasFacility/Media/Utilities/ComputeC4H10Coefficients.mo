within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeC4H10Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.C4H10_n_butane);
end ComputeC4H10Coefficients;
