within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_Demand_A
  extends PaperCaseI_Demand(useEnergyDemand = false, sourceH2_A(G=0, computeEnthalpyWithFixedPressure=false), m_flow_H2_ref = 0.00129827,
    m_flow_H2(
      duration=0,
      offset=0,
      startTime=3*3600));
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation (Line(
      points={{-94,-40},{-86,-40},{-86,-59},{-57,-59},{-57,-6},{-20,-6},{-20,-10}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime = 86400, Interval = 44, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
  Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    Documentation(info="<html>
<p>Hydrogen injection in node 3 following the H2 production profile. </p>
<p><span style=\"font-family: Arial;\">WI results are the same ad PaperCaseI --&gt; Ok.</span></p>
</html>"));
end PaperCaseI_Demand_A;
