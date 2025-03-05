within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_2sources_NG
  "Test using a fluid with components NG6 and two immissions of biomethane (97%CH4 and 3% CO2)"
  extends Rete_Gas_2i_2sources(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    nX=7,
    X_start = X_algeria,
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    Immissione_1(X0=X_inj),
    Immissione_2(X0=X_inj));
    //X_start= {0.9, 0.04, 0.04, 0.005, 0.005, 0.01, 0.0},

    parameter Types.MassFraction X_inj[nX] = {0.97, 0, 0, 0, 0.03, 0, 0}; //Biomethane composition
    parameter Types.MassFraction X_algeria[nX] = {0.87, 0.09, 0.009, 0.001, 0.02, 0.01, 0};


  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(
      StopTime=56000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_2sources_NG;
