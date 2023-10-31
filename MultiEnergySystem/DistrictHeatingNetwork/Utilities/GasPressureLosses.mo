within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
function GasPressureLosses
  "Renourd for q/D < 150 (m3/(h.mm))"
  input Real Q "volumetric flow in m3/h";
  input Real Di "Internal diameter of the pipe in mm";
  input Real dr "Relative gas density in mbar";
  input Real L "Total length in m";
  output Real dp;

algorithm
  dp := 2.275e4*Q^(1.82)*Di^(-4.82)*dr*L;

end GasPressureLosses;
