within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_source2_CH4H2
  "Test using a fluid with components CH4H2(100%,0%) and immission 2 of H2"
  extends RG2i_source2_CH4(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_inj = {0,1},
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    m_flow_H1(offset=0.0001),
    valveLinearOpening(m_flow_nom=0.413, A_v=1.9*0.413/(sqrt(40.18*(60 - 4.93)*
          1e5))),
    valve_controller(P_rng=(6 - 2.5)*10^5));
    //X_inj = {0, 0, 0, 0, 0, 0, 1},
    // X_start= {0.9, 0.04, 0.04, 0.005, 0.005, 0.01, 0.0},

    //parameter Types.MassFraction X_inj[nX] = {0, 0, 0, 0, 0, 0, 1};
    //parameter Types.MassFraction X_algeria[nX] = {0.87, 0.09, 0.009, 0.001, 0.02, 0.01, 0};
  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
end RG2i_source2_CH4H2;
