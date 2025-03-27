within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_241106Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241106_Test1.mat"));
  annotation (
    experiment(StopTime = 16000, __Dymola_Algorithm = "Dassl"));
end S400_Seq_241106Test1;
