within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines;
model ControlledElectricBoilerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler eBoiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = 60 + 273.15, etanom = 0.98, h = 1.25, m_flow_nom = 1, pin_start = 300000, pout_start = 289999.9999999999) annotation (
    Placement(visible = true, transformation(origin={36,-22},  extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 80 + 273.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin={22,48},     extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(
    use_in_T0=true,
    T0=333.15,
    p0=310000)                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-22,8},     extent={{-10,-10},{10,10}},      rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin(duration = 100, height = -12, offset = 65 + 273.15, startTime = 250) annotation (
    Placement(visible = true, transformation(origin={-78,22},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 100, height = 0.25, offset = 0.7, startTime = 1800) annotation (
    Placement(visible = true, transformation(origin={-2,58},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system                                                                                      annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin_up(duration = 100, height = 15, offset = 0, startTime = 500) annotation (
    Placement(visible = true, transformation(origin={-78,54},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation (
    Placement(visible = true, transformation(origin={-42,38},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ToutSP(
    duration=100,
    height=10,
    offset=80 + 273.15,
    startTime=500) annotation (Placement(visible=true, transformation(
        origin={-22,-22},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.BooleanTable EB401_Status(table={1e6}, startValue=true)
    "Input to decide whether or nor the CHP is working"
    annotation (Placement(transformation(extent={{-32,-70},{-12,-50}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{98,-38},{66,-6}})));
equation
  connect(sinkM.inlet, eBoiler.outlet) annotation (
    Line(points={{32,48},{43.8,48},{43.8,-1.2}},
                                         color = {136, 136, 136}));
  connect(sourceP.outlet, eBoiler.inlet) annotation (
    Line(points={{-12,8},{28.2,8},{28.2,-1.2}},  color = {136, 136, 136}));
  connect(m_flow.y, sinkM.in_m_flow) annotation (
    Line(points={{9,58},{28,58},{28,53}},            color = {0, 0, 127}));
  connect(Tin.y, add.u2)
    annotation (Line(points={{-67,22},{-62,22},{-62,32},{-54,32}}, color={0,0,127}));
  connect(Tin_up.y, add.u1)
    annotation (Line(points={{-67,54},{-62,54},{-62,44},{-54,44}}, color={0,0,127}));
  connect(add.y, sourceP.in_T0)
    annotation (Line(points={{-31,38},{-18,38},{-18,16.4}}, color={0,0,127}));
  connect(ToutSP.y, eBoiler.Tout_ref)
    annotation (Line(points={{-11,-22},{17.8,-22}}, color={0,0,127}));
  connect(EB401_Status.y, eBoiler.heat_on)
    annotation (Line(points={{-11,-60},{0,-60},{0,-35},{17.8,-35}},     color={255,0,255}));
  connect(sourceVoltage.outlet, eBoiler.inletPower) annotation (Line(
      points={{66,-22},{54.2,-22}},
      color={56,93,138},
      thickness=1));
  annotation (
    experiment(StartTime = 0, StopTime = 3000, Tolerance = 1e-06, Interval = 6),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
end ControlledElectricBoilerTest;
