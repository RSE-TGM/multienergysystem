within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_1704Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1704_Test1.mat"));
  annotation (
    experiment(StopTime = 3500, __Dymola_Algorithm = "Dassl"));
end S400_Seq_1704Test1;
