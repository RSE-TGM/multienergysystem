within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeArCoefficients
  extends AllamCycle.Substances.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.Ar);
end ComputeArCoefficients;