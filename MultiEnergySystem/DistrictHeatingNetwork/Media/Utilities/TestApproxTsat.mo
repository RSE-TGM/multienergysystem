within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model TestApproxTsat
  extends DistrictHeatingNetwork.Icons.Generic.Utilities;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  parameter Types.Temperature T_min = 273.15 + 25;
  parameter Types.Temperature T_max = 273.15 + 130;
  parameter Types.Pressure p_min = Medium.saturationPressure(T_min);
  parameter Types.Pressure p_max = Medium.saturationPressure(T_max);
  parameter Types.Pressure p_ref = 1e5;
  parameter Types.Temperature T_ref = 270;
  parameter Integer N = 50;
  parameter Integer ord_Tsat = 3;
  constant Types.Time t0 = 1;

  Types.Pressure p;
  Types.Temperature Tsat;
  Types.Temperature Tsat_approx;

  String s;
  //protected
  parameter Types.Pressure p_data[:] = linspace(p_min, p_max, N);
  parameter Types.Temperature T_data[:]=
      {Medium.saturationTemperature(p_data[i]) for i in 1:N};
  parameter Real coeff_Tsat[:] = Poly.fitting(p_data/p_ref, exp(T_data./T_ref), ord_Tsat);
equation
  p = p_min + (p_max - p_min)*time/t0;
  Tsat = Medium.saturationTemperature(p);
  Tsat_approx = log(Poly.evaluate(coeff_Tsat,p/p_ref))*T_ref;
algorithm
  when (initial()) then
    s := "a = {";
    for i in 1:ord_Tsat+1 loop
      s := s + String(coeff_Tsat[i], significantDigits = 14);
      if i < ord_Tsat + 1 then
        s := s + ",";
      end if;
    end for;
    s :=s + "},";
    print(s);
  end when;

annotation (
    Documentation(info = "<html><head></head><body>Based Partial Model to compute the coefficients of the cp curve of ideal gases. The most important considerations:<div>- Temperature range of the working fluid, defining T_min and T_max.</div><div>- Order of equation of the curve defining ord_cp.</div></body></html>"));
end TestApproxTsat;
