within MultiEnergySystem.DistrictHeatingNetwork.Tests.Media;
model ModelicaVSPartialSubstance
  extends Modelica.Icons.Example;
  replaceable package MediumIdeal =
      DistrictHeatingNetwork.Media.StandardWater "Modelica Water";
  replaceable model MediumReal = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity "Simplified Water model";
  parameter Types.Temperature T_min = 10 + 273.15 "Minimum temperature of the temperature range";
  parameter Types.Temperature T_max = 80 + 273.15 "Maximum temperature of the temperature range";
  parameter Types.Pressure p = 0.5e6 "Pressure";
  constant Real T0(unit = "s") = 1 "Reference value for units";
  MediumIdeal.BaseProperties idealWater;
  MediumReal realWater(T_start = T_min, p_start = p);
  MediumReal realWater1(T_start = T_min, p_start = p);
  MediumReal realWater2(T_start = T_min, p_start = p);
  Types.Temperature T;
  Types.Density rho_id, rho_re;
  Types.SpecificEnergy u_id, u_re;
  Types.SpecificHeatCapacity cp_id, cp_re, cp_re_check;
  Types.SpecificHeatCapacity cv_id, cv_re;
  Types.SpecificEnthalpy h_id, h_re, dh_id, dh_re;
  Types.SpecificEnergy u_bias;
equation
  T = T_min + (T_max - T_min)*time/T0;
  idealWater.T = T;
  idealWater.p = p;
  rho_id = idealWater.d;
  u_id = idealWater.u;
  cp_id = MediumIdeal.specificHeatCapacityCp(idealWater.state);
  cv_id = MediumIdeal.specificHeatCapacityCv(idealWater.state);
  h_id = MediumIdeal.specificEnthalpy(idealWater.state);
  dh_id = MediumIdeal.specificEnthalpy(MediumIdeal.setState_pTX(p, T_min)) - MediumIdeal.specificEnthalpy(MediumIdeal.setState_pTX(p, T_max));
  realWater.T = T;
  realWater.p = p;
  realWater1.T = T_min;
  realWater1.p = p;
  realWater2.T = T_max;
  realWater2.p = p;
  rho_re = realWater.rho;
  cp_re = realWater.cp;
  cp_re_check = der(h_re)/(T_max - T_min)*T0;
  cv_re = realWater.cv;
  h_re = realWater.h;
  u_re = realWater.u;
  dh_re = realWater1.h - realWater2.h;
  u_bias = realWater.u - idealWater.u;
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ModelicaVSPartialSubstance;
