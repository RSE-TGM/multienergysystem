within MultiEnergySystem.H2GasFacility.Tests.Media;

model SinglePTXFluidTest
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPR "Real fluid";
  parameter Types.Temperature T_ref = 50 + 273.15 "Reference temperature";
  parameter Types.Pressure p_ref = 5e3 "Reference pressure";
  parameter Types.MassFraction X_ref[:] = M/Mt "Mass Fraction of the real gas";
  parameter Types.MoleFraction Y[:] = {0.97201, 0.01862, 0.00393, 0.00000,0.00000,0.00000,0.00000, 0.00000, 0.00544};
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
end SinglePTXFluidTest;
