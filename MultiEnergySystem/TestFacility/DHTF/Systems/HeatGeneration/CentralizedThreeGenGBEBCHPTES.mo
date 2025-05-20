within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedThreeGenGBEBCHPTES "Three heat generators + thermal energy storage"
  extends CentralizedThreeGenGBEBCHP;
  replaceable Subsystems.HeatGeneration.TES S200(q_m3h_S2=8) "Subsystem S200 - Thermal Storage System" annotation (Placement(transformation(extent={{192,-50},{282,40}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
    allowFlowReversal=true,
    L=24.5,
    t=1.5e-3,
    pin_start(displayUnit="Pa") = 2e5,
    Tin_start(displayUnit="K") = 65 + 273.15,
    Tout_start(displayUnit="K") = 65 + 273.15,
    Di=51e-3,
    q_m3h_start=5,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={220,70})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
    allowFlowReversal=true,
    L=21.5,
    t=t_S5,
    pin_start(displayUnit="Pa") = 2.1e5,
    Tin_start(displayUnit="K") = 65 + 273.15,
    Tout_start(displayUnit="K") = 65 + 273.15,
    Di=Di_S5,
    q_m3h_start=5,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={256,70})));
equation
  connect(PL_S200_rCD_cold.outlet, S200.inlet) annotation (Line(
      points={{220,60},{220,53.875},{219.45,53.875},{219.45,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet, S200.outlet) annotation (Line(
      points={{256,60},{256,53.375},{255.45,53.375},{255.45,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus.statusS200, S200.status) annotation (Line(
      points={{-290,-2},{-290,-120},{178,-120},{178,-0.5},{187.5,-0.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV201, S200.theta) annotation (Line(
      points={{-290,-2},{-292,-2},{-292,-118},{176,-118},{176,17.5},{187.5,17.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.omegaP201, S200.pumpset) annotation (Line(
      points={{-290,-2},{-290,-116},{174,-116},{174,26.5},{187.5,26.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PL_S200_rCD_cold.inlet, junction.outlet) annotation (Line(
      points={{220,80},{220,220},{-16,220},{-16,234}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.outlet, junction2_1.inlet) annotation (Line(
      points={{256,80},{256,228},{36,228},{36,234}},
      color={140,56,54},
      thickness=0.5));
end CentralizedThreeGenGBEBCHPTES;
