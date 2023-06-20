within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeN2Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.N2);

end ComputeN2Coefficients;
