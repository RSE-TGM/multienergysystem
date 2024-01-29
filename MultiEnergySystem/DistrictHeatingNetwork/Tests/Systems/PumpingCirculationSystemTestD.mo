within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model PumpingCirculationSystemTestD
  extends PumpingCirculationSystemTest(
    Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\2601_Test1\Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\2601_Test1\Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\2601_Test1\Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\2601_Test1\Actuators.mat"),
    P901_omega(table=[t,omegaP901]),
    Kv = 20);
  annotation (experiment(
      StopTime=12000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PumpingCirculationSystemTestD;
