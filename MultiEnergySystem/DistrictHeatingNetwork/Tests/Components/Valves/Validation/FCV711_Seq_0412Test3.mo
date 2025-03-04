within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV711_Seq_0412Test3
  extends Valves.Validation.TestBase(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"),
  matrixPTi = "PT712",
  matrixPTo = "PT711",
  matrixTTi = "TT711",
  matrixtheta = "theta_FCV711",
  matrixFT = "FT711");
equation

annotation (
    experiment(
      StopTime=9000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV711_Seq_0412Test3;
