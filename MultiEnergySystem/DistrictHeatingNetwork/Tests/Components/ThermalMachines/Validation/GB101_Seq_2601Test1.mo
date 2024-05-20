within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines.Validation;
model GB101_Seq_2601Test1
  extends GB101_Seq_0412Test3(
    Data = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"));
  annotation (experiment(
      StopTime=7000,
      Interval=0.5,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GB101_Seq_2601Test1;
