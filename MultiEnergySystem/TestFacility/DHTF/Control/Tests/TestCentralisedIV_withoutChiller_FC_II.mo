within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIV_withoutChiller_FC_II
  extends TestCentralisedIV_withoutChiller_FC(actuator(domegaP201_var(y=if time < 3600*12 then 3.08 else 0.5), S200status(y=if time < 3600*12 then 1 else 0)));
end TestCentralisedIV_withoutChiller_FC_II;
