within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
partial function PowerCharacteristicLinear
  "Linear function to describe the characteristic behaviour of Power w.r.t. volumetric flow rate in a pump"
  input Real c1;
  input Real c2;
  input Real q;
  output Real P;

algorithm

  P :=c1*q + c2;

end PowerCharacteristicLinear;
