within MultiEnergySystem.DistrictHeatingNetwork.Tests.Media;

model IdealCH4H2mixtureTest
  replaceable package Medium = DistrictHeatingNetwork.Media.IdealGases.MethaneOxygen "Ideal Gas mixture model";
  parameter SI.Temperature T_min = 800;
  parameter SI.Temperature T_max = 1500;
  parameter SI.Pressure p = 1e5;
  parameter SI.MassFraction X[2] = {0.8, 0.2};
  constant Real T0(unit = "s") = 1 "Reference value for units";
  Medium.BaseProperties idealGas;
  SI.Temperature T;
  SI.Density d_id;
  SI.SpecificEnergy u_id;
  SI.SpecificHeatCapacity cp_id;
  SI.SpecificHeatCapacity cv_id;
  SI.SpecificEnthalpy h_id;
equation
  T = T_min + (T_max - T_min) * time / T0;
  idealGas.T = T;
  idealGas.p = p;
  idealGas.X = X;
  d_id = idealGas.d;
  u_id = idealGas.u;
  cp_id = Medium.specificHeatCapacityCp(idealGas.state);
  cv_id = Medium.specificHeatCapacityCv(idealGas.state);
  h_id = Medium.specificHeatCapacityCv(idealGas.state);
end IdealCH4H2mixtureTest;
