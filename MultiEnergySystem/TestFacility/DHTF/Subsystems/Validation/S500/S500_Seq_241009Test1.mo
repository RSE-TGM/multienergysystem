within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S500;
model S500_Seq_241009Test1
  extends TestBase(S500(EX501(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState), P501(b = {4.254842049585266, 4.254842049585266, -0.610148581094915})), MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241009_Test1.mat"), Tin_start_S5 = 59.94 + 273.15, Tout_start_S5 = 62.03 + 273.15, Tin_start_CHP = 61.64 + 273.15, Tout_start_CHP = 63.35 + 273.15, PelSP(offset = 25e3));
  annotation (
    experiment(StartTime = 5000, StopTime = 12000, __Dymola_Algorithm = "Dassl"));
end S500_Seq_241009Test1;
