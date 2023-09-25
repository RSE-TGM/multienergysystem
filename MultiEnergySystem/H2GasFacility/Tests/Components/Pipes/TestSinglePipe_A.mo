within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_A "Base test model of a single pipe (Flow1DFV) with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Types.MassFraction Xref[:] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X "Nominal mass fraction";
  parameter Types.MassFlowRate m_flow_start = Pipe.pipe1.m_flow_start "Initial mass flowrate in the sink";
  parameter Integer n = 5 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = Pipe.pipe1.pin_start "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = Pipe.pipe1.Tin_start "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter Types.MassFraction X_start[7] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;

  // Components
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV roundPipe(redeclare model Medium = Medium, Di = Pipe.pipe1.Di, L = Pipe.pipe1.L, Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start, X_start = X_start, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start, momentum = momentum,
    kappa=kappa) annotation (
    Placement(visible = true, transformation(origin = {-3.55271e-15, 2.22045e-16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = 20 + 273.15, X0 = Xref, p0 = pin_start, use_in_T0 = true, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(redeclare model Medium = Medium, G = 0, T0 = 20 + 273.15, X0 = Xref, m_flow0 = m_flow_start, p0 = 66.09e2, pin_start = 66.09e2, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 50,
    height=-m_flow_start*0.999,                                                offset = m_flow_start, startTime = 50) annotation (
    Placement(visible = true, transformation(origin = {26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in(duration = 20, height = 5, offset = 15 + 273.15, startTime = 150) annotation (
    Placement(visible = true, transformation(origin = {-86, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50,
    height=1000*0,                                                offset = pin_start, startTime = 200) annotation (
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceP.outlet, roundPipe.inlet) annotation (
    Line(points = {{-40, 0}, {-22, 0}}, color = {182, 109, 49}));
  connect(roundPipe.outlet, sink.inlet) annotation (
    Line(points = {{22, 0}, {42, 0}}, color = {182, 109, 49}));
  connect(m_flow.y, sink.in_m_flow0) annotation (
    Line(points={{37,38},{46,38},{46,5}},        color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation (
    Line(points={{-75,20},{-54,20},{-54,8.4}},      color = {0, 0, 127}));
  connect(T_in.y, sourceP.in_T0) annotation (
    Line(points={{-75,52},{-50,52},{-50,9.6}},       color = {0, 0, 127}));
  annotation (
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.0350035),
    Diagram);
end TestSinglePipe_A;
