within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model ElectricBoilerTestII
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ElectricBoiler eBoiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3,Tin_start = 60 + 273.15, etanom = 0.98, h = 1.25, m_flow_nom = 1, pin_start = 300000, pout_start = 289999.9999999999)  annotation(
    Placement(visible = true, transformation(origin = {-8.88178e-16, 8.88178e-16}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 80 + 273.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = true)  annotation(
    Placement(visible = true, transformation(origin = {-48, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T = 60 + 273.15, p0 = 3.1e5, use_T = true, use_in_T = true)  annotation(
    Placement(visible = true, transformation(origin = {-48, -12}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin(duration = 600, height =  0, offset = 60 + 273.15, startTime = 250) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 100, height = -0.2, offset = 0.5, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sinkM.inlet, eBoiler.outlet) annotation(
    Line(points = {{-38, 10}, {-16, 10}}, color = {136, 136, 136}));
  connect(sourceP.outlet, eBoiler.inlet) annotation(
    Line(points = {{-38, -12}, {-16, -12}, {-16, -10}}, color = {136, 136, 136}));
  connect(m_flow.y, sinkM.in_m_flow) annotation(
    Line(points = {{-58, 30}, {-42, 30}, {-42, 16}}, color = {0, 0, 127}));
  connect(Tin.y, sourceP.in_T) annotation(
    Line(points = {{-58, -30}, {-48, -30}, {-48, -22}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-6, Interval = 0.5),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
end ElectricBoilerTestII;
