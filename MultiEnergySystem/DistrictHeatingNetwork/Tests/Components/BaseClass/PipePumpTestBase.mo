within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model PipePumpTestBase "Base test model for pumps' tests"
  extends Modelica.Icons.Example;
  // Nominal fluid parameters
  parameter Types.Pressure pin_start = 3e5;
  parameter Types.Pressure pout_start = 2.9e5;
  parameter Types.Temperature Tin_start = 80 + 273.15;
  parameter Types.Temperature Tout_start = 70 + 273.15;
  parameter Types.Pressure pout_start2 = 2.8e5;
  parameter Types.SpecificEnthalpy hin_start = 3e5;
  parameter Types.SpecificEnthalpy hout_start = 2.9e5;
  parameter Types.MassFlowRate m_flow_start = 16.545;
  parameter Types.Velocity u_start = 3;
  parameter Types.Density rho_start = 971.892;
  // Nominal pipe parameters
  parameter Integer n = 5 "Number of volumes";
  parameter Types.Length L = 10;
  parameter Types.Length Di = 0.085;
  parameter Types.Length H= 0.01;
  parameter Types.Length t = 2e-3;
  parameter Types.Length tIns = 60e-3;
  parameter Types.PerUnit cf = 0.004;
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump pump(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P101.a, b = Pump.P101.b, dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, etanom = Pump.P101.etanom, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, qnom_inm3h = 15.60340167, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom, use_in_omega = true) annotation (
    Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0 = Pump.P101.Tin_start, p0 = Pump.P101.pin_start) annotation (
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp omega(duration = 10, height = 0, offset = Pump.P101.omeganom, startTime = 10) annotation (
    Placement(visible = true, transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp theta(duration = 20, height = -0.5, offset = 1, startTime = 30) annotation (
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve cvalve(Kv = 33.25192916, dp_nom = 20000) annotation (
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe1(Di = Di, L = L, Tin_start = Tin_start, Tout_start = Tin_start, allowFlowReversal = system.allowFlowReversal, cf = cf, h = H, k = Pipe.S100.k, kc = 1, m_flow_start = m_flow_start, n = n, pin_start = pin_start, pout_start = pout_start, rho_nom = rho_start, t = t, tIns = tIns, u_nom = u_start) annotation (
    Placement(visible = true, transformation(origin = {36, 10}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 20, height = 5.5, offset = 0.5, startTime = 30) annotation (
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0 = Tout_start, p0 = pout_start)  annotation (
    Placement(visible = true, transformation(origin = {72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall = system.T_amb, n = n) annotation (
    Placement(visible = true, transformation(origin = {36, 26}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
equation
  connect(pump.inlet, sourceP.outlet) annotation (
    Line(points={{-48.4,0},{-70,0}},        color = {140, 56, 54}));
  connect(pump.outlet, cvalve.inlet) annotation (
    Line(points={{-19.6,0},{-19.6,6},{-20,6},{-20,10.44},{-8,10.44},{-8,10}},
                                                     color = {140, 56, 54}));
  connect(pipe1.outlet, sinkP.inlet) annotation (
    Line(points = {{50, 10}, {62, 10}}, color = {140, 56, 54}));
  connect(cvalve.outlet, pipe1.inlet) annotation (
    Line(points = {{8, 10}, {22, 10}}, color = {140, 56, 54}));
  connect(theta.y, cvalve.opening) annotation (
    Line(points={{-9,50},{0,50},{0,16.4}},      color = {0, 0, 127}));
  connect(omega.y, pump.in_omega) annotation (
    Line(points={{-49,50},{-41.2,50},{-41.2,9}},     color = {0, 0, 127}));
  connect(wall_FixedT.MultiPort, pipe1.wall) annotation (
    Line(points={{36,26},{36,15.74}},   color = {255, 238, 44}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 80, StartTime = 0, Tolerance = 1e-06, Interval = 0.16));
end PipePumpTestBase;
