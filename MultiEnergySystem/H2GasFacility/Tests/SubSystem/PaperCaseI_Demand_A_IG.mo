within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_Demand_A_IG
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseI_Demand_A(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    redeclare model MediumUsers =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2_ND);
equation

  annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_Demand_A_IG;
