within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_1004Test1 "Validation test using data from sequence 1004_Test1"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1004_Test1.mat"));
  annotation (
    experiment(StopTime = 18000, __Dymola_Algorithm = "Dassl"));
end S900_Seq_1004Test1;
