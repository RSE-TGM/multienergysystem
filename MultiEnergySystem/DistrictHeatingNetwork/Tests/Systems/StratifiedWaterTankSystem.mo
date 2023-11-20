within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model StratifiedWaterTankSystem
  extends WaterTankSystem(
    redeclare DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H=4,
                 n=4),
    redeclare DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H=4,
                 n=4),
    Tin_start_S2 = 60 + 273.15,
    Tout_start_S2 = 60 + 273.15,
    theta = 0,
    P201(pout_start=3e5),
    source(R=1e-3));
  annotation (experiment(
      StopTime=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end StratifiedWaterTankSystem;
