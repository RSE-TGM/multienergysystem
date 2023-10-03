within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
function squareReg
  "Anti-symmetric square approximation with non-zero derivative in the origin"
  input Real x;
  input Real delta=0.01 "Range of significant deviation from x^2*sgn(x)";
  output Real y;
algorithm
  y := x*sqrt(x*x + delta*delta);
end squareReg;
