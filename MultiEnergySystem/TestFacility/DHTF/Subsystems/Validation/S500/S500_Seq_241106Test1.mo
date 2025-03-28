within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S500;
model S500_Seq_241106Test1
  extends TestBase(S500(EX501(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState, wall(Tstart1 = 344.15, TstartN = 336.15)), P501(b = {4.254842049585266, 4.254842049585266, -0.610148581094915})), MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241106_Test1.mat"), PelSP(height = 11e3, duration = 256, offset = 29e3, startTime = 13153), Tin_start_S5 = 58.24 + 273.15, Tout_start_S5 = 69.69 + 273.15, Tin_start_CHP = 65.7 + 273.15, Tout_start_CHP = 73.17 + 273.15);
  annotation (
    experiment(StartTime = 11000, StopTime = 15000, __Dymola_Algorithm = "Dassl"));
end S500_Seq_241106Test1;
