within MultiEnergySystem.H2GasFacility.Tests.Media;

model NaturalGasPR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.CH4PR(
  
    redeclare model MediumIdeal = H2GasFacility.Media.IdealGases.H2,
    redeclare model MediumReal = H2GasFacility.Media.RealGases.NaturalGasPR,
    T_min = 0 + 273.15,
    T_max = 500 + 273.15,
    p = 5e5,
    X = {0.97201, 0.01862, 0.00393, 0.00543, 0.00001}
  );
equation

end NaturalGasPR;
