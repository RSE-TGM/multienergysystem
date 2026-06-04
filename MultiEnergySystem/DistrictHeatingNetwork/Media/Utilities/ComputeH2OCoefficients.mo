within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeH2OCoefficients
  extends Media.Utilities.ComputeIdealGasCoefficients(ord_cp = 2, ord_d = 2, redeclare
      package                                                                                  Medium =
        Modelica.Media.Water.StandardWater);
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ComputeH2OCoefficients;
