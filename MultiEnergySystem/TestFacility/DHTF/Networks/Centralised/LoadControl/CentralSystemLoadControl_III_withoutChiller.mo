within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_III_withoutChiller "Heat generation including GB, EB and CHP"
  extends CentralSystemLoadControl_III(
    redeclare DHTF.Systems.Load.LoadPlantFourHXControlledWithoutChiller load);
end CentralSystemLoadControl_III_withoutChiller;
