within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E701_Seq_2301Test2
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    deltaThotmax = 25,
    deltaTcoldmax = 18,
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
    Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Actuators.mat"));
  annotation (experiment(
      StopTime=7500,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E701_Seq_2301Test2;
