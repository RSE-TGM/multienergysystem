within MultiEnergySystem.CaseStudies.GasNetwork_2iRG;
model RG2i_source1_CH4
  "Test using a fluid with components CH4H2 (100%, 0%) and immission 1 of CH4"
  extends CaseStudies.GasNetwork_2iRG.Rete_Gas_2i_1sources(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start={1,0},
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    Immissione_1(X0=X_inj),
    m_flow_H2(
      height=25/3600,
      duration=300,
      offset=0.001),
    m_flow_H3(height=-25/3600, duration=300));

    parameter H2GasFacility.Types.MassFraction X_inj[nX]={1,0};
                                                    //Biomethane composition

  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
end RG2i_source1_CH4;
