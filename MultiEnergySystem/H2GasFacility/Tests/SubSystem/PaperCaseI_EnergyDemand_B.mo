within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_EnergyDemand_B
  extends PaperCaseI_EnergyDemand(sourceH2_A(G=0, computeEnthalpyWithFixedPressure=false), m_flow_H2_ref = 0.00129827,
    m_flow_H2(
      duration=0,
      offset=0,
      startTime=3*3600));
equation
  connect(sourceH2_A.outlet, pipe9.inlet) annotation (Line(
      points={{-104,-42},{-102,-42},{-102,-106},{-88,-106},{-88,-98},{10,-98},{10,0},{20,
          0},{20,10}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_EnergyDemand_B;
