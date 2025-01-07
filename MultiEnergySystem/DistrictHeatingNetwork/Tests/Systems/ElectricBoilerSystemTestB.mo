within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model ElectricBoilerSystemTestB
  extends ElectricBoilerSystemTest(
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"));
  annotation (experiment(
      StopTime=2600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ElectricBoilerSystemTestB;
