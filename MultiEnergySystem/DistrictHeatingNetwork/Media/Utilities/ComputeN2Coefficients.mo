within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeN2Coefficients
  extends AllamCycle.Substances.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.N2);
end ComputeN2Coefficients;
