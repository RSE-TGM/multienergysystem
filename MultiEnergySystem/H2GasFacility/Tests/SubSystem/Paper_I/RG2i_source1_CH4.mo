within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Paper_I;
model RG2i_source1_CH4
  "Test using a fluid with components CH4H2 (100%, 0%) and immission 1 of CH4"
  extends Rete_Gas_2i_1sources(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start = {1,0},
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    Immissione_1(X0=X_inj),
    m_flow_H2(
      height=25/3600,          duration=300,
      offset=0.001),
    m_flow_H3(height=-25/3600,  duration=300),
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))));
    //X_start = MultiEnergySystem.H2GasFacility.Data.MassMolFractionData.NG_Guzzo_Algerian.X,
    //MultiEnergySystem.H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
    //X_start= {0.9, 0.04, 0.04, 0.005, 0.005, 0.01, 0.0},

    parameter Types.MassFraction X_inj[nX] = {1,0}; //Biomethane composition
    //parameter Types.MassFraction X_inj[nX] = {0.97, 0, 0, 0, 0.03, 0, 0}; //Biomethane composition
    //parameter Types.MassFraction X_algeria[nX] = {0.87, 0.09, 0.009, 0.001, 0.02, 0.01, 0};

  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
end RG2i_source1_CH4;
