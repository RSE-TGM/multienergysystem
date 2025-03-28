within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E701_Seq_2601Test1
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    deltaThotmax = 17,
    deltaTcoldmax = 30,
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"));
 annotation (experiment(
      StopTime=3900,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E701_Seq_2601Test1;
