within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Paper_I;
model RG2i_source1_CH4H2
  "Test using a fluid with components CH4H2(100%,0%) and immission 1 of H2 (100%)"
  extends RG2i_source1_CH4(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_inj= {0,1},
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    Immissione_1(X0=X_inj, use_in_X0=true),
    m_flow_H2(height=25/3600, offset=0.001),
    m_flow_H3(height=-25/3600),
    valve_controller(P_rng=(6 - 2.5)*10^5));

  Modelica.Blocks.Sources.RealExpression realExpression[2](y=if (time > 3600
         and time < 18300) then {0,1} else {1,0})
    annotation (Placement(transformation(extent={{-110,-94},{-90,-74}})));
equation
  connect(realExpression.y, Immissione_1.in_X0)
    annotation (Line(points={{-89,-84},{-89,-25},{-92,-25}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
end RG2i_source1_CH4H2;
