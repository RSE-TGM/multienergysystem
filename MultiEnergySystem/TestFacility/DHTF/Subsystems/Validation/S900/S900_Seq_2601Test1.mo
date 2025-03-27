within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_2601Test1 "Validation test using data from sequence 2601_Test1"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"));
  annotation (
    experiment(StopTime = 7000, __Dymola_Algorithm = "Dassl"));
end S900_Seq_2601Test1;
