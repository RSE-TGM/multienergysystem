within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model HP301System
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics
    HP301 annotation (Placement(transformation(extent={{-17,-82},{17,-48}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P301 "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D301 annotation (Placement(transformation(extent={{37,30},{67,78}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,105.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,96.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,24})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV2 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={10,78})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV3 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,125})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,44.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,35.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT301
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-12,-7})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,15})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,125})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P302 "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-116})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT303 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-89.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT304 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-98.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV7 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,-145})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT303 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,-120.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT302
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-12,-137})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-100})));
equation
  connect(roundPipe1DFV6.inlet, PT301.inlet) annotation (Line(
      points={{-10,115},{-10,44.5},{-10.3,44.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT301.inlet, TT301.inlet) annotation (Line(
      points={{-10.3,44.5},{-10.3,33},{-10.3,33},{-10.3,35.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.inlet, roundPipe1DFV5.outlet) annotation (Line(
      points={{-10.3,35.5},{-10.3,30.25},{-10,30.25},{-10,25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.inlet, FT301.outlet) annotation (Line(
      points={{-10,5},{-10,-4}},
      color={140,56,54},
      thickness=0.5));
  connect(FT301.inlet, roundPipe1DFV4.outlet) annotation (Line(
      points={{-10,-10},{-10,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV4.inlet, HP301.inhot) annotation (Line(
      points={{-10,-40},{-10,-47.4},{-10.2,-47.4},{-10.2,-54.8}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outhot, roundPipe1DFV.inlet) annotation (Line(
      points={{10.2,-54.8},{10.2,-47.4},{10,-47.4},{10,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV.outlet, P301.inlet) annotation (Line(
      points={{10,-20},{10,-9}},
      color={140,56,54},
      thickness=0.5));
  connect(P301.outlet, roundPipe1DFV1.inlet) annotation (Line(
      points={{10,7},{10,14}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.outlet, D301.inlet) annotation (Line(
      points={{10,34},{10,45},{37,45}},
      color={140,56,54},
      thickness=0.5));
  connect(D301.outlet, roundPipe1DFV2.inlet) annotation (Line(
      points={{37,63},{10,63},{10,68}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV2.outlet, TT302.inlet) annotation (Line(
      points={{10,88},{10,92.25},{10.3,92.25},{10.3,96.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT302.inlet, PT302.inlet) annotation (Line(
      points={{10.3,96.5},{10.3,105.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT302.inlet, roundPipe1DFV3.inlet) annotation (Line(
      points={{10.3,105.5},{10.3,110.25},{10,110.25},{10,115}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.incold, PT303.inlet) annotation (Line(
      points={{10.2,-75.2},{10.2,-82.35},{10.3,-82.35},{10.3,-89.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT303.inlet, TT304.inlet) annotation (Line(
      points={{10.3,-89.5},{10.3,-98.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT304.inlet, P302.outlet) annotation (Line(
      points={{10.3,-98.5},{10.3,-103.25},{10,-103.25},{10,-108}},
      color={140,56,54},
      thickness=0.5));
  connect(P302.inlet, roundPipe1DFV7.outlet) annotation (Line(
      points={{10,-124},{10,-135}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.outlet, TT303.inlet) annotation (Line(
      points={{-10,-134},{-10,-127.25},{-10.3,-127.25},{-10.3,-120.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT303.inlet, roundPipe1DFV8.inlet) annotation (Line(
      points={{-10.3,-120.5},{-10.3,-115.25},{-10,-115.25},{-10,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV8.outlet, HP301.outcold) annotation (Line(
      points={{-10,-90},{-10,-82.6},{-10.2,-82.6},{-10.2,-75.2}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(
        preserveAspectRatio=false,
        extent={{-140,-180},{140,180}},
        grid={1,1})));
end HP301System;
