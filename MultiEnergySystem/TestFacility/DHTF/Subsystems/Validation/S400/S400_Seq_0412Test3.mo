within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_0412Test3
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
  annotation (
    experiment(StopTime = 9000, __Dymola_Algorithm = "Dassl"));
end S400_Seq_0412Test3;
