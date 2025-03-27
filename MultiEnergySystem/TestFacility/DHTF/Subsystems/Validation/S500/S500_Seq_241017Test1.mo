within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S500;
model S500_Seq_241017Test1
  extends TestBase(S500(EX501(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState), P501(b = {4.254842049585266, 4.254842049585266, -0.610148581094915})), MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241017_Test1.mat"), PelSP(offset = 29e3), Tin_start_CHP = 64.46 + 273.15, Tout_start_CHP = 70.94 + 273.15);
  annotation (
    experiment(StopTime = 5000, __Dymola_Algorithm = "Dassl"));
end S500_Seq_241017Test1;
