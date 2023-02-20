within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
function linspaceExt "Extended linspace function handling also the N=1 case"
  input Real x1;
  input Real x2;
  input Integer N;
  output Real vec[N];
algorithm
  vec := if N == 1 then {x1}
         else linspace(x1, x2, N);
end linspaceExt;
