within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_3sources_H2
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends Rete_Gas_2i_3sources(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start=X_start_2,
    constantFrictionFactor=false,
    massFractionDynamicBalance = false,
    raccordo2(m_flow_start=0.098));
  parameter Types.MassFraction X_start_2[2] = {0.995, 0.005};
  annotation (Documentation(info="<html>
<p>The 3 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(
      StopTime=86400,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_3sources_H2;
