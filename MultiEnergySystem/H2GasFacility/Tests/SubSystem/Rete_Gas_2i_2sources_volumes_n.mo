within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_2sources_volumes_n
  extends Rete_Gas_2i_2sources_ok(
    sds7(n=nV),
    s1(n=nV),
    sds8(n=nV),
    sds6(n=nV),
    sds3(n=nV),
    sds12(n=nV),
    sds15(n=nV),
    s2(n=33),
    s4(n=nV),
    s11(n=nV),
    s14(n=nV),
    s16(n=nV),
    s18(n=nV),
    s31(n=nV),
    s36_Stadio(n=nV),
    s19(n=nV));
  parameter Integer nV = 5;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=20000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_2sources_volumes_n;
