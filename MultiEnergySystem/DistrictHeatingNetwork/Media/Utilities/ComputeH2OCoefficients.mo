within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeH2OCoefficients
  extends AllamCycle.Substances.Utilities.ComputeIdealGasCoefficients(ord_cp=3,
      redeclare package Medium = Modelica.Media.IdealGases.SingleGases.H2O);

end ComputeH2OCoefficients;
