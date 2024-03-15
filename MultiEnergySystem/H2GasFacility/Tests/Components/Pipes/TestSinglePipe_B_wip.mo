within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_B_wip
  extends TestSinglePipe_B(redeclare MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip roundPipe(
      X_start=Xref,
      quasiStatic=true,
      constantFrictionFactor=true,
      hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle),

    sinkPressure(T0=15 + 273.15, R=0),
    sourceP(R=0));
end TestSinglePipe_B_wip;
