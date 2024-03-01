within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E731_Seq_3001Test2
  extends E700Test(
    E7X1(
      gamma_nom_hot=3666.84441,
      gamma_nom_cold=9520.42245,
         coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    matrixTT701 = "TT731",
    matrixTT702 = "TT732",
    matrixTT703 = "TT733",
    matrixTT704 = "TT734",
    matrixFT701 = "FT731",
    matrixFT703 = "FT733",
    matrixPT701 = "PT731",
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
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
end E731_Seq_3001Test2;
