within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTestIIB
  extends GasBoilerSystemTestII(
    Temperatures = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test3/Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test3/Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test3/Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test3/Actuators.mat"));


  annotation (experiment(
      StopTime=7800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystemTestIIB;
