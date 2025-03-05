within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model RG2i_source1_NG_H2
  "Test using a fluid with components NG6_H2 and immission 1 of H2"
  extends RG2i_source1_NG(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    X_start = MultiEnergySystem.H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
    nX=7,
    X_inj = {0, 0, 0, 0, 0, 0, 1},
    constantFrictionFactor = false,
    massFractionDynamicBalance = true,
    Immissione_1(X0=X_inj));

    //X_start = MultiEnergySystem.H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
    //X_inj = {0, 0, 0, 0, 0, 0, 1},
    //X_start = MultiEnergySystem.H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,

    //X_start = X_algeria,
    // X_start= {0.9, 0.04, 0.04, 0.005, 0.005, 0.01, 0.0},
    //parameter Types.MassFraction X_inj[nX] = {0, 0, 0, 0, 0, 0, 1};
    //parameter Types.MassFraction X_algeria[nX] = {0.87, 0.09, 0.009, 0.001, 0.02, 0.01, 0};
  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(
      StopTime=28800,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_source1_NG_H2;
