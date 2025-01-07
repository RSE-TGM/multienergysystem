within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV721_Seq_3001Test2
  extends Valves.Validation.FCV721_Seq_0412Test3(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
equation

annotation (
    experiment(
      StopTime=4200,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV721_Seq_3001Test2;
