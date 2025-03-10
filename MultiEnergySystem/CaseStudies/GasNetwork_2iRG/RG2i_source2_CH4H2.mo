within MultiEnergySystem.CaseStudies.GasNetwork_2iRG;
model RG2i_source2_CH4H2
  "Test using a fluid with components CH4H2(100%,0%) and immission 2 of H2"
  extends CaseStudies.GasNetwork_2iRG.RG2i_source2_CH4(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_inj={0,1},
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    m_flow_H1(offset=0.0001),
    valve_controller(P_rng=(6 - 2.5)*10^5));

  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
end RG2i_source2_CH4H2;
