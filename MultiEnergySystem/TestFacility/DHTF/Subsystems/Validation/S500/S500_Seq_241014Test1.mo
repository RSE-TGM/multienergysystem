within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S500;
model S500_Seq_241014Test1
  extends TestBase(S500(EX501(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState, wall(Tstart1 = 72 + 273.15, TstartN = 66 + 273.15)), CHP(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState), P501(b = {4.254842049585266, 4.254842049585266, -0.610148581094915})), MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241014_Test1.mat"), PelSP(offset = 25e3), Tin_start_S5 = 59.26 + 273.15, Tout_start_S5 = 68.84 + 273.15, Tin_start_CHP = 65.62 + 273.15, Tout_start_CHP = 72.3 + 273.15, m_flow_ref_CHP(table = [0, 1.46; 1e6, 1.46]), m_flow_ref(table = [0, 0.9566; 4e3, 0.9566; 1e6, 0.9566]));
  annotation (
    experiment(StartTime = 4000, StopTime = 10000, __Dymola_Algorithm = "Dassl"));
end S500_Seq_241014Test1;
