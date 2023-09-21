within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_A "Same as PaperCaseI with injection of pure hydrogen in node 3"
  extends Tests.SubSystem.PaperCaseI(useEnergyDemand = false, sourceH2_A(
      computeEnthalpyWithFixedPressure = false, use_in_m_flow0 = true, G = 0),
      m_flow_H2(duration = 0));
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation (Line(
      points={{-104,-40},{-100,-40},{-100,-40},{-94,-40},{-94,-60},{-66,-60},{-66,-16},{-46,
          -16},{-46,-6},{-30,-6},{-30,-10}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0)
    annotation (Line(points={{-159,-30},{-120,-30},{-120,-35}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.166667));
end PaperCaseI_A;
