within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_EnergyDemand_A
  extends PaperCaseI_EnergyDemand(sourceH2_A(G=0, computeEnthalpyWithFixedPressure=false), m_flow_H2_ref = 0.00129827,
    m_flow_H2(
      duration=0,
      offset=0,
      startTime=3*3600));
equation
  connect(sourceH2_A.outlet, pipe7.inlet) annotation (Line(
      points={{-104,-40},{-100,-40},{-100,-40},{-94,-40},{-94,-60},{-66,-60},{
          -66,-6},{-30,-6},{-30,-10}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_EnergyDemand_A;
