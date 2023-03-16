within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeC5H12Coefficients
  extends AllamCycle.Substances.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium =
        Modelica.Media.IdealGases.SingleGases.C5H12_n_pentane);

end ComputeC5H12Coefficients;
