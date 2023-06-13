within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseI_A
  extends Tests.SubSystem.PaperCaseI(sourceH2_A.computeEnthalpyWithFixedPressure = false, sourceH2_A.use_in_m_flow0 = true, m_flow_H2.duration = 0, sourceH2_A.G = 0, opening_H2.startTime = 100);
equation
  connect(valveH2.outlet, pipe6.inlet) annotation(
    Line(points = {{-110, -100}, {-94, -100}, {-94, -6}, {-34, -6}, {-34, 0}, {-20, 0}}, color = {182, 109, 49}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.166667));
end PaperCaseI_A;
