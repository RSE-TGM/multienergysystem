within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;

model TestSinglePipe_A "Base test model of a single pipe (Flow1DFV) with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4H2 "Medium";
  parameter Types.MassFraction Xref[:] = {0.85, 0.15} "Nominal mass fraction";
  parameter Types.MassFlowRate m_flow_start = 0.2666 "Initial mass flowrate in the sink";
  parameter Integer n = 15 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = 7500 "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = 20 + 273.15 "Initial temperature at the inlet";
  
  // Components
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV roundPipe(Di = 0.16, L = 50, redeclare model Medium = Medium, Tin_start = Tin_start, Tout_start = 20 + 273.15, X_start = Xref, cf = 0.1, hin_start = -4.27208e6, k = 0.0013676, kc = 1, m_flow_start = m_flow_start, n = n, pin_start = pin_start, pout_start = 66.09e2, rho_nom = 0.05521) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 2.22045e-16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = 20 + 273.15, X0 = Xref, p0 = 75e2, use_in_T0 = true, use_in_p0 = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(redeclare model Medium = Medium, G = 0, T0 = 20 + 273.15, X0 = Xref, m_flow0 = m_flow_start, p0 = 66.09e2, pin_start = 66.09e2, use_in_m_flow0 = true) annotation(
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 50, height = m_flow_start*0.2, offset = m_flow_start, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in(duration = 20, height = 5, offset = 15 + 273.15, startTime = 150) annotation(
    Placement(visible = true, transformation(origin = {-86, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50, height = 1000, offset = pin_start, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceP.outlet, roundPipe.inlet) annotation(
    Line(points = {{-40, 0}, {-22, 0}}, color = {182, 109, 49}));
  connect(roundPipe.outlet, sink.inlet) annotation(
    Line(points = {{22, 0}, {42, 0}}, color = {182, 109, 49}));
  connect(m_flow.y, sink.in_m_flow0) annotation(
    Line(points = {{38, 38}, {46, 38}, {46, 6}}, color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation(
    Line(points = {{-74, 20}, {-54, 20}, {-54, 8}}, color = {0, 0, 127}));
  connect(T_in.y, sourceP.in_T0) annotation(
    Line(points = {{-74, 52}, {-50, 52}, {-50, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.0350035),
    Diagram);
end TestSinglePipe_A;
