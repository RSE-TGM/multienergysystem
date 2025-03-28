within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_0412Test2
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"), nR = 3.8, EB401_ToutSP1(table = [0, 76 + 273.15; 1e6, 76 + 273.15]), EB401_Status1(table = {537, 768, 2271, 2500}));
  annotation (
    experiment(StopTime = 9500, __Dymola_Algorithm = "Dassl"));
end S400_Seq_0412Test2;
