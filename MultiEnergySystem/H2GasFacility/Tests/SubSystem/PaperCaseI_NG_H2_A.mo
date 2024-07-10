within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_NG_H2_A
  "Same as PaperCaseI with pure CH4 and without H2 injection across the net for S.S. validation"
  extends Tests.SubSystem.PaperCaseI(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    redeclare model MediumUsers =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    redeclare model Hydrogen =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    nX = 7,
    useEnergyDemand = false,
    constantFrictionFactor = false,
    sourceH2_A(
      G=0,         use_in_m_flow0 = true),
    m_flow_H2(duration = 0),
    m_flow_H2_ref = 0.01,
    quasiStatic = false,
    n = 3,
    X_start = {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0},
    X_start_H2 = {0.0, 0.00, 0.00, 0.000, 0.00, 0.000, 1},
    system(allowFlowReversal=true));
    //constantFrictionFactor = true,
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation (
    Line(points={{-94,-40},{-90,-40},{-90,-60},{-55,-60},{-55,-6},{-20,-6},{-20,
          -8},{-20,-8},{-20,-10}},                                                                                          color = {182, 109, 49}, thickness = 0.5));
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0) annotation (
    Line(points={{-124,-30},{-110,-30},{-110,-35}},        color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    experiment(
      StopTime=4000,
      Interval=0.166667,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><span style=\"font-family: Arial;\">Dynamic analysis of injection of pure hydrogen in node 3.</span></p>
<p>Not working: simulation failed.</p>
</html>"));
end PaperCaseI_NG_H2_A;
