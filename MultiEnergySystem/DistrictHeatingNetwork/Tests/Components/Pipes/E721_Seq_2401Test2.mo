within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E721_Seq_2401Test2
  extends E700Test(
    E7X1(
      gamma_nom_hot=3666.84441,
      gamma_nom_cold=9520.42245,
         coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    matrixTT701 = "TT721",
    matrixTT702 = "TT722",
    matrixTT703 = "TT723",
    matrixTT704 = "TT724",
    matrixFT701 = "FT721",
    matrixFT703 = "FT723",
    matrixPT701 = "PT721",
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
    deltaThotmax = 25,
    deltaTcoldmax = 18,
    Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test2/Temperatures.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test2/Pressures.mat"),
    Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test2/Flow.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2401_Test2/Actuators.mat"));
  annotation (experiment(
      StopTime=4500,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E721_Seq_2401Test2;
