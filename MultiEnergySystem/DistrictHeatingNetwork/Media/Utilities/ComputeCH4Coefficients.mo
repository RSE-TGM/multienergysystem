within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeCH4Coefficients
  extends ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.CH4);
end ComputeCH4Coefficients;
