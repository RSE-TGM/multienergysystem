within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model S900_Seq_1701Test3 "Validation test using data from sequence 1701_Test3"
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"));
  annotation (
    experiment(StopTime = 7800, __Dymola_Algorithm = "Dassl"));
end S900_Seq_1701Test3;
