within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines;
model ElectricBoilerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ElectricBoiler eBoiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3,
    Tin_start=333.15,                                                                                                                                                       etanom = 0.98, h = 1.25, m_flow_nom = 1,
    pin_start=300000,
    pout_start=290000)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-8.88178e-16, 8.88178e-16}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(
    T0=353.15,                                                                          m_flow0 = 1.2,
    p0=300000,
    pin_start=300000,                                                                                                                   use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin = {-48, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(
    T0=333.15,
    p0=310000,                                                                                          use_in_T0 = true) annotation (
    Placement(visible = true, transformation(origin = {-48, -12}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin(duration = 600, height = 0, offset = 60 + 273.15, startTime = 250) annotation (
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 100,
    height=-0.2*0,                                                   offset = 0.5, startTime = 100) annotation (
    Placement(visible = true, transformation(origin={-72,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system                                                                                      annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sinkM.inlet, eBoiler.outlet) annotation (
    Line(points={{-38,10},{-26,10},{-26,20.8},{7.8,20.8}},
                                          color = {136, 136, 136}));
  connect(sourceP.outlet, eBoiler.inlet) annotation (
    Line(points={{-38,-12},{-7.8,-12},{-7.8,20.8}},     color = {136, 136, 136}));
  connect(m_flow.y, sinkM.in_m_flow) annotation (
    Line(points={{-61,30},{-42,30},{-42,15}},        color = {0, 0, 127}));
  connect(Tin.y, sourceP.in_T0) annotation (Line(points={{-59,-30},{-44,-30},{
          -44,-20.4}}, color={0,0,127}));
  annotation (
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-6, Interval = 0.5),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
end ElectricBoilerTest;
