within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_Demand_B
  extends PaperCaseI_Demand(sourceH2_A(G=0, computeEnthalpyWithFixedPressure=false), m_flow_H2_ref = 0.00129827,
    m_flow_H2(
      duration=0,
      offset=0,
      startTime=3*3600));
equation
  connect(sourceH2_A.outlet, pipe17.inlet) annotation (Line(
      points={{-104,-42},{-100,-42},{-100,-102},{6,-102},{6,0},{40,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_Demand_B;
