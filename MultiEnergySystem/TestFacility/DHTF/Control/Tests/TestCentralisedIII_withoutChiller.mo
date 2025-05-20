within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIII_withoutChiller
  extends TestCentralisedIII(
  redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_III_withoutChiller plant, system(allowFlowReversal=false));
end TestCentralisedIII_withoutChiller;
