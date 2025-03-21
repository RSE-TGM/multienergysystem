within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCVC02_Seq_3001Test2
  extends FCVC02_Seq_0412Test3(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
equation

annotation (
    experiment(
      StopTime=3900,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCVC02_Seq_3001Test2;
