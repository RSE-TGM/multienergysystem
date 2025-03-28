within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model SR_ThreeGen_CaseA_LoadAnalysis
  extends DHTF.Control.Tests.SR_ThreeGen_CaseA(theta_TCV731_delta=-0.01);
  annotation (
    experiment(StopTime = 8000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end SR_ThreeGen_CaseA_LoadAnalysis;
