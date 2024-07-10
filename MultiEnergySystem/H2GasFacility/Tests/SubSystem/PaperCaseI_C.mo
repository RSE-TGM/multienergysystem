within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_C "Same as PaperCaseI with injection of pure hydrogen in node 9"
  extends Tests.SubSystem.PaperCaseI(
    useEnergyDemand = false,
    sourceH2_A(use_in_m_flow0 = true, G = 0),
    m_flow_H2(duration = 0),
    n = 3,
    quasiStatic = false,
    system(allowFlowReversal=false));
equation
  connect(sourceH2_A.outlet, pipe14.inlet) annotation (Line(
      points={{-94,-40},{-100,-40},{-100,-100},{20,-100},{20,-40},{45,-40}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0) annotation (Line(points={{-124,
          -30},{-124,-30},{-124,-26},{-110,-26},{-110,-35}},
                                                  color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    experiment(
      StopTime=600,
      Interval=0.5,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><span style=\"font-size: 12pt;\">Injection of pure Hydrogen in node 3 with a step at t=50 s. </span></p>
<p><br>Not working: the problem is structurally singular. </p>
</html>"));
end PaperCaseI_C;
