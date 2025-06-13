within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_II_withoutChiller "Heat generation including GB & EB; Load System without chiller"
  extends CentralSystemLoadControl_II(
    redeclare DHTF.Systems.Load.LoadPlantFourHXControlledWithoutChiller load);
end CentralSystemLoadControl_II_withoutChiller;
