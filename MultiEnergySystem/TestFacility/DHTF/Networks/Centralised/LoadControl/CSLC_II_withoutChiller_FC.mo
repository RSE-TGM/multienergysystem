within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CSLC_II_withoutChiller_FC
  extends CentralSystemLoadControl_II_withoutChiller(
    redeclare DHTF.Systems.HeatGeneration.CentralizedTwoGenGB_SC_EB_FC heatGeneration(redeclare model Gas = H2GasFacility.Media.IdealGases.CH4),
    distribution(redeclare TestFacility.DHTF.Subsystems.Distribution.CirculationPumpPC S900));
end CSLC_II_withoutChiller_FC;
