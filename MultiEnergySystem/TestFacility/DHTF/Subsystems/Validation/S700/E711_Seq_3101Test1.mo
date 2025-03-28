within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E711_Seq_3101Test1
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    matrixTT701 = "TT711",
    matrixTT702 = "TT712",
    matrixTT703 = "TT713",
    matrixTT704 = "TT714",
    matrixFT701 = "FT711",
    matrixFT703 = "FT713",
    matrixPT701 = "PT711",
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
    deltaThotmax = 20,
    deltaTcoldmax = 16,
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3101_Test1.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3101_Test1.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3101_Test1.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3101_Test1.mat"));
 annotation (experiment(
      StopTime=15000,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E711_Seq_3101Test1;
