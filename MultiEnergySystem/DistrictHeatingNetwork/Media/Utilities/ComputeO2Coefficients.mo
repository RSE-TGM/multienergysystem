within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeO2Coefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.O2);
end ComputeO2Coefficients;
