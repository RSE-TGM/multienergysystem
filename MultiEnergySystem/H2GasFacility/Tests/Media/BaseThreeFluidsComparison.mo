within MultiEnergySystem.H2GasFacility.Tests.Media;
model BaseThreeFluidsComparison
  extends BaseTwoFluidsComparison;
  replaceable model Medium3 = H2GasFacility.Media.RealGases.NaturalGasH2PR constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Fluid reference";

  Medium3 medium3(T_start = T_ref, p_start = p_ref, X_start = X_ref);
equation

  medium3.T = T_ref;
  medium3.p = p;
  medium3.Xi = X_ref[1:medium1.nXi];

end BaseThreeFluidsComparison;
