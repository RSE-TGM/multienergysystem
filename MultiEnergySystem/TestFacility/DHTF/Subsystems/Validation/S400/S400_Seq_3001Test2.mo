within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_3001Test2
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
  annotation (
    experiment(StopTime = 4000, __Dymola_Algorithm = "Dassl"));
end S400_Seq_3001Test2;
