within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E721_Seq_3001Test2
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
    deltaThotmax = 17,
    deltaTcoldmax = 30,
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
 annotation (experiment(
      StopTime=3900,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E721_Seq_3001Test2;
