within MultiEnergySystem.H2GasFacility.Tests.Media;

model Comparison2FluidPTXTest
  extends Modelica.Icons.Example;
  replaceable package Medium_Modelica = MultiEnergySystem.H2GasFacility.Media.IdealGases.MethaneOxygen                         constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model";
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4H2 "Real fluid";
  
  constant Real T0(unit = "s") = 1 "Reference value for units";
  
  // Parameters
  
  parameter Types.Temperature T_min = 0 + 273.15 "Minimum temperature of the temperature range";
  parameter Types.Temperature T_max = 40 + 273.15 "Maximum temperature of the temperature range";
  parameter Types.Pressure p = 0.01e6 "Pressure";
  parameter Types.MoleFraction Y[:] = {0.8, 0.2};
  parameter Types.MolarMass M[:] = Y.*idealGas.MM;
  parameter Types.MolarMass Mt = sum(M);
  parameter Types.MassFraction X_ref[:] = M/Mt "Mass Fraction of the real gas";
  
  // Fluids
  Medium_Modelica.BaseProperties idealModelicaGas;
  Medium idealGas(T_start = T_min, p_start = p, X_start = X_ref);
  
  // Variables
  Types.Temperature T;
  Types.Density rho_id, rho_re;
  Types.SpecificEnergy u_id, u_re;
  Types.SpecificHeatCapacity cp_id, cp_re, cp_re_check;
  Types.SpecificHeatCapacity cv_id, cv_re;
  Types.SpecificEnthalpy h_id, h_re, dh_id/*, dh_re*/;
equation
  T = T_min + (T_max - T_min)*time/T0;
  
  // ideal Modelica Gas declarion
  idealModelicaGas.T = T;
  idealModelicaGas.p = p;
  idealModelicaGas.X = X_ref;

  // ideal Gas declaration
  idealGas.T = T;
  idealGas.p = p;
  idealGas.Xi = X_ref[1:idealGas.nXi];

  // ideal Modelica Gas variables
  rho_id = idealModelicaGas.d;
  u_id = idealModelicaGas.u;
  cp_id = Medium_Modelica.specificHeatCapacityCp(idealModelicaGas.state);
  cv_id = Medium_Modelica.specificHeatCapacityCv(idealModelicaGas.state);
  h_id = Medium_Modelica.specificEnthalpy(idealModelicaGas.state);
  dh_id = Medium_Modelica.specificEnthalpy(Medium_Modelica.setState_pTX(p, T_min, X_ref)) - Medium_Modelica.specificEnthalpy(Medium_Modelica.setState_pTX(p, T_max, X_ref));
  
  // ideal Gas variables
  rho_re = idealGas.rho;
  cp_re = idealGas.cp;
  cp_re_check = der(h_re)/(T_max - T_min)*T0;
  cv_re = idealGas.cv;
  h_re = idealGas.h;
  u_re = idealGas.u;
  
end Comparison2FluidPTXTest;
