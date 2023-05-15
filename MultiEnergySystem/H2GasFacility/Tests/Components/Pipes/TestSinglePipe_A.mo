within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;

model TestSinglePipe_A
  replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPapay;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV roundPipe(redeclare model Medium = Medium, Di = 0.02, L = 50, Tin_start = 20 + 273.15, Tout_start = 15 + 27.15, cf = 0.006, hin_start = -4.27208e6, kc = 1, m_flow_start = 0.26666, pin_start = 75e2, pout_start = 66.09e2, rho_nom = 0.747955, u_nom = 17.82146) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 2.22045e-16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = 20 + 273.15, X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0, 0, 0.544}/100, p0 = 75e2) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(redeclare model Medium = Medium, T0 = 20 + 273.15, X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0, 0, 0.544}/100, m_flow0 = 0.2666, p0 = 66.09e2, pin_start = 66.09e2) annotation(
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceP.outlet, roundPipe.inlet) annotation(
    Line(points = {{-40, 0}, {-22, 0}}, color = {182, 109, 49}));
  connect(roundPipe.outlet, sink.inlet) annotation(
    Line(points = {{22, 0}, {42, 0}}, color = {182, 109, 49}));
end TestSinglePipe_A;
