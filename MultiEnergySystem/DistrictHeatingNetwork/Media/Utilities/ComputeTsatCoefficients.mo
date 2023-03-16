within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeTsatCoefficients
  import      Modelica.Units.SI;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  parameter SI.Temperature T_min = 273.15 + 20;
  parameter SI.Temperature T_max = 273.15 + 150;
  parameter SI.Pressure p_min = Medium.saturationPressure(T_min);
  parameter SI.Pressure p_max = Medium.saturationPressure(T_max);
  parameter SI.Pressure p_ref = 1e5;
  parameter SI.Temperature T_ref = 270;
  parameter Integer N = 50;
  parameter Integer ord_Tsat = 6;
  constant SI.Time t0 = 1;

  SI.Pressure p;
  SI.Temperature Tsat;
  SI.Temperature Tsat_approx;

  String s;
  //protected
  parameter SI.Pressure p_data[:] = linspace(p_min, p_max, N);
  parameter SI.Temperature T_data[:]=
      {Medium.saturationTemperature(p_data[i]) for i in 1:N};
  parameter Real coeff_Tsat[:] = Poly.fitting(p_data/p_ref, T_data./T_ref, ord_Tsat);
equation
  p = p_min + (p_max - p_min)*time/t0;
  Tsat = Medium.saturationTemperature(p);
  Tsat_approx = Poly.evaluate(coeff_Tsat,p/p_ref)*T_ref;
algorithm
  when (initial()) then
    s := "a = {";
    for i in 1:ord_Tsat+1 loop
      s := s + String(coeff_Tsat[i], significantDigits = 15);
      if i < ord_Tsat + 1 then
        s := s + ",";
      end if;
    end for;
    s :=s + "},";
    print(s);
  end when;

annotation (
    Documentation(info = "<html><head></head><body>Based Partial Model to compute the coefficients of the cp curve of ideal gases. The most important considerations:<div>- Temperature range of the working fluid, defining T_min and T_max.</div><div>- Order of equation of the curve defining ord_cp.</div></body></html>"));
end ComputeTsatCoefficients;
