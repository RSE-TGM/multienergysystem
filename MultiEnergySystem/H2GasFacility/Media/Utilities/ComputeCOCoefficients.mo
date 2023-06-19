within MultiEnergySystem.H2GasFacility.Media.Utilities;

model ComputeCOCoefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp = 3, redeclare package Medium = Modelica.Media.IdealGases.SingleGases.CO);
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ComputeCOCoefficients;
