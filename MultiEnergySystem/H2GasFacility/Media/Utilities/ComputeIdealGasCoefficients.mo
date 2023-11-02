within MultiEnergySystem.H2GasFacility.Media.Utilities;
partial model ComputeIdealGasCoefficients
  extends DistrictHeatingNetwork.Icons.Generic.Utilities;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

  parameter Types.Temperature T_min = 0 + 273.15;
  parameter Types.Temperature T_max = 100 + 273.15;
  parameter Types.Pressure p = 1e5 "Reference pressure";
  parameter Integer N = 50;
  parameter Integer ord_cp = 3;
  constant Types.Time t0 = 1;

  Types.Temperature T;
  Types.SpecificHeatCapacity cp;
  Types.SpecificHeatCapacity cp_approx;

  String s;

  parameter Types.Temperature T_data[:] = linspace(T_min, T_max, N);
  parameter Types.SpecificHeatCapacity cp_data[:]=
      {Medium.specificHeatCapacityCp(Medium.setState_pTX(p, T_data[i])) for i in 1:N};
  parameter Real coeff_cp[:] = Poly.fitting(T_data,cp_data, ord_cp);

equation
  T = T_min + (T_max - T_min)*time/t0;
  cp = Medium.specificHeatCapacityCp(Medium.setState_pTX(p, T));
  cp_approx = Poly.evaluate(coeff_cp,T);
algorithm
  when (initial()) then
    s := "a = {";
    for i in 1:ord_cp+1 loop
      s := s + String(coeff_cp[i], significantDigits = 14);
      if i < ord_cp + 1 then
        s := s + ",";
      end if;
    end for;
    s :=s + "},";
    print(s);
  end when;

annotation (
    Documentation(info = "<html><head></head><body>Based Partial Model to compute the coefficients of the cp curve of ideal gases. The most important considerations:<div>- Temperature range of the working fluid, defining T_min and T_max.</div><div>- Order of equation of the curve defining ord_cp.</div></body></html>"));
end ComputeIdealGasCoefficients;
