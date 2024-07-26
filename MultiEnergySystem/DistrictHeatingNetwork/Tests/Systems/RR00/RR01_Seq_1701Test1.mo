within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Seq_1701Test1
  extends RR01_Test(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"), RR01(
      V=0.005,
      initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
      T_bandwidth=6,
      compressor1_on(start=true),
      TT1(rising=20),
      TT2(rising=20)));
  annotation (experiment(
      StopTime=2700,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RR01_Seq_1701Test1;
