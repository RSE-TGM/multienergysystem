within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_0410Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0410_Test1.mat"));
  annotation (
    experiment(StopTime = 3500, __Dymola_Algorithm = "Dassl"));
end S400_Seq_0410Test1;
