within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
function sqrtReg
  "Symmetric square root approximation with finite derivative in zero"
  input Real x;
  input Real delta=0.01 "Range of significant deviation from sqrt(x)";
  output Real y;
algorithm
  y := x/sqrt(sqrt(x*x + delta*delta));
end sqrtReg;
