within MultiEnergySystem.DistrictHeatingNetwork.Media.Utilities;
model ComputeAdditionalCpCoefficients
  extends DistrictHeatingNetwork.Icons.Generic.Utilities;
  import Poly = Modelica.Math.Polynomials;
  import Modelica.Utilities.Streams.*;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  parameter Types.Temperature T_min = 273.15 + 15;
  parameter Types.Temperature T_max = 273.15 + 130;
  parameter Types.Pressure p = 15e5;
  parameter Types.MoleFraction MMw = Modelica.Media.IdealGases.Common.SingleGasesData.H2O.MM;
  parameter Types.MoleFraction MMinc = Modelica.Media.IdealGases.Common.SingleGasesData.CO2.MM;
  parameter Integer N = 50;
  parameter Integer ord_cp = 3;
  parameter Integer ord_psat = 6;
  constant Types.Time t0 = 1;

  Types.Temperature T;
  Types.SpecificHeatCapacity cp;
  Types.SpecificHeatCapacity cp_approx;
  Types.SpecificEnthalpy delta_h;
  Real dpdT;

  String s;
  //protected
  parameter SI.Temperature T_data[:] = linspace(T_min, T_max, N);
  parameter SI.SpecificHeatCapacity delta_h_data[:]=
      {Medium.dewEnthalpy(Medium.setSat_T(T_data[i])) -
       Medium.bubbleEnthalpy(Medium.setSat_T(T_data[i])) for i in 1:N};
  parameter SI.SpecificHeatCapacity dpdT_data[:]=
      {1/Medium.saturationTemperature_derp_sat(Medium.setSat_T(T_data[i])) for i in 1:N};
  parameter SI.SpecificHeatCapacity cp_data[:]=
      {delta_h_data[i]*MMw/MMinc*dpdT_data[i]/p for i in 1:N};
  parameter SI.Pressure psat_data[:] = {Medium.saturationPressure(T_data[i]) for i in 1:N};
  parameter Real coeff_cp[:] = Poly.fitting(T_data,cp_data, ord_cp);
equation
  T = T_min + (T_max - T_min)*time/t0;
  delta_h = Medium.dewEnthalpy(Medium.setSat_T(T))-Medium.bubbleEnthalpy(Medium.setSat_T(T)) "evaporation";
  dpdT = 1/Medium.saturationTemperature_derp_sat(Medium.setSat_T(T));
  cp = delta_h*MMw/MMinc*dpdT/p;
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
end ComputeAdditionalCpCoefficients;
