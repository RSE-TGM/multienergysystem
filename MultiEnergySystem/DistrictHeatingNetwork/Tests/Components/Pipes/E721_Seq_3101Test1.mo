within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E721_Seq_3101Test1
  extends E700Test(
    matrixTT701 = "TT721",
    matrixTT702 = "TT722",
    matrixTT703 = "TT723",
    matrixTT704 = "TT724",
    matrixFT701 = "FT721",
    matrixFT703 = "FT723",
    matrixPT701 = "PT721",
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
    deltaThotmax = 20,
    deltaTcoldmax = 16,
    Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Actuators.mat"),
    E701(
      gamma_nom_hot=3666.84441,
      gamma_nom_cold=9520.42245,
         coldside(alpha=0.67402256), hotside(alpha=0.67402256)));
 annotation (experiment(
      StopTime=15000,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E721_Seq_3101Test1;
