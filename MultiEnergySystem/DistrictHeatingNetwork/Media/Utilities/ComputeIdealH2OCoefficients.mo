within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeIdealH2OCoefficients
  extends DistrictHeatingNetwork.Icons.Generic.Utilities;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium = Modelica.Media.Water.StandardWater;

  parameter Types.Temperature T_min = 5 + 273.15;
  parameter Types.Temperature T_max = 95 + 273.15;
  parameter Types.Pressure p = 2.5e5 "Reference pressure";
  parameter Integer N = 50;
  parameter Integer ord_cp = 3;
  parameter Integer ord_d = 3;
  parameter Integer ord_k = 3;
  parameter Integer ord_mu = 3;
  constant Types.Time t0 = 1;

  Types.Temperature T;
  Types.SpecificHeatCapacity cp;
  Types.SpecificHeatCapacity cp_approx;
  Types.Density d;
  Types.Density d_approx;
  Types.ThermalConductivity k;
  Types.ThermalConductivity k_approx;
  Types.DynamicViscosity mu;
  Types.DynamicViscosity mu_approx;

  String s, st, sk, smu;

  parameter Types.Temperature T_data[:] = linspace(T_min, T_max, N);
  parameter Types.SpecificHeatCapacity cp_data[:]=
      {Medium.specificHeatCapacityCp(Medium.setState_pTX(p, T_data[i])) for i in 1:N};
  parameter Real coeff_cp[:] = Poly.fitting(T_data,cp_data, ord_cp);
  parameter Types.Density d_data[:]={Medium.density(Medium.setState_pTX(p, T_data[i])) for i in 1:N};
  parameter Real coeff_d[:] = Poly.fitting(T_data,d_data, ord_d);
  parameter Types.ThermalConductivity k_data[:] = {Medium.thermalConductivity(Medium.setState_pTX(p, T_data[i])) for i in 1:N};
  parameter Real coeff_k[:] = Poly.fitting(T_data, k_data, ord_k);
  parameter Types.DynamicViscosity mu_data[:] = {Medium.dynamicViscosity(Medium.setState_pTX(p, T_data[i])) for i in 1:N};
  parameter Real coeff_mu[:] = Poly.fitting(T_data, mu_data, ord_mu);

equation
  T = T_min + (T_max - T_min)*time/t0;
  cp = Medium.specificHeatCapacityCp(Medium.setState_pTX(p, T));
  cp_approx = Poly.evaluate(coeff_cp,T);
  d = Medium.density(Medium.setState_pTX(p, T));
  d_approx = Poly.evaluate(coeff_d,T);
  k = Medium.thermalConductivity(Medium.setState_pTX(p,T));
  k_approx = Poly.evaluate(coeff_k,T);
  mu = Medium.dynamicViscosity(Medium.setState_pTX(p,T));
  mu_approx = Poly.evaluate(coeff_mu,T);
algorithm
  when (initial()) then
    s := "cp_coeff = {";
    st := "rho_coeff = {";
    sk := "k_coeff = {";
    smu := "mu_coeff = {";
    for i in 1:ord_cp+1 loop
      s := s + String(coeff_cp[i], significantDigits = 14);
      st:= st + String(coeff_d[i], significantDigits = 14);
      sk:= sk + String(coeff_k[i], significantDigits = 14);
      smu:= smu + String(coeff_mu[i], significantDigits = 14);
      if i < ord_cp + 1 then
        s := s + ",";
        st:= st + ",";
        sk:= sk + ",";
        smu:= smu + ",";
      end if;
    end for;
    s :=s + "},";
    st:=st + "},";
    sk:=sk + "},";
    smu:=smu + "},";
    print(s);
    print(st);
    print(sk);
    print(smu);
  end when;

annotation (
    Documentation(info = "<html><head></head><body>Based Partial Model to compute the coefficients of the cp curve of ideal gases. The most important considerations:<div>- Temperature range of the working fluid, defining T_min and T_max.</div><div>- Order of equation of the curve defining ord_cp.</div></body></html>"),
      experiment(__Dymola_Algorithm="Dassl"));
end ComputeIdealH2OCoefficients;
