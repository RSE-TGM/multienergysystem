within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model PipeTestBase
  extends Modelica.Icons.Example;
  // Nominal fluid parameters
  parameter Types.Pressure pin_start = 3e5;
  parameter Types.Pressure pout_start = 2.9e5;
  parameter Types.Temperature Tin_start = 80 + 273.15;
  parameter Types.Temperature Tout_start = 78 + 273.15;
  parameter Types.SpecificEnthalpy hin_start = 3e5;
  parameter Types.SpecificEnthalpy hout_start = 2.9e5;
  parameter Types.MassFlowRate m_flow_start = 16.545;
  parameter Types.Velocity u_start = 3;
  parameter Types.Density rho_start = 971.892;
  // Nominal pipe parameters
  parameter Integer n = 2 "Number of volumes";
  parameter Types.Length L = 10;
  parameter Types.Length Di = 0.085;
  parameter Types.Length H = 0;
  parameter Types.Length t = 2e-3;
  parameter Types.Length tIns = 60e-3;
  parameter Types.PerUnit cf = 0.004;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV pipeFV(Di = Di, L = L, N = n, T_ext = system.T_amb, T_start = Tin_start, Tin_start = Tin_start, Tout_start = Tout_start, allowFlowReversal = system.allowFlowReversal, cf = cf, h = H, hin_start = hin_start, m_flow_start = m_flow_start, pin_start = pin_start, pout_start = pout_start, t = t, tIns = tIns, thermalInertia = true, u_nom = u_start) annotation (
    Placement(visible = true, transformation(origin = {-1.77636e-15, 30}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore(Di = Di, L = L, T_ext = system.T_amb, T_start = Tin_start, Tin_start = Tin_start, Tout_start = Tout_start, allowFlowReversal = system.allowFlowReversal, cf = cf, h = H, hin_start = hin_start, m_flow_start = m_flow_start, pin_start = pin_start, pout_start = pout_start, t = t, tIns = tIns, u_nom = u_start) annotation (
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Tin_start, h0 = hin_start, p0 = pin_start) annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkPressure sinkP(T0 = Tout_start, p0 = pout_start, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall = system.T_amb, n = n) annotation (
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp pout_set(duration = 10, height = pout_start*0.2, offset = pout_start, startTime = 20)  annotation (
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(sourceP.outlet, plugFlowCore.inlet) annotation (
    Line(points = {{-50, 0}, {-40, 0}, {-40, 70}, {-14, 70}}, color = {140, 56, 54}));
  connect(sourceP.outlet, pipeFV.inlet) annotation (
    Line(points = {{-50, 0}, {-40, 0}, {-40, 30}, {-14, 30}}, color = {140, 56, 54}));
  connect(plugFlowCore.outlet, sinkP.inlet) annotation (
    Line(points = {{14, 70}, {40, 70}, {40, 0}, {50, 0}}, color = {140, 56, 54}));
  connect(pipeFV.outlet, sinkP.inlet) annotation (
    Line(points = {{14, 30}, {40, 30}, {40, 0}, {50, 0}}, color = {140, 56, 54}));
  connect(pout_set.y, sinkP.in_p0) annotation (
    Line(points={{79,30},{56,30},{56,8.4}},      color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01));
end PipeTestBase;
