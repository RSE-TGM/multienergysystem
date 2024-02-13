within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E700Test_C "Same as E700Test but replacing the fluid to WaterLiquidIdeal"
  extends E700Test(redeclare model Medium =
      DistrictHeatingNetwork.Media.WaterLiquidIdeal);
  annotation (experiment(
      StopTime=8000,
      Interval=2,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E700Test_C;
