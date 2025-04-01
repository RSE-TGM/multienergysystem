within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
model CentralizedSystem_III
  extends BaseClass.CentralizedBase(redeclare DHTF.Systems.HeatGeneration.CentralizedThreeGenGBEBCHP heatGeneration);
  ElectricNetwork.Interfaces.ElectricPortInlet electricPortInlet annotation (
    Placement(transformation(extent={{-90,-74},{-70,-54}}),   iconTransformation(origin={-46,150},extent={{-64,-160},{-44,-140}})));
equation
  connect(heatGeneration.electricPortInlet, electricPortInlet) annotation (Line(
      points={{-80,0},{-80,0},{-80,-64}},
      color={56,93,138},
      thickness=1));
end CentralizedSystem_III;
