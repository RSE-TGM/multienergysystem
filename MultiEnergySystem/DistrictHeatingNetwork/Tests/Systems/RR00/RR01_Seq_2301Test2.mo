within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Seq_2301Test2
  extends RR01_Test(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2301_Test2.mat"),
    TTRSP_profile = [0, 25 + 273.15; 1e6, 25 + 273.15],
    RR01(V=0.001,
      T_bandwidth=5,
                  cooling_phase(start=false)),
    RR101_Status(table={1288}, startValue=false));

  annotation (experiment(
      StopTime=7000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RR01_Seq_2301Test2;
