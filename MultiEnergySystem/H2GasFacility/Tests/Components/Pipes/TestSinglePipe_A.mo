within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;

model TestSinglePipe_A
  replaceable model Medium = H2GasFacility.Media.RealGases.NGPapay_6;
  parameter Types.MassFraction Xref[:] = {0.81878, 0.102312, 0.0250063, 0.00329607, 0.0124787, 0.0381269};
  parameter Types.MassFlowRate m_flow_ref = 0.02;
  parameter Integer n = 5;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV roundPipe(redeclare model Medium = Medium, Di = 0.02, L = 50, Tin_start = 20 + 273.15, Tout_start = 20 + 273.15, X_start = Xref, cf = 0.1, hin_start = -4.27208e6, k = 44500, kc = 1, m_flow_start = m_flow_ref, n = n, pin_start = 75e2, pout_start = 66.09e2, quasistaticEnergyBalance = true, rho_nom = 0.05521, u_nom = 17.82146) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 2.22045e-16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = 20 + 273.15, X0 = Xref, p0 = 75e2, use_in_T0 = true, use_in_p0 = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(redeclare model Medium = Medium, G = 0, T0 = 20 + 273.15, X0 = Xref, m_flow0 = m_flow_ref, p0 = 66.09e2, pin_start = 66.09e2, use_in_m_flow0 = true) annotation(
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 0, height = m_flow_ref*0.2, offset = m_flow_ref, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in(duration = 0, height = 5, offset = 15 + 273.15, startTime = 150) annotation(
    Placement(visible = true, transformation(origin = {-70, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50, height = 1000, offset = 7500, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-70, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceP.outlet, roundPipe.inlet) annotation(
    Line(points = {{-40, 0}, {-22, 0}}, color = {182, 109, 49}));
  connect(roundPipe.outlet, sink.inlet) annotation(
    Line(points = {{22, 0}, {42, 0}}, color = {182, 109, 49}));
  connect(m_flow.y, sink.in_m_flow0) annotation(
    Line(points = {{38, 38}, {46, 38}, {46, 6}}, color = {0, 0, 127}));
  connect(T_in.y, sourceP.in_T0) annotation(
    Line(points = {{-59, 52}, {-50, 52}, {-50, 10}}, color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation(
    Line(points = {{-58, 26}, {-54, 26}, {-54, 8}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.0350035));
end TestSinglePipe_A;
