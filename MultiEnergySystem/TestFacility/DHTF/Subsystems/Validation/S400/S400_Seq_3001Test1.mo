within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_3001Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/240130_Test1.mat"));
  annotation (
    experiment(StopTime = 1500, __Dymola_Algorithm = "Dassl"));
end S400_Seq_3001Test1;
