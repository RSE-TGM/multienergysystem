within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseI_B
  extends Tests.SubSystem.PaperCaseI(sourceH2_A.computeEnthalpyWithFixedPressure = false, sourceH2_A.use_in_m_flow0 = true, m_flow_H2.duration = 0, sourceH2_A.G = 0);
equation
  connect(sourceH2_A.outlet, pipe17.inlet) annotation(
    Line(points = {{-104, -42}, {-94, -42}, {-94, -96}, {12, -96}, {12, 0}, {40, 0}}, color = {182, 109, 49}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.5));
end PaperCaseI_B;
