within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_241031Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241031_Test1.mat"));
  annotation (
    experiment(StopTime = 8450, __Dymola_Algorithm = "Dassl"));
end S400_Seq_241031Test1;
