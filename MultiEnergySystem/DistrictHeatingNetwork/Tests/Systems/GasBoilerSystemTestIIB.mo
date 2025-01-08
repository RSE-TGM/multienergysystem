within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTestIIB
  extends GasBoilerSystemTestII(
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"));


  annotation (experiment(
      StopTime=7800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystemTestIIB;
