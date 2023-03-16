within MultiEnergySystem.H2GasFacility.Tests.Media;

model IdealVSReal
  extends Modelica.Icons.Example;
  replaceable package MediumIdeal = H2GasFacility.Media.IdealGases.CH4 "Ideal CH4 fluid";
  replaceable model MediumReal = H2GasFacility.Media.RealGases.MixtureCH4 "Real CH4 fluid";
  parameter Types.Temperature T_min = 15 + 273.15;
  parameter Types.Temperature T_max = 30 + 273.15;
  parameter Types.Pressure p = 0.03e6;
  parameter Types.MassFraction X[realGas.nX] = realGas.X_start;
  constant Real T0(unit = "s") = 1 "Reference value for units";
  MediumIdeal.BaseProperties idealGas;
  MediumReal realGas(T_start = T_min, p_start = p);
  Types.Temperature T;
  Types.Density rho_id, rho_re;
  Types.SpecificEnergy u_id;
  Types.SpecificHeatCapacity cp_id, cp_re;
  Types.SpecificHeatCapacity cv_id, cv_re;
  Types.SpecificEnthalpy h_id, h_re;
equation
  T = T_min + (T_max - T_min) * time / T0;
  idealGas.T = T;
  idealGas.p = p;
  rho_id = idealGas.d;
  u_id = idealGas.u;
  cp_id = MediumIdeal.specificHeatCapacityCp(idealGas.state);
  cv_id = MediumIdeal.specificHeatCapacityCv(idealGas.state);
  h_id = MediumIdeal.specificEnthalpy(idealGas.state);
  
  realGas.T = T;
  realGas.p = p;
  realGas.X = X;
  
  rho_re = realGas.rho;
  cp_re = realGas.cp;
  cv_re = realGas.cv;
  h_re = realGas.h;
  
  
end IdealVSReal;
