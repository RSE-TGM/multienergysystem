within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model ControlledElectricBoilerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler eBoiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = 60 + 273.15, etanom = 0.98, h = 1.25, m_flow_nom = 1, pin_start = 300000, pout_start = 289999.9999999999) annotation(
    Placement(visible = true, transformation(origin = {28, 8}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 80 + 273.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = true) annotation(
    Placement(visible = true, transformation(origin = {-20, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T = 60 + 273.15, p0 = 3.1e5, use_T = true, use_in_T = true) annotation(
    Placement(visible = true, transformation(origin = {-10, -4}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin(duration = 100, height = -12, offset = 65 + 273.15, startTime = 250) annotation(
    Placement(visible = true, transformation(origin = {-62, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 100, height = 0.25, offset = 0.7, startTime = 1800) annotation(
    Placement(visible = true, transformation(origin = {-42, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin_up(duration = 100, height = 15, offset = 0, startTime = 500) annotation(
    Placement(visible = true, transformation(origin = {-62, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {-30, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sinkM.inlet, eBoiler.outlet) annotation(
    Line(points = {{-10, 18}, {12, 18}}, color = {136, 136, 136}));
  connect(sourceP.outlet, eBoiler.inlet) annotation(
    Line(points = {{0, -4}, {12, -4}, {12, -2}}, color = {136, 136, 136}));
  connect(m_flow.y, sinkM.in_m_flow) annotation(
    Line(points = {{-31, 38}, {-15, 38}, {-15, 24}}, color = {0, 0, 127}));
  connect(Tin_up.y, add.u1) annotation(
    Line(points = {{-51, 8}, {-49, 8}, {-49, -16}, {-43, -16}}, color = {0, 0, 127}));
  connect(Tin.y, add.u2) annotation(
    Line(points = {{-51, -52}, {-49, -52}, {-49, -28}, {-43, -28}}, color = {0, 0, 127}));
  connect(add.y, sourceP.in_T) annotation(
    Line(points = {{-19, -22}, {-11, -22}, {-11, -14}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 3500, Tolerance = 1e-06, Interval = 7),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
end ControlledElectricBoilerTest;
