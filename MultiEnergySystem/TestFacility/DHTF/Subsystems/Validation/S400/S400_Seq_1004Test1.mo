within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_1004Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1004_Test1.mat"));
  annotation (
    experiment(StopTime = 18400, __Dymola_Algorithm = "Dassl"));
end S400_Seq_1004Test1;
