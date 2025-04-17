within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_II
  extends CentralSystemLoadControl_I(
    redeclare DHTF.Systems.HeatGeneration.CentralizedTwoGenGBEB heatGeneration(X_gas = {1}));
equation
  connect(heatGeneration.electricPortInlet, electricPortInlet) annotation (Line(
      points={{-80,0},{-94,0},{-94,-40},{-80,-40},{-80,-64}},
      color={56,93,138},
      thickness=1));
end CentralSystemLoadControl_II;
