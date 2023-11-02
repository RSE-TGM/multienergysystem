within MultiEnergySystem.H2GasFacility.Tests.Sources;
model TestSinkSource
  replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPapay;
  parameter Integer nX = 9;
  parameter Types.MassFraction X_ref[nX] = {97.201, 1.862, 0.393, 0, 0, 0, 0, 0, 0.544}/100;
  parameter Types.Pressure p_ref = 1e5;
  parameter Types.Temperature T_ref = 15 + 273.15;
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source(X0 = X_ref, p0 = p_ref)  annotation (
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sink(G = 0, T0 = T_ref, X0 = X_ref, m_flow0 = 0.333, pin_start = p_ref)  annotation (
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourcemflow(T0 = T_ref, X0 = X_ref, m_flow0 = 0.333, p0 = p_ref)  annotation (
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkP(T0 = T_ref,X0 = X_ref, computeTransport = false, p0 = p_ref)  annotation (
    Placement(visible = true, transformation(origin = {30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source.outlet, sink.inlet) annotation (
    Line(points = {{-20, 40}, {20, 40}}, color = {182, 109, 49}));
  connect(sourcemflow.outlet, sinkP.inlet) annotation (
    Line(points = {{-20, -40}, {20, -40}}, color = {182, 109, 49}));
end TestSinkSource;
