within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E701_Seq_3101Test1
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    deltaThotmax = 20,
    deltaTcoldmax = 16,
    Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Actuators.mat"));
 annotation (experiment(
      StopTime=15000,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E701_Seq_3101Test1;