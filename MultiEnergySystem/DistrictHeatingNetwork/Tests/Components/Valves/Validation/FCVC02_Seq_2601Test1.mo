within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCVC02_Seq_2601Test1
  extends FCVC02_Seq_0412Test3(
  MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"));
equation

annotation (
    experiment(
      StopTime=7000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCVC02_Seq_2601Test1;
