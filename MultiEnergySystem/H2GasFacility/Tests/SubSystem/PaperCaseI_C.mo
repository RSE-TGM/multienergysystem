within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_C "Same as PaperCaseI with injection of pure hydrogen in node 9"
  extends Tests.SubSystem.PaperCaseI(sourceH2_A(
    computeEnthalpyWithFixedPressure = false, use_in_m_flow0 = true, G = 0),
    m_flow_H2(duration = 0), n = 9);
equation
  connect(sourceH2_A.outlet, pipe17.inlet) annotation (
    Line(points = {{-104, -42}, {-94, -42}, {-94, -96}, {12, -96}, {12, 0}, {40, 0}}, color = {182, 109, 49},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.5));
end PaperCaseI_C;
