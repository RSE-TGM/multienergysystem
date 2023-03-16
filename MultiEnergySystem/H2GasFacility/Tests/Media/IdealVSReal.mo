within MultiEnergySystem.H2GasFacility.Tests.Media;

model IdealVSReal
  extends Modelica.Icons.Example;
  replaceable package MediumIdeal = H2GasFacility.Media.IdealGases.CH4 "Ideal CH4 fluid";
  replaceable model MediumReal = H2GasFacility.Media.RealGases.CH4 "Real CH4 fluid";
  parameter Types.Temperature T_min = -20 + 273.15 "Minimum temperature of the temperature range";
  parameter Types.Temperature T_max = 80 + 273.15 "Maximum temperature of the temperature range";
  parameter Types.Pressure p = 0.03e6 "Pressure";
  parameter Types.MassFraction X[realGas.nX] = realGas.X_start "Mass Fraction of the real gas";
  constant Real T0(unit = "s") = 1 "Reference value for units";
  MediumIdeal.BaseProperties idealGas;
  MediumReal realGas(T_start = T_min, p_start = p);
  MediumReal realGas1(T_start = T_min, p_start = p);
  MediumReal realGas2(T_start = T_min, p_start = p);
  Types.Temperature T;
  Types.Density rho_id, rho_re;
  Types.SpecificEnergy u_id, u_re;
  Types.SpecificHeatCapacity cp_id, cp_re, cp_re_check;
  Types.SpecificHeatCapacity cv_id, cv_re;
  Types.SpecificEnthalpy h_id, h_re, dh_id, dh_re;
equation
  T = T_min + (T_max - T_min) * time / T0;
  
  idealGas.T = T;
  idealGas.p = p;
  rho_id = idealGas.d;
  u_id = idealGas.u;
  cp_id = MediumIdeal.specificHeatCapacityCp(idealGas.state);
  cv_id = MediumIdeal.specificHeatCapacityCv(idealGas.state);
  h_id = MediumIdeal.specificEnthalpy(idealGas.state);
  dh_id = MediumIdeal.specificEnthalpy(MediumIdeal.setState_pTX(p, T_min)) - MediumIdeal.specificEnthalpy(MediumIdeal.setState_pTX(p, T_max));
  
  realGas.T = T;
  realGas.p = p;
  realGas.X = X;
  realGas1.T = T_min;
  realGas1.p = p;
  realGas1.X = X;
  realGas2.T = T_max;
  realGas2.p = p;
  realGas2.X = X;
  rho_re = realGas.rho;
  cp_re = realGas.cp;
  cp_re_check = der(h_re) / (T_max - T_min) * T0;
  cv_re = realGas.cv;
  h_re = realGas.h;
  u_re = realGas.u;
  dh_re = realGas1.h - realGas2.h;
  
end IdealVSReal;
