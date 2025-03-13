within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_A_IG
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.PaperCaseI_A(
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
    redeclare model MediumUsers =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2_ND);
equation

  annotation (experiment(
      StopTime=500,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>Step of hydrogen at node 3.</p>
</html>"));
end PaperCaseI_A_IG;
