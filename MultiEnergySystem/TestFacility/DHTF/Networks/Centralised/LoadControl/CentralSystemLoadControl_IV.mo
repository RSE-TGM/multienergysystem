within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_IV
  extends CentralSystemLoadControl_III(
    redeclare DHTF.Systems.HeatGeneration.CentralizedThreeGenGBEBCHPTES heatGeneration(X_gas = {1}));
end CentralSystemLoadControl_IV;
