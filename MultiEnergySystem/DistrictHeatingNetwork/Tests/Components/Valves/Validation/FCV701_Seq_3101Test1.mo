within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV701_Seq_3101Test1
  extends Valves.Validation.TestBase(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3101_Test1.mat"));
equation

annotation (
    experiment(
      StopTime=14000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV701_Seq_3101Test1;
