within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Seq_1701Test1
  extends RR01_Test(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"), RR01(
      Tout_cold_nom=TTo[1, 1],
      V=0.01,
      initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
      T_bandwidth=2,
      TT1(rising=20),
      TT2(rising=20),
      onOffController(bandwidth=5),
      TT(amplitude=-100e3)));
  annotation (experiment(
      StopTime=2700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RR01_Seq_1701Test1;