within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_III "Heat generation including GB, EB and CHP"
  extends CentralSystemLoadControl_II(
    redeclare DHTF.Systems.HeatGeneration.CentralizedThreeGenGBEBCHP heatGeneration(X_gas = {1}));
end CentralSystemLoadControl_III;
