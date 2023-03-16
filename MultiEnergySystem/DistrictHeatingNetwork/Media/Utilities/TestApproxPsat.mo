within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model TestApproxPsat
  extends DistrictHeatingNetwork.Icons.Generic.Utilities;
  import Modelica.Units.SI;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  parameter Types.Temperature T_min = 273.15 + 10;
  parameter Types.Temperature T_max = 273.15 + 100;
  parameter Integer N = 50;
  parameter Integer ord_psat = 3;
  constant Types.Time t0 = 1;
  Types.Temperature T;
  Types.Pressure psat;
  Types.Pressure psat_approx;
  String s;
  //protected
  parameter Types.Temperature T_data[:] = linspace(T_min, T_max, N);
  parameter Types.Pressure psat_data[:] = {Medium.saturationPressure(T_data[i]) for i in 1:N};
  parameter Real coeff_psat[:] = Poly.fitting(T_data, log(psat_data), ord_psat);
equation
  T = T_min + (T_max - T_min) * time / t0;
  psat = Medium.saturationPressure(T);
  psat_approx = exp(Poly.evaluate(coeff_psat, T));
algorithm
  when initial() then
    s := "a = {";
    for i in 1:ord_psat + 1 loop
      s := s + String(coeff_psat[i], significantDigits = 14);
      if i < ord_psat + 1 then
        s := s + ",";
      end if;
    end for;
    s := s + "},";
    print(s);
  end when;
  annotation (
    Documentation(info = "<html><head></head><body>Based Partial Model to compute the coefficients of the cp curve of ideal gases. The most important considerations:<div>- Temperature range of the working fluid, defining T_min and T_max.</div><div>- Order of equation of the curve defining ord_cp.</div></body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end TestApproxPsat;
