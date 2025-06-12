within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.LoadControl;
model CentralSystemLoadControl_II_PC
  extends CentralSystemLoadControl_I(
    redeclare DHTF.Systems.Distribution.CentralizedFourHX_CP_dpcontrolled distribution,
    redeclare DHTF.Systems.HeatGeneration.CentralizedTwoGenGBEB_PC_freeGB heatGeneration(X_gas = {1}));

equation
  connect(heatGeneration.returncold, distribution.returncold) annotation (Line(
      points={{-40,12},{-20,12}},
      color={140,56,54},
      thickness=0.5));
  connect(distribution.senthot, heatGeneration.senthot) annotation (Line(
      points={{-20,-12},{-40,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(heatGeneration.inletGas, inletGas) annotation (Line(
      points={{-60,-20},{-60,-80},{0,-80}},
      color={182,109,49},
      thickness=0.5));
  connect(electricPortInlet, heatGeneration.electricPortInlet) annotation (Line(
      points={{-80,-64},{-80,-24},{-86,-24},{-86,0},{-80,0}},
      color={56,93,138},
      thickness=1));
  connect(heatGeneration.controlSignalBus, controlSignalBus) annotation (Line(
      points={{-60,20},{-60,80},{0,80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end CentralSystemLoadControl_II_PC;
