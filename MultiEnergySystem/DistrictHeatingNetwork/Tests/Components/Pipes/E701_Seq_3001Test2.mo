within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E701_Seq_3001Test2
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    deltaThotmax = 17,
    deltaTcoldmax = 30,
    Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Actuators.mat"));
 annotation (experiment(
      StopTime=3900,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E701_Seq_3001Test2;