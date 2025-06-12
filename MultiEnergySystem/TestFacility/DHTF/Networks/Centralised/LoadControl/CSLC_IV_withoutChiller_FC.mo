within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CSLC_IV_withoutChiller_FC
  extends CentralSystemLoadControl_IV_withoutChiller(
    redeclare DHTF.Systems.HeatGeneration.CentralizedThreeGenGBEBCHPTES_FC heatGeneration(redeclare
        model                                                                                             Gas =
          H2GasFacility.Media.IdealGases.CH4),
    distribution(redeclare TestFacility.DHTF.Subsystems.Distribution.CirculationPumpPC S900));
end CSLC_IV_withoutChiller_FC;
