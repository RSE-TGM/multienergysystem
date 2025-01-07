within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines;
model ControlledChillerNoDynamicsTest
  extends Modelica.Icons.Example;
  parameter SI.MassFlowRate m_flow_hot = 0.56;
  parameter SI.MassFlowRate m_flow_cold = 1;
  parameter SI.Temperature Tin_cold = 14 + 273.15;
  parameter SI.Temperature Tin_hot = 30 + 273.15;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    chiller annotation (Placement(visible=true, transformation(
        origin={-4,20},
        extent={{-34,-34},{34,34}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold(T0 = Tin_cold, m_flow0 = m_flow_cold, p0(displayUnit = "Pa") = 200000, use_in_T = true)  annotation (
    Placement(visible = true, transformation(origin={32,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkCold(T0=282.15,
      p0=200000)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-48,-40},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tincold(duration = 20, height = -7, offset = 14 + 273.15, startTime = 10)  annotation (
    Placement(visible = true, transformation(origin={-8,-70},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System system
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.BooleanTable Chiller_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working" annotation (Placement(transformation(extent={{-66,14},{-54,26}})));
equation
  connect(sinkCold.inlet, chiller.outcold) annotation (Line(points={{-38,-40},{
          -24.4,-40},{-24.4,-0.4}}, color={168,168,168}));
  connect(chiller.incold, sourceCold.outlet) annotation (Line(points={{16.4,
          -0.4},{16.4,-40},{22,-40}}, color={168,168,168}));
  connect(Tincold.y, sourceCold.in_T) annotation (
    Line(points={{3,-70},{32,-70},{32,-45}},        color = {0, 0, 127}));
  connect(Chiller_Status.y, chiller.cold_on) annotation (Line(points={{-53.4,20},{-41.4,20}}, color={255,0,255}));
annotation (
    Documentation(info = "<html><head></head><body>Test model for the component:&nbsp;<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics\">ControlledHeatPumpNoDynamics</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>cold water inlet temperature</li><li>hot water inlet temperature</li></ul></div><div></div></body></html>"),
      experiment(
      StopTime=100,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ControlledChillerNoDynamicsTest;
