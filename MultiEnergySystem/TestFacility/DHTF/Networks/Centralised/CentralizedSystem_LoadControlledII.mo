within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
model CentralizedSystem_LoadControlledII
  extends BaseClass.CentralizedBase(
    redeclare model Gas = H2GasFacility.Media.IdealGases.CH4,
    redeclare DHTF.Systems.HeatGeneration.CentralizedThreeGenGBEBCHPTES heatGeneration(X_gas = {1}),
    redeclare DHTF.Systems.Load.LoadPlantFourHXControlled load(nHX=5,
    EX701_q_m3h_hot=2,
      EX701_Tin_hot=353.15,
      EX701_Tout_hot=338.15,
    EX701_q_m3h_cold=1,
      EX701_Tin_cold=288.15,
      EX701_Tout_cold=298.15,
    EX701_TN_wall_start(displayUnit="K"),
    EX711_q_m3h_hot=2,
      EX711_Tin_hot=353.15,
      EX711_Tout_hot=338.15,
    EX711_q_m3h_cold=1,
    EX711_Tin_cold(displayUnit="degC") = 288.15,
    EX711_Tout_cold(displayUnit="degC") = 298.15,
    EX711_TN_wall_start(displayUnit="K"),
    EX721_q_m3h_hot=2,
      EX721_Tin_hot=353.15,
      EX721_Tout_hot=338.15,
    EX721_q_m3h_cold=1,
      EX721_Tin_cold=288.15,
      EX721_Tout_cold=298.15,
    EX731_q_m3h_hot=2,
      EX731_Tin_hot=353.15,
      EX731_Tout_hot=338.15,
    EX731_q_m3h_cold=1,
      EX731_Tin_cold=288.15,
      EX731_Tout_cold=298.15,
    q_Cool=25,
    q_Users_total=8));
  ElectricNetwork.Interfaces.ElectricPortInlet electricPortInlet annotation (
    Placement(transformation(extent={{-90,-74},{-70,-54}}),   iconTransformation(origin={-46,150},extent={{-64,-160},{-44,-140}})));
equation
  connect(heatGeneration.electricPortInlet, electricPortInlet) annotation (Line(
      points={{-80,0},{-80,0},{-80,-64}},
      color={56,93,138},
      thickness=1));
end CentralizedSystem_LoadControlledII;
