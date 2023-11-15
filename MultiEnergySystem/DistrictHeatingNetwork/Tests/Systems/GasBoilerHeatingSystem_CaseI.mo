within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerHeatingSystem_CaseI
  extends GasBoilerHeatingSystem(
    EX701(n=n),
    EX711(n=n),
    EX721(n=n),
    EX731(n=n),
    FCV101_theta_(height=-0.9),
    CoolingP(startTime=150));
  parameter Integer n = 5;
  parameter Integer nP = 2;
end GasBoilerHeatingSystem_CaseI;
