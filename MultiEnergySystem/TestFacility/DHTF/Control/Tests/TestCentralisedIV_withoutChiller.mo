within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIV_withoutChiller
  extends TestCentralisedIV(
  redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_IV_withoutChiller plant);
end TestCentralisedIV_withoutChiller;
