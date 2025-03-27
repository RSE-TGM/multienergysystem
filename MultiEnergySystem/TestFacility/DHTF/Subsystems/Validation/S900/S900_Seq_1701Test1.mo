within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_1701Test1 "Validation test using data from sequence 1701_Test1"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"));
  annotation (
    experiment(StopTime = 2700, __Dymola_Algorithm = "Dassl"));
end S900_Seq_1701Test1;
