within MultiEnergySystem.H2GasFacility.Tests.Sources;
model TestSourceSink
  replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPapay;
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source(X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0, 0, 0.544}/100, p0 = 1e5)  annotation (
    Placement(visible = true, transformation(origin = {-34, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(G = 0, T0 = 20 + 273.15, X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0, 0, 0.544}/100, m_flow0 = 0.333, pin_start = 1e5)  annotation (
    Placement(visible = true, transformation(origin = {24, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source.outlet, sink.inlet) annotation (
    Line(points = {{-24, -6}, {14, -6}}, color = {182, 109, 49}));
end TestSourceSink;
