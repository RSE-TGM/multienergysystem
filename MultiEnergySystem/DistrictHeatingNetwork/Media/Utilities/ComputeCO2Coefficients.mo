within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeCO2Coefficients
  extends AllamCycle.Substances.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CO2);
end ComputeCO2Coefficients;
