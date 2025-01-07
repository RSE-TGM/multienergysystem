within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV701_Seq_2301Test2
  extends Valves.Validation.TestBase(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2301_Test2.mat"));
equation

annotation (
    experiment(
      StopTime=9200,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV701_Seq_2301Test2;
