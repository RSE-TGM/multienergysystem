within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_2sources_NG_H2
  "Test using a fluid with components NG4_H2 and two immissions of H2"
  extends Rete_Gas_2i_2sources(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    nX=7,
    X_start = X_algeria,
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    Immissione_1(X0=X_inj),
    Immissione_2(X0=X_inj),
    m_flow_H1(height=0.01, duration=180),
    m_flow_H5(height=-0.01, duration=180),
    m_flow_H3(height=-0.01, duration=180),
    m_flow_H2(height=0.01, duration=180));
    // X_start= {0.9, 0.04, 0.04, 0.005, 0.005, 0.01, 0.0},

    parameter Types.MassFraction X_inj[nX] = {0, 0, 0, 0, 0, 0, 1};
    parameter Types.MassFraction X_algeria[nX] = {0.87, 0.09, 0.009, 0.001, 0.02, 0.01, 0};
  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(StopTime=56000, __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_2sources_NG_H2;
