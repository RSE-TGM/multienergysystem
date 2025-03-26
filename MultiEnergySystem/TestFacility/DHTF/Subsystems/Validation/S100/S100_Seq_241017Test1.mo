within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model S100_Seq_241017Test1
  extends DHTF.Subsystems.Validation.S100.TestBase(
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241017_Test1.mat"),
    Pmaxnom=147.6e3*0.92,
    eta_combustion=0.86,
    tdelay=0,
    GB101_ToutSP(table=[0,70 + 273.15; 5920,70 + 273.15; 5920,80 + 273.15; 1e6,80 + 273.15]),
    realExpression(y=1e-5));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex valT1 annotation (
    Placement(transformation(extent = {{-60, -72}, {-48, -60}})));
  Modelica.Blocks.Sources.RealExpression deltaT_real(y = Tout_ref.y - TT101_profile.y) annotation (
    Placement(transformation(extent = {{-92, -66}, {-72, -46}})));
  Modelica.Blocks.Sources.RealExpression deltaT_sim(y = gasBoiler.TTout - TT101_profile.y) annotation (
    Placement(transformation(extent = {{-92, -86}, {-72, -66}})));
equation
  connect(deltaT_real.y, valT1.u_meas) annotation (
    Line(points = {{-71, -56}, {-66, -56}, {-66, -63}, {-61.2, -63}}, color = {0, 0, 127}));
  connect(deltaT_sim.y, valT1.u_sim) annotation (
    Line(points = {{-71, -76}, {-66, -76}, {-66, -69}, {-61.2, -69}}, color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 13000, __Dymola_Algorithm = "Dassl"));
end S100_Seq_241017Test1;
