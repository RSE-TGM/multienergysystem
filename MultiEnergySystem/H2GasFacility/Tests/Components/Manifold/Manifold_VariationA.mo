within MultiEnergySystem.H2GasFacility.Tests.Components.Manifold;

model Manifold_VariationA
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Manifold.TestManifold(source2.use_in_m_flow0 = true, source1.use_in_m_flow0 = true, manifold.V = 1);
  Modelica.Blocks.Sources.Ramp m_flow_1(duration = 0, height = 0.01, offset = 0.05, startTime = 50)  annotation(
    Placement(visible = true, transformation(origin = {-42, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_2(duration = 0, height = 0.03, offset = 0.02, startTime = 100)  annotation(
    Placement(visible = true, transformation(origin = {52, 66}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(m_flow_1.y, source2.in_m_flow0) annotation(
    Line(points = {{-30, 66}, {-16, 66}}, color = {0, 0, 127}));
  connect(m_flow_2.y, source1.in_m_flow0) annotation(
    Line(points = {{42, 66}, {18, 66}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.01));
end Manifold_VariationA;
