within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model RG2i_quality_analysis "Quality index analysis"
  extends RG2i_1sources(redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    nX=7,
    X_start = H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
    constantFrictionFactor = true,
    computeInertialTerm = false,
    massFractionDynamicBalance=false,
    Immissione_1(X0=X_inj),
    valve_controller(P_rng=(5.5 - 4.93)*10^5, P_max=5.5e5),
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))),
    m_flow_H2(startTime=50),
    m_flow_H3(height=0));

    parameter Types.MassFraction X_inj[nX] = {0,0,0,0,0,0,1};

  annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
end RG2i_quality_analysis;
