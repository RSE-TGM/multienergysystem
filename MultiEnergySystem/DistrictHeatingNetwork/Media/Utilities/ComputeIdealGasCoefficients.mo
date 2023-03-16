within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
partial model ComputeIdealGasCoefficients
  import      Modelica.Units.SI;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium;

  parameter SI.Temperature T_min = 280;
  parameter SI.Temperature T_max = 1500;
  parameter Integer N = 50;
  parameter Integer ord_cp = 3;
  constant SI.Time t0 = 1;

  SI.Temperature T;
  SI.SpecificEnthalpy cp;
  SI.SpecificEnthalpy cp_approx;

  String s;
  //protected
  parameter SI.Temperature T_data[:] = linspace(T_min, T_max, N);
  parameter SI.SpecificHeatCapacity cp_data[:]=
      {Medium.specificHeatCapacityCp(Medium.setState_pTX(1e5, T_data[i])) for i in 1:N};
  parameter Real coeff_cp[:] = Poly.fitting(T_data,cp_data, ord_cp);

equation
  T = T_min + (T_max - T_min)*time/t0;
  cp = Medium.specificHeatCapacityCp(Medium.setState_pTX(1e5, T));
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
