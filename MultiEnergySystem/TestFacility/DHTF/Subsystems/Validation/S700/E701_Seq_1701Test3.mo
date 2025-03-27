within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E701_Seq_1701Test3 "Test using data from file 1701_Test3"
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    rhocoldref = 998,
    rhohotref = 987,
    deltaThotmax = 33,
    deltaTcoldmax = 14.5,
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"));
  annotation (experiment(
      StopTime=7000,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E701_Seq_1701Test3;
