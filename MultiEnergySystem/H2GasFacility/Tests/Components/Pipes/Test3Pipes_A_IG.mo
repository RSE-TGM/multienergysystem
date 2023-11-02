within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test3Pipes_A_IG
  extends MultiEnergySystem.H2GasFacility.Tests.Components.Pipes.Test3Pipes_A(
    redeclare model MediumPipes =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2, sourceP1(X0 = X_start),
    redeclare model MediumBoundaries =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2_ND(computeEnergyVariables = false));
equation

end Test3Pipes_A_IG;
