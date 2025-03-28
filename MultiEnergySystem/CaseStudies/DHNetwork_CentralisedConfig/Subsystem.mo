within MultiEnergySystem.CaseStudies.DHNetwork_CentralisedConfig;
model Subsystem "Validation test for S900 system"
  extends TestFacility.DHTF.Subsystems.Validation.S900.TestBase(MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
  annotation (
    experiment(StopTime = 7200, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end Subsystem;
