within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeC3H8Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.C3H8);

end ComputeC3H8Coefficients;
