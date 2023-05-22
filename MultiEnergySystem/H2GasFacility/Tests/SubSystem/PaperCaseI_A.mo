within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseI_A
  extends Tests.SubSystem.PaperCaseI(sourceH2_A.computeEnthalpyWithFixedPressure = false, sourceH2_A.use_in_m_flow0 = true, m_flow_H2.duration = 0, sourceH2_A.G = 0);
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation(
    Line(points = {{-104, -42}, {-90, -42}, {-90, -6}, {-30, -6}, {-30, -10}}, color = {182, 109, 49}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.5));
end PaperCaseI_A;
