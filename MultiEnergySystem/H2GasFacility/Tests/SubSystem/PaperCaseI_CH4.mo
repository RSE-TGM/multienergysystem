within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_CH4 "Extended PaperCaseI with pure CH4 and without H2 injection across the net for S.S. validation"
  extends Tests.SubSystem.PaperCaseI(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4,
    redeclare model MediumUsers =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4,
    redeclare model Hydrogen =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4,
    nX = 1,
    constantFrictionFactor = false,
    useEnergyDemand = false,
    sourceH2_A(G=0,use_in_m_flow0 = true),
    m_flow_H2(duration = 0),
    m_flow_H2_ref = 0,
    massFractionDynamicBalance = true,
    n = 3,
    X_start = {1},
    X_start_H2 = {1},
    system(allowFlowReversal=true));
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
<p>The <span style=\"font-family: Courier New;\">PaperCaseI_CH4</span> model is an extension of the <span style=\"font-family: Courier New;\">PaperCaseI</span> model. This extended version is specifically designed to simulate a steady-state system using pure methane (<span style=\"font-family: Courier New;\">CH4</span>) .</p>
<h4>Use Case</h4>
<p>This model is useful for validating steady-state behavior in systems designed for methane-only operation. It simplifies the system configuration to exclude hydrogen while preserving the essential dynamics of the <span style=\"font-family: Courier New;\">PaperCaseI</span> setup. The parameter adjustments and redefinitions ensure compatibility and accurate representation of a methane-based system.</p>
<h4>Assumptions</h4>
<ul>
<li>The medium (<span style=\"font-family: Courier New;\">CH4</span>) is treated as an ideal gas throughout the system.</li>
<li>Hydrogen-related components are replaced with methane equivalents but retain their original roles for compatibility.</li>
<li>The steady-state validation assumes no transient effects or energy demand.</li>
</ul>
</html>"));
end PaperCaseI_CH4;
