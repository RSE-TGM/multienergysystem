within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines;

model GasBoilerTest
  extends Modelica.Icons.Example;
  replaceable model Gas = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Gas fluid";
  replaceable model Water = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Water fluid";
  
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.GasBoiler boiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = 333.15, etanom = 0.98, h = 1.25, m_flow_nom = 1, pin_start = 300000, pout_start = 290000) annotation(
    Placement(visible = true, transformation(origin = {-8.88178e-16, 8.88178e-16}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 353.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = false) annotation(
    Placement(transformation(origin = {30, 60}, extent = {{-12, 12}, {12, -12}}, rotation = -0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = 333.15, p0 = 310000, use_in_T0 = false) annotation(
    Placement(transformation(origin = {-36, 60}, extent = {{-10, 10}, {10, -10}})));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SourceMassFlow sourceCH4(redeclare model Medium = Gas, p0 = 0.105e6, T0 = 15 + 273.15, X0 = {1, 0}, m_flow0 = 5.8) annotation(
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sourceCH4.outlet, boiler.inletfuel) annotation(
    Line(points = {{-60, 0}, {-16, 0}}, color = {182, 109, 49}));
  connect(sourceP.outlet, boiler.inlet) annotation(
    Line(points = {{-26, 60}, {-8, 60}, {-8, 20}}, color = {140, 56, 54}));
  connect(sinkM.inlet, boiler.outlet) annotation(
    Line(points = {{18, 60}, {8, 60}, {8, 20}}, color = {140, 56, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-6, Interval = 0.5),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"),
    Diagram);
end GasBoilerTest;
