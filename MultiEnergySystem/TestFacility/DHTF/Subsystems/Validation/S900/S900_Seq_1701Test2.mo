within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_1701Test2 "Validation test using data from sequence 1701_Test2"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test2.mat"));
  annotation (
    experiment(StopTime = 5600, __Dymola_Algorithm = "Dassl"));
end S900_Seq_1701Test2;
