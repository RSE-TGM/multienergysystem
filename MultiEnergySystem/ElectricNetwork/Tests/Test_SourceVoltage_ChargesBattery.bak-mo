within MultiEnergySystem.ElectricNetwork.Tests;
model Test_SourceVoltage_ChargesBattery
  MultiEnergySystem.ElectricNetwork.Sources.SourceVoltage src(v0=385);
  MultiEnergySystem.ElectricNetwork.Components.BatteryChargeSink batt(
    SOC0=0.3,
    SOC_max=0.9,
    P_request=5000,
    P_chg_max=8000);

equation
  connect(src.outlet, batt.inlet);

  annotation (experiment(StopTime=4000));
end Test_SourceVoltage_ChargesBattery;
