within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_0412Test3 "Validation test using data from sequence 0412_Test3"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
  annotation (
    experiment(StopTime = 7200, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end S900_Seq_0412Test3;
