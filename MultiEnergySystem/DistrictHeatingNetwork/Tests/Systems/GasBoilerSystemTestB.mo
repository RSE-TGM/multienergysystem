within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTestB
  extends GasBoilerSystemTest(
  redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_rCD_cold,
  redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_FT101_GB101,
  redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_TT101_FT101,
  redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_GB101_P101,
  redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_P101_FCV101,
  redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_rCD_hot);
end GasBoilerSystemTestB;
