within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_3001Test2 "Validation test using data from sequence 3001_Test2"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
  annotation (
    experiment(StopTime = 3900, __Dymola_Algorithm = "Dassl"));
end S900_Seq_3001Test2;
