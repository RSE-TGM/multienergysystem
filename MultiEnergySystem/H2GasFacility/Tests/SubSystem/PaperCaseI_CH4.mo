within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_CH4 "Same as PaperCaseI with pure CH4 and without H2 injection across the net for S.S. validation"
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
    quasiStatic = false,
    n = 3,
    X_start = {1},
    X_start_H2 = {1},
    system(allowFlowReversal=true));
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation (
    Line(points={{-94,-40},{-90,-40},{-90,-60},{-55,-60},{-55,-6},{-20,-6},{-20,
          -8},{-20,-8},{-20,-10}},                                                                                          color = {182, 109, 49}, thickness = 0.5));
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0) annotation (
    Line(points = {{-149, -30}, {-110, -30}, {-110, -35}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    experiment(
      StopTime=600,
      Interval=0.166667,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_CH4;
