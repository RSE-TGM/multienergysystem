within MultiEnergySystem.DistrictHeatingNetwork.Utilities;

model LaceyEquationComputation
  parameter Real D = 160/1000;
  parameter Real pin = 75e2;
  parameter Real pout = 66.09e2;
  parameter Real L = 50;
  //parameter Real q = 1344/3600*0.716892;
  parameter Real correctionfactor = 1;
  Real f;
  //Real S;
  parameter Real S = 0.6048;
  Real q;
  Real w;
  parameter Real rho = 0.6048*1;
equation
  q = 5.72*correctionfactor*sqrt(((pin-pout)*D^5)/(f*S*L));
  f = 0.0044*(1+ (12/(0.276*D)));
  q = w/rho;

end LaceyEquationComputation;
