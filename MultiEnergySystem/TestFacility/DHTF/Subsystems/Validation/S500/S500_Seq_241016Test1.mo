within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S500;
model S500_Seq_241016Test1
  extends TestBase(S500(EX501(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState, wall(Tstart1 = 343.15, TstartN = 336.15)), P501(b = {4.254842049585266, 4.254842049585266, -0.610148581094915})), MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241016_Test1.mat"), PelSP(offset = 29e3), Tin_start_S5 = 58 + 273.15, Tout_start_S5 = 68.89 + 273.15, Tin_start_CHP = 65.38 + 273.15, Tout_start_CHP = 72.55 + 273.15, P501_omega(table = [0, 41.4*2*3.151592654; 6e3 + 357, 41.4*2*3.151592654; 6e3 + 357, 30*2*3.151592654; 10e3, 30*2*3.151592654]), m_flow_ref_CHP(table = [0, 1.463289883587085; 1e5, 1.463289883587085]));
  annotation (
    experiment(StartTime = 6000, StopTime = 10000, __Dymola_Algorithm = "Dassl"));
end S500_Seq_241016Test1;
