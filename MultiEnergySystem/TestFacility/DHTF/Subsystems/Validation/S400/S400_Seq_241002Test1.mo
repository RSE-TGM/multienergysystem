within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_241002Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241002_Test1.mat"), EB401_Status1(table = {1350}, startValue = false));
  annotation (
    experiment(StopTime = 12600, __Dymola_Algorithm = "Dassl"));
end S400_Seq_241002Test1;
