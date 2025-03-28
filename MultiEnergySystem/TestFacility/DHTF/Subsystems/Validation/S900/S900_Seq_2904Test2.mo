within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_2904Test2 "Validation test using data from sequence 2904_Test2"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2904_Test1.mat"));
  annotation (
    experiment(StopTime = 4140, __Dymola_Algorithm = "Dassl"));
end S900_Seq_2904Test2;
