within MultiEnergySystem.H2GasFacility.Tests.Media;

model Comparison2FluidVariableX
  extends Modelica.Icons.Example;
  replaceable package Medium_Modelica = MultiEnergySystem.H2GasFacility.Media.IdealGases.MethaneOxygen                         constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model";
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4H2 "Real fluid";
  
  constant Real p0(unit = "s") = 1 "Reference value for units";
  
  // Parameters
  
  parameter Types.Pressure p_min = 0.1e5 "Minimum pressure";
  parameter Types.Pressure p_max = 5e5 "Maximum pressure";
  parameter Types.MassFraction X_min[:] = {1, 0};
  parameter Types.MassFraction X_max[:] = {0, 1};
  parameter Types.Temperature T = 15 + 273.15 "Temperature";
  parameter Types.MoleFraction Y[:] = {0.8, 0.2};
  parameter Types.MolarMass M[:] = Y.*idealGas.MM;
  parameter Types.MolarMass Mt = sum(M);
  parameter Types.MassFraction X_ref[:] = M/Mt "Mass Fraction of the real gas";
  
  // Fluids
  Medium_Modelica.BaseProperties idealModelicaGas;
  Medium idealGas(T_start = T, p_start = p_min, X_start = X_min);
  
  // Variables
  Types.Pressure p;
  Types.MassFraction X[2];
  Types.Density rho_id, rho_re;
  Types.SpecificEnergy u_id, u_re;
  Types.SpecificHeatCapacity cp_id, cp_re;
  Types.SpecificHeatCapacity cv_id, cv_re;
  Types.SpecificEnthalpy h_id, h_re, dh_id/*, dh_re*/;
equation
  p = p_min + (p_max - p_min)*time/p0;
  X = X_min + (X_max - X_min)*time/p0;
  
  // ideal Modelica Gas declarion
  idealModelicaGas.T = T;
  idealModelicaGas.p = p;
  idealModelicaGas.X = X;

  // ideal Gas declaration
  idealGas.T = T;
  idealGas.p = p;
  idealGas.Xi = X[1:idealGas.nXi];

  // ideal Modelica Gas variables
  rho_id = idealModelicaGas.d;
  u_id = idealModelicaGas.u;
  cp_id = Medium_Modelica.specificHeatCapacityCp(idealModelicaGas.state);
  cv_id = Medium_Modelica.specificHeatCapacityCv(idealModelicaGas.state);
  h_id = Medium_Modelica.specificEnthalpy(idealModelicaGas.state);
  dh_id = Medium_Modelica.specificEnthalpy(Medium_Modelica.setState_pTX(p_min, T, X_min)) - Medium_Modelica.specificEnthalpy(Medium_Modelica.setState_pTX(p_max, T, X_max));
  
  // ideal Gas variables
  rho_re = idealGas.rho;
  cp_re = idealGas.cp;
  cv_re = idealGas.cv;
  h_re = idealGas.h;
  u_re = idealGas.u;
  
end Comparison2FluidVariableX;
