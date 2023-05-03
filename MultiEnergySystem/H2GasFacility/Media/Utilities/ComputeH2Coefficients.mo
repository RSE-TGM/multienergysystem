within MultiEnergySystem.H2GasFacility.Media.Utilities;
model ComputeH2Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.H2);

end ComputeH2Coefficients;
