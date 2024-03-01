within MultiEnergySystem.H2GasFacility.Tests.Media;
model BaseTwoFluidsComparison
  extends Modelica.Icons.Example;
  replaceable model Medium1 = H2GasFacility.Media.IdealGases.NG6_H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Fluid reference";
  replaceable model Medium2 = H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Fluid compared";

  constant Real p0(unit = "s") = 1 "Reference value for units";

  parameter Types.Temperature T_ref = 15 + 273.15 "Reference temperature";
  parameter Types.Pressure p_ref = p_min "Reference pressure";
  parameter Types.MassFraction X_ref[:] = M/Mt "Mass Fraction of the real gas";
  parameter Types.MoleFraction Y[:] = H2GasFacility.Data.MassMolFractionData.NG_Guzzo_Russian.Y;
  parameter Types.MolarMass M[:] = Y.*medium1.MM;
  parameter Types.MolarMass Mt = sum(M);
  parameter Types.Pressure p_min = 0.05e6 "Reference pressure";
  parameter Types.Pressure p_max = 1.2e6 "Reference pressure";

  Types.PerUnit rho_err "density error in %";
  Types.PerUnit Z_err "specific enthalpy error in %";
  Types.Pressure p "pressure";

  Medium1 medium1(T_start = T_ref, p_start = p_ref, X_start = X_ref);
  Medium2 medium2(T_start = T_ref, p_start = p_ref, X_start = X_ref);
equation
  p = p_min + (p_max - p_min)*time/p0;

  medium1.T = T_ref;
  medium1.p = p;
  medium1.Xi = X_ref[1:medium1.nXi];

  medium2.T = T_ref;
  medium2.p = p;
  medium2.Xi = X_ref[1:medium2.nXi];

  rho_err = abs(medium1.rho - medium2.rho)*100/medium1.rho;
  Z_err = abs(medium1.Z - medium2.Z)*100/medium1.Z;


end BaseTwoFluidsComparison;
