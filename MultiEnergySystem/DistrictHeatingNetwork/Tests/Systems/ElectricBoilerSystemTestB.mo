within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model ElectricBoilerSystemTestB
  extends ElectricBoilerSystemTest(
    Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test1\Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test1\Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test1\Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test1\Actuators.mat"),
    PL4_S401(h=0.2));
  annotation (experiment(
      StopTime=2500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ElectricBoilerSystemTestB;
