within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_pipes_users_CH4H2 "Test using a fluid with components CH4 (100%) and H2 (0%) and NO immissions"
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends Rete_Gas_2i_NG.Rete_Gas_2i_pipes_users(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
        nX = 2,
        X_start= {1, 0},
    constantFrictionFactor = false,
    massFractionDynamicBalance = false);
  annotation(Documentation(info="<html>
<p>The base model is extended redeclaring the medium with CH4+H2 fluid.</p>
</html>"), experiment(StopTime=1000, __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_pipes_users_CH4H2;
