within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E731_Seq_2401Test2
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
    deltaThotmax = 25,
    deltaTcoldmax = 18,
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2401_Test2.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2401_Test2.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2401_Test2.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2401_Test2.mat"));
  annotation (experiment(
      StopTime=4500,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E731_Seq_2401Test2;
