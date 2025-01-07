within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV711_Seq_2901Test2
  extends Valves.Validation.FCV711_Seq_0412Test3(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2901_Test2.mat"));
equation

annotation (
    experiment(
      StopTime=2700,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV711_Seq_2901Test2;
