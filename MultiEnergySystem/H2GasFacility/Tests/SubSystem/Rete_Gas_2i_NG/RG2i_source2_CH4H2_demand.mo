within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_source2_CH4H2_demand
  "Test using a fluid with components CH4H2(100%,0%) and immission 2 of H2 with Demand Profile"
  extends RG2i_source2_CH4(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_inj = {0,1},
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    valveLinearOpening(m_flow_nom=0.413, A_v=1.9*0.413/(sqrt(40.18*(60 - 4.93)*
          1e5))),
    valve_controller(P_rng=(6 - 2.5)*10^5),
    GRM_5(massflowratedemand=[0,GRM_5.m_flow0; 5*3600,GRM_5.m_flow0*2; 6*3600,
          GRM_5.m_flow0*4; 7*3600,GRM_5.m_flow0*5; 8*3600,GRM_5.m_flow0*5; 9*
          3600,GRM_5.m_flow0*4; 10*3600,GRM_5.m_flow0*5; 11*3600,GRM_5.m_flow0*
          5; 12*3600,GRM_5.m_flow0*5; 13*3600,GRM_5.m_flow0*4; 14*3600,GRM_5.m_flow0
          *3; 15*3600,GRM_5.m_flow0*4; 16*3600,GRM_5.m_flow0*4; 17*3600,GRM_5.m_flow0
          *5; 18*3600,GRM_5.m_flow0*3; 18*3600,GRM_5.m_flow0*3; 19*3600,GRM_5.m_flow0
          *2; 20*3600,GRM_5.m_flow0; 21*3600,GRM_5.m_flow0; 22*3600,GRM_5.m_flow0;
          23*3600,GRM_5.m_flow0]),
    m_flow_H1(offset=0.0001, startTime=7*3600),
    Immissione_2(use_in_X0=true),
    m_flow_H5(startTime=10*3600));
    //X_inj = {0, 0, 0, 0, 0, 0, 1},
    // X_start= {0.9, 0.04, 0.04, 0.005, 0.005, 0.01, 0.0},

    //parameter Types.MassFraction X_inj[nX] = {0, 0, 0, 0, 0, 0, 1};
    //parameter Types.MassFraction X_algeria[nX] = {0.87, 0.09, 0.009, 0.001, 0.02, 0.01, 0};
  Modelica.Blocks.Sources.RealExpression realExpression[2](y=if (time > (7*3600)
         and time < (10*3600 + 300)) then {0,1} else {1,0})
    annotation (Placement(transformation(extent={{-354,274},{-334,294}})));
equation
  connect(realExpression.y, Immissione_2.in_X0) annotation (Line(points={{-333,
          284},{-318,284},{-318,282},{-306,282},{-306,225}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end RG2i_source2_CH4H2_demand;
