within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model ControlledHeatPumpNoDynamicsTest
  extends Modelica.Icons.Example;
  parameter SI.MassFlowRate m_flow_hot = 0.56;
  parameter SI.MassFlowRate m_flow_cold = 1;
  parameter SI.Temperature Tin_cold = 14 + 273.15;
  parameter SI.Temperature Tin_hot = 30 + 273.15;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics heatpump annotation(
    Placement(visible = true, transformation(origin = {-6, 6.43929e-15}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot(T0 = 45 + 273.15, p0 = 99999.99999999999, pin_start = 99999.99999999999, m_flow0 = m_flow_hot)  annotation(
    Placement(visible = true, transformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot(T0 = Tin_hot, p0 = 1e5, use_T = true, use_in_T = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold(T0 = Tin_cold, m_flow0 = m_flow_cold, p0(displayUnit = "Pa") = 200000, use_in_T = true)  annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkCold(T0 = 9 + 273.15, p0 = 200000, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tincold(duration = 20, height = -7, offset = 14 + 273.15, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tinhot(duration = 20, height = 5, offset = 30 + 273.15, startTime = 40) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sinkCold.inlet, heatpump.outcold) annotation(
    Line(points = {{-40, -60}, {-26, -60}, {-26, -20}}, color = {168, 168, 168}));
  connect(heatpump.outhot, sinkHot.inlet) annotation(
    Line(points = {{14, 20}, {14, 40}, {24, 40}}, color = {168, 168, 168}));
  connect(sourceHot.outlet, heatpump.inhot) annotation(
    Line(points = {{-40, 40}, {-26, 40}, {-26, 20}}, color = {168, 168, 168}));
  connect(heatpump.incold, sourceCold.outlet) annotation(
    Line(points = {{14, -20}, {14, -60}, {20, -60}}, color = {168, 168, 168}));
  connect(Tincold.y, sourceCold.in_T) annotation(
    Line(points = {{2, -90}, {30, -90}, {30, -64}}, color = {0, 0, 127}));
  connect(Tinhot.y, sourceHot.in_T) annotation(
    Line(points = {{-58, 70}, {-50, 70}, {-50, 50}}, color = {0, 0, 127}));
annotation(
    Documentation(info = "<html><head></head><body>Test model for the component:&nbsp;<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics\">ControlledHeatPumpNoDynamics</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>cold water inlet temperature</li><li>hot water inlet temperature</li></ul></div><div></div></body></html>"));
end ControlledHeatPumpNoDynamicsTest;
