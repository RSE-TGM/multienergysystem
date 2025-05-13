within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_IV_withoutChiller "Heat generation including GB, EB and CHP and TES"
  extends CentralSystemLoadControl_IV(
    redeclare DHTF.Systems.Load.LoadPlantFourHXControlledWithoutChiller load);
end CentralSystemLoadControl_IV_withoutChiller;
