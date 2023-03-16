within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeC2H6Coefficients
  extends AllamCycle.Substances.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.C2H6);

end ComputeC2H6Coefficients;
