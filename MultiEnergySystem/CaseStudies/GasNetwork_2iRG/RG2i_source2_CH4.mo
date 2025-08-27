within MultiEnergySystem.CaseStudies.GasNetwork_2iRG;
model RG2i_source2_CH4
  "Test using a fluid with components CH4H2(100%,0%) and immission 2 of CH4"
  extends CaseStudies.GasNetwork_2iRG.Rete_Gas_2i_source2(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start={1,0},
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    Immissione_2(X0={1,0}),
    m_flow_H1(
      height=25/3600,
      duration=300,
      offset=0.0001,
      startTime=3600),
    m_flow_H5(
      height=-25/3600,
      duration=300,
      startTime=18000),
    valve_controller(P_rng=(6 - 4.93)*10^5),
    valveLinearOpening(A_v=3.3274406e-05));

    parameter H2GasFacility.Types.MassFraction X_inj[nX]={1,0};
                                                    //Biomethane composition

  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(
      StopTime=28800,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_source2_CH4;
