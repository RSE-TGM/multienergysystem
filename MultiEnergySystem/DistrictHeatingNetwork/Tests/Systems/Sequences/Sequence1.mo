within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence1
  extends GBEBPumpingSystem(
    m_flow_S9 = 4,
    m_flow_S1 = 2.35,
    m_flow_S4 = 1.67,
    m_flow_total = m_flow_S9,
    pin_start_rCD_cold = 2.2e5,
    FV933_state = false,
    P901omega = [0, 2*3.141592654*35;  60, 2*3.141592654*35;  60, 2*3.141592654*40; 300, 2*3.141592654*40; 320, 2*3.141592654*35; 500, 2*3.141592654*35],
    P101omega = [0, 2*3.141592654*35; 120, 2*3.141592654*35; 120, 2*3.141592654*40; 300, 2*3.141592654*40; 320, 2*3.141592654*35; 500, 2*3.141592654*35],
    P401omega = [0, 2*3.141592654*35; 180, 2*3.141592654*35; 180, 2*3.141592654*40; 300, 2*3.141592654*40; 320, 2*3.141592654*35; 500, 2*3.141592654*35],
    FCVC01theta = [0, 0; 660, 0; 660, 0.5; 720, 0.5; 720, 1; 1000, 1],
    FCVC02theta = [0, 1; 780, 1; 780, 0.5; 840, 0.5; 840, 0; 1000, 0],
    FCV901theta = [0, 1; 360, 1; 360, 0.8; 600, 0.8; 620, 1; 1000, 1],
    FCV101theta = [0, 1; 420, 1; 420, 0.8; 600, 0.8; 620, 1; 1000, 1],
    FCV401theta = [0, 1; 480, 1; 480, 0.8; 600, 0.8; 620, 1; 1000, 1],
    VE901(p0(displayUnit="Pa") = 220000),
    P101(use_in_omega=true),
    P401(use_in_omega=true),
    P901(use_in_omega=true));

equation
  connect(P101_input.y, P101.in_omega) annotation (Line(points={{-127,-170.5},{
          -127,-169.8},{-146,-169.8}}, color={0,0,127}));
  connect(P401_input.y, P401.in_omega) annotation (Line(points={{-219,-164.5},{
          -224,-164.5},{-224,-169.8},{-230,-169.8}}, color={0,0,127}));
  connect(P901_input.y, P901.in_omega) annotation (Line(points={{-651,53.5},{
          -651,54},{-664,54}}, color={0,0,127}));
  annotation (experiment(
      StopTime=1000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
  Diagram(coordinateSystem(extent = {{-800, -320}, {800, 320}})));
end Sequence1;
