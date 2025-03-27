within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_3001Test1 "Validation test using data from sequence 3001_Test1"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test1.mat"));
  annotation (
    experiment(StopTime = 1500, __Dymola_Algorithm = "Dassl"));
end S900_Seq_3001Test1;
