within MultiEnergySystem.H2GasFacility.Tests.Media;
model SinglePTXFluidTest
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.IdealGases.NG5_H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Real fluid";
  parameter Types.Temperature T_ref = 50 + 273.15 "Reference temperature";
  parameter Types.Pressure p_ref = 5e3 "Reference pressure";
  parameter Types.MassFraction X_ref[:] = M/Mt "Mass Fraction of the real gas";
  parameter Types.MoleFraction Y[:] = {0.97, 0, 0, 0, 0.025, 0.005};
  parameter Types.MolarMass M[:] = Y.*medium.MM;
  parameter Types.MolarMass Mt = sum(M);
  Medium medium(T_start = T_ref, p_start = p_ref, X_start = X_ref);
  Types.Density rho;
  Types.SpecificEnergy u;
  Types.SpecificHeatCapacity cp;
  Types.SpecificHeatCapacity cv;
  Types.SpecificEnthalpy h;
equation
  medium.T = T_ref;
  medium.p = p_ref;
  medium.Xi = X_ref[1:medium.nXi];
  rho = medium.rho;
  cp = medium.cp;
  cv = medium.cv;
  h = medium.h;
  u = medium.u;
annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end SinglePTXFluidTest;
