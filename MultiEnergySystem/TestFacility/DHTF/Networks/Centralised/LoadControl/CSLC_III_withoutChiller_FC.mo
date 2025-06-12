within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CSLC_III_withoutChiller_FC
  extends CentralSystemLoadControl_III_withoutChiller(
    redeclare DHTF.Systems.HeatGeneration.CentralizedThreeGenGBEBCHP_FC heatGeneration(redeclare
        model                                                                                          Gas =
          H2GasFacility.Media.IdealGases.CH4),
    distribution(redeclare TestFacility.DHTF.Subsystems.Distribution.CirculationPumpPC S900));
end CSLC_III_withoutChiller_FC;
