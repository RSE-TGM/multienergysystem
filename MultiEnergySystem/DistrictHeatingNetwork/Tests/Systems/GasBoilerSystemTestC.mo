within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTestC
  extends GasBoilerSystemTest(
    Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"),
    FT_101 = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1],dim[2])*985/3600,
    q_101 = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1],dim[2]),
    PT_101 = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT101,dim[1],dim[2])*1e5,
    PT_102 = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT102,dim[1],dim[2])*1e5,
    system(T_amb=278.15),
    FT101_profile(table=[t,FT_101]),
    PT101_profile(table=[t,PT_101]),
    GB101(h=1.2*0.93, Pmaxnom=118e3));

  parameter Types.PerUnit cf = 0.004 "Constant Fanning friction coefficient"
  annotation (experiment(
      StopTime=7000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
  annotation (experiment(
      StopTime=7800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystemTestC;
