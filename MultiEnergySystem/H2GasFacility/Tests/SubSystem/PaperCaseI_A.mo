within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_A "Same as PaperCaseI with injection of pure hydrogen in node 3"
  extends Tests.SubSystem.PaperCaseI(
    m_flow_H2_ref = 0.005,
    useEnergyDemand = false,
    sourceH2_A(use_in_m_flow0 = true),
    m_flow_H2(duration = 0),
    massFractionDynamicBalance = true,
    n = 3);
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation (
    Line(points={{-94,-40},{-90,-40},{-90,-60},{-55,-60},{-55,-6},{-20,-6},{-20,
          -8},{-20,-8},{-20,-10}},                                                                                          color = {182, 109, 49}, thickness = 0.5));
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0) annotation (
    Line(points={{-124,-30},{-110,-30},{-110,-35}},        color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    experiment(
      StopTime=600,
      Interval=0.166667,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">PaperCaseI_A</span> model is an extension of the <span style=\"font-family: Courier New;\">PaperCaseI</span> model, designed to simulate the injection of pure hydrogen (<span style=\"font-family: Courier New;\">H2</span>) into node 3 of the system. The system works with real and ideal medium models.</p>
<h4>Use Case</h4>
<p>This model is ideal for:</p>
<ul>
<li>Studying the effects of hydrogen injection in a subsystem modeled by <span style=\"font-family: Courier New;\">PaperCaseI</span>.</li>
<li>Analyzing transient dynamics and flow distribution in the presence of pure hydrogen.</li>
</ul>
<h4>Assumptions</h4>
<ul>
<li>Pure Hydrogen (<span style=\"font-family: Courier New;\">H2</span>) is the injected medium.</li>
<li>The system operates dynamically.</li>
</ul>
</html>"));
end PaperCaseI_A;
