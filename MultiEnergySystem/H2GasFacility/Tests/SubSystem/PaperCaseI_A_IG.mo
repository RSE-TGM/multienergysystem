within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_A_IG
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseI_A(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2);
equation

  annotation (experiment(
      StopTime=500,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_A_IG;
