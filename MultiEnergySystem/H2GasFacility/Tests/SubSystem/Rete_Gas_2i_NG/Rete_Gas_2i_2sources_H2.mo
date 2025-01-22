within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model Rete_Gas_2i_2sources_H2
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends Rete_Gas_2i_2sources(redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
        nX = 2,
        X_start = X_start_2,
        constantFrictionFactor = false,
        quasiStatic = true,
        raccordo2(m_flow_start=0.098),
    m_flow_H1(offset=0),
    m_flow_H2(offset=0));
  parameter Types.MassFraction X_start_2[2] = {1,0};
  annotation (Documentation(info="<html>
<p>The 2 injection sources model is extended redeclaring the medium with CH4+H2 fluid. </p>
</html>"), experiment(
      StopTime=56000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_2sources_H2;
