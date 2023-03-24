within MultiEnergySystem.DistrictHeatingNetwork.Tests.Media;

model ModelicaVSPartialSubstance
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  replaceable package MediumIdeal = DistrictHeatingNetwork.Media.StandardWater "Modelica Water";
  replaceable model MediumReal = DistrictHeatingNetwork.Media.WaterLiquid "Simplified Water model";
  parameter Types.Temperature T_min = 10 + 273.15 "Minimum temperature of the temperature range";
  parameter Types.Temperature T_max = 90 + 273.15 "Maximum temperature of the temperature range";
  parameter Types.Pressure p = 0.1e6 "Pressure";
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
  Types.SpecificEnergy u_bias;
equation
  T = T_min + (T_max - T_min)*time/T0;
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
  realGas1.T = T_min;
  realGas1.p = p;
  realGas2.T = T_max;
  realGas2.p = p;
  rho_re = realGas.rho;
  cp_re = realGas.cp;
  cp_re_check = der(h_re)/(T_max - T_min)*T0;
  cv_re = realGas.cv;
  h_re = realGas.h;
  u_re = realGas.u;
  dh_re = realGas1.h - realGas2.h;
  u_bias = realGas.u - idealGas.u;
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ModelicaVSPartialSubstance;
