within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTestB
  extends GasBoilerSystemTest(
    Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test3\Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test3\Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test3\Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test3\Actuators.mat"),
    FT_101 = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1],dim[2])*982/3600,
    q_101 = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1],dim[2]),
    PT_101 = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT101,dim[1],dim[2])*1e5,
    PT_102 = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT102,dim[1],dim[2])*1e5,
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_rCD_cold,
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_FT101_GB101(cf=cf),
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_TT101_FT101(cf=cf),
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_GB101_P101(cf=cf),
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_P101_FCV101(cf=cf),
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_rCD_hot,
    system(T_amb=278.15),
    FT101_profile(table=[t,FT_101]),
    PT101_profile(table=[t,PT_101]),
    GB101(Pmaxnom=92.5e3));

  parameter Types.PerUnit cf = 0.004 "Constant Fanning friction coefficient"
  annotation (experiment(
      StopTime=7000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
  annotation (experiment(
      StopTime=7200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystemTestB;
